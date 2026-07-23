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
    /// Hit-test cấu trúc XML tại offset source (Phase 2 — field→view, items@controller→Lookup,
    /// clientScript→function) — chạy sau Entity miss. <paramref name="controllers_path"/> dùng
    /// cho Lookup path resolve; null nếu Program chưa gắn.
    /// </summary>
    StructuralNavHit? ResolveStructuralAtOffset(
        ErpDocumentId document_id,
        int offset,
        string? controllers_path);

    /// <summary>
    /// Hit-test JS runtime FBO (Phase 3 — request/case, function FindRefs, <c>g.$a</c>, showForm)
    /// — chạy sau Entity + Structural miss.
    ///
    /// Index chạy trên ClearText nên thấy được nội dung đến từ entity include; kết quả trả về
    /// <see cref="JsRuntimeNavHit.TargetPath"/> + <see cref="JsRuntimeNavHit.TargetOffset"/> trỏ
    /// đúng file nguồn thật, có thể khác document đang mở.
    /// </summary>
    /// <param name="offset">
    /// Offset trên buffer đang hiển thị. <paramref name="offset_is_clear_text"/> = true khi editor
    /// đang ở Insight mode (buffer là ClearText); false = offset trên source XML.
    /// </param>
    /// <param name="controllers_path">Cho showForm related files; null nếu Program chưa gắn.</param>
    JsRuntimeNavHit? ResolveJsRuntimeAtOffset(
        ErpDocumentId document_id,
        int offset,
        string? controllers_path,
        bool offset_is_clear_text = false);

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

    // ── Phase 4: FBO JS catalog (Completion / Hover / Signature) ─────────────

    /// <summary>
    /// Nạp catalog API JS FBO từ <c>fbo-js.catalog.xml</c>. Thiếu file / XML hỏng → catalog rỗng
    /// (không throw): editor mất gợi ý chứ không sập.
    /// </summary>
    void LoadFboJsCatalog(string absolute_path);

    /// <summary>
    /// Completion trong island JS. Insight mode luôn rỗng (buffer read-only); ngoài island cũng
    /// rỗng (fail closed).
    /// </summary>
    /// <param name="offset_is_clear_text">true = offset tính trên buffer ClearText (Insight).</param>
    FboJsCompletionList CompleteFboJs(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);

    /// <summary>Hover mô tả API từ catalog — chạy ở cả Source lẫn Insight khi trong island.</summary>
    FboJsHoverInfo? HoverFboJs(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);

    /// <summary>Signature Help; Insight luôn null.</summary>
    FboJsSignatureHelp? SignatureFboJs(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);

    // ── Phase 5: SQL tooling ────────────────────────────────────────────────

    /// <summary>
    /// Ctrl+Click trên <c>information="…"</c> → câu <c>SELECT</c> tra cứu; null nếu offset không
    /// nằm trong giá trị attribute đó hoặc giá trị không parse được.
    /// </summary>
    string? BuildInformationSqlAtOffset(
        ErpDocumentId document_id, int offset, bool offset_is_clear_text = false);

    /// <summary>
    /// Tên object SQL (schema.name) tại offset nếu đang trong island SQL; null nếu không.
    /// Hit-test chạy trên ClearText vì SQL FBO thường nằm trong khai báo entity.
    /// </summary>
    SqlObjectName? ResolveSqlObjectAtOffset(
        ErpDocumentId document_id, int offset, bool offset_is_clear_text = false);

    /// <summary>Controller thuộc CSDL App hay Sys (theo <c>@database</c> trên root).</summary>
    ControllerDatabaseKind ResolveDatabaseKind(ErpDocumentId document_id);

    /// <summary>
    /// Nạp catalog snippet SQL từ <c>sql-snippets.xml</c>. Thiếu file / XML hỏng → catalog rỗng
    /// (Tab về hành vi mặc định), không throw.
    /// </summary>
    void LoadSqlSnippets(string absolute_path);

    /// <summary>
    /// Expand snippet SQL cho một dòng / vùng chọn; null nếu không mẫu nào khớp.
    /// Mẫu đến từ config — UI không giữ danh sách.
    /// </summary>
    string? TryExpandSqlSnippet(string? text);

    /// <summary>
    /// Nạp catalog hàm SQL từ <c>sql-functions.xml</c> (mô tả cho Hover). Thiếu file / XML hỏng →
    /// catalog rỗng (hover im lặng), không throw — cùng luật fail-closed với catalog JS.
    /// </summary>
    void LoadSqlFunctions(string absolute_path);

    /// <summary>
    /// Hover mô tả hàm SQL trong Form Source/Insight — chỉ trả kết quả khi offset nằm trong
    /// island SQL (<c>&lt;command&gt;</c>/<c>&lt;query&gt;</c>); null nếu không.
    /// </summary>
    SqlHoverInfo? HoverSqlFunction(
        ErpDocumentId document_id, int offset, bool offset_is_clear_text = false);

    /// <summary>
    /// Hover mô tả hàm SQL trên một buffer SQL thuần (tab SQL) — không cần document đã mở trong LS.
    /// </summary>
    SqlHoverInfo? HoverSqlFunctionInText(string? sql_text, int offset);

    /// <summary>
    /// Completion SQL trong Form Source: chỉ trong island SQL, Insight luôn rỗng (buffer
    /// read-only) — cùng luật với Completion JS.
    /// </summary>
    SqlCompletionList CompleteSql(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);

    /// <summary>Completion SQL trên buffer SQL thuần (tab SQL).</summary>
    SqlCompletionList CompleteSqlInText(string? sql_text, int offset);
}
