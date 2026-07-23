using System.Xml.Linq;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Đọc <c>fbo-js.catalog.xml</c> → <see cref="FboJsCatalogData"/>.
/// Fail closed: thiếu file / XML hỏng → catalog RỖNG (Version = 0), không throw — hỗ trợ editor
/// không được phép làm sập app vì một file config sai.
/// </summary>
public static class FboJsCatalogParser
{
    public static FboJsCatalogData ParseFile(string absolute_path)
    {
        if (string.IsNullOrWhiteSpace(absolute_path) || !File.Exists(absolute_path))
            return new FboJsCatalogData();

        try
        {
            return ParseXml(File.ReadAllText(absolute_path));
        }
        catch
        {
            return new FboJsCatalogData();
        }
    }

    public static FboJsCatalogData ParseXml(string xml)
    {
        if (string.IsNullOrWhiteSpace(xml)) return new FboJsCatalogData();

        XDocument document;
        try
        {
            document = XDocument.Parse(xml);
        }
        catch
        {
            return new FboJsCatalogData();
        }

        var root = document.Root;
        if (root is null) return new FboJsCatalogData();

        var types = root.Elements("type").Select(ParseType).ToList();
        var globals = root.Element("globals")?.Elements("member")
            .Select(m => ParseMember(m, FboJsMemberKind.Function)).ToList() ?? [];

        return new FboJsCatalogData
        {
            Version = ReadInt(root.Attribute("version")),
            Types = types,
            Globals = globals
        };
    }

    private static FboJsTypeInfo ParseType(XElement element) => new()
    {
        Id = element.Attribute("id")?.Value ?? string.Empty,
        Aliases = SplitAliases(element.Attribute("aliases")?.Value),
        Summary = element.Element("summary")?.Value.Trim()
                  ?? element.Attribute("summary")?.Value
                  ?? string.Empty,
        Members = element.Elements("member")
            .Select(m => ParseMember(m, FboJsMemberKind.Method))
            .ToList()
    };

    private static FboJsMemberInfo ParseMember(XElement element, FboJsMemberKind fallback) => new()
    {
        Name = element.Attribute("name")?.Value ?? string.Empty,
        Kind = ParseKind(element.Attribute("kind")?.Value, fallback),
        Signature = element.Attribute("signature")?.Value ?? string.Empty,
        Summary = element.Attribute("summary")?.Value ?? string.Empty,
        Effect = element.Attribute("effect")?.Value ?? string.Empty,
        Params = element.Elements("param").Select(p => new FboJsParamInfo
        {
            Name = p.Attribute("name")?.Value ?? string.Empty,
            Summary = p.Attribute("summary")?.Value ?? string.Empty
        }).ToList()
    };

    /// <summary>Giá trị lạ → <paramref name="fallback"/> (không throw vì catalog do người sửa tay).</summary>
    private static FboJsMemberKind ParseKind(string? value, FboJsMemberKind fallback) =>
        value?.Trim().ToLowerInvariant() switch
        {
            "method" => FboJsMemberKind.Method,
            "property" => FboJsMemberKind.Property,
            "function" => FboJsMemberKind.Function,
            _ => fallback
        };

    private static IReadOnlyList<string> SplitAliases(string? csv) =>
        string.IsNullOrWhiteSpace(csv)
            ? []
            : csv.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);

    private static int ReadInt(XAttribute? attribute) =>
        int.TryParse(attribute?.Value, out var value) ? value : 0;
}
