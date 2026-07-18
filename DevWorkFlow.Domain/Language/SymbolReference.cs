namespace DevWorkFlow.Domain.Language;

/// <summary>Tham chiếu tới một <see cref="ErpSymbol"/>.</summary>
public sealed class SymbolReference
{
    public string SymbolId { get; init; } = string.Empty;

    public SourceLocation Location { get; init; } = SourceLocation.None;

    /// <summary>Mô tả ngắn (ví dụ items.controller, &amp;Entity;).</summary>
    public string Kind { get; init; } = string.Empty;
}
