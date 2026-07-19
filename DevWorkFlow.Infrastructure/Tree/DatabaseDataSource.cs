using System.Data;
using DevWorkFlow.Tree;

namespace DevWorkFlow.Infrastructure.Tree;

/// <summary>
/// Database catalog tree. Caller supplies a DataTable (schema_name, object_name, object_type, modify_date)
/// and folder mapping — no SQL inside the Tree framework.
/// </summary>
public sealed class DatabaseDataSource : ITreeDataSource, ITreeSearchProvider
{
    private readonly Dictionary<Guid, TreeNode> _nodes = new();
    private readonly Dictionary<Guid, List<TreeNode>> _children = new();
    private List<TreeNode> _roots = [];
    private string? _connection_string;

    public void SetCatalog(
        DataTable table,
        IReadOnlyDictionary<string, DatabaseFolderInfo> folders_by_type,
        string? connection_string)
    {
        _nodes.Clear();
        _children.Clear();
        _roots = [];
        _connection_string = connection_string;

        var folder_nodes = new Dictionary<string, TreeNode>(StringComparer.OrdinalIgnoreCase);
        foreach (var folder in folders_by_type.Values.GroupBy(f => f.FolderName, StringComparer.OrdinalIgnoreCase))
        {
            var info = folder.First();
            var node = new TreeNode
            {
                Id = Guid.NewGuid(),
                ParentId = null,
                DisplayName = info.FolderName,
                Icon = string.IsNullOrWhiteSpace(info.FolderIcon)
                    ? (string.IsNullOrWhiteSpace(info.Icon) ? "FolderOutline" : info.Icon)
                    : info.FolderIcon,
                IconColor = string.IsNullOrWhiteSpace(info.FolderColor) ? info.Color : info.FolderColor,
                Kind = TreeNodeKind.Folder,
                State = TreeNodeState.Loaded,
                HasChildren = true,
                SearchKey = info.FolderName,
                Metadata = new DatabaseNodeMeta
                {
                    IsFolder = true,
                    ConnectionString = connection_string
                }
            };
            folder_nodes[info.FolderName] = node;
            _nodes[node.Id] = node;
            _children[node.Id] = [];
            _roots.Add(node);
        }

        _roots = _roots
            .OrderBy(r => folders_by_type.Values.FirstOrDefault(f =>
                string.Equals(f.FolderName, r.DisplayName, StringComparison.OrdinalIgnoreCase))?.Order ?? 0)
            .ToList();

        foreach (DataRow row in table.Rows)
        {
            var schema = Convert.ToString(row["schema_name"]) ?? "dbo";
            var name = Convert.ToString(row["object_name"]) ?? string.Empty;
            var type_code = (Convert.ToString(row["object_type"]) ?? string.Empty).Trim();
            if (string.IsNullOrWhiteSpace(name)) continue;
            if (!folders_by_type.TryGetValue(type_code, out var folder_info)) continue;
            if (!folder_nodes.TryGetValue(folder_info.FolderName, out var folder_node)) continue;

            var display = $"{schema}.{name}";
            var child = new TreeNode
            {
                Id = Guid.NewGuid(),
                ParentId = folder_node.Id,
                DisplayName = display,
                Icon = string.IsNullOrWhiteSpace(folder_info.Icon) ? "DatabaseOutline" : folder_info.Icon,
                IconColor = folder_info.Color,
                Kind = TreeNodeKind.Leaf,
                State = TreeNodeState.Loaded,
                HasChildren = false,
                SearchKey = display,
                Metadata = new DatabaseNodeMeta
                {
                    Schema = schema,
                    ObjectName = name,
                    ObjectType = type_code,
                    IsFolder = false,
                    ConnectionString = connection_string
                }
            };
            _nodes[child.Id] = child;
            _children[folder_node.Id].Add(child);
        }
    }

    public Task<IReadOnlyList<TreeNode>> GetChildrenAsync(
        TreeNode? parent,
        CancellationToken cancellation_token = default)
    {
        if (parent is null)
            return Task.FromResult<IReadOnlyList<TreeNode>>(_roots);

        if (_children.TryGetValue(parent.Id, out var list))
            return Task.FromResult<IReadOnlyList<TreeNode>>(list);

        return Task.FromResult<IReadOnlyList<TreeNode>>(Array.Empty<TreeNode>());
    }

    public bool HasChildren(TreeNode node) =>
        _children.TryGetValue(node.Id, out var list) && list.Count > 0;

    public Task RefreshAsync(TreeNode node, CancellationToken cancellation_token = default) =>
        Task.CompletedTask;

    public Task<TreeNode?> FindNodeAsync(Guid id, CancellationToken cancellation_token = default) =>
        Task.FromResult(_nodes.TryGetValue(id, out var n) ? n : null);

    public Task<IReadOnlyList<TreeNode>> SearchAsync(
        string keyword,
        CancellationToken cancellation_token = default)
    {
        if (string.IsNullOrWhiteSpace(keyword))
            return Task.FromResult<IReadOnlyList<TreeNode>>(Array.Empty<TreeNode>());

        var needle = keyword.Trim();
        var hits = _nodes.Values
            .Where(n => n.Kind != TreeNodeKind.Folder
                        && (n.SearchKey?.Contains(needle, StringComparison.OrdinalIgnoreCase) == true
                            || n.DisplayName.Contains(needle, StringComparison.OrdinalIgnoreCase)))
            .Take(500)
            .ToList();
        return Task.FromResult<IReadOnlyList<TreeNode>>(hits);
    }
}

public sealed class DatabaseFolderInfo
{
    public required string FolderName { get; init; }
    public int Order { get; init; }
    public string Icon { get; init; } = "DatabaseOutline";
    public string Color { get; init; } = string.Empty;
    public string FolderIcon { get; init; } = "FolderOutline";
    public string FolderColor { get; init; } = string.Empty;
}
