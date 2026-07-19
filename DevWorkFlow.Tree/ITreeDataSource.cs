namespace DevWorkFlow.Tree;

/// <summary>
/// Data provider for the tree. All I/O and business logic live here — never in the Tree framework.
/// </summary>
public interface ITreeDataSource
{
    /// <summary>Children of <paramref name="parent"/>; null parent = roots.</summary>
    Task<IReadOnlyList<TreeNode>> GetChildrenAsync(
        TreeNode? parent,
        CancellationToken cancellation_token = default);

    bool HasChildren(TreeNode node);

    Task RefreshAsync(TreeNode node, CancellationToken cancellation_token = default);

    Task<TreeNode?> FindNodeAsync(Guid id, CancellationToken cancellation_token = default);
}
