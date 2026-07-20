using DevWorkFlow.Tree;

namespace DevWorkFlow.Infrastructure.Tree;

/// <summary>
/// Hierarchical command/menu tree. Caller feeds root nodes (already mapped from wcommand).
/// </summary>
public sealed class CommandDataSource : ITreeDataSource, ITreeSearchProvider, ITreeCommandProvider
{
    private readonly Dictionary<Guid, TreeNode> _nodes = new();
    private readonly Dictionary<Guid, List<TreeNode>> _children = new();
    private List<TreeNode> _roots = [];

    public void SetTree(IReadOnlyList<TreeNode> roots, IReadOnlyDictionary<Guid, IReadOnlyList<TreeNode>> children)
    {
        _nodes.Clear();
        _children.Clear();
        _roots = roots.ToList();
        foreach (var root in roots)
            _nodes[root.Id] = root;

        foreach (var (parent_id, kids) in children)
        {
            _children[parent_id] = kids.ToList();
            foreach (var kid in kids)
                _nodes[kid.Id] = kid;
        }
    }

    /// <summary>Build from a recursive node factory (UI/domain maps MenuTreeNode → TreeNode).</summary>
    public void SetFromHierarchy(IReadOnlyList<TreeNode> roots)
    {
        _nodes.Clear();
        _children.Clear();
        _roots = [];
        foreach (var root in roots)
            IndexRecursive(root, parent_id: null);
    }

    private void IndexRecursive(TreeNode node, Guid? parent_id)
    {
        var stored = node.ParentId == parent_id ? node : node with { ParentId = parent_id };
        _nodes[stored.Id] = stored;
        if (parent_id is null)
            _roots.Add(stored);

        // Children come from Metadata bag if provided as List<TreeNode> under "Children" — avoid that.
        // Caller should use SetTree for full graphs. This overload only indexes the given roots list
        // as leaves unless HasChildren and children already registered.
        if (!_children.ContainsKey(stored.Id))
            _children[stored.Id] = [];
    }

    public void AddChild(Guid parent_id, TreeNode child)
    {
        var stored = child.ParentId == parent_id ? child : child with { ParentId = parent_id };
        _nodes[stored.Id] = stored;
        if (!_children.TryGetValue(parent_id, out var list))
        {
            list = [];
            _children[parent_id] = list;
        }

        list.Add(stored);
        if (_nodes.TryGetValue(parent_id, out var parent))
            _nodes[parent_id] = parent.WithHasChildren(true).WithState(TreeNodeState.Loaded);
    }

    public void ReplaceChildren(Guid parent_id, IReadOnlyList<TreeNode> children)
    {
        var list = children.Select(c => c.ParentId == parent_id ? c : c with { ParentId = parent_id }).ToList();
        _children[parent_id] = list;
        foreach (var c in list)
            _nodes[c.Id] = c;
        if (_nodes.TryGetValue(parent_id, out var parent))
            _nodes[parent_id] = parent.WithHasChildren(list.Count > 0).WithState(TreeNodeState.Loaded);
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
        node.HasChildren || (_children.TryGetValue(node.Id, out var list) && list.Count > 0);

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
            .Where(n => n.Kind != TreeNodeKind.Separator
                        && n.Kind != TreeNodeKind.File
                        && n.SearchKey?.Contains(needle, StringComparison.OrdinalIgnoreCase) == true)
            .Take(500)
            .ToList();
        return Task.FromResult<IReadOnlyList<TreeNode>>(hits);
    }

    public Task<IReadOnlyList<TreeCommand>> GetCommandsAsync(
        IReadOnlyList<TreeNode> selection,
        CancellationToken cancellation_token = default)
    {
        var commands = new List<TreeCommand>
        {
            new("refresh", "Refresh", IsEnabled: selection.Count <= 1)
        };
        if (selection.Any(s => s.Metadata is CommandNodeMeta { Link: not null and not "" }))
            commands.Add(new TreeCommand("open", "Open"));

        return Task.FromResult<IReadOnlyList<TreeCommand>>(commands);
    }

    public Task ExecuteAsync(
        TreeCommand command,
        IReadOnlyList<TreeNode> selection,
        CancellationToken cancellation_token = default) =>
        Task.CompletedTask;
}
