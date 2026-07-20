namespace DevWorkFlow.Tree;

public enum TreeLoadPriority
{
    High = 0,
    Medium = 1,
    Low = 2
}

public sealed class TreeEngineOptions
{
    public int LruCapacity { get; init; } = 2_048;
    public int MaxConcurrentLoads { get; init; } = 4;
}

/// <summary>
/// Manages visible flat rows, lazy load, cache, LRU, cancellation, incremental patch.
/// No UI references.
/// </summary>
public sealed class VirtualTreeEngine : IAsyncDisposable
{
    private readonly ITreeDataSource _data_source;
    private readonly TreeEngineOptions _options;
    private readonly object _gate = new();

    private readonly Dictionary<Guid, TreeNode> _nodes = new();
    private readonly Dictionary<Guid, IReadOnlyList<TreeNode>> _children_cache = new();
    private readonly LinkedList<Guid> _lru = new();
    private readonly Dictionary<Guid, LinkedListNode<Guid>> _lru_map = new();
    private readonly HashSet<Guid> _expanded = new();
    private readonly Dictionary<Guid, CancellationTokenSource> _load_cts = new();
    private readonly TreeLoadScheduler _scheduler;

    private List<TreeRow> _visible_rows = [];
    private Guid? _root_sentinel;
    private int _version;

    public VirtualTreeEngine(ITreeDataSource data_source, TreeEngineOptions? options = null)
    {
        _data_source = data_source ?? throw new ArgumentNullException(nameof(data_source));
        _options = options ?? new TreeEngineOptions();
        _scheduler = new TreeLoadScheduler(_options.MaxConcurrentLoads);
    }

    public IReadOnlyList<TreeRow> VisibleRows
    {
        get
        {
            lock (_gate) return _visible_rows;
        }
    }

    public event EventHandler? VisibleRowsChanged;

    public async Task InitializeAsync(CancellationToken cancellation_token = default)
    {
        _root_sentinel = Guid.Empty;
        await LoadChildrenAsync(parent: null, TreeLoadPriority.High, cancellation_token)
            .ConfigureAwait(false);
        RebuildVisibleRows();
    }

    public bool IsExpanded(Guid node_id)
    {
        lock (_gate) return _expanded.Contains(node_id);
    }

    public async Task ExpandAsync(Guid node_id, CancellationToken cancellation_token = default)
    {
        TreeNode? node;
        lock (_gate)
        {
            if (!_nodes.TryGetValue(node_id, out node)) return;
            if (node.IsPlaceholder) return;
            if (!_expanded.Add(node_id))
            {
                RebuildVisibleRows_NoLock();
                return;
            }
        }

        RaiseVisibleChanged();

        if (!_children_cache.ContainsKey(node_id))
        {
            InsertPlaceholder(node_id);
            RaiseVisibleChanged();
            await LoadChildrenAsync(node, TreeLoadPriority.High, cancellation_token)
                .ConfigureAwait(false);
        }

        TouchLru(node_id);
        RebuildVisibleRows();
    }

    public Task CollapseAsync(Guid node_id)
    {
        lock (_gate)
        {
            if (!_expanded.Remove(node_id)) return Task.CompletedTask;
            CancelLoad_NoLock(node_id);
        }

        RebuildVisibleRows();
        return Task.CompletedTask;
    }

    public async Task ToggleExpandAsync(Guid node_id, CancellationToken cancellation_token = default)
    {
        if (IsExpanded(node_id))
            await CollapseAsync(node_id).ConfigureAwait(false);
        else
            await ExpandAsync(node_id, cancellation_token).ConfigureAwait(false);
    }

    public async Task RefreshNodeAsync(Guid node_id, CancellationToken cancellation_token = default)
    {
        TreeNode? node;
        lock (_gate)
        {
            if (!_nodes.TryGetValue(node_id, out node)) return;
            CancelLoad_NoLock(node_id);
            _children_cache.Remove(node_id);
            RemoveLru_NoLock(node_id);
        }

        await _data_source.RefreshAsync(node, cancellation_token).ConfigureAwait(false);

        if (IsExpanded(node_id) || node_id == _root_sentinel)
        {
            InsertPlaceholder(node_id);
            RaiseVisibleChanged();
            await LoadChildrenAsync(node_id == Guid.Empty ? null : node, TreeLoadPriority.High, cancellation_token)
                .ConfigureAwait(false);
        }

        RebuildVisibleRows();
    }

