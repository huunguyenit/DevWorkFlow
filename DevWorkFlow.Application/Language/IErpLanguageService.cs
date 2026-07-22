using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// ERP Language Service — cổng duy nhất UI/AI dùng để mở và quản lý document.
/// Phase 1: lifecycle + snapshot; semantic qua adapter parser hiện tại.
/// </summary>
public interface IErpLanguageService
{
    /// <summary>Workspace hiện tại.</summary>
    IErpWorkspace Workspace { get; }

    /// <summary>Gán Program path (thư mục SP226, …).</summary>
    void SetProgramPath(string? program_path);

    /// <summary>Mở document từ file trên disk.</summary>
    IErpDocument OpenDocument(string path);

    /// <summary>Mở document từ text (buffer / path ảo).</summary>
    IErpDocument OpenDocumentFromText(string path, string raw_text);

    /// <summary>Đọc lại file và tăng Version.</summary>
    IErpDocument ReloadDocument(ErpDocumentId document_id);

    /// <summary>Đóng document khỏi workspace.</summary>
    bool CloseDocument(ErpDocumentId document_id);

    /// <summary>Lấy document theo id.</summary>
    IErpDocument? GetDocument(ErpDocumentId document_id);

    /// <summary>Snapshot storage hiện tại.</summary>
    StorageSnapshot? GetSnapshot(ErpDocumentId document_id);

    /// <summary>Insight collection đã merge từ Provider Pipeline.</summary>
    IReadOnlyList<InsightItem> GetInsights(ErpDocumentId document_id);

    /// <summary>Lấy projection từ cùng ErpDocument.</summary>
    ErpDocumentProjection GetProjection(
        ErpDocumentId document_id,
        ErpProjectionKind kind);

    /// <summary>Đi tới định nghĩa entity.</summary>
    SourceLocation? GetEntityDefinition(
        ErpDocumentId document_id,
        string entity_name);

    /// <summary>Tìm mọi reference của entity trong graph document/include.</summary>
    IReadOnlyList<SymbolReference> FindEntityReferences(
        ErpDocumentId document_id,
        string entity_name);

    /// <summary>
    /// Hit-test entity tại offset source (Ctrl+Click / hover ở Source mode) — trả
    /// <see cref="EntityHit"/> nếu offset nằm trong một tham chiếu / khai báo entity, null nếu không.
    /// </summary>
    EntityHit? ResolveEntityAtOffset(ErpDocumentId document_id, int offset);

    /// <summary>
    /// Semantic inline edit. Inline declaration cập nhật snapshot; external entity
    /// cập nhật đúng resolved file. Entity reference trong source không bị thay.
    /// </summary>
    EntityEditResult UpdateEntityValue(
        ErpDocumentId document_id,
        string entity_name,
        string new_value);

    // ── Phase 5: Workspace Symbol Index ──────────────────────────────────

    /// <summary>
    /// Tìm symbol theo tên / display name trong toàn workspace (substring, case-insensitive).
    /// </summary>
    IReadOnlyList<WorkspaceSymbolEntry> SearchSymbols(
        string query,
        ErpSymbolKind? kind = null,
        int max_results = 50);

    /// <summary>Go to Definition — trả SourceLocation của symbol theo id; null nếu chưa có.</summary>
    SourceLocation? GetSymbolDefinition(string symbol_id);

    /// <summary>
    /// Find References — trả danh sách reference của symbol theo id.
    /// Phase 5: EntitySymbol trả entity graph references; symbol khác trả [].
    /// </summary>
    IReadOnlyList<SymbolReference> FindSymbolReferences(string symbol_id);

    /// <summary>ERP Navigation Service (NodeId / Symbol → NavigationTarget).</summary>
    IErpNavigationService Navigation { get; }
}
