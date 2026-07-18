using System.Xml.Linq;

namespace DevWorkFlow.Application.Language.Schema;

/// <summary>
/// Đọc XSD (Dir/Grid/Lookup/Report/…) để biết attribute định danh của mỗi element.
/// Nguồn: <c>xs:key</c> / <c>xs:unique</c> (selector = element, field = @attr).
///
/// Cấu trúc XML FBO cố định → Navigation/Outline dựng generic theo schema,
/// không hard-code từng loại symbol. Chỉ &lt;script&gt; là ngoại lệ (chứa JS function).
/// </summary>
public static class XsdSchemaCatalog
{
    private static readonly Lazy<IReadOnlyDictionary<string, string>> IdentityMap =
        new(LoadIdentityAttributes);

    // Fallback theo thứ tự ưu tiên khi element không có key trong schema.
    private static readonly string[] Fallback =
        ["name", "id", "event", "index", "value", "key"];

    /// <summary>Attribute định danh của element (vd. field→name, command→event, view→id).</summary>
    public static string? GetIdentityAttribute(string element_name) =>
        string.IsNullOrWhiteSpace(element_name)
            ? null
            : IdentityMap.Value.GetValueOrDefault(element_name);

    public static IReadOnlyList<string> FallbackIdentityAttributes => Fallback;

    private static IReadOnlyDictionary<string, string> LoadIdentityAttributes()
    {
        var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        XNamespace xs = "http://www.w3.org/2001/XMLSchema";

        foreach (var file in EnumerateSchemaFiles())
        {
            XDocument doc;
            try
            {
                doc = XDocument.Load(file);
            }
            catch
            {
                continue;
            }

            foreach (var key in doc.Descendants().Where(e =>
                         e.Name == xs + "key" || e.Name == xs + "unique"))
            {
                var selector = key.Element(xs + "selector")?.Attribute("xpath")?.Value;
                var field = key.Element(xs + "field")?.Attribute("xpath")?.Value;
                if (string.IsNullOrWhiteSpace(selector) || string.IsNullOrWhiteSpace(field))
                    continue;

                var element = LocalName(selector);
                var attr = field.TrimStart('@').Trim();
                if (element.Length == 0 || attr.Length == 0)
                    continue;

                map.TryAdd(element, attr);
            }
        }

        return map;
    }

    /// <summary>Local name của segment cuối trong xpath (vd. a:fields/a:field → field).</summary>
    private static string LocalName(string xpath)
    {
        var segment = xpath.Split('/').LastOrDefault() ?? xpath;
        var colon = segment.LastIndexOf(':');
        return (colon >= 0 ? segment[(colon + 1)..] : segment).Trim();
    }

    private static IEnumerable<string> EnumerateSchemaFiles()
    {
        var dir = Path.Combine(AppContext.BaseDirectory, "Schemas");
        if (!Directory.Exists(dir))
            yield break;

        foreach (var file in Directory.EnumerateFiles(dir, "*.xsd"))
            yield return file;
    }
}
