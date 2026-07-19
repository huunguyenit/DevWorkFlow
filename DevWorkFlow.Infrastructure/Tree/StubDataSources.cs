using DevWorkFlow.Tree;

namespace DevWorkFlow.Infrastructure.Tree;

/// <summary>Stub DataSources for Workflow / Entity / AI — structure only until domain models land.</summary>
public abstract class StubTreeDataSource : ITreeDataSource, ITreeSearchProvider
{
    private readonly List<TreeNode> _roots;
    private readonly Dictionary<Guid, TreeNode> _nodes = new();

    protected StubTreeDataSource(string root_label, string icon)
    {
        var root = new TreeNode
        {
            Id = Guid.NewGuid(),
            DisplayName = root_label,
            Icon = icon,
            Kind = TreeNodeKind.Group,
            State = TreeNodeState.Loaded,
            HasChildren = true,
            Metadata = new StubNodeMeta { Key = root_label }
        };
        var placeholder = new TreeNode
        {
            Id = Guid.NewGuid(),
            ParentId = root.Id,
            DisplayName = "(not implemented)",
            Icon = "InformationOutline",
            Kind = TreeNodeKind.Leaf,
            State = TreeNodeState.Loaded,
            HasChildren = false,
            Metadata = new StubNodeMeta { Key = $"{root_label}:todo" }
        };
        _roots = [root];
        _nodes[root.Id] = root;
        _nodes[placeholder.Id] = placeholder;
        Children[root.Id] = [placeholder];
    }

    protected Dictionary<Guid, List<TreeNode>> Children { get; } = new();

    public Task<IReadOnlyList<TreeNode>> GetChildrenAsync(
        TreeNode? parent,
        CancellationToken cancellation_token = default)
    {
        if (parent is null)
            return Task.FromResult<IReadOnlyList<TreeNode>>(_roots);

        if (Children.TryGetValue(parent.Id, out var list))
            return Task.FromResult<IReadOnlyList<TreeNode>>(list);

        return Task.FromResult<IReadOnlyList<TreeNode>>(Array.Empty<TreeNode>());
    }

    public bool HasChildren(TreeNode node) => Children.ContainsKey(node.Id);

    public Task RefreshAsync(TreeNode node, CancellationToken cancellation_token = default) =>
        Task.CompletedTask;

    public Task<TreeNode?> FindNodeAsync(Guid id, CancellationToken cancellation_token = default) =>
        Task.FromResult(_nodes.TryGetValue(id, out var n) ? n : null);

    public Task<IReadOnlyList<TreeNode>> SearchAsync(
        string keyword,
        CancellationToken cancellation_token = default) =>
        Task.FromResult<IReadOnlyList<TreeNode>>(Array.Empty<TreeNode>());
}

public sealed class WorkflowDataSource : StubTreeDataSource
{
    public WorkflowDataSource() : base("Workflow", "SitemapOutline") { }
}

public sealed class EntityDataSource : StubTreeDataSource
{
    public EntityDataSource() : base("Entities", "Graphql") { }
}

public sealed class AIResultDataSource : StubTreeDataSource
{
    public AIResultDataSource() : base("AI Results", "RobotOutline") { }
}
