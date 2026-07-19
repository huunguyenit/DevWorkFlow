namespace DevWorkFlow.Tree;

/// <summary>Optional: search belongs to DataSource; Tree only renders results.</summary>
public interface ITreeSearchProvider
{
    Task<IReadOnlyList<TreeNode>> SearchAsync(
        string keyword,
        CancellationToken cancellation_token = default);
}

/// <summary>Context-menu command descriptor (DataSource decides available actions).</summary>
public sealed record TreeCommand(
    string Id,
    string Header,
    bool IsEnabled = true,
    object? Parameter = null);

public interface ITreeCommandProvider
{
    Task<IReadOnlyList<TreeCommand>> GetCommandsAsync(
        IReadOnlyList<TreeNode> selection,
        CancellationToken cancellation_token = default);

    Task ExecuteAsync(
        TreeCommand command,
        IReadOnlyList<TreeNode> selection,
        CancellationToken cancellation_token = default);
}

public enum TreeDropEffect
{
    None = 0,
    Move = 1,
    Copy = 2,
    Link = 3
}

public interface ITreeDragDropHandler
{
    TreeDropEffect GetEffects(IReadOnlyList<TreeNode> dragged, TreeNode? target);

    Task<bool> DropAsync(
        IReadOnlyList<TreeNode> dragged,
        TreeNode? target,
        TreeDropEffect effect,
        CancellationToken cancellation_token = default);
}
