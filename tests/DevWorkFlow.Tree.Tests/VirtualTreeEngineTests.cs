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

internal sealed class FakeDataSource : ITreeDataSource
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
}
