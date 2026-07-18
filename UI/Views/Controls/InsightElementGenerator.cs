using System.Windows.Input;
using DevWorkFlow.Domain.Language;
using ICSharpCode.AvalonEdit.Rendering;

namespace UI.Views.Controls;

/// <summary>
/// Rendering adapter chung: chỉ compose/render InsightItem, không parse hay resolve XML.
/// </summary>
public sealed class InsightElementGenerator : VisualLineElementGenerator
{
    private IReadOnlyList<InsightItem> _insights = [];

    public IReadOnlyList<InsightItem> Insights
    {
        get => _insights;
        set => _insights = value ?? [];
    }

    public ICommand? EditCommand { get; set; }

    public bool IsEnabled { get; set; }

    public override int GetFirstInterestedOffset(int start_offset)
    {
        if (!IsEnabled)
            return -1;

        var end_offset = CurrentContext.VisualLine.LastDocumentLine.EndOffset;
        return _insights
            .Where(IsRenderable)
            .Select(item => item.Range.Span.StartOffset)
            .Where(offset => offset >= start_offset && offset < end_offset)
            .DefaultIfEmpty(-1)
            .Min();
    }

    public override VisualLineElement? ConstructElement(int offset)
    {
        if (!IsEnabled)
            return null;

        var insight = _insights
            .Where(IsRenderable)
            .OrderByDescending(item => item.Priority)
            .FirstOrDefault(item => item.Range.Span.StartOffset == offset);
        if (insight is null || insight.Range.Span.Length <= 0)
            return null;

        return insight.Type switch
        {
            InsightType.Entity => new InlineObjectElement(
                insight.Range.Span.Length,
                new EntityInsightBlock(insight, EditCommand)),
            _ => null
        };
    }

    private static bool IsRenderable(InsightItem item) =>
        item.Type == InsightType.Entity
        && item.Range.Span.StartOffset >= 0
        && item.Range.Span.Length > 0;
}
