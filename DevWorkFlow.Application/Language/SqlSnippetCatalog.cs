using System.Text.RegularExpressions;
using System.Xml.Linq;

namespace DevWorkFlow.Application.Language;

/// <summary>Một snippet khai báo trong <c>sql-snippets.xml</c>.</summary>
public sealed class SqlSnippetDefinition
{
    public required string Id { get; init; }

    public required string Match { get; init; }

    public required string Expand { get; init; }

    public string Summary { get; init; } = string.Empty;
}

/// <summary>
/// Catalog snippet SQL đọc từ <c>Config/xml/sql-snippets.xml</c> — SoT là file config, thêm
/// snippet mới KHÔNG cần sửa code (yêu cầu "khai báo động ở Config/xml").
///
/// Regex hỏng / file thiếu → snippet đó bị bỏ qua, catalog vẫn dùng được phần còn lại; không
/// throw để một dòng config sai không làm chết phím Tab.
/// </summary>
public sealed class SqlSnippetCatalog
{
    private static readonly Regex PlaceholderRegex = new(
        @"\$\{(?<name>[A-Za-z_][\w]*)\}", RegexOptions.Compiled);

    private readonly List<(SqlSnippetDefinition Definition, Regex Pattern)> _compiled = [];

    private SqlSnippetCatalog(IEnumerable<SqlSnippetDefinition> definitions)
    {
        foreach (var definition in definitions)
        {
            if (string.IsNullOrWhiteSpace(definition.Match)) continue;
            try
            {
                _compiled.Add((
                    definition,
                    new Regex(definition.Match, RegexOptions.IgnoreCase | RegexOptions.CultureInvariant)));
            }
            catch (ArgumentException)
            {
                // Regex sai cú pháp trong config → bỏ qua snippet đó.
            }
        }
    }

    public static SqlSnippetCatalog Empty { get; } = new([]);

    public IReadOnlyList<SqlSnippetDefinition> Definitions =>
        [.. _compiled.Select(c => c.Definition)];

    public static SqlSnippetCatalog FromFile(string absolute_path)
    {
        if (string.IsNullOrWhiteSpace(absolute_path) || !File.Exists(absolute_path))
            return Empty;

        try
        {
            return FromXml(File.ReadAllText(absolute_path));
        }
        catch
        {
            return Empty;
        }
    }

    public static SqlSnippetCatalog FromXml(string xml)
    {
        if (string.IsNullOrWhiteSpace(xml)) return Empty;

        XDocument document;
        try
        {
            document = XDocument.Parse(xml);
        }
        catch
        {
            return Empty;
        }

        var definitions = document.Root?.Elements("snippet").Select(e => new SqlSnippetDefinition
        {
            Id = e.Attribute("id")?.Value ?? string.Empty,
            Match = e.Attribute("match")?.Value ?? string.Empty,
            Expand = e.Attribute("expand")?.Value ?? string.Empty,
            Summary = e.Attribute("summary")?.Value ?? string.Empty
        }) ?? [];

        return new SqlSnippetCatalog(definitions);
    }

    /// <summary>
    /// Snippet đầu tiên khớp <paramref name="text"/> → chuỗi đã thay <c>${nhóm}</c>.
    /// null nếu không snippet nào khớp.
    /// </summary>
    public string? TryExpand(string? text)
    {
        if (string.IsNullOrWhiteSpace(text)) return null;

        foreach (var (definition, pattern) in _compiled)
        {
            var match = pattern.Match(text);
            if (!match.Success) continue;

            return PlaceholderRegex.Replace(definition.Expand, placeholder =>
            {
                var group = match.Groups[placeholder.Groups["name"].Value];
                return group.Success ? group.Value : string.Empty;
            });
        }

        return null;
    }
}
