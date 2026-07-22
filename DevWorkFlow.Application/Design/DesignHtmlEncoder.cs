namespace DevWorkFlow.Application.Design;

/// <summary>
/// Escape text/attribute + chuẩn hoá id an toàn cho HTML sinh ra (render-only, không script sống).
/// Chỉ escape 5 ký tự đặc biệt của HTML — KHÔNG numeric-encode ký tự Unicode (tiếng Việt) vì tài liệu
/// xuất UTF-8, giữ nguyên chữ có dấu (WebUtility.HtmlEncode sẽ đổi 'ã' → '&amp;#227;', làm vỡ hiển thị).
/// </summary>
internal static class DesignHtmlEncoder
{
    public static string Text(string? value)
    {
        if (string.IsNullOrEmpty(value)) return string.Empty;
        return value
            .Replace("&", "&amp;")
            .Replace("<", "&lt;")
            .Replace(">", "&gt;");
    }

    public static string Attribute(string? value)
    {
        if (string.IsNullOrEmpty(value)) return string.Empty;
        return value
            .Replace("&", "&amp;")
            .Replace("<", "&lt;")
            .Replace(">", "&gt;")
            .Replace("\"", "&quot;")
            .Replace("'", "&#39;");
    }

    public static string SafeId(string value)
    {
        var chars = value.Select(c =>
            char.IsLetterOrDigit(c) || c is '-' or '_' ? c : '-').ToArray();
        return new string(chars);
    }
}
