using System.Text.RegularExpressions;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Đọc file main (.aspx) của menu, lấy thuộc tính Controller="…"
/// (ưu tiên FastBusiness:*Extender, fallback mọi Controller=).
/// </summary>
public static partial class AspxControllerParser
{
    /// <summary>FastBusiness:ReportExtender … Controller="Item".</summary>
    [GeneratedRegex(
        @"FastBusiness:\w+\b[^>]*\bController\s*=\s*[""'](?<name>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.CultureInvariant)]
    private static partial Regex FastBusinessControllerRegex();

    /// <summary>Controller="ValueAddedTax" hoặc Controller='ValueAddedTax'.</summary>
    [GeneratedRegex(
        @"\bController\s*=\s*[""'](?<name>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.CultureInvariant)]
    private static partial Regex ControllerAttributeRegex();

    public static IReadOnlyList<string> ParseControllers(string aspx_content)
    {
        if (string.IsNullOrWhiteSpace(aspx_content))
            return [];

        var from_extender = FastBusinessControllerRegex()
            .Matches(aspx_content)
            .Select(m => m.Groups["name"].Value.Trim())
            .Where(n => n.Length > 0)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        if (from_extender.Count > 0)
            return from_extender;

        return ControllerAttributeRegex()
            .Matches(aspx_content)
            .Select(m => m.Groups["name"].Value.Trim())
            .Where(n => n.Length > 0)
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();
    }

    public static IReadOnlyList<string> ParseControllersFromFile(string aspx_path)
    {
        if (!File.Exists(aspx_path))
            return [];

        var content = File.ReadAllText(aspx_path);
        return ParseControllers(content);
    }
}
