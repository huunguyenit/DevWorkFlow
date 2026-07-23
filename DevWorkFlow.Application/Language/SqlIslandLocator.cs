using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>Vùng nội dung SQL (thân <c>command</c>/<c>query</c>) trên buffer đang xét.</summary>
public readonly record struct SqlIslandSpan(int StartOffset, int Length)
{
    public int EndOffset => StartOffset + Length;

    public bool Contains(int offset) => offset >= StartOffset && offset <= EndOffset;
}

/// <summary>
/// Tìm các island SQL — gate cho Ctrl+Click object SQL, snippet options và hover hàm SQL trên
/// Form Source. **Fail closed** như island JS Phase 4.
///
/// Ba nơi chứa SQL trong controller FBO (đo trên FBISP24/SP226):
/// <c>&lt;command&gt;</c>, <c>&lt;query&gt;</c> và <c>&lt;response&gt;&lt;action&gt;</c> — thân
/// action là T-SQL chạy phía server (<c>exec FastBusiness$…</c>), không bao giờ là JavaScript.
/// </summary>
public static class SqlIslandLocator
{
    private static readonly Regex SqlElementRegex = new(
        @"<(?<tag>command|query)\b(?<attrs>[^>]*)>(?<body>[\s\S]*?)</\k<tag>\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex ResponseRegex = new(
        @"<response\b[^>]*>(?<body>[\s\S]*?)</response\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>Chỉ nhận action CÓ thân (<c>&lt;action …/&gt;</c> tự đóng không chứa SQL).</summary>
    private static readonly Regex ResponseActionRegex = new(
        @"<action\b[^>]*(?<!/)>(?<body>[\s\S]*?)</action\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary><c>command event="Checking"</c> chứa JS chứ không phải SQL (island của Phase 4).</summary>
    private static readonly Regex CheckingEventRegex = new(
        @"\bevent\s*=\s*(?:""Checking""|'Checking')",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public static IReadOnlyList<SqlIslandSpan> FindIslands(string source_xml)
    {
        if (string.IsNullOrEmpty(source_xml)) return [];

        var spans = new List<SqlIslandSpan>();
        foreach (Match match in SqlElementRegex.Matches(source_xml))
        {
            var body = match.Groups["body"];
            if (!body.Success) continue;
            // Không nhận Checking: nội dung là JavaScript, Ctrl+Click ở đó thuộc Phase 4.
            if (CheckingEventRegex.IsMatch(match.Groups["attrs"].Value)) continue;
            spans.Add(new SqlIslandSpan(body.Index, body.Length));
        }

        foreach (Match response in ResponseRegex.Matches(source_xml))
        {
            var response_body = response.Groups["body"];
            if (!response_body.Success) continue;

            foreach (Match action in ResponseActionRegex.Matches(response_body.Value))
            {
                var body = action.Groups["body"];
                if (!body.Success) continue;
                // Index của match tính trên thân response → đổi về offset tuyệt đối.
                spans.Add(new SqlIslandSpan(response_body.Index + body.Index, body.Length));
            }
        }

        return spans;
    }

    public static bool IsInside(string source_xml, int offset)
    {
        if (string.IsNullOrEmpty(source_xml)) return false;
        if (offset < 0 || offset > source_xml.Length) return false;

        foreach (var span in FindIslands(source_xml))
            if (span.Contains(offset))
                return true;
        return false;
    }
}
