namespace DevWorkFlow.Tree;

/// <summary>
/// Immutable tree node. Framework never interprets <see cref="Metadata"/>.
/// </summary>
public sealed record TreeNode
{
    public required Guid Id { get; init; }
    public Guid? ParentId { get; init; }
    public required string DisplayName { get; init; }
    public string Icon { get; init; } = string.Empty;
    /// <summary>Optional hex color for UI icon (e.g. #1565C0). Empty = theme muted.</summary>
    public string IconColor { get; init; } = string.Empty;
    /// <summary>Optional hex color for label text. Empty = theme foreground.</summary>
    public string TextColor { get; init; } = string.Empty;
    public bool IsItalic { get; init; }
    /// <summary>False = separator / non-focusable row.</summary>
    public bool IsSelectable { get; init; } = true;
    public TreeNodeKind Kind { get; init; } = TreeNodeKind.Default;
    public TreeNodeState State { get; init; } = TreeNodeState.NotLoaded;
    public bool HasChildren { get; init; }
    public object? Metadata { get; init; }
    public string? SearchKey { get; init; }

    public bool IsPlaceholder => Kind == TreeNodeKind.Placeholder;

    public static TreeNode CreatePlaceholder(Guid parent_id) => new()
    {
        Id = Guid.NewGuid(),
        ParentId = parent_id,
        DisplayName = "…",
        Icon = string.Empty,
        Kind = TreeNodeKind.Placeholder,
        State = TreeNodeState.Loading,
        HasChildren = false,
        IsSelectable = false
    };

    public TreeNode WithState(TreeNodeState state) => this with { State = state };

    public TreeNode WithHasChildren(bool has_children) => this with { HasChildren = has_children };
}
