namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Khoảng text do Navigation Map cung cấp cho Editor (Rendering Engine).
/// Consumer (Outline/AI/Validation) không tự tính offset — chỉ nhận qua NavigationTarget.
/// </summary>
public readonly record struct TextRange(int StartOffset, int EndOffset)
{
    public int Length => Math.Max(0, EndOffset - StartOffset);

    public bool IsEmpty => Length <= 0;

    public static TextRange Empty { get; } = new(0, 0);

    public static TextRange FromSpan(SourceSpan span) =>
        new(span.StartOffset, span.EndOffset);

    public SourceSpan ToSpan() =>
        new(StartOffset, Length);
}
