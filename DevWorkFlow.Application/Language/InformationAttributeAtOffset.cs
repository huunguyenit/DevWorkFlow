using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Hit-test Ctrl+Click trên giá trị attribute <c>information="…"</c> (Phase 5 #9), kèm
/// <c>key</c> / <c>check</c> lấy từ CÙNG start-tag (không lẫn sang tag khác).
/// </summary>
public static class InformationAttributeAtOffset
{
    private static readonly Regex StartTagRegex = new(
        @"<[A-Za-z_][\w.:-]*\b[^<>]*?/?>",
        RegexOptions.Compiled);

    public static InformationSqlRequest? TryResolve(string source_xml, int offset)
    {
        if (string.IsNullOrEmpty(source_xml)) return null;
        if (offset < 0 || offset > source_xml.Length) return null;

        foreach (Match tag in StartTagRegex.Matches(source_xml))
        {
            if (offset < tag.Index || offset > tag.Index + tag.Length) continue;

            var information = ReadAttribute(tag.Value, "information");
            if (information is null) continue;

            // Chỉ tính là "trúng" khi con trỏ nằm TRONG giá trị information, không phải bất kỳ
            // đâu trong tag (tránh Ctrl+Click ở controller=… cũng mở SQL).
            var value_start = tag.Index + information.Index;
            if (offset < value_start || offset > value_start + information.Length)
                return null;

            return new InformationSqlRequest
            {
                Information = information.Value,
                Key = ReadAttribute(tag.Value, "key")?.Value,
                Check = ReadAttribute(tag.Value, "check")?.Value
            };
        }

        return null;
    }

    /// <summary>
    /// Giá trị attribute chỉ được chặn bởi ĐÚNG loại nháy bao ngoài — corpus có
    /// <c>key="kh_yn = 1 and status = '1'"</c> (nháy đơn NẰM TRONG nháy kép). Dùng
    /// <c>[^'"]*</c> sẽ cắt sớm ở dấu nháy đơn và mất mệnh đề WHERE.
    /// </summary>
    private static Group? ReadAttribute(string tag_text, string attribute)
    {
        var match = Regex.Match(
            tag_text,
            $@"\b{Regex.Escape(attribute)}\s*=\s*(?:""(?<v>[^""]*)""|'(?<v>[^']*)')",
            RegexOptions.IgnoreCase);
        return match.Success ? match.Groups["v"] : null;
    }
}
