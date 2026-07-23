using System.Xml.Linq;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Đọc <c>sql-functions.xml</c> → <see cref="SqlFunctionCatalogData"/>.
/// Fail closed như catalog JS: thiếu file / XML hỏng → catalog RỖNG (hover im lặng), không throw.
/// </summary>
public static class SqlFunctionCatalogParser
{
    public static SqlFunctionCatalogData ParseFile(string absolute_path)
    {
        if (string.IsNullOrWhiteSpace(absolute_path) || !File.Exists(absolute_path))
            return new SqlFunctionCatalogData();

        try
        {
            return ParseXml(File.ReadAllText(absolute_path));
        }
        catch
        {
            return new SqlFunctionCatalogData();
        }
    }

    public static SqlFunctionCatalogData ParseXml(string xml)
    {
        if (string.IsNullOrWhiteSpace(xml)) return new SqlFunctionCatalogData();

        XDocument document;
        try
        {
            document = XDocument.Parse(xml);
        }
        catch
        {
            return new SqlFunctionCatalogData();
        }

        var root = document.Root;
        if (root is null) return new SqlFunctionCatalogData();

        var groups = new List<SqlFunctionGroupInfo>();
        foreach (var element in root.Elements("group"))
            groups.Add(ParseGroup(element));

        // Hàm khai báo thẳng dưới root (không bọc group) vẫn nhận — file nhỏ khỏi phải tạo group.
        var loose = root.Elements("function").Select(f => ParseFunction(f, string.Empty)).ToList();
        if (loose.Count > 0)
            groups.Add(new SqlFunctionGroupInfo { Id = string.Empty, Functions = loose });

        return new SqlFunctionCatalogData
        {
            Version = int.TryParse(root.Attribute("version")?.Value, out var version) ? version : 0,
            Groups = groups,
            Keywords = ParseKeywords(root)
        };
    }

    /// <summary>
    /// <c>&lt;keywords&gt;</c>: mỗi <c>&lt;keyword name="…"/&gt;</c> là một mục Completion. Cho phép
    /// khai báo gọn bằng <c>@names</c> (CSV) khi không cần mô tả riêng cho từng từ.
    /// </summary>
    private static IReadOnlyList<SqlKeywordInfo> ParseKeywords(XElement root)
    {
        var keywords = new List<SqlKeywordInfo>();

        foreach (var block in root.Elements("keywords"))
        {
            var csv = block.Attribute("names")?.Value;
            if (!string.IsNullOrWhiteSpace(csv))
            {
                foreach (var name in csv.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
                    keywords.Add(new SqlKeywordInfo { Name = name });
            }

            foreach (var element in block.Elements("keyword"))
            {
                var name = element.Attribute("name")?.Value?.Trim();
                if (string.IsNullOrWhiteSpace(name)) continue;
                keywords.Add(new SqlKeywordInfo
                {
                    Name = name,
                    InsertText = element.Attribute("insert")?.Value ?? string.Empty,
                    Summary = ReadText(element, "summary")
                });
            }
        }

        return keywords;
    }

    private static SqlFunctionGroupInfo ParseGroup(XElement element)
    {
        var id = element.Attribute("id")?.Value ?? string.Empty;
        return new SqlFunctionGroupInfo
        {
            Id = id,
            Summary = ReadText(element, "summary"),
            Functions = element.Elements("function").Select(f => ParseFunction(f, id)).ToList()
        };
    }

    private static SqlFunctionInfo ParseFunction(XElement element, string group_id) => new()
    {
        Name = element.Attribute("name")?.Value?.Trim() ?? string.Empty,
        Schema = element.Attribute("schema")?.Value?.Trim() ?? string.Empty,
        Group = group_id,
        Signature = element.Attribute("signature")?.Value ?? string.Empty,
        Summary = ReadText(element, "summary"),
        Returns = ReadText(element, "returns"),
        Remarks = ReadText(element, "remarks"),
        Example = ReadText(element, "example"),
        Params = element.Elements("param").Select(p => new SqlFunctionParamInfo
        {
            Name = p.Attribute("name")?.Value ?? string.Empty,
            Summary = p.Attribute("summary")?.Value ?? p.Value.Trim()
        }).ToList()
    };

    /// <summary>Nhận cả attribute lẫn element con — mô tả dài viết ở element cho dễ đọc.</summary>
    private static string ReadText(XElement element, string name) =>
        element.Attribute(name)?.Value
        ?? element.Element(name)?.Value.Trim()
        ?? string.Empty;
}
