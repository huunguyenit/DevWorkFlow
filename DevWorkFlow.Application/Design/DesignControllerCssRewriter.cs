using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Rewrite url ảnh toolbar trong &lt;css&gt; controller:
/// nếu có <c>background-image:url(...)</c> → trỏ tới Program/Images (virtual host),
/// không map sang Config/image/fbo-*.
/// </summary>
internal static class DesignControllerCssRewriter
{
    private static readonly Regex DivBgRuleRegex = new(
        @"div\.([A-Za-z][\w]*)\s*\{([^}]*)\}",
        RegexOptions.Compiled);

    private static readonly Regex BgImageUrlRegex = new(
        @"background-image\s*:\s*url\(\s*['""]?([^'""\)]+)['""]?\s*\)",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public static string Rewrite(string? css_text)
    {
        if (string.IsNullOrWhiteSpace(css_text))
            return css_text ?? string.Empty;

        return DivBgRuleRegex.Replace(css_text, match =>
        {
            var class_name = match.Groups[1].Value;
            var body = match.Groups[2].Value;
            if (!BgImageUrlRegex.IsMatch(body))
                return match.Value;

            var new_body = BgImageUrlRegex.Replace(body, url_match =>
            {
                var program_url = ToProgramImagesUrl(url_match.Groups[1].Value);
                return program_url is null
                    ? url_match.Value
                    : $"background-image:url(\"{program_url}\")";
            });
            return $"div.{class_name}{{{new_body}}}";
        });
    }

    /// <summary>Các class div.* có background-image trong CSS controller (để HTML không ghi đè bằng Config).</summary>
    public static HashSet<string> ClassesWithBackgroundImage(string? css_text)
    {
        var set = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        if (string.IsNullOrWhiteSpace(css_text)) return set;

        foreach (Match match in DivBgRuleRegex.Matches(css_text))
        {
            if (BgImageUrlRegex.IsMatch(match.Groups[2].Value))
                set.Add(match.Groups[1].Value);
        }
        return set;
    }

    /// <summary>
    /// <c>../Images/Download.png</c> / <c>../images/Upload.png</c> →
    /// <c>https://devworkflow.program/Images/Download.png</c>.
    /// </summary>
    internal static string? ToProgramImagesUrl(string raw_url)
    {
        if (string.IsNullOrWhiteSpace(raw_url)) return null;
        if (raw_url.StartsWith("data:", StringComparison.OrdinalIgnoreCase)) return null;
        if (raw_url.StartsWith("https://", StringComparison.OrdinalIgnoreCase)
            || raw_url.StartsWith("http://", StringComparison.OrdinalIgnoreCase))
            return raw_url;

        var clean = raw_url.Trim().Replace('\\', '/');
        var q = clean.IndexOfAny(['?', '#']);
        if (q >= 0) clean = clean[..q];

        var file_name = Path.GetFileName(clean);
        if (string.IsNullOrEmpty(file_name)) return null;

        // Controller CSS luôn tham chiếu ảnh toolbar dưới Program/Images.
        return $"https://{DesignHtmlGenerator.ProgramVirtualHost}/Images/{file_name}";
    }
}
