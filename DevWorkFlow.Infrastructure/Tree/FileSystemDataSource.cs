using DevWorkFlow.Tree;

namespace DevWorkFlow.Infrastructure.Tree;

/// <summary>
/// Lazy filesystem tree. Framework-safe: all IO lives here.
/// </summary>
public sealed class FileSystemDataSource : ITreeDataSource, ITreeSearchProvider
{
    private readonly Func<FileSystemDataSourceOptions> _options_factory;
    private readonly Dictionary<Guid, TreeNode> _nodes = new();
    private readonly Dictionary<string, Guid> _path_to_id = new(StringComparer.OrdinalIgnoreCase);
    private string? _root_path;

    public FileSystemDataSource(Func<FileSystemDataSourceOptions> options_factory)
    {
        _options_factory = options_factory ?? throw new ArgumentNullException(nameof(options_factory));
    }

    public FileSystemDataSource(FileSystemDataSourceOptions options)
        : this(() => options)
    {
    }

    public void SetRoot(string? root_path)
    {
        _root_path = string.IsNullOrWhiteSpace(root_path) ? null : Path.GetFullPath(root_path);
        _nodes.Clear();
        _path_to_id.Clear();
    }

    public async Task<IReadOnlyList<TreeNode>> GetChildrenAsync(
        TreeNode? parent,
        CancellationToken cancellation_token = default)
    {
        var options = _options_factory();
        return await Task.Run(
            () =>
            {
                cancellation_token.ThrowIfCancellationRequested();
                if (parent is null)
                    return LoadRoots(options, cancellation_token);

                if (parent.Metadata is not FileSystemNodeMeta { IsDirectory: true } meta)
                    return (IReadOnlyList<TreeNode>)Array.Empty<TreeNode>();

                return LoadDirectory(meta.FullPath, parent.Id, options, cancellation_token);
            },
            cancellation_token).ConfigureAwait(false);
    }

    public bool HasChildren(TreeNode node) =>
        node.HasChildren
        || node.Metadata is FileSystemNodeMeta { IsDirectory: true };

    public Task RefreshAsync(TreeNode node, CancellationToken cancellation_token = default)
    {
        if (node.Metadata is FileSystemNodeMeta meta)
        {
            // Drop path cache entries under this folder so next GetChildren re-enumerates.
            var prefix = meta.FullPath.TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar)
                         + Path.DirectorySeparatorChar;
            foreach (var path in _path_to_id.Keys.Where(p =>
                         p.StartsWith(prefix, StringComparison.OrdinalIgnoreCase)).ToList())
            {
                if (_path_to_id.TryGetValue(path, out var id))
                    _nodes.Remove(id);
                _path_to_id.Remove(path);
            }
        }

