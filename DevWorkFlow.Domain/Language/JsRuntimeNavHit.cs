namespace DevWorkFlow.Domain.Language;

/// <summary>Loại điều hướng JS runtime (Phase 3) tại một offset source.</summary>
public enum JsRuntimeNavKind
{
    /// <summary>Arg1 của <c>request(...)</c> → response/action tương ứng.</summary>
    RequestAction = 0,

    /// <summary>Arg2 của <c>request(...)</c> → <c>case '…'</c> trong <c>on$…$ResponseComplete</c>.</summary>
    RequestResponseCase = 1,

    /// <summary>Ctrl+Click định nghĩa <c>function Name</c> → Find References (call sites).</summary>
    ScriptFunctionRefs = 2,

    /// <summary>Property trong object literal <c>g.$a = { … }</c>.</summary>
    DollarAProperty = 3,

    /// <summary>Literal trong <c>x.showForm('Name')</c> → file liên quan Filter/Lookup/Grid.</summary>
    ShowFormRelated = 4,

    /// <summary>
    /// Chiều ngược của <see cref="RequestAction"/>: từ <c>&lt;action id="X"&gt;</c> /
    /// <c>&lt;response name="X"&gt;</c> → các chỗ gọi <c>request('X', …)</c>.
    /// </summary>
    ActionRequestSites = 5,

    /// <summary>
    /// Chiều ngược của <see cref="RequestResponseCase"/>: từ <c>case 'X':</c> trong
    /// <c>on$…$ResponseComplete</c> → các chỗ gọi <c>request(…, 'X', …)</c>.
    /// </summary>
    CaseRequestSites = 6
}

/// <summary>Vai trò của một mắt xích trong chuỗi quan hệ FBO (request → action → case).</summary>
public enum JsRuntimeRelationRole
{
    /// <summary>Nơi gọi <c>request('A', 'C', …)</c>.</summary>
    RequestSite = 0,

    /// <summary>Khai báo <c>&lt;action id="A"&gt;</c> / <c>&lt;response name="A"&gt;</c>.</summary>
    ActionDeclaration = 1,

    /// <summary>Nhánh <c>case 'C':</c> trong <c>on$…$ResponseComplete</c>.</summary>
    ResponseCase = 2,

    /// <summary>Định nghĩa <c>function Name</c>.</summary>
    FunctionDefinition = 3
}

/// <summary>
/// Một mắt xích trong quan hệ hai chiều quanh symbol đang xét — panel Symbol Info dựng thành
/// sơ đồ RELATIONSHIP (request → action → case) để luôn thấy "nó ở đâu và ai gọi".
/// </summary>
public sealed class JsRuntimeRelation
{
    public JsRuntimeRelationRole Role { get; init; }

    /// <summary>Nhãn hiển thị, ví dụ <c>request('Discount', 'Discount')</c>.</summary>
    public string Label { get; init; } = string.Empty;

    /// <summary>File chứa mắt xích; rỗng = document hiện tại.</summary>
    public string TargetPath { get; init; } = string.Empty;

    /// <summary>Offset trong <see cref="TargetPath"/>; -1 nếu không điều hướng được.</summary>
    public int TargetOffset { get; init; } = -1;

    public int Line { get; init; }
}

/// <summary>
/// Kết quả hit-test JS runtime tại một offset source (Phase 3 — SoT cho Ctrl+Click/hover
/// trong script sau khi Entity (Phase 1) và Structural (Phase 2) miss).
/// </summary>
public sealed class JsRuntimeNavHit
{
    /// <summary>Tên symbol để hiển thị ở đầu panel (function name / action name / …).</summary>
    public string SymbolName { get; init; } = string.Empty;

    /// <summary>Loại symbol dạng người đọc được ("JavaScript Function", "Request Action", …).</summary>
    public string SymbolKindText { get; init; } = string.Empty;

    /// <summary>Chuỗi quan hệ hai chiều quanh symbol (request → action → case / definition).</summary>
    public IReadOnlyList<JsRuntimeRelation> Relations { get; init; } = [];

    public JsRuntimeNavKind Kind { get; init; }

    /// <summary>SymbolId nếu resolve được (vd <c>script:onChange</c>).</summary>
    public string SymbolId { get; init; } = string.Empty;

    /// <summary>Nhãn status bar.</summary>
    public string DisplayLabel { get; init; } = string.Empty;

    /// <summary>
    /// Offset để reveal, tính trên file <see cref="TargetPath"/>; -1 nếu không áp dụng.
    /// </summary>
    public int TargetOffset { get; init; } = -1;

    /// <summary>
    /// File chứa <see cref="TargetOffset"/>. Nội dung script FBO thường đến từ entity include
    /// dùng chung nên target có thể nằm ở file khác document đang mở — host phải mở file này
    /// rồi mới đặt caret. Rỗng = chính document đang mở.
    /// </summary>
    public string TargetPath { get; init; } = string.Empty;

    /// <summary>Giá trị hiển thị cho hover (vd value của <c>g.$a.name</c>).</summary>
    public string HoverValue { get; init; } = string.Empty;

    /// <summary>Danh sách file tuyệt đối liên quan (ShowFormRelated).</summary>
    public IReadOnlyList<string> RelatedPaths { get; init; } = [];

    /// <summary>Danh sách reference (ScriptFunctionRefs) — definition + call sites.</summary>
    public IReadOnlyList<NavigationTarget> References { get; init; } = [];
}
