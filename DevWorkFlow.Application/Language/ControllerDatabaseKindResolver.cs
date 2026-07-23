using System.Text.RegularExpressions;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Đọc <c>@database</c> trên root <c>dir|grid|lookup</c> để biết controller thuộc CSDL App hay
/// Sys. Corpus dùng cả <c>"Sys"</c> lẫn <c>"sys"</c> nên so sánh KHÔNG phân biệt hoa thường.
/// </summary>
public static class ControllerDatabaseKindResolver
{
    // Giá trị chặn bởi đúng loại nháy bao ngoài (attribute FBO có thể chứa nháy loại kia).
    private static readonly Regex RootDatabaseRegex = new(
        @"<(?:dir|grid|lookup)\b[^>]*?\bdatabase\s*=\s*(?:""(?<value>[^""]*)""|'(?<value>[^']*)')",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public static ControllerDatabaseKind ResolveFromXml(string source_xml)
    {
        if (string.IsNullOrEmpty(source_xml)) return ControllerDatabaseKind.App;

        var match = RootDatabaseRegex.Match(source_xml);
        return match.Success
            ? ResolveFromDatabaseAttribute(match.Groups["value"].Value)
            : ControllerDatabaseKind.App;
    }

    public static ControllerDatabaseKind ResolveFromDatabaseAttribute(string? database_attribute_value) =>
        string.Equals(database_attribute_value?.Trim(), "Sys", StringComparison.OrdinalIgnoreCase)
            ? ControllerDatabaseKind.Sys
            : ControllerDatabaseKind.App;
}
