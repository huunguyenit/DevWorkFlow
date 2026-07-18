using DevWorkFlow.Domain.Language;
using UI.ViewModels.Base;

namespace UI.ViewModels.Design;

/// <summary>Một dòng hiển thị trên cột Semantic Kind / Resolved Value (Insight Mode).</summary>
public sealed class InsightEditorLineVm : ViewModelBase
{
    public required int LineNumber { get; init; }

    public required string KindBadge { get; init; }

    public required string KindIcon { get; init; }

    public string ReferenceText { get; init; } = string.Empty;

    public string ResolvedValue { get; set; } = string.Empty;

    public bool CanEdit { get; init; }

    public string? EntityName { get; init; }

    public string? SymbolId { get; init; }

    public InsightType InsightType { get; init; }

    public string DisplayLine => $"Ln {LineNumber}";

    public static InsightEditorLineVm FromInsight(InsightItem insight)
    {
        var line = insight.Range.Line > 0
            ? insight.Range.Line
            : 1;

        return new InsightEditorLineVm
        {
            LineNumber = line,
            KindBadge = insight.Type switch
            {
                InsightType.Entity => "Entity",
                InsightType.Validation => insight.Layer switch
                {
                    InsightLayer.Error => "Error",
                    InsightLayer.Warning => "Warning",
                    _ => "Hint"
                },
                _ => insight.Type.ToString()
            },
            KindIcon = insight.Type switch
            {
                InsightType.Entity => "AlphaEBox",
                InsightType.Validation => "AlertCircleOutline",
                _ => "InformationOutline"
            },
            ReferenceText = insight.ReferenceText,
            ResolvedValue = insight.ResolvedValue,
            CanEdit = insight.CanEditResolvedValue,
            EntityName = insight.Metadata.TryGetValue("entity_name", out var name)
                ? name
                : ExtractEntityName(insight.ReferenceText),
            SymbolId = insight.SymbolId,
            InsightType = insight.Type
        };
    }

    public static InsightEditorLineVm FromField(FieldSymbol field)
    {
        var line = field.Definition.Line;
        if (line <= 0) line = 1;

        return new InsightEditorLineVm
        {
            LineNumber = line,
            KindBadge = "Field",
            KindIcon = "FormTextbox",
            ReferenceText = field.Name,
            ResolvedValue = string.IsNullOrWhiteSpace(field.HeaderV)
                ? field.DisplayName
                : field.HeaderV,
            CanEdit = false,
            SymbolId = field.Id,
            InsightType = InsightType.Documentation
        };
    }

    private static string? ExtractEntityName(string reference_text)
    {
        if (string.IsNullOrWhiteSpace(reference_text)) return null;
        var trimmed = reference_text.Trim();
        if (!trimmed.StartsWith('&') || !trimmed.EndsWith(';')) return null;
        return trimmed[1..^1];
    }
}
