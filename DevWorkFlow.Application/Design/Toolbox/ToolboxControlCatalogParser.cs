using System.Xml.Linq;
using DevWorkFlow.Domain.Design;

namespace DevWorkFlow.Application.Design.Toolbox;

/// <summary>
/// Đọc <c>toolbox-controls.xml</c> → <see cref="ToolboxControlCatalogData"/>.
/// Fail-closed như catalog SQL: thiếu file / XML hỏng → catalog RỖNG, không throw.
/// </summary>
public static class ToolboxControlCatalogParser
{
    public static ToolboxControlCatalogData ParseFile(string absolute_path)
    {
        if (string.IsNullOrWhiteSpace(absolute_path) || !File.Exists(absolute_path))
            return ToolboxControlCatalogData.Empty;

        try
        {
            return ParseXml(File.ReadAllText(absolute_path));
        }
        catch
        {
            return ToolboxControlCatalogData.Empty;
        }
    }

    public static ToolboxControlCatalogData ParseXml(string xml)
    {
        if (string.IsNullOrWhiteSpace(xml)) return ToolboxControlCatalogData.Empty;

        XDocument document;
        try
        {
            document = XDocument.Parse(xml);
        }
        catch
        {
            return ToolboxControlCatalogData.Empty;
        }

        var root = document.Root;
        if (root is null) return ToolboxControlCatalogData.Empty;

        var groups = new List<ToolboxControlGroup>();
        foreach (var group_el in root.Elements("group"))
            groups.Add(ParseGroup(group_el));

        return new ToolboxControlCatalogData
        {
            Version = int.TryParse(root.Attribute("version")?.Value, out var version) ? version : 0,
            Groups = groups
        };
    }

    private static ToolboxControlGroup ParseGroup(XElement group_el)
    {
        var id = group_el.Attribute("id")?.Value?.Trim() ?? string.Empty;
        var title = group_el.Attribute("title")?.Value ?? string.Empty;
        var controls = group_el.Elements("control")
            .Select(c => ParseControl(c, id, title))
            .Where(c => c is not null)
            .Select(c => c!)
            .ToList();

        return new ToolboxControlGroup { Id = id, Title = title, Controls = controls };
    }

    private static ToolboxControlInfo? ParseControl(XElement el, string group_id, string group_title)
    {
        var control_id = el.Attribute("id")?.Value?.Trim();
        if (string.IsNullOrWhiteSpace(control_id)) return null;

        return new ToolboxControlInfo
        {
            Id = control_id,
            Name = el.Attribute("name")?.Value ?? control_id,
            Icon = el.Attribute("icon")?.Value ?? string.Empty,
            Enabled = ReadBool(el.Attribute("enabled")?.Value, fallback: true),
            GroupId = group_id,
            GroupTitle = group_title,
            Prefix = Trimmed(el.Attribute("prefix")?.Value),
            DataType = Trimmed(el.Attribute("type")?.Value),
            // dataFormatString="" là hợp lệ (attr rỗng vẫn giữ) → không Trim thành null.
            DataFormatString = el.Attribute("dataFormatString")?.Value,
            ItemsStyle = Trimmed(el.Attribute("itemsStyle")?.Value),
            CreateReference = ReadBool(el.Attribute("createReference")?.Value, fallback: false),
            PlaceKinds = ParseCsv(el.Attribute("placeKinds")?.Value),
            TabKind = Trimmed(el.Attribute("tabKind")?.Value)
        };
    }

    private static IReadOnlyList<string> ParseCsv(string? csv)
    {
        if (string.IsNullOrWhiteSpace(csv)) return [];
        return csv
            .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
            .ToList();
    }

    private static bool ReadBool(string? value, bool fallback) =>
        bool.TryParse(value, out var parsed) ? parsed : fallback;

    private static string? Trimmed(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value.Trim();
}
