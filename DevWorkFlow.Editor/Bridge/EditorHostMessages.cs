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

    /// <summary>Áp dụng theme (màu/font theo token) — payload khớp UI.Services.EditorThemeOptions serialize camelCase.</summary>
    public const string ApplyTheme = "applyTheme";
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
}
