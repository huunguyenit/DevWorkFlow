using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Expand snippet SQL bằng Tab (Phase 5 #17).
///
/// Mẫu snippet khai báo trong <c>Config/xml/sql-snippets.xml</c> (<see cref="SqlSnippetCatalog"/>)
/// — thêm mẫu mới không cần sửa code. Mẫu <c>options.name/val</c> dưới đây chỉ là FALLBACK khi
/// catalog chưa nạp được (thiếu file config), để tính năng không chết hẳn.
/// </summary>
public static class OptionsSnippetExpander
{
    private static readonly Regex FallbackPattern = new(
        @"^\s*options\s*\.\s*name\s*=\s*(?<q1>['""])(?<name>.*?)\k<q1>\s+and\s+val\s*=\s*(?<q2>['""])(?<val>.*?)\k<q2>\s*$",
        RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture | RegexOptions.Compiled);

    /// <summary>Dùng catalog config; rỗng thì mới rơi về mẫu dựng sẵn.</summary>
    public static string? TryExpand(string? text, SqlSnippetCatalog? catalog)
    {
        if (string.IsNullOrWhiteSpace(text)) return null;

        var from_catalog = catalog?.TryExpand(text);
        if (from_catalog is not null) return from_catalog;

        return catalog is null || catalog.Definitions.Count == 0
            ? TryExpand(text)
            : null;
    }

    /// <summary>Mẫu dựng sẵn (fallback khi không có catalog).</summary>
    public static string? TryExpand(string? text)
    {
        if (string.IsNullOrWhiteSpace(text)) return null;

        var match = FallbackPattern.Match(text);
        if (!match.Success) return null;

        var q1 = match.Groups["q1"].Value;
        var q2 = match.Groups["q2"].Value;
        return $"SELECT * FROM options WHERE name = {q1}{match.Groups["name"].Value}{q1} " +
               $"and val = {q2}{match.Groups["val"].Value}{q2}";
    }
}
