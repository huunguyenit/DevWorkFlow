using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Xác định caret có nằm trong island JS không (<c>&lt;script&gt;</c> hoặc
/// <c>&lt;command event="Checking"&gt;</c>). Gate cho Completion/Hover/Signature Phase 4 —
/// **fail closed**: không chắc thì trả false, để tuyệt đối không gợi ý API JS khi con trỏ đang
/// ở vùng XML thường.
///
/// Chạy trên BUFFER ĐANG XÉT (Source XML hoặc ClearText) nên dùng scan text, không phụ thuộc
/// syntax tree của source — offset Insight vốn thuộc hệ toạ độ khác.
/// </summary>
public static class ScriptIslandLocator
{
    private static readonly Regex ScriptElementRegex = new(
        @"<script\b[^>]*>(?<body>[\s\S]*?)</script\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>command có event="Checking" (giữ tinh thần ControllerRelatedFileResolver).</summary>
    private static readonly Regex CheckingCommandRegex = new(
        @"<command\b(?=[^>]*\bevent\s*=\s*[""']Checking[""'])[^>]*>(?<body>[\s\S]*?)</command\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public static bool IsInsideJsIsland(string buffer_text, int offset)
    {
        if (string.IsNullOrEmpty(buffer_text)) return false;
        if (offset < 0 || offset > buffer_text.Length) return false;

        return IsInsideBodyOf(ScriptElementRegex, buffer_text, offset)
               || IsInsideBodyOf(CheckingCommandRegex, buffer_text, offset);
    }

    private static bool IsInsideBodyOf(Regex regex, string text, int offset)
    {
        foreach (Match match in regex.Matches(text))
        {
            var body = match.Groups["body"];
            if (!body.Success) continue;
            if (offset >= body.Index && offset <= body.Index + body.Length)
                return true;
        }
        return false;
    }
}
