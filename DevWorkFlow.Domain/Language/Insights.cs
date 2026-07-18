namespace DevWorkFlow.Domain.Language;

/// <summary>Chế độ hiển thị chuẩn của Editor theo Architecture Freeze 1.0.</summary>
public enum ErpEditorMode
{
    Source = 0,
    Insight = 1,
    Designer = 2
}

/// <summary>Loại insight độc lập với UI/rendering technology.</summary>
public enum InsightType
{
    Entity = 0,
    Validation = 1,
    Workflow = 2,
    AI = 3,
    Sql = 4,
    Documentation = 5,
    Git = 6,
    Plugin = 7
}

/// <summary>Layer dùng để compose nhiều insight tại cùng source range.</summary>
public enum InsightLayer
{
    Error = 0,
    Warning = 1,
    Entity = 2,
    AI = 3,
    Workflow = 4,
    Documentation = 5,
    Git = 6,
    Other = 7
}

/// <summary>Action descriptor; Provider không chứa ICommand hoặc logic UI.</summary>
public sealed class InsightAction
{
    public string Id { get; init; } = string.Empty;

    public string DisplayName { get; init; } = string.Empty;

    public IReadOnlyDictionary<string, string> Metadata { get; init; } =
        new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
}

/// <summary>
/// Model chung cho mọi virtual insight. Insight không được lưu vào XML.
/// </summary>
public sealed class InsightItem
{
    public string Id { get; init; } = string.Empty;

    public InsightType Type { get; init; }

    public SourceLocation Range { get; init; } = SourceLocation.None;

    public int Priority { get; init; }

    public InsightLayer Layer { get; init; }

    public string DisplayContent { get; init; } = string.Empty;

    public string? SymbolId { get; init; }

    public string ReferenceText { get; init; } = string.Empty;

    public string ResolvedValue { get; init; } = string.Empty;

    public bool CanEditResolvedValue { get; init; }

    public IReadOnlyList<InsightAction> Actions { get; init; } = [];

    public IReadOnlyDictionary<string, string> Metadata { get; init; } =
        new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

    /// <summary>Nested entity/insight tree; renderer không được flatten.</summary>
    public IReadOnlyList<InsightItem> Children { get; init; } = [];
}

/// <summary>
/// Provider chỉ đọc Semantic Model và sinh InsightItem; không render, sửa XML hay thao tác UI.
/// </summary>
public interface IInsightProvider
{
    string ProviderId { get; }

    IReadOnlyList<InsightItem> Provide(
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic> diagnostics);
}

public interface IInsightProviderPipeline
{
    IReadOnlyList<InsightItem> Build(
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic> diagnostics);
}