        return Task.CompletedTask;
    }

    public Task<TreeNode?> FindNodeAsync(Guid id, CancellationToken cancellation_token = default) =>
        Task.FromResult(_nodes.TryGetValue(id, out var n) ? n : null);

    public Task<IReadOnlyList<TreeNode>> SearchAsync(
        string keyword,
        CancellationToken cancellation_token = default)
    {
        if (string.IsNullOrWhiteSpace(keyword) || string.IsNullOrWhiteSpace(_root_path))
            return Task.FromResult<IReadOnlyList<TreeNode>>(Array.Empty<TreeNode>());

        var options = _options_factory();
        var max_hits = Math.Max(50, options.SearchMaxHits);
        var needle = keyword.Trim();

        // Không truyền cancellation_token vào Task.Run — khi user gõ tiếp, CTS hủy task
        // scheduled → TaskCanceledException/OperationCanceledException dù vòng lặp chưa
        // chạy. Chỉ kiểm tra hợp tác trong vòng quét; kết quả cũ bị VM bỏ qua theo keyword.
        return Task.Run(
            () =>
            {
                var hits = new List<TreeNode>();
                foreach (var file in EnumerateFilesSafe(_root_path!, options, cancellation_token))
                {
                    if (cancellation_token.IsCancellationRequested)
                        break;

                    var name = Path.GetFileName(file);
                    if (name.Contains(needle, StringComparison.OrdinalIgnoreCase)
                        || file.Contains(needle, StringComparison.OrdinalIgnoreCase))
                    {
                        hits.Add(EnsurePathChain(file, is_directory: false));
                        if (hits.Count >= max_hits) break;
                    }
                }

                return (IReadOnlyList<TreeNode>)hits;
            });
    }

    private IReadOnlyList<TreeNode> LoadRoots(
        FileSystemDataSourceOptions options,
        CancellationToken cancellation_token)
    {
        if (string.IsNullOrWhiteSpace(_root_path) || !Directory.Exists(_root_path))
            return Array.Empty<TreeNode>();

        return LoadDirectory(_root_path, parent_id: null, options, cancellation_token);
    }

    private IReadOnlyList<TreeNode> LoadDirectory(
        string path,
        Guid? parent_id,
        FileSystemDataSourceOptions options,
        CancellationToken cancellation_token)
    {
        var result = new List<TreeNode>();
        var folder_name = Path.GetFileName(
            path.TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar));
        var is_root = parent_id is null;

        try
        {
            foreach (var dir in Directory.EnumerateDirectories(path))
            {
                cancellation_token.ThrowIfCancellationRequested();
                var name = Path.GetFileName(dir);
                if (is_root && options.HiddenRootFolders.Contains(name))
                    continue;

                result.Add(GetOrCreateDirNode(dir, parent_id));
            }

            var files = Directory.EnumerateFiles(path).ToList();
            foreach (var file in files)
            {
                cancellation_token.ThrowIfCancellationRequested();
                var ext = Path.GetExtension(file);
                if (options.ExcludedExtensions.Contains(ext))
                    continue;
                if (ShouldHideDotF(file, files, folder_name, options))
                    continue;

                result.Add(GetOrCreateFileNode(file, parent_id));
            }
        }
        catch (UnauthorizedAccessException)
        {
            // skip
        }
        catch (DirectoryNotFoundException)
        {
            // skip
        }

        return SortChildren(result, is_root, options);
    }

    private static List<TreeNode> SortChildren(
        List<TreeNode> nodes,
        bool is_root,
        FileSystemDataSourceOptions options)
    {
        var preferred = options.PreferredRootFolders;
        return nodes
            .OrderByDescending(n => n.Kind == TreeNodeKind.Folder)
            .ThenBy(n => is_root ? PreferredFolderRank(n.DisplayName, preferred) : int.MaxValue)
            .ThenBy(n => n.DisplayName, StringComparer.OrdinalIgnoreCase)
            .ToList();
    }

    private static int PreferredFolderRank(string name, IReadOnlyList<string> preferred)
    {
        if (preferred.Count == 0) return int.MaxValue;
        for (var i = 0; i < preferred.Count; i++)
        {
            if (string.Equals(preferred[i], name, StringComparison.OrdinalIgnoreCase))
                return i;
        }

        // Không nằm trong preferred → sau các folder ưu tiên, vẫn alpha
        return preferred.Count + 1_000;
    }

    private TreeNode EnsurePathChain(string path, bool is_directory)
    {
        var full = Path.GetFullPath(path);
        if (_root_path is null)
            return is_directory
                ? GetOrCreateDirNode(full, null)
                : GetOrCreateFileNode(full, null);

        var root = Path.GetFullPath(_root_path)
            .TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar);
        var relative = Path.GetRelativePath(root, full);
        if (relative.StartsWith("..", StringComparison.Ordinal))
            return is_directory
                ? GetOrCreateDirNode(full, null)
                : GetOrCreateFileNode(full, null);

        Guid? parent_id = null;
        var current = root;
        var parts = relative.Split(
            [Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar],
            StringSplitOptions.RemoveEmptyEntries);

        for (var i = 0; i < parts.Length; i++)
        {
            current = Path.Combine(current, parts[i]);
            var is_last = i == parts.Length - 1;
            if (is_last && !is_directory)
            {
                return GetOrCreateFileNode(current, parent_id);
            }

            var dir_node = GetOrCreateDirNode(current, parent_id);
            parent_id = dir_node.Id;
            if (is_last)
                return dir_node;
        }

        return is_directory
            ? GetOrCreateDirNode(full, parent_id)
            : GetOrCreateFileNode(full, parent_id);
    }

    private TreeNode GetOrCreateDirNode(string path, Guid? parent_id)
    {
        var full = Path.GetFullPath(path);
        if (_path_to_id.TryGetValue(full, out var existing) && _nodes.TryGetValue(existing, out var node))
            return node with { ParentId = parent_id };

        var options = _options_factory();
        var visual = options.ResolveVisual?.Invoke(full, true)
                     ?? ("Folder", string.Empty, false);

        var created = new TreeNode
        {
            Id = Guid.NewGuid(),
            ParentId = parent_id,
            DisplayName = Path.GetFileName(full),
            Icon = visual.Icon,
            IconColor = visual.Color,
            IsItalic = visual.IsItalic,
            Kind = TreeNodeKind.Folder,
            State = TreeNodeState.NotLoaded,
            HasChildren = true,
            SearchKey = Path.GetFileName(full),
            Metadata = new FileSystemNodeMeta { FullPath = full, IsDirectory = true }
        };
        _nodes[created.Id] = created;
        _path_to_id[full] = created.Id;
        return created;
    }

    private TreeNode GetOrCreateFileNode(string path, Guid? parent_id)
    {
        var full = Path.GetFullPath(path);
        if (_path_to_id.TryGetValue(full, out var existing) && _nodes.TryGetValue(existing, out var node))
            return node with { ParentId = parent_id };

        var options = _options_factory();
        var visual = options.ResolveVisual?.Invoke(full, false)
                     ?? ("FileOutline", string.Empty, false);
        var is_f = Path.GetExtension(full).Equals(".f", StringComparison.OrdinalIgnoreCase);

        var created = new TreeNode
        {
            Id = Guid.NewGuid(),
            ParentId = parent_id,
            DisplayName = Path.GetFileName(full),
            Icon = visual.Icon,
            IconColor = visual.Color,
            IsItalic = visual.IsItalic || is_f,
            Kind = TreeNodeKind.File,
            State = TreeNodeState.Loaded,
            HasChildren = false,
            SearchKey = Path.GetFileName(full),
            Metadata = new FileSystemNodeMeta { FullPath = full, IsDirectory = false }
        };
        _nodes[created.Id] = created;
        _path_to_id[full] = created.Id;
        return created;
    }

    /// <summary>
    /// Ẩn .f khi:
    /// 1) Có file cặp bỏ đuôi .f (Form.xml.f ↔ Form.xml) — mọi folder
    /// 2) Trong Dir/Grid/Filter: cùng tên với .xml (Account.f ↔ Account.xml)
    /// </summary>
    private static bool ShouldHideDotF(
        string file_path,
        IReadOnlyList<string> siblings,
        string folder_name,
        FileSystemDataSourceOptions options)
    {
        if (!file_path.EndsWith(".f", StringComparison.OrdinalIgnoreCase))
            return false;

        // Form.xml.f khi đã có Form.xml
        var paired_strip_f = file_path[..^2];
        if (siblings.Any(s => string.Equals(s, paired_strip_f, StringComparison.OrdinalIgnoreCase)))
            return true;

        // Dir/Grid/Filter: Account.f khi đã có Account.xml
        if (!options.HideDotFWhenXmlExistsFolders.Contains(folder_name))
            return false;

        var dir = Path.GetDirectoryName(file_path);
        if (string.IsNullOrEmpty(dir)) return false;

        var base_name = Path.GetFileNameWithoutExtension(file_path);
        var xml_sibling = Path.Combine(dir, base_name + ".xml");
        return siblings.Any(s => string.Equals(s, xml_sibling, StringComparison.OrdinalIgnoreCase));
    }

    private static IEnumerable<string> EnumerateFilesSafe(
        string root,
        FileSystemDataSourceOptions options,
        CancellationToken cancellation_token)
    {
        var stack = new Stack<string>();
        stack.Push(root);
        while (stack.Count > 0)
        {
            if (cancellation_token.IsCancellationRequested)
                yield break;

            var dir = stack.Pop();
            IEnumerable<string> dirs;
            IEnumerable<string> files;
            try
            {
                dirs = Directory.EnumerateDirectories(dir);
                files = Directory.EnumerateFiles(dir);
            }
            catch
            {
                continue;
            }

            foreach (var child in dirs)
            {
                var name = Path.GetFileName(child);
                if (string.Equals(dir, root, StringComparison.OrdinalIgnoreCase)
                    && options.HiddenRootFolders.Contains(name))
                    continue;
                stack.Push(child);
            }

            var folder_name = Path.GetFileName(
                dir.TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar));
            var file_list = files.ToList();
            foreach (var file in file_list)
            {
                var ext = Path.GetExtension(file);
                if (options.ExcludedExtensions.Contains(ext)) continue;
                if (ShouldHideDotF(file, file_list, folder_name, options))
                    continue;
                yield return file;
            }
        }
    }
}

public sealed class FileSystemDataSourceOptions
{
    public HashSet<string> HiddenRootFolders { get; init; } = new(StringComparer.OrdinalIgnoreCase);
    public HashSet<string> ExcludedExtensions { get; init; } = new(StringComparer.OrdinalIgnoreCase);
    public int SearchMaxHits { get; init; } = 400;

    /// <summary>Thứ tự folder cấp root (program). Không khớp → xếp sau, alpha.</summary>
    public IReadOnlyList<string> PreferredRootFolders { get; init; } = Array.Empty<string>();

    /// <summary>
    /// Trong các folder này, ẩn *.f nếu đã có *.xml cùng tên (Account.f + Account.xml).
    /// Mặc định: Dir, Grid, Filter.
    /// </summary>
    public HashSet<string> HideDotFWhenXmlExistsFolders { get; init; } =
        new(StringComparer.OrdinalIgnoreCase) { "Dir", "Grid", "Filter" };

    /// <summary>
    /// Optional visual resolver. Signature: (full_path, is_directory) → (icon, color, is_italic).
    /// </summary>
    public Func<string, bool, (string Icon, string Color, bool IsItalic)>? ResolveVisual { get; init; }
}
