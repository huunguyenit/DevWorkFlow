using System.Text.Json;

namespace DevWorkFlow.Editor.Bridge;

/// <summary>
/// Message Bridge (ADR-0005 §Message Bridge): "Command / RequestId / Payload / Response".
/// Không phụ thuộc WebView2/WPF — Adapter cụ thể (MonacoEditorHost, ở tầng UI) mới nối
/// các type này với transport thật (window.chrome.webview.postMessage).
/// </summary>

/// <summary>Response JS trả về khớp với một Request theo Id (không có Id nghĩa là không hợp lệ).</summary>
public sealed class EditorHostResponse
{
    public string? Id { get; init; }
    public JsonElement? Result { get; init; }
    public string? Error { get; init; }
}

/// <summary>Event JS phát ra không cần Request trước (content/selection changed, entity committed, ready).</summary>
public sealed class EditorHostEvent
{
    public string? Event { get; init; }
    public JsonElement? Payload { get; init; }
}

/// <summary>Lỗi do JS side trả về qua Response.Error, hoặc do Request bị huỷ/không có phản hồi.</summary>
public sealed class EditorBridgeException(string message) : Exception(message);

public static class EditorHostMessage
{
    /// <summary>
    /// Phân loại một message JSON thô nhận từ JS: Response (có "id") hoặc Event (có "event").
    /// Trả về false nếu không parse được hoặc không khớp hình dạng nào.
    /// </summary>
    public static bool TryParseIncoming(
        string json,
        out EditorHostResponse? response,
        out EditorHostEvent? @event)
    {
        response = null;
        @event = null;

        JsonDocument doc;
        try
        {
            doc = JsonDocument.Parse(json);
        }
        catch (JsonException)
        {
            return false;
        }

        using (doc)
        {
            var root = doc.RootElement;
            if (root.ValueKind != JsonValueKind.Object)
                return false;

            if (root.TryGetProperty("event", out var event_prop)
                && event_prop.ValueKind == JsonValueKind.String)
            {
                JsonElement? payload = root.TryGetProperty("payload", out var payload_prop)
                    && payload_prop.ValueKind != JsonValueKind.Null
                    ? payload_prop.Clone()
                    : null;

                @event = new EditorHostEvent { Event = event_prop.GetString(), Payload = payload };
                return true;
            }

            if (root.TryGetProperty("id", out var id_prop) && id_prop.ValueKind == JsonValueKind.String)
            {
                JsonElement? result = root.TryGetProperty("result", out var result_prop)
                    && result_prop.ValueKind != JsonValueKind.Null
                    ? result_prop.Clone()
                    : null;

                string? error = root.TryGetProperty("error", out var error_prop)
                    && error_prop.ValueKind == JsonValueKind.String
                    ? error_prop.GetString()
                    : null;

                response = new EditorHostResponse { Id = id_prop.GetString(), Result = result, Error = error };
                return true;
            }

            return false;
        }
    }

    private static readonly JsonSerializerOptions RequestJsonOptions = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };

    /// <summary>
    /// Dựng JSON cho một Request gửi từ C# sang JS: {"id","command","payload"}. Payload (kể cả
    /// object lồng nhau như InsightItem) được serialize camelCase để khớp quy ước phía bridge.js.
    /// </summary>
    public static string BuildRequestJson(string id, string command, object? payload) =>
        JsonSerializer.Serialize(new { id, command, payload }, RequestJsonOptions);
}

/// <summary>Tên Command dùng chung giữa MonacoEditorHost (C#) và bridge.js — tránh magic string lệch nhau.</summary>
public static class EditorHostCommands
{
    public const string SetValue = "setValue";
    public const string GetValue = "getValue";
    public const string SetReadOnly = "setReadOnly";
    public const string SetShowInsights = "setShowInsights";

    /// <summary>
    /// Insight mode: tô màu các đoạn ClearText có nguồn từ entity — payload khớp
    /// <c>DevWorkFlow.Domain.Language.ClearTextSegment</c> serialize camelCase.
    /// </summary>
    public const string SetClearTextSegments = "setClearTextSegments";
    public const string RevealLine = "revealLine";
    public const string RevealOffset = "revealOffset";
    public const string SelectRange = "selectRange";
    public const string OpenFind = "openFind";
    public const string OpenReplace = "openReplace";

    /// <summary>
    /// Chạy một built-in editor action/handler của Monaco qua editor.trigger — payload { actionId }.
    /// Dùng cho phím điều hướng (cursorHome/End/PageUp/PageDown ±Select) mà host phải chặn ở lớp
    /// WPF để AvalonDock không nuốt (xem MonacoEditorHost.OnWebViewPreviewKeyDown).
    /// </summary>
    public const string RunAction = "runAction";

    /// <summary>
    /// Hiện hover virtual view của entity (Content Widget) — payload { name, value, isError }.
    /// Widget tự quản mouseenter/leave; chỉ ẩn khi con trỏ rời khỏi widget.
    /// </summary>
    public const string ShowEntityHover = "showEntityHover";

    /// <summary>Ẩn hover virtual view của entity.</summary>
    public const string HideEntityHover = "hideEntityHover";

