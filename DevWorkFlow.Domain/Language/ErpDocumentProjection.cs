namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Storage projections chuyển tiếp cho Language Service adapters.
/// Editor mode chuẩn dùng <see cref="ErpEditorMode"/>.
/// </summary>
public enum ErpProjectionKind
{
    Source = 0,
    ClearText = 1,
    Semantic = 2
}

/// <summary>Entity segment chuyển tiếp; UI mới dùng <see cref="InsightItem"/>.</summary>
public sealed class EntityProjectionSegment
{
    public string SymbolId { get; init; } = string.Empty;

    public string Name { get; init; } = string.Empty;

    public string DisplayText { get; init; } = string.Empty;

    /// <summary>Span của reference trong Source projection.</summary>
    public SourceSpan SourceSpan { get; init; }

    public bool CanEdit { get; init; }
}

/// <summary>
/// Projection hiển thị; SourceText luôn là storage gốc, Text tùy theo mode.
/// </summary>
public sealed class ErpDocumentProjection
{
    public ErpProjectionKind Kind { get; init; }

    public string Text { get; init; } = string.Empty;

    public IReadOnlyList<EntityProjectionSegment> EntitySegments { get; init; } = [];
}

/// <summary>Kết quả semantic edit entity.</summary>
public sealed class EntityEditResult
{
    public bool Success { get; init; }

    public string? Error { get; init; }

    public IErpDocument? Document { get; init; }
}

/// <summary>Yêu cầu inline edit gửi từ semantic entity control.</summary>
public sealed class EntityValueEdit
{
    public string EntityName { get; init; } = string.Empty;

    public string NewValue { get; init; } = string.Empty;
}
