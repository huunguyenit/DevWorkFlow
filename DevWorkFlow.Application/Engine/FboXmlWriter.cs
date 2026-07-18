using System.Text.RegularExpressions;
using System.Xml.Linq;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Ghi lại layout (column widths, view patterns, category columns) và thuộc tính field
/// vào XML gốc khi Save.
/// Bảo toàn DOCTYPE + entity ref (&amp;UnitViews;, &amp;ClientDefault;, ...) bằng cách:
///  - tách preamble (xml decl + DOCTYPE) giữ nguyên,
///  - thay entity ref bằng sentinel Unicode trước khi parse, khôi phục sau khi ToString.
/// </summary>
public class FboXmlWriter
{
    private const char EntStart = '\uE000';
    private const char EntEnd = '\uE001';

    private static readonly Regex RootStartRegex =
        new(@"<(?:dir|filter|grid|lookup)[\s>]", RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex CustomEntityRegex =
        new(@"&(?!(?:amp|lt|gt|quot|apos|#\d+|#x[0-9a-fA-F]+);)([A-Za-z_][\w.-]*);",
            RegexOptions.Compiled);

    public string ApplyLayout(string xml, FboFormModel form)
    {
        if (string.IsNullOrWhiteSpace(xml) || form.Layout is null)
            return xml;

        var (preamble, body) = SplitPreamble(xml);
        var doc = ParseBody(body);
        var root = doc.Root;
        if (root is null) return xml;

        var view = FindView(root);
        if (view is null) return xml;

        var layout = form.Layout;
        var width_line = string.Join(", ", layout.ColumnWidths);
        var row_items = layout.Rows
            .Select(r => $"{r.Pattern}: {BuildControlsPart(r)}")
            .ToList();

        var existing_items = view.Elements()
            .Where(e => e.Name.LocalName.Equals("item", StringComparison.OrdinalIgnoreCase))
            .ToList();

        var new_values = new List<string> { width_line };
        new_values.AddRange(row_items);

        for (var i = 0; i < new_values.Count; i++)
        {
            if (i < existing_items.Count)
                existing_items[i].SetAttributeValue("value", new_values[i]);
            else
                view.Add(new XElement(view.Name.Namespace + "item",
                    new XAttribute("value", new_values[i])));
        }

        for (var i = existing_items.Count - 1; i >= new_values.Count; i--)
            existing_items[i].Remove();

        UpdateCategoryColumns(view, layout);

        return Serialize(preamble, doc);
    }

    private static void UpdateCategoryColumns(XElement view, FormViewLayout layout)
    {
        if (layout.Categories.Count == 0) return;

        var categories_el = view.Elements()
            .FirstOrDefault(e => e.Name.LocalName.Equals("categories", StringComparison.OrdinalIgnoreCase));
        if (categories_el is null) return;

        foreach (var cat_el in categories_el.Elements()
                     .Where(e => e.Name.LocalName.Equals("category", StringComparison.OrdinalIgnoreCase)))
        {
            if (!int.TryParse((string?)cat_el.Attribute("index"), out var index))
                continue;
            var model = layout.Categories.FirstOrDefault(c => c.Index == index);
            if (model is { ColumnWidths.Count: > 0 })
                cat_el.SetAttributeValue("columns", string.Join(", ", model.ColumnWidths));
        }
    }

    private static string BuildControlsPart(FormViewRow row)
    {
        var parts = new List<string>();
        foreach (var cell in row.Cells)
        {
            if (cell.Kind == FormViewCellKind.Empty) continue;
            var name = cell.FieldName ?? string.Empty;
            // Ưu tiên suffix gốc để ghi lại chính xác (.Footer / .Description / .Label / .)
            if (!string.IsNullOrEmpty(cell.Suffix))
            {
                parts.Add($"[{name}]{cell.Suffix}");
                continue;
            }

            parts.Add(cell.Kind switch
            {
                FormViewCellKind.Label => $"[{name}].Label",
                FormViewCellKind.Description => $"[{name}].Description",
                _ => $"[{name}]"
            });
        }

        return string.Join(", ", parts);
    }

    /// <summary>Cập nhật widths từ danh sách px mới (sau kéo ruler).</summary>
    public static void UpdateColumnWidths(FboFormModel form, IReadOnlyList<int> widths_px)
    {
        if (form.Layout is null) return;
        form.Layout.ColumnWidths = widths_px.ToList();
    }

    /// <summary>Ghi thuộc tính field (attribute / items) vào XML theo name.</summary>
    public string ApplyFieldProperty(string xml, string field_name, string property_name, string? value)
    {
        if (string.IsNullOrWhiteSpace(xml) || string.IsNullOrWhiteSpace(field_name))
            return xml;

        var (preamble, body) = SplitPreamble(xml);
        var doc = ParseBody(body);
        var root = doc.Root;
        if (root is null) return xml;

        var fields = root.Elements()
            .FirstOrDefault(e => e.Name.LocalName.Equals("fields", StringComparison.OrdinalIgnoreCase));
        if (fields is null) return xml;

        var field_el = fields.Elements()
            .FirstOrDefault(e =>
                e.Name.LocalName.Equals("field", StringComparison.OrdinalIgnoreCase)
                && string.Equals((string?)e.Attribute("name"), field_name, StringComparison.OrdinalIgnoreCase));
        if (field_el is null) return xml;

        if (TrySplitChild(property_name, out var child_name, out var child_attr))
        {
            var child_el = field_el.Elements()
                .FirstOrDefault(e => e.Name.LocalName.Equals(child_name, StringComparison.OrdinalIgnoreCase));
            if (child_el is null)
            {
                child_el = new XElement(field_el.Name.Namespace + child_name);
                field_el.Add(child_el);
            }

            // header/footer là phần tử con có v/e; items dùng attribute
            SetChildAttr(child_el, child_attr, value);
        }
        else
        {
            SetOrRemoveAttr(field_el, property_name, value);
        }

        return Serialize(preamble, doc);
    }

    private static void SetOrRemoveAttr(XElement el, string attr_name, string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
            el.Attribute(attr_name)?.Remove();
        else
            el.SetAttributeValue(attr_name, value);
    }

    /// <summary>header/footer: giữ attribute rỗng ("") — không xóa để không mất khai báo v/e.</summary>
    private static void SetChildAttr(XElement el, string attr_name, string? value) =>
        el.SetAttributeValue(attr_name, value ?? string.Empty);

    /// <summary>"items.style" / "header.v" / "footer.e" → (child, attr).</summary>
    private static bool TrySplitChild(string property_name, out string child, out string attr)
    {
        child = string.Empty;
        attr = string.Empty;
        var dot = property_name.IndexOf('.');
        if (dot <= 0) return false;
        var prefix = property_name[..dot];
        if (prefix is not ("items" or "header" or "footer")) return false;
        child = prefix;
        attr = property_name[(dot + 1)..];
        return true;
    }

    private static XElement? FindView(XElement root)
    {
        var views = root.Elements()
            .FirstOrDefault(e => e.Name.LocalName.Equals("views", StringComparison.OrdinalIgnoreCase));
        return views?.Elements()
            .FirstOrDefault(e => e.Name.LocalName.Equals("view", StringComparison.OrdinalIgnoreCase));
    }

    // ── Bảo toàn preamble + entity ───────────────────────────────────

    private static (string preamble, string body) SplitPreamble(string xml)
    {
        var m = RootStartRegex.Match(xml);
        return m.Success ? (xml[..m.Index], xml[m.Index..]) : (string.Empty, xml);
    }

    private static XDocument ParseBody(string body) =>
        XDocument.Parse(EncodeEntities(body), LoadOptions.PreserveWhitespace);

    private static string EncodeEntities(string body) =>
        CustomEntityRegex.Replace(body, m => $"{EntStart}{m.Groups[1].Value}{EntEnd}");

    private static string DecodeEntities(string text) =>
        text.Replace(EntStart, '&').Replace(EntEnd, ';');

    private static string Serialize(string preamble, XDocument doc)
    {
        var body = DecodeEntities(doc.ToString(SaveOptions.DisableFormatting));
        // XmlWriter chèn 1 space trước "/>" ở element tự đóng — trả về style gốc "…"/>
        body = body.Replace("\" />", "\"/>");
        return preamble + body;
    }
}
