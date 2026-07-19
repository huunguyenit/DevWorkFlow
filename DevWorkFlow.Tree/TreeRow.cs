namespace DevWorkFlow.Tree;

/// <summary>
/// Flat visible row produced by <see cref="VirtualTreeEngine"/>.
/// Rendering layer binds to this — not to hierarchical children.
/// </summary>
public sealed record TreeRow(
    TreeNode Node,
    int Depth,
    bool IsExpanded,
    bool IsExpandable);
