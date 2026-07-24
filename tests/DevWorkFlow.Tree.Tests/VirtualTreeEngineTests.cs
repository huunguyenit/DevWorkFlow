using DevWorkFlow.Tree;
using Xunit;

namespace DevWorkFlow.Tree.Tests;

public sealed class VirtualTreeEngineTests
{
    [Fact]
    public async Task Initialize_loads_roots()
    {
        var ds = new FakeDataSource();
        var a = ds.AddRoot("A", has_children: false);
        var b = ds.AddRoot("B", has_children: false);

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();

        Assert.Equal(2, engine.VisibleRows.Count);
        Assert.Contains(engine.VisibleRows, r => r.Node.Id == a.Id);
        Assert.Contains(engine.VisibleRows, r => r.Node.Id == b.Id);
    }

    [Fact]
    public async Task Expand_shows_placeholder_then_children()
    {
        var ds = new FakeDataSource();
        var folder = ds.AddRoot("Folder", has_children: true);
        var child = ds.AddChild(folder.Id, "Child", has_children: false);
        ds.DelayMs = 30;

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();

        var expand = engine.ExpandAsync(folder.Id);
        await Task.Delay(5);
        Assert.Contains(engine.VisibleRows, r => r.Node.IsPlaceholder);

        await expand;
        Assert.DoesNotContain(engine.VisibleRows, r => r.Node.IsPlaceholder);
        Assert.Contains(engine.VisibleRows, r => r.Node.Id == child.Id);
    }

    [Fact]
    public async Task Collapse_cancels_in_flight_load()
    {
        var ds = new FakeDataSource();
        var folder = ds.AddRoot("Folder", has_children: true);
        ds.AddChild(folder.Id, "Child", has_children: false);
        ds.DelayMs = 200;

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();

        var expand = engine.ExpandAsync(folder.Id);
        await Task.Delay(20);
        await engine.CollapseAsync(folder.Id);
        await expand; // should complete without throwing

        Assert.False(engine.IsExpanded(folder.Id));
        Assert.DoesNotContain(engine.VisibleRows, r => r.Depth > 0);
    }

    [Fact]
    public async Task PatchChildren_does_not_clear_other_branches()
    {
        var ds = new FakeDataSource();
        var a = ds.AddRoot("A", has_children: true);
        var b = ds.AddRoot("B", has_children: true);
        var a1 = ds.AddChild(a.Id, "A1", has_children: false);
        var b1 = ds.AddChild(b.Id, "B1", has_children: false);

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();
        await engine.ExpandAsync(a.Id);
        await engine.ExpandAsync(b.Id);

        var a2 = new TreeNode
        {
            Id = Guid.NewGuid(),
            ParentId = a.Id,
            DisplayName = "A2",
            HasChildren = false,
            State = TreeNodeState.Loaded
        };
        engine.PatchChildren(a.Id, [a1, a2]);

        Assert.Contains(engine.VisibleRows, r => r.Node.Id == a2.Id);
        Assert.Contains(engine.VisibleRows, r => r.Node.Id == b1.Id);
    }

    [Fact]
    public async Task VisibleRows_scales_with_synthetic_100k_collapsed()
    {
        var ds = new FakeDataSource();
        var root = ds.AddRoot("Root", has_children: true);
        for (var i = 0; i < 100_000; i++)
            ds.AddChild(root.Id, $"N{i}", has_children: false);

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();

        // Collapsed: only root visible
        Assert.Single(engine.VisibleRows);

        await engine.ExpandAsync(root.Id);
        Assert.Equal(100_001, engine.VisibleRows.Count);
    }

    /// <summary>
    /// Panel Explorer: SearchAsync trả file sâu (Account.xml) nhưng ancestor chưa có trong
    /// engine — ApplySearchMatchesAsync phải hiện file qua AppendVisible_NoLock.
    /// </summary>
    [Fact]
    public async Task PanelExplorer_search_shows_matched_file_with_expanded_ancestors()
    {
        var ds = new FakeDataSource();
        var app_data = ds.AddRoot("App_Data", has_children: true);
        var dir = ds.AddChild(app_data.Id, "Dir", has_children: true);
        var account = ds.AddChild(dir.Id, "Account.xml", has_children: false);
        account = account with { Kind = TreeNodeKind.File, SearchKey = "Account.xml" };
        ds.UpdateNode(account);

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();

        Assert.Single(engine.VisibleRows);
        Assert.Equal("App_Data", engine.VisibleRows[0].Node.DisplayName);

        var hits = await ds.SearchAsync("Account.xml", CancellationToken.None);
        Assert.Single(hits);

        await engine.ApplySearchMatchesAsync(hits, CancellationToken.None);

        var names = engine.VisibleRows.Select(r => r.Node.DisplayName).ToList();
        Assert.Contains("App_Data", names);
        Assert.Contains("Dir", names);
        Assert.Contains("Account.xml", names);
        Assert.Equal(3, engine.VisibleRows.Count);
    }

