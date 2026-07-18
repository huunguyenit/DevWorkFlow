using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Document IDE thống nhất: Storage + Syntax + Semantic + Diagnostics + Insights.
/// </summary>
public interface IErpDocument
{
    ErpDocumentId Id { get; }

    /// <summary>Đường dẫn file hoặc id buffer.</summary>
    string Path { get; }

    StorageSnapshot Snapshot { get; }

    /// <summary>Lossless syntax tree (Phase 2); null chỉ khi chưa parse.</summary>
    ISyntaxTree? SyntaxTree { get; }

    IErpSemanticModel SemanticModel { get; }

    IReadOnlyList<ErpDiagnostic> Diagnostics { get; }

    /// <summary>Virtual insights đã merge; không thuộc XML storage.</summary>
    IReadOnlyList<InsightItem> Insights { get; }

    /// <summary>Navigation Map (Document Model) — null trước khi build.</summary>
    INavigationMap? NavigationMap { get; }

    /// <summary>Storage projection chuyển tiếp cho SQL/related adapters.</summary>
    ErpDocumentProjection GetProjection(ErpProjectionKind kind);

    /// <summary>Phiên bản lifecycle (open/reload).</summary>
    int Version { get; }

    bool IsDirty { get; }
}
