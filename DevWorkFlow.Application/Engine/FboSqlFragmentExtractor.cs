using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;
using DevWorkFlow.Domain.Models.Sql;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Trích &lt;command&gt; / &lt;query&gt; từ XML Dir/Filter/Lookup/Grid.
/// Không expand entity — giữ &amp;Name; (Reference) cho bước auto-declare sau.
/// </summary>
public static class FboSqlFragmentExtractor
{
    private static readonly Regex DoctypeSubsetRegex = new(
        @"<!DOCTYPE[\s\S]*?\[[\s\S]*?\]\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex DoctypeSimpleRegex = new(
        @"<!DOCTYPE[^>]*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>Entity tùy biến → placeholder parse được; chuẩn XML giữ nguyên.</summary>
    private static readonly Regex CustomEntityRegex = new(
        @"&(?!(amp|lt|gt|quot|apos|#\d+|#x[0-9a-fA-F]+);)([A-Za-z_][\w.-]*);",
        RegexOptions.Compiled);

    private static readonly Regex PlaceholderRegex = new(
        @"\u00ABentity:([A-Za-z_][\w.-]*)\u00BB",
        RegexOptions.Compiled);

    public static IReadOnlyList<FboSqlFragment> Extract(string xml)
    {
        if (string.IsNullOrWhiteSpace(xml))
            return [];

        try
        {
            var sanitized = StripDoctype(ProtectEntities(xml));
            var doc = XDocument.Parse(sanitized, LoadOptions.SetLineInfo | LoadOptions.PreserveWhitespace);
            var fragments = new List<FboSqlFragment>();

            foreach (var el in doc.Descendants())
            {
                var local = el.Name.LocalName;
                if (!local.Equals("command", StringComparison.OrdinalIgnoreCase)
                    && !local.Equals("query", StringComparison.OrdinalIgnoreCase))
                    continue;

                var text_el = el.Elements().FirstOrDefault(c =>
                    c.Name.LocalName.Equals("text", StringComparison.OrdinalIgnoreCase));
                var raw = text_el is not null ? GetInnerText(text_el) : GetInnerText(el);
                raw = RestoreEntities(raw).Trim();
                if (string.IsNullOrWhiteSpace(raw))
                    continue;

                var line = 0;
                if (el is IXmlLineInfo li && li.HasLineInfo())
                    line = li.LineNumber;

                fragments.Add(new FboSqlFragment
                {
                    Kind = local.ToLowerInvariant(),
                    Event = (string?)el.Attribute("event") ?? string.Empty,
                    Text = raw,
                    LineHint = line
                });
            }

            return fragments;
        }
        catch (XmlException)
        {
            return [];
        }
    }

    /// <summary>Gộp fragments thành một script có comment section.</summary>
    public static string BuildCombinedScript(IEnumerable<FboSqlFragment> fragments, string? source_name = null)
    {
        var sb = new StringBuilder();
        if (!string.IsNullOrWhiteSpace(source_name))
            sb.AppendLine($"-- Source: {source_name}");

        var first = true;
        foreach (var f in fragments)
        {
            if (!first)
            {
                sb.AppendLine();
                sb.AppendLine("GO");
                sb.AppendLine();
            }
            first = false;

            var evt = string.IsNullOrWhiteSpace(f.Event) ? "(none)" : f.Event;
            sb.AppendLine($"-- [{f.Kind}] event={evt}" + (f.LineHint > 0 ? $" line={f.LineHint}" : string.Empty));
            sb.AppendLine(f.Text);
        }

        return sb.ToString().TrimEnd() + Environment.NewLine;
    }

    private static string GetInnerText(XElement el)
    {
        var sb = new StringBuilder();
        foreach (var node in el.Nodes())
        {
            if (node is XCData cdata)
                sb.Append(cdata.Value);
            else if (node is XText text)
                sb.Append(text.Value);
            else if (node is XElement child
                     && child.Name.LocalName.Equals("text", StringComparison.OrdinalIgnoreCase))
                sb.Append(GetInnerText(child));
        }
        return sb.ToString();
    }

    private static string StripDoctype(string xml)
    {
        var result = DoctypeSubsetRegex.Replace(xml, string.Empty);
        return DoctypeSimpleRegex.Replace(result, string.Empty);
    }

    private static string ProtectEntities(string xml) =>
        CustomEntityRegex.Replace(xml, m => $"\u00ABentity:{m.Groups[2].Value}\u00BB");

    private static string RestoreEntities(string text) =>
        PlaceholderRegex.Replace(text, m => $"&{m.Groups[1].Value};");
}