    /// <summary>
    /// Menu panel: search khớp menu qua SearchKey (bar/bar2/sysid/wmenu_id). File controller đã load
    /// dưới menu KHÔNG khớp keyword nhưng vẫn phải hiện & expand khi keep_descendants = true.
    /// </summary>
    [Fact]
    public async Task Menu_search_keeps_loaded_child_files_expanded_even_when_unmatched()
    {
        var ds = new FakeDataSource();
        var menu = ds.AddRoot("Kế toán tổng hợp", has_children: true);
        menu = menu with { SearchKey = "gltran" };
        ds.UpdateNode(menu);
        var dir = ds.AddChild(menu.Id, "Dir", has_children: true);
        var file = ds.AddChild(dir.Id, "unrelated_grid.xml", has_children: false);
        file = file with { Kind = TreeNodeKind.File, SearchKey = null };
        ds.UpdateNode(file);

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();
        // Người dùng đã expand menu → file controller được load vào cache, rồi collapse lại.
        await engine.ExpandAsync(menu.Id);
        await engine.ExpandAsync(dir.Id);
        await engine.CollapseAsync(menu.Id);

        var hits = await ds.SearchAsync("gltran", CancellationToken.None);
        Assert.Single(hits);
        Assert.Equal(menu.Id, hits[0].Id);

        await engine.ApplySearchMatchesAsync(
            hits, CancellationToken.None, empty_hides_all: true, keep_descendants: true);

        var names = engine.VisibleRows.Select(r => r.Node.DisplayName).ToList();
        Assert.Contains("Kế toán tổng hợp", names);
        Assert.Contains("Dir", names);
        Assert.Contains("unrelated_grid.xml", names);
    }

    /// <summary>Search không khớp menu nào → keep_descendants không cứu; empty_hides_all ẩn sạch cây.</summary>
    [Fact]
    public async Task Menu_search_with_no_match_hides_everything()
    {
        var ds = new FakeDataSource();
        var menu = ds.AddRoot("Kế toán", has_children: true);
        menu = menu with { SearchKey = "gltran" };
        ds.UpdateNode(menu);
        var dir = ds.AddChild(menu.Id, "Dir", has_children: true);
        ds.AddChild(dir.Id, "gl_grid.xml", has_children: false);

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();
        await engine.ExpandAsync(menu.Id);
        await engine.ExpandAsync(dir.Id);

        // "grid" chỉ khớp filename — không phải bar/bar2/sysid/wmenu_id → SearchAsync phải trả rỗng
        // trong panel Menu thực; ở đây giả lập bằng danh sách match rỗng.
        await engine.ApplySearchMatchesAsync(
            [], CancellationToken.None, empty_hides_all: true, keep_descendants: true);

        Assert.Empty(engine.VisibleRows);
    }

    /// <summary>
    /// Explorer bug (spec 2026-07-24): search "Customer" rồi đổi "Item" — Dir/Filter/Grid có Item.xml
    /// PHẢI hiện, không kế thừa nhánh Customer cũ; Customer.xml không còn hiện.
    /// </summary>
    [Fact]
    public async Task Search_keyword_change_shows_new_matches_across_all_folders()
    {
        var ds = new FakeDataSource();
        var dir = ds.AddRoot("Dir", has_children: true);
        var filter = ds.AddRoot("Filter", has_children: true);
        var grid = ds.AddRoot("Grid", has_children: true);
        MakeFile(ds, dir.Id, "Customer.xml");
        MakeFile(ds, dir.Id, "Item.xml");
        MakeFile(ds, filter.Id, "Customer.xml");
        MakeFile(ds, filter.Id, "Item.xml");
        MakeFile(ds, grid.Id, "Item.xml");

        await using var engine = new VirtualTreeEngine(ds);
        await engine.InitializeAsync();

        // Search "Customer" → Dir/Filter hiện với Customer.xml.
        await engine.ApplySearchMatchesAsync(
            await ds.SearchAsync("Customer", CancellationToken.None), CancellationToken.None);
        var after_customer = engine.VisibleRows.Select(r => r.Node.DisplayName).ToList();
        Assert.Contains("Dir", after_customer);
        Assert.Contains("Filter", after_customer);
        Assert.Contains("Customer.xml", after_customer);
        Assert.DoesNotContain("Item.xml", after_customer);

        // Đổi search "Item" → Dir/Filter/Grid hiện với Item.xml; Customer.xml biến mất.
        await engine.ApplySearchMatchesAsync(
            await ds.SearchAsync("Item", CancellationToken.None), CancellationToken.None);
        var after_item = engine.VisibleRows.Select(r => r.Node.DisplayName).ToList();
        Assert.Contains("Dir", after_item);
        Assert.Contains("Filter", after_item);
        Assert.Contains("Grid", after_item);
        Assert.Equal(3, after_item.Count(n => n == "Item.xml"));
        Assert.DoesNotContain("Customer.xml", after_item);
    }

