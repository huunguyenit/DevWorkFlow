namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Một symbol trong workspace index — gắn với document nguồn.
/// </summary>
public sealed record WorkspaceSymbolEntry(
    ErpSymbol Symbol,
    ErpDocumentId DocumentId,
    string DocumentPath);