    /// <summary>Replace cached children of a parent (incremental — does not clear other branches).</summary>
    public void PatchChildren(Guid parent_id, IReadOnlyList<TreeNode> children)
    {
        lock (_gate)
        {
            StoreChildren_NoLock(parent_id == Guid.Empty ? null : parent_id, children);
        }

        RebuildVisibleRows();
    }

    /// <summary>
    /// Expand ancestors of matches and filter visible tree to matching branches.
    /// Empty matches → restore full tree, or hide everything when
    /// <paramref name="empty_hides_all"/> (a real search that found nothing must not reveal the tree).
    /// When <paramref name="keep_descendants"/>, a matched node also keeps its already-loaded
    /// subtree visible and expanded — so matching a container reveals its contents even when the
    /// descendants themselves don't match the keyword.
    /// </summary>
    public async Task ApplySearchMatchesAsync(
        IReadOnlyList<TreeNode> matches,
        CancellationToken cancellation_token = default,
        bool empty_hides_all = false,
        bool keep_descendants = false)
    {
        if (matches.Count == 0)
        {
            if (empty_hides_all)
            {
                lock (_gate) _search_keep = new HashSet<Guid>();
                RebuildVisibleRows();
            }
            else
            {
                ClearSearchFilter();
            }

            return;
        }

        var match_ids = new HashSet<Guid>();
        foreach (var match in matches)
        {
            cancellation_token.ThrowIfCancellationRequested();
            await RegisterNodeChainAsync(match, cancellation_token).ConfigureAwait(false);
            match_ids.Add(match.Id);
        }

        // Search hit thường đến từ DataSource (EnsurePathChain) — ancestor chưa có trong
        // engine._nodes / _children_cache. ExpandAsync(parent) no-op nếu parent chưa
        // register → AppendVisible_NoLock không descend được tới file match.
        // Ghép cache theo đường dẫn + đánh dấu expanded thay vì lazy-load cả folder.
        lock (_gate)
        {
            foreach (var match in matches)
                StitchSearchPath_NoLock(match);

            _search_keep = BuildSearchKeepSet_NoLock(match_ids, keep_descendants);
        }

        RebuildVisibleRows();
    }

    /// <summary>Đăng ký match và mọi ancestor (FindNodeAsync) vào engine._nodes.</summary>
    private async Task RegisterNodeChainAsync(TreeNode node, CancellationToken cancellation_token)
    {
        lock (_gate) _nodes[node.Id] = node;

        var parent_id = node.ParentId;
        while (parent_id is Guid pid && pid != Guid.Empty)
        {
            cancellation_token.ThrowIfCancellationRequested();

            lock (_gate)
            {
                if (_nodes.TryGetValue(pid, out var cached))
                {
                    parent_id = cached.ParentId;
                    continue;
                }
            }

            var found = await _data_source.FindNodeAsync(pid, cancellation_token).ConfigureAwait(false);
            if (found is null) break;

            lock (_gate) _nodes[found.Id] = found;
            parent_id = found.ParentId;
        }
    }

    /// <summary>
    /// Ghép _children_cache + _expanded dọc đường từ match lên root để AppendVisible_NoLock
    /// render được nhánh lọc mà không cần GetChildrenAsync load cả folder.
    /// </summary>
    private void StitchSearchPath_NoLock(TreeNode match)
    {
        var current = match;
        while (true)
        {
            if (current.ParentId is Guid pid && pid != Guid.Empty)
            {
                if (!_nodes.TryGetValue(pid, out var parent))
                    break;

                EnsureChildInCache_NoLock(pid, current);
                _expanded.Add(pid);
                current = parent;
                continue;
            }

            EnsureChildInCache_NoLock(Guid.Empty, current);
            break;
        }
    }

    private void EnsureChildInCache_NoLock(Guid parent_key, TreeNode child)
    {
        if (!_children_cache.TryGetValue(parent_key, out var existing))
        {
            _children_cache[parent_key] = [child];
            return;
        }

        if (existing.Any(c => c.Id == child.Id)) return;

        var merged = existing.ToList();
        merged.Add(child);
        _children_cache[parent_key] = merged
            .OrderByDescending(n => n.Kind == TreeNodeKind.Folder)
            .ThenBy(n => n.DisplayName, StringComparer.OrdinalIgnoreCase)
            .ToList();
    }

    public void ClearSearchFilter()
    {
        lock (_gate) _search_keep = null;
        RebuildVisibleRows();
    }