    /// <summary>Áp dụng theme (màu/font theo token) — payload khớp UI.Services.EditorThemeOptions serialize camelCase.</summary>
    public const string ApplyTheme = "applyTheme";

    /// <summary>
    /// Đổi ngôn ngữ tô màu của model hiện tại (StatusBar: XML ↔ JavaScript ↔ SQL) — payload
    /// { language }: "xml" (→ tokenizer FBO erp-xml), "javascript", "sql".
    /// </summary>
    public const string SetLanguage = "setLanguage";

    /// <summary>
    /// Đặt marker chẩn đoán (squiggle) trên buffer hiện tại — payload { markers: EditorMarker[] }
    /// (offset trên buffer đang hiển thị). Dùng ở Source mode; Insight gửi danh sách rỗng để xoá.
    /// </summary>
    public const string SetMarkers = "setMarkers";

    /// <summary>
    /// Trả kết quả Completion cho một request đang chờ ở JS — payload
    /// <c>{ id, items: [{ label, insertText, kind, detail, documentation }] }</c>.
    /// </summary>
    public const string FboJsCompleteResult = "fboJsCompleteResult";

    /// <summary>
    /// Trả kết quả Signature Help — payload
    /// <c>{ id, help: null | { label, documentation, parameters, activeParameter } }</c>.
    /// </summary>
    public const string FboJsSignatureResult = "fboJsSignatureResult";

    /// <summary>
    /// Trả kết quả expand snippet options — payload <c>{ id, expanded: null | string }</c>.
    /// <c>null</c> nghĩa là không khớp mẫu; JS để Tab chạy hành vi mặc định.
    /// </summary>
    public const string OptionsSnippetResult = "optionsSnippetResult";
}

/// <summary>
/// Marker chẩn đoán gửi cho editor (squiggle) — editor-agnostic, offset trên buffer đang hiển
/// thị. Serialize camelCase khớp bridge.js setMarkers. Không chứa khái niệm ERP (Editor chỉ render).
/// </summary>
public sealed record EditorMarker
{
    public int StartOffset { get; init; }

    /// <summary>Độ dài vùng gạch chân; ≤ 0 → editor tô tối thiểu 1 ký tự.</summary>
    public int Length { get; init; }

    public string Message { get; init; } = string.Empty;

    /// <summary>"error" | "warning" | "info" | "hint".</summary>
    public string Severity { get; init; } = "warning";

    /// <summary>Mã hiển thị (vd ERP3003).</summary>
    public string Code { get; init; } = string.Empty;
}

/// <summary>Tên Event dùng chung giữa bridge.js và MonacoEditorHost (C#).</summary>
public static class EditorHostEvents
{
    public const string Ready = "ready";
    public const string ContentChanged = "contentChanged";
    public const string SelectionChanged = "selectionChanged";

    /// <summary>
    /// Ctrl+Click một vùng entity trong Insight mode. Host quyết định điều hướng: entity
    /// SYSTEM (hoặc khai báo ở file khác) → mở tab mới, giữ nguyên caret/scroll tab hiện tại;
    /// entity inline khai báo trong chính document → nhảy tới khai báo trong tab đang mở.
    /// </summary>
    public const string OpenEntityRequested = "openEntityRequested";

    /// <summary>
    /// Ctrl+Click ở Source mode (buffer = XML thô): bridge chỉ gửi <c>offset</c> nguồn; host tra
    /// Language Service (<c>ResolveEntityAtOffset</c>) để quyết định điều hướng — Editor không parse.
    /// Payload: <c>{ offset: number }</c>.
    /// </summary>
    public const string EntityOffsetActivated = "entityOffsetActivated";

    /// <summary>
    /// Hover trên entity (debounced). Payload: <c>{ offset: number, insight: bool, entityName?: string }</c>.
    /// Host tra giá trị (Source: offset→LS; Insight: entityName→SemanticModel) rồi gửi
    /// <c>showEntityHover</c> / <c>hideEntityHover</c>.
    /// </summary>
    public const string EntityHoverRequested = "entityHoverRequested";

    /// <summary>
    /// Monaco xin Completion trong island JS. Payload: <c>{ id, offset, insight }</c> — host tra
    /// catalog qua Language Service rồi trả <c>fboJsCompleteResult</c> theo <c>id</c>.
    /// </summary>
    public const string FboJsCompleteRequested = "fboJsCompleteRequested";

    /// <summary>
    /// Monaco xin Signature Help. Payload: <c>{ id, offset, insight }</c>; host trả
    /// <c>fboJsSignatureResult</c> theo <c>id</c>.
    /// </summary>
    public const string FboJsSignatureRequested = "fboJsSignatureRequested";

    /// <summary>
    /// Tab trong vùng SQL: hỏi host xem dòng hiện tại có phải mẫu snippet <c>options.name=…</c>
    /// không. Payload <c>{ id, offset, lineText }</c>; host trả <c>optionsSnippetResult</c>.
    /// JS KHÔNG tự dựng câu SQL — mẫu và kết quả đều do Application quyết định.
    /// </summary>
    public const string OptionsSnippetRequested = "optionsSnippetRequested";
}
