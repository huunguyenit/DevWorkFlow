using System.Text.RegularExpressions;

namespace DevWorkFlow.Infrastructure.Design;

/// <summary>
/// Parse tối thiểu Page/Master ASPX: lấy MasterPageFile + gom giá trị href/src/Path (link, CompositeScript,
/// script). Chỉ nhặt raw string; chuẩn hoá + lọc (Css/ClientScript/Images, bỏ .axd) do resolver làm.
/// </summary>
internal static partial class AspxMasterPageParser
{
    [GeneratedRegex("MasterPageFile\\s*=\\s*(\"[^\"]*\"|'[^']*')", RegexOptions.IgnoreCase)]
    private static partial Regex MasterPageFileRegex();

    [GeneratedRegex("\\b(?:href|src|Path)\\s*=\\s*(\"[^\"]*\"|'[^']*')", RegexOptions.IgnoreCase)]
    private static partial Regex AssetAttrRegex();

    public static string? ParseMasterPageFile(string content)
    {
        if (string.IsNullOrEmpty(content)) return null;
        var match = MasterPageFileRegex().Match(content);
        return match.Success ? Unquote(match.Groups[1].Value) : null;
    }

    public static IReadOnlyList<string> CollectStaticAssetPaths(string content)
    {
        if (string.IsNullOrEmpty(content)) return [];
        var list = new List<string>();
        foreach (Match match in AssetAttrRegex().Matches(content))
            list.Add(Unquote(match.Groups[1].Value));
        return list;
    }

    private static string Unquote(string quoted) =>
        quoted.Length >= 2 ? quoted[1..^1] : quoted;
}