    private static void MakeFile(FakeDataSource ds, Guid parent_id, string name)
    {
        var file = ds.AddChild(parent_id, name, has_children: false);
        ds.UpdateNode(file with { Kind = TreeNodeKind.File, SearchKey = name });
    }

    [Fact]
    public async Task Lru_does_not_dispose_expanded_branch()
    {
        var ds = new FakeDataSource();
        var keep = ds.AddRoot("Keep", has_children: true);
        ds.AddChild(keep.Id, "KeepChild", has_children: false);

        await using var engine = new VirtualTreeEngine(ds, new TreeEngineOptions { LruCapacity = 2 });
        await engine.InitializeAsync();
        await engine.ExpandAsync(keep.Id);

        for (var i = 0; i < 10; i++)
        {
            var folder = ds.AddRoot($"F{i}", has_children: true);
            ds.AddChild(folder.Id, $"C{i}", has_children: false);
            // re-init roots cache via patch of roots
            var roots = ds.GetRootsSnapshot();
            engine.PatchChildren(Guid.Empty, roots);
            await engine.ExpandAsync(folder.Id);
            await engine.CollapseAsync(folder.Id);
        }

        Assert.True(engine.IsExpanded(keep.Id));
        Assert.Contains(engine.VisibleRows, r => r.Node.DisplayName == "KeepChild");
    }
}

internal sealed class FakeDataSource : ITreeDataSource, ITreeSearchProvider
{
    private readonly Dictionary<Guid, List<TreeNode>> _children = new();
    private readonly List<TreeNode> _roots = [];
    private readonly Dictionary<Guid, TreeNode> _all = new();

    public int DelayMs { get; set; }

    public TreeNode AddRoot(string name, bool has_children)
    {
        var node = new TreeNode
        {
            Id = Guid.NewGuid(),
            ParentId = null,
            DisplayName = name,
            HasChildren = has_children,
            Kind = has_children ? TreeNodeKind.Folder : TreeNodeKind.Leaf,
            State = TreeNodeState.NotLoaded
        };
        _roots.Add(node);
        _all[node.Id] = node;
        _children[node.Id] = [];
        return node;
    }

    public TreeNode AddChild(Guid parent_id, string name, bool has_children)
    {
        var node = new TreeNode
        {
            Id = Guid.NewGuid(),
            ParentId = parent_id,
            DisplayName = name,
            HasChildren = has_children,
            Kind = has_children ? TreeNodeKind.Folder : TreeNodeKind.Leaf,
            State = TreeNodeState.NotLoaded
        };
        if (!_children.TryGetValue(parent_id, out var list))
        {
            list = [];
            _children[parent_id] = list;
        }

        list.Add(node);
        _all[node.Id] = node;
        _children[node.Id] = [];
        return node;
    }

    public IReadOnlyList<TreeNode> GetRootsSnapshot() => _roots.ToList();

    public async Task<IReadOnlyList<TreeNode>> GetChildrenAsync(
        TreeNode? parent,
        CancellationToken cancellation_token = default)
    {
        if (DelayMs > 0)
            await Task.Delay(DelayMs, cancellation_token).ConfigureAwait(false);

        if (parent is null)
            return _roots.ToList();

        return _children.TryGetValue(parent.Id, out var list)
            ? list.ToList()
            : Array.Empty<TreeNode>();
    }

    public bool HasChildren(TreeNode node) =>
        _children.TryGetValue(node.Id, out var list) && list.Count > 0 || node.HasChildren;

    public Task RefreshAsync(TreeNode node, CancellationToken cancellation_token = default) =>
        Task.CompletedTask;

    public Task<TreeNode?> FindNodeAsync(Guid id, CancellationToken cancellation_token = default) =>
        Task.FromResult(_all.TryGetValue(id, out var n) ? n : null);

    public void UpdateNode(TreeNode node) => _all[node.Id] = node;

    public Task<IReadOnlyList<TreeNode>> SearchAsync(
        string keyword,
        CancellationToken cancellation_token = default)
    {
        if (string.IsNullOrWhiteSpace(keyword))
            return Task.FromResult<IReadOnlyList<TreeNode>>(Array.Empty<TreeNode>());

        var needle = keyword.Trim();
        var hits = _all.Values
            .Where(n => n.DisplayName.Contains(needle, StringComparison.OrdinalIgnoreCase)
                        || n.SearchKey?.Contains(needle, StringComparison.OrdinalIgnoreCase) == true)
            .Take(500)
            .ToList();
        return Task.FromResult<IReadOnlyList<TreeNode>>(hits);
    }
}