    private HashSet<Guid>? _search_keep;

    private HashSet<Guid> BuildSearchKeepSet_NoLock(HashSet<Guid> match_ids, bool keep_descendants)
    {
        var keep = new HashSet<Guid>(match_ids);
        foreach (var id in match_ids)
        {
            var current = id;
            while (_nodes.TryGetValue(current, out var node) && node.ParentId is Guid pid)
            {
                keep.Add(pid);
                current = pid;
            }
        }

        if (keep_descendants)
            foreach (var id in match_ids)
                KeepLoadedSubtree_NoLock(id, keep);

        return keep;
    }

    /// <summary>
    /// Đưa toàn bộ subtree đã load (trong _children_cache) của một match vào keep-set và
    /// đánh dấu các node chứa con là expanded — để nhánh con của match hiện dù không khớp keyword.
    /// </summary>
    private void KeepLoadedSubtree_NoLock(Guid parent_id, HashSet<Guid> keep)
    {
        if (!_children_cache.TryGetValue(parent_id, out var children))
            return;

        var has_real_child = false;
        foreach (var child in children)
        {
            if (child.IsPlaceholder) continue;
            has_real_child = true;
            keep.Add(child.Id);
            KeepLoadedSubtree_NoLock(child.Id, keep);
        }

        if (has_real_child)
            _expanded.Add(parent_id);
    }

    private void InsertPlaceholder(Guid parent_id)
    {
        lock (_gate)
        {
            if (_children_cache.ContainsKey(parent_id)) return;
            var placeholder = TreeNode.CreatePlaceholder(parent_id);
            _nodes[placeholder.Id] = placeholder;
            _children_cache[parent_id] = [placeholder];
            RebuildVisibleRows_NoLock();
        }
    }

    private async Task LoadChildrenAsync(
        TreeNode? parent,
        TreeLoadPriority priority,
        CancellationToken cancellation_token)
    {
        var parent_id = parent?.Id ?? Guid.Empty;
        CancellationTokenSource linked;
        lock (_gate)
        {
            CancelLoad_NoLock(parent_id);
            linked = CancellationTokenSource.CreateLinkedTokenSource(cancellation_token);
            _load_cts[parent_id] = linked;
            if (parent is not null)
                _nodes[parent.Id] = parent.WithState(TreeNodeState.Loading);
        }

        try
        {
            var children = await _scheduler
                .EnqueueAsync(
                    priority,
                    ct => _data_source.GetChildrenAsync(parent, ct),
                    linked.Token)
                .ConfigureAwait(false);

            if (linked.IsCancellationRequested) return;

            lock (_gate)
            {
                if (parent is not null && _nodes.TryGetValue(parent.Id, out var current))
                    _nodes[parent.Id] = current.WithState(TreeNodeState.Loaded).WithHasChildren(children.Count > 0);

                StoreChildren_NoLock(parent?.Id, children);
                TouchLru_NoLock(parent_id);
                EvictLru_NoLock();
                RebuildVisibleRows_NoLock();
            }

            RaiseVisibleChanged();
        }
        catch (OperationCanceledException)
        {
            // expected on collapse / newer request
        }
        catch
        {
            lock (_gate)
            {
                if (parent is not null && _nodes.TryGetValue(parent.Id, out var current))
                    _nodes[parent.Id] = current.WithState(TreeNodeState.Error);
                _children_cache[parent_id] = Array.Empty<TreeNode>();
                RebuildVisibleRows_NoLock();
            }

            RaiseVisibleChanged();
            throw;
        }
        finally
        {
            lock (_gate)
            {
                if (_load_cts.TryGetValue(parent_id, out var cts) && ReferenceEquals(cts, linked))
                    _load_cts.Remove(parent_id);
            }

            linked.Dispose();
        }
    }

    private void StoreChildren_NoLock(Guid? parent_id, IReadOnlyList<TreeNode> children)
    {
        var key = parent_id ?? Guid.Empty;
        foreach (var child in children)
        {
            _nodes[child.Id] = child;
            if (child.ParentId is null && parent_id is Guid pid)
                _nodes[child.Id] = child with { ParentId = pid == Guid.Empty ? null : pid };
        }

        // Drop old placeholder children from node map if replaced
        if (_children_cache.TryGetValue(key, out var old))
        {
            foreach (var o in old)
            {
                if (o.IsPlaceholder)
                    _nodes.Remove(o.Id);
            }
        }

        _children_cache[key] = children;
    }

