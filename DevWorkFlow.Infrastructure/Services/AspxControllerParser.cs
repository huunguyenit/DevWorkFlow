using System.Text.RegularExpressions;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Đọc file main (.aspx) của menu, lấy thuộc tính Controller="...".
/// </summary>
public static partial class AspxControllerParser
{
    /// <summary>Controller="ValueAddedTax" hoặc Controller='ValueAddedTax'.</summary>
    [GeneratedRegex(@"\bController\s*=\s*[""'](?<name>[^""']+)[""']", RegexOptions.IgnoreCase | RegexOptions.CultureInvariant)]
    private static partial Regex ControllerAttributeRegex();

    public static IReadOnlyList<string> ParseControllers(string aspx_content)
    {
        if (string.IsNullOrWhiteSpace(aspx_content))
            return [];

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
