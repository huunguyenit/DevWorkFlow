namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Kết quả điều hướng — Editor chỉ Scroll/Select theo TextRange.
/// Outline/Designer/AI/Validation chỉ làm việc với NodeId hoặc Symbol.
/// </summary>
public sealed class NavigationTarget
{
    public required NodeId NodeId { get; init; }

    public required string DocumentUri { get; init; }

    public required TextRange TextRange { get; init; }

    public required string NodeType { get; init; }

    /// <summary>ErpSymbol.Id nếu có.</summary>
    public string? SymbolId { get; init; }

    public ErpSymbol? Symbol { get; init; }

    public int StartLine { get; init; }

    public int EndLine { get; init; }

    /// <summary>true = Editor chỉ caret/scroll, không Select highlight.</summary>
    public bool PreferCaretOnly { get; init; }

    /// <summary>
    /// true = <see cref="TextRange"/> tính trên buffer ClearText (Insight map). Editor áp
    /// offset trực tiếp, không đi qua ClearTextOffsetMap. Xem <see cref="DocumentNode.UsesClearTextOffsets"/>.
    /// </summary>
    public bool UsesClearTextOffsets { get; init; }
}
