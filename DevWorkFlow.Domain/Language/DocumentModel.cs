namespace DevWorkFlow.Domain.Language;

/// <summary>Cây Document Model của một ErpDocument (Outline / Breadcrumb / Nav).</summary>
public sealed class DocumentModel
{
    public required ErpDocumentId DocumentId { get; init; }

    public required string DocumentUri { get; init; }

    public required DocumentNode Root { get; init; }

    public IReadOnlyList<DocumentNode> Roots =>
        Root.Children.Count > 0 ? Root.Children : [Root];
}
