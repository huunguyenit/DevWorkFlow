namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Read-only index symbol toàn workspace — query theo tên, kind, hoặc document.
/// Mutation (IndexDocument / RemoveDocument) nằm trên implementation concrete.
/// </summary>
public interface IWorkspaceSymbolIndex
{
    /// <summary>Tìm symbol theo tên hoặc display name (substring, case-insensitive).</summary>
    IReadOnlyList<WorkspaceSymbolEntry> Search(
        string query,
        ErpSymbolKind? kind = null,
        int max_results = 50);

    /// <summary>Trả vị trí định nghĩa của symbol theo id; null nếu chưa có.</summary>
    SourceLocation? GetDefinition(string symbol_id);

    /// <summary>
    /// Tìm tất cả reference của symbol theo id.
    /// Phase 5: EntitySymbol trả References từ entity graph; symbol khác trả [].
    /// </summary>
    IReadOnlyList<SymbolReference> FindReferences(string symbol_id);

    /// <summary>Lấy toàn bộ symbol của một document.</summary>
    IReadOnlyList<WorkspaceSymbolEntry> GetDocumentSymbols(ErpDocumentId document_id);
}
