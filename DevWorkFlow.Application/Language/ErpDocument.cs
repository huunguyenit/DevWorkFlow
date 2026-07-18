using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language;

/// <summary>Implementation mutable của <see cref="IErpDocument"/>.</summary>
public sealed class ErpDocument : IErpDocument
{
    public ErpDocument(
        ErpDocumentId id,
        string path,
        StorageSnapshot snapshot,
        ISyntaxTree? syntax_tree,
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic>? diagnostics = null,
        IReadOnlyList<InsightItem>? insights = null)
    {
        Id = id;
        Path = path;
        Snapshot = snapshot;
        SyntaxTree = syntax_tree;
        SemanticModel = semantic_model;
        Diagnostics = diagnostics ?? [];
        Insights = insights ?? [];
        Version = snapshot.Version;
    }

    public ErpDocumentId Id { get; }

    public string Path { get; private set; }

    public StorageSnapshot Snapshot { get; private set; }

    public ISyntaxTree? SyntaxTree { get; private set; }

    public IErpSemanticModel SemanticModel { get; private set; }

    public IReadOnlyList<ErpDiagnostic> Diagnostics { get; private set; }

    public IReadOnlyList<InsightItem> Insights { get; private set; }

    public INavigationMap? NavigationMap { get; private set; }

    public ErpDocumentProjection GetProjection(ErpProjectionKind kind)
    {
        var semantic = SemanticModel as ErpSemanticModel;
        return kind switch
        {
            ErpProjectionKind.Source => new ErpDocumentProjection
            {
                Kind = kind,
                Text = Snapshot.RawText
            },
            ErpProjectionKind.ClearText => new ErpDocumentProjection
            {
                Kind = kind,
                Text = string.IsNullOrEmpty(semantic?.ClearText)
                    ? Snapshot.RawText
                    : semantic.ClearText
            },
            ErpProjectionKind.Semantic => new ErpDocumentProjection
            {
                Kind = kind,
                Text = Snapshot.RawText,
                EntitySegments = semantic?.EntitySegments ?? []
            },
            _ => throw new ArgumentOutOfRangeException(nameof(kind), kind, null)
        };
    }

    public int Version { get; private set; }

    public bool IsDirty { get; set; }

    internal void ReplaceContent(
        StorageSnapshot snapshot,
        ISyntaxTree? syntax_tree,
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic> diagnostics,
        IReadOnlyList<InsightItem> insights)
    {
        Snapshot = snapshot;
        SyntaxTree = syntax_tree;
        SemanticModel = semantic_model;
        Diagnostics = diagnostics;
        Insights = insights;
        Version = snapshot.Version;
        Path = snapshot.Path;
        IsDirty = false;
    }

    internal void SetNavigationMap(INavigationMap map) => NavigationMap = map;
}
