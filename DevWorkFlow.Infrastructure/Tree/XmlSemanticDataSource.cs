using DevWorkFlow.Tree;

namespace DevWorkFlow.Infrastructure.Tree;

/// <summary>Outline / semantic tree — caller supplies hierarchy from Navigation Map (no XML parse).</summary>
public sealed class XmlSemanticDataSource : ITreeDataSource, ITreeSearchProvider
{
    private readonly Dictionary<Guid, TreeNode> _nodes = new();
    private readonly Dictionary<Guid, List<TreeNode>> _children = new();
    private List<TreeNode> _roots = [];

    public void SetHierarchy(IReadOnlyList<(TreeNode Node, Guid? ParentId)> flat)
    {
        _nodes.Clear();
        _children.Clear();
        _roots = [];

        foreach (var (node, parent_id) in flat)
        {
            var stored = node with { ParentId = parent_id };
            _nodes[stored.Id] = stored;
            if (parent_id is null)
            {
                _roots.Add(stored);
            }
            else
            {
                if (!_children.TryGetValue(parent_id.Value, out var list))
                {
                    list = [];
                    _children[parent_id.Value] = list;
                }

                list.Add(stored);
            }
        }

        foreach (var id in _children.Keys.ToList())
        {
            if (_nodes.TryGetValue(id, out var parent))
                _nodes[id] = parent.WithHasChildren(true).WithState(TreeNodeState.Loaded);
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
            .Where(n => n.DisplayName.Contains(needle, StringComparison.OrdinalIgnoreCase)
                        || n.SearchKey?.Contains(needle, StringComparison.OrdinalIgnoreCase) == true)
            .Take(500)
            .ToList();
        return Task.FromResult<IReadOnlyList<TreeNode>>(hits);
    }
}