    private void RebuildVisibleRows()
    {
        lock (_gate) RebuildVisibleRows_NoLock();
        RaiseVisibleChanged();
    }

    private void RebuildVisibleRows_NoLock()
    {
        var rows = new List<TreeRow>(capacity: Math.Max(64, _visible_rows.Count));
        if (_children_cache.TryGetValue(Guid.Empty, out var roots))
            AppendVisible_NoLock(roots, depth: 0, rows);

        _visible_rows = rows;
        _version++;
    }

    private void AppendVisible_NoLock(IReadOnlyList<TreeNode> nodes, int depth, List<TreeRow> rows)
    {
        foreach (var node in nodes)
        {
            if (_search_keep is not null && !_search_keep.Contains(node.Id) && !node.IsPlaceholder)
                continue;

            var expandable = !node.IsPlaceholder
                             && (node.HasChildren || _data_source.HasChildren(node)
                                 || _children_cache.ContainsKey(node.Id));
            var expanded = expandable && _expanded.Contains(node.Id);
            rows.Add(new TreeRow(node, depth, expanded, expandable));

            if (!expanded) continue;
            if (_children_cache.TryGetValue(node.Id, out var children))
                AppendVisible_NoLock(children, depth + 1, rows);
        }
    }

    private void CancelLoad_NoLock(Guid parent_id)
    {
        if (_load_cts.TryGetValue(parent_id, out var cts))
        {
            try { cts.Cancel(); } catch { /* ignore */ }
            _load_cts.Remove(parent_id);
            cts.Dispose();
        }
    }

    private void TouchLru(Guid id)
    {
        lock (_gate) TouchLru_NoLock(id);
    }

    private void TouchLru_NoLock(Guid id)
    {
        if (id == Guid.Empty) return;
        if (_lru_map.TryGetValue(id, out var existing))
        {
            _lru.Remove(existing);
            _lru.AddFirst(existing);
            return;
        }

        var node = _lru.AddFirst(id);
        _lru_map[id] = node;
    }

    private void RemoveLru_NoLock(Guid id)
    {
        if (!_lru_map.TryGetValue(id, out var existing)) return;
        _lru.Remove(existing);
        _lru_map.Remove(id);
    }

    private void EvictLru_NoLock()
    {
        while (_lru.Count > _options.LruCapacity)
        {
            var last = _lru.Last;
            if (last is null) break;
            var id = last.Value;
            _lru.RemoveLast();
            _lru_map.Remove(id);

            if (_expanded.Contains(id)) continue; // never dispose expanded / visible branch roots
            if (IsAncestorExpanded_NoLock(id)) continue;

            if (_children_cache.TryGetValue(id, out var children))
            {
                foreach (var child in children)
                    MarkDisposedRecursive_NoLock(child.Id);
                _children_cache.Remove(id);
            }

            if (_nodes.TryGetValue(id, out var node) && !node.IsPlaceholder)
                _nodes[id] = node.WithState(TreeNodeState.Disposed);
        }
    }

    private bool IsAncestorExpanded_NoLock(Guid id)
    {
        if (!_nodes.TryGetValue(id, out var node)) return false;
        var parent = node.ParentId;
        while (parent is Guid pid)
        {
            if (_expanded.Contains(pid)) return true;
            if (!_nodes.TryGetValue(pid, out var p)) break;
            parent = p.ParentId;
        }

        return false;
    }

    private void MarkDisposedRecursive_NoLock(Guid id)
    {
        if (_expanded.Contains(id)) return;
        if (_children_cache.TryGetValue(id, out var children))
        {
            foreach (var child in children)
                MarkDisposedRecursive_NoLock(child.Id);
            _children_cache.Remove(id);
        }

        if (_nodes.TryGetValue(id, out var node))
            _nodes[id] = node.WithState(TreeNodeState.Disposed);
        RemoveLru_NoLock(id);
    }

    private void RaiseVisibleChanged() => VisibleRowsChanged?.Invoke(this, EventArgs.Empty);

    public ValueTask DisposeAsync()
    {
        lock (_gate)
        {
            foreach (var cts in _load_cts.Values)
            {
                try { cts.Cancel(); } catch { /* ignore */ }
                cts.Dispose();
            }

            _load_cts.Clear();
        }

        _scheduler.Dispose();
        return ValueTask.CompletedTask;
    }
}
