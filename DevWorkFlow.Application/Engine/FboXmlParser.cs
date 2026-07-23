using System.Net;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Parse XML controller FBO (Dir / Filter / Grid / Lookup) → model.
/// Tập trung &lt;fields&gt; + &lt;views&gt; để phục vụ render.
/// </summary>
public class FboXmlParser
{
    private static readonly XNamespace NsDir = "urn:schemas-fast-com:data-dir";
    private static readonly XNamespace NsFilter = "urn:schemas-fast-com:data-filter";
    private static readonly XNamespace NsGrid = "urn:schemas-fast-com:data-grid";
    private static readonly XNamespace NsLookup = "urn:schemas-fast-com:data-lookup";

    private static readonly Regex CellRefRegex = new(
        @"\[(?<name>[^\]]+)\](?:\.(?<kind>Label|Description|Footer)?)?",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public FboControllerDocument Parse(string xml, string? file_path = null)
    {
        if (string.IsNullOrWhiteSpace(xml))
            throw new InvalidOperationException("XML trống.");

        var sanitized = SanitizeXml(xml);
        var doc = LoadXml(sanitized);
        var root = doc.Root ?? throw new InvalidOperationException("XML thiếu root.");

        var local = root.Name.LocalName;
        var controller_name = ResolveControllerName(file_path, root);

        var document = local.ToLowerInvariant() switch
        {
            "dir" => FboControllerDocument.FromForm(ParseForm(root, ControllerFolderKind.Dir, controller_name), file_path ?? "", xml),
            "filter" => FboControllerDocument.FromForm(ParseForm(root, ControllerFolderKind.Filter, controller_name), file_path ?? "", xml),
            "grid" => FboControllerDocument.FromGrid(ParseGrid(root, controller_name), file_path ?? "", xml),
            "lookup" => FboControllerDocument.FromLookup(ParseLookup(root, controller_name), file_path ?? "", xml),
            _ => throw new InvalidOperationException($"Root XML không hỗ trợ: <{local}>.")
        };
        document.CssText = FindChild(FindChild(root, "css"), "text")?.Value ?? string.Empty;
        return document;
    }

    public FboControllerDocument ParseFile(string file_path)
    {
        return Parse(File.ReadAllText(file_path), file_path);
    }

    // ── Form (Dir / Filter) ──────────────────────────────────────────

    private static FboFormModel ParseForm(XElement root, ControllerFolderKind folder, string controller_name)
    {
        var model = new FboFormModel
        {
            FolderKind = folder,
            ControllerName = controller_name,
            Table = Attr(root, "table"),
            CodeField = Attr(root, "code"),
            OrderBy = NullIfEmpty(Attr(root, "order")),
            AppType = NullIfEmpty(Attr(root, "type")),
            Database = NullIfEmpty(Attr(root, "database")),
            UniKey = IsTrue(Attr(root, "uniKey")),
            Navigation = IsTrue(Attr(root, "navigation")),
            Title = ReadLocalized(FindChild(root, "title"))
        };

        model.Fields = ParseFields(FindChild(root, "fields"));
        model.FieldsByName = model.Fields.ToDictionary(f => f.Name, StringComparer.OrdinalIgnoreCase);
        model.Layout = ParseFormView(FindChild(root, "views"), model.FieldsByName);
        return model;
    }

    private static FormViewLayout? ParseFormView(
        XElement? views_el,
        IReadOnlyDictionary<string, FboField>? fields_by_name = null)
    {
        if (views_el is null) return null;

        var views = views_el.Elements()
            .Where(e => e.Name.LocalName.Equals("view", StringComparison.OrdinalIgnoreCase))
            .ToList();
        var view = views.FirstOrDefault(e =>
                Attr(e, "id").Equals("Dir", StringComparison.OrdinalIgnoreCase))
            ?? views.FirstOrDefault();
        if (view is null) return null;

        // XSD: height
        var height_expr = NullIfEmpty(Attr(view, "height"));

        var layout = new FormViewLayout
        {
            ViewId = Attr(view, "id"),
            HeightExpression = height_expr,
            HeightPx = FboLayoutUnits.EvaluateHeightExpression(height_expr),
            Anchor = int.TryParse(Attr(view, "anchor"), out var anchor) ? anchor : null,
            Split = int.TryParse(Attr(view, "split"), out var split) ? split : null
        };

        layout.Categories = ParseCategories(FindChild(view, "categories"));

        var items = view.Elements()
            .Where(e => e.Name.LocalName.Equals("item", StringComparison.OrdinalIgnoreCase))
            .Select(e => Attr(e, "value"))
            .Where(v => !string.IsNullOrWhiteSpace(v))
            .ToList();

        if (items.Count == 0) return layout;

        // Item đầu: "120, 30, 20, 50, 50, 280" (giữ cả cột 0)
        if (!items[0].Contains(':', StringComparison.Ordinal))
        {
            layout.ColumnWidths = ParseColumnWidths(items[0]);
            items = items.Skip(1).ToList();
        }

        foreach (var item in items)
        {
            var cat_index = ResolveRowCategoryIndex(item, fields_by_name);
            var widths = ResolveRowColumnWidths(cat_index, layout);
            var row = ParseViewRow(item, widths);
            row.CategoryIndex = cat_index;
            layout.Rows.Add(row);

            if (cat_index < 0)
                layout.BottomRows.Add(row);
            else if (cat_index == 0)
                layout.TopRows.Add(row);
            else
            {
                var category = layout.Categories.FirstOrDefault(c => c.Index == cat_index);
                if (category is not null)
                    category.Rows.Add(row);
                else
                    layout.TopRows.Add(row); // category chưa khai báo → đẩy lên trên
            }
        }

        // Không có categories → toàn bộ rows ở vùng trên (giữ hành vi cũ)
        if (!layout.HasCategories && layout.TopRows.Count == 0 && layout.Rows.Count > 0)
        {
            layout.TopRows.AddRange(layout.Rows);
            layout.BottomRows.Clear();
        }

        return layout;
    }

    private static List<FormCategory> ParseCategories(XElement? categories_el)
    {
        var list = new List<FormCategory>();
        if (categories_el is null) return list;

        foreach (var cat_el in categories_el.Elements()
                     .Where(e => e.Name.LocalName.Equals("category", StringComparison.OrdinalIgnoreCase)))
        {
            if (!int.TryParse(Attr(cat_el, "index"), out var index))
                continue;

            var header = FindChild(cat_el, "header");
            list.Add(new FormCategory
            {
                Index = index,
                HeaderV = header is null ? string.Empty : Attr(header, "v"),
                HeaderE = header is null ? string.Empty : Attr(header, "e"),
                ColumnWidths = ParseColumnWidths(Attr(cat_el, "columns")),
                Anchor = int.TryParse(Attr(cat_el, "anchor"), out var a) ? a : null,
                Split = int.TryParse(Attr(cat_el, "split"), out var s) ? s : null
            });
        }

        // Giữ thứ tự khai báo XML — không sort theo index.
        return list;
    }

    private static List<int> ParseColumnWidths(string? raw)
    {
        if (string.IsNullOrWhiteSpace(raw)) return [];
        return raw
            .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
            .Select(s => int.TryParse(s, out var w) ? w : 0)
            .ToList();
    }

    /// <summary>
    /// categoryIndex của dòng = field đầu tiên có khai báo; null → 0 (vùng trên); -1 = vùng dưới.
    /// </summary>
    private static int ResolveRowCategoryIndex(
        string item_value,
        IReadOnlyDictionary<string, FboField>? fields_by_name)
    {
        if (fields_by_name is null || fields_by_name.Count == 0) return 0;

        foreach (Match m in CellRefRegex.Matches(item_value))
        {
            var field_name = m.Groups["name"].Value.Trim();
            if (!fields_by_name.TryGetValue(field_name, out var field))
                continue;
            if (field.CategoryIndex.HasValue)
                return field.CategoryIndex.Value;
        }

        return 0;
    }

    private static IReadOnlyList<int> ResolveRowColumnWidths(int category_index, FormViewLayout layout)
    {
        if (category_index > 0)
        {
            var category = layout.Categories.FirstOrDefault(c => c.Index == category_index);
            if (category is { ColumnWidths.Count: > 0 })
                return category.ColumnWidths;
        }

        if (category_index < 0)
            return layout.FooterColumnWidths;

        return layout.ColumnWidths;
    }

    /// <summary>
    /// Pattern FBO:
    /// 1 = bắt đầu control mới (gán control kế tiếp),
    /// 0 = nối tiếp control trước (cộng width),
    /// - = không dùng (ô trống),
    /// thiếu cột so với ColumnWidths → pad '-'.
    /// Footer: [f].Description | [f].Footer | [f].
    /// </summary>
    internal static FormViewRow ParseViewRow(string value, IReadOnlyList<int> column_widths)
    {
        var row = new FormViewRow();
        var parts = value.Split(':', 2);
        var pattern = parts[0].Trim();
        var controls_part = parts.Length > 1 ? parts[1] : string.Empty;
        row.Pattern = pattern;

        var controls = new List<FormViewCell>();
        foreach (Match m in CellRefRegex.Matches(controls_part))
        {
            var kind_raw = m.Groups["kind"].Value;
            FormViewCellKind kind;
            if (!m.Groups["kind"].Success)
            {
                // [field] không có dấu chấm → Input
                kind = FormViewCellKind.Input;
            }
            else if (kind_raw.Equals("Label", StringComparison.OrdinalIgnoreCase))
            {
                kind = FormViewCellKind.Label;
            }
            else
            {
                // Description | Footer | (rỗng sau dấu .) → footer text
                kind = FormViewCellKind.Description;
            }

            var full = m.Value;
            var bracket_end = full.IndexOf(']') + 1;
            var suffix = bracket_end > 0 && bracket_end < full.Length ? full[bracket_end..] : string.Empty;

            controls.Add(new FormViewCell
            {
                Kind = kind,
                FieldName = m.Groups["name"].Value.Trim(),
                Suffix = suffix,
                ColumnSpan = 1
            });
        }

        // Pad pattern bằng '-' cho đủ số cột
        var col_count = column_widths.Count > 0 ? column_widths.Count : pattern.Length;
        if (pattern.Length < col_count)
            pattern = pattern.PadRight(col_count, '-');
        else if (pattern.Length > col_count && col_count > 0)
            pattern = pattern[..col_count];

        FormViewCell? current = null;
        var control_index = 0;
        var span_start = 0;

        for (var i = 0; i < pattern.Length; i++)
        {
            var ch = pattern[i];
            var col_px = i < column_widths.Count ? column_widths[i] : 80;

            if (ch == '1')
            {
                current = control_index < controls.Count
                    ? controls[control_index++]
                    : new FormViewCell { Kind = FormViewCellKind.Empty };
                current.ColumnIndex = i;
                current.ColumnSpan = 1;
                current.WidthPx = col_px;
                span_start = i;
                row.Cells.Add(current);
            }
            else if (ch == '0')
            {
                if (current is not null)
                {
                    current.ColumnSpan++;
                    current.WidthPx += col_px;
                }
                else
                {
                    // 0 không có 1 trước → coi như empty
                    row.Cells.Add(new FormViewCell
                    {
                        Kind = FormViewCellKind.Empty,
                        ColumnIndex = i,
                        ColumnSpan = 1,
                        WidthPx = col_px
                    });
                }
            }
            else // '-' hoặc ký tự khác = không dùng
            {
                current = null;
                row.Cells.Add(new FormViewCell
                {
                    Kind = FormViewCellKind.Empty,
                    ColumnIndex = i,
                    ColumnSpan = 1,
                    WidthPx = col_px
                });
            }
        }

        return row;
    }

    // Overload giữ tương thích test cũ
    internal static FormViewRow ParseViewRow(string value, int table_column_count = 0)
    {
        var widths = table_column_count > 0
            ? Enumerable.Repeat(80, table_column_count).ToList()
            : new List<int>();
        // Nếu không có widths thật, suy từ pattern length
        if (widths.Count == 0)
        {
            var pattern_len = value.Split(':', 2)[0].Trim().Length;
            widths = Enumerable.Repeat(80, Math.Max(pattern_len, 1)).ToList();
        }
        return ParseViewRow(value, (IReadOnlyList<int>)widths);
    }

    // ── Grid ─────────────────────────────────────────────────────────

    private static FboGridModel ParseGrid(XElement root, string controller_name)
    {
        var model = new FboGridModel
        {
            ControllerName = controller_name,
            Table = Attr(root, "table"),
            CodeField = Attr(root, "code"),
            OrderBy = NullIfEmpty(Attr(root, "order")),
            AppType = NullIfEmpty(Attr(root, "type")),
            Title = ReadLocalized(FindChild(root, "title")),
            SubTitle = ReadLocalized(FindChild(root, "subTitle"))
        };

        model.Fields = ParseFields(FindChild(root, "fields"));
        model.FieldsByName = model.Fields.ToDictionary(f => f.Name, StringComparer.OrdinalIgnoreCase);

        var views = FindChild(root, "views");
        var view_candidates = views?.Elements()
            .Where(e => e.Name.LocalName.Equals("view", StringComparison.OrdinalIgnoreCase))
            .ToList();
        var view = view_candidates?.FirstOrDefault(e =>
                Attr(e, "id").Equals("Grid", StringComparison.OrdinalIgnoreCase))
            ?? view_candidates?.FirstOrDefault();
        if (view is not null)
        {
            model.VisibleFieldNames = view.Elements()
                .Where(e => e.Name.LocalName.Equals("field", StringComparison.OrdinalIgnoreCase))
                .Select(e => Attr(e, "name"))
                .Where(n => n.Length > 0)
                .ToList();
        }

        var toolbar = FindChild(root, "toolbar");
        if (toolbar is not null)
        {
            foreach (var btn in toolbar.Elements().Where(e => e.Name.LocalName.Equals("button", StringComparison.OrdinalIgnoreCase)))
            {
                var toolbar_button = new GridToolbarButton
                {
                    Command = Attr(btn, "command"),
                    Title = ReadLocalized(FindChild(btn, "title"))
                };
                toolbar_button.MenuItems = ParseToolbarMenuItems(FindChild(btn, "menuItems"));
                model.Toolbar.Add(toolbar_button);
            }
        }

        return model;
    }

    private static List<GridToolbarMenuItem> ParseToolbarMenuItems(XElement? menu_items)
    {
        var list = new List<GridToolbarMenuItem>();
        if (menu_items is null) return list;

        foreach (var item in menu_items.Elements()
                     .Where(e => e.Name.LocalName.Equals("menuItem", StringComparison.OrdinalIgnoreCase)))
        {
            list.Add(new GridToolbarMenuItem
            {
                CommandArgument = Attr(item, "commandArgument"),
                Header = ReadLocalized(FindChild(item, "header"))
            });
        }

        return list;
    }

    // ── Lookup ───────────────────────────────────────────────────────

    private static FboLookupModel ParseLookup(XElement root, string controller_name)
    {
        var model = new FboLookupModel
        {
            ControllerName = controller_name,
            Table = Attr(root, "table"),
            CodeField = Attr(root, "code"),
            NameField = Attr(root, "name"),
            OrderBy = NullIfEmpty(Attr(root, "order")),
            Header = ReadLocalized(FindChild(root, "header"))
        };

        model.Fields = ParseFields(FindChild(root, "fields"));
        model.FieldsByName = model.Fields.ToDictionary(f => f.Name, StringComparer.OrdinalIgnoreCase);
        model.SearchField = !string.IsNullOrWhiteSpace(model.CodeField)
            ? model.CodeField
            : model.Fields.FirstOrDefault()?.Name ?? string.Empty;

        return model;
    }

    // ── Fields ───────────────────────────────────────────────────────

    private static List<FboField> ParseFields(XElement? fields_el)
    {
        if (fields_el is null) return [];

        return fields_el.Elements()
            .Where(e => e.Name.LocalName.Equals("field", StringComparison.OrdinalIgnoreCase))
            .Select(ParseField)
            .Where(f => !string.IsNullOrWhiteSpace(f.Name))
            .ToList();
    }

    private static FboField ParseField(XElement el)
    {
        var items = FindChild(el, "items");
        var footer = FindChild(el, "footer");
        var data_type = NullIfEmpty(Attr(el, "type"));

        var field = new FboField
        {
            Name = Attr(el, "name"),
            AliasName = NullIfEmpty(Attr(el, "aliasName")),
            Header = ReadLocalized(FindChild(el, "header")),
            Footer = footer is null ? null : ReadLocalized(footer),
            IsPrimaryKey = IsTrue(Attr(el, "isPrimaryKey")),
            OnDemand = IsTrue(Attr(el, "onDemand")),
            AllowNulls = !string.Equals(Attr(el, "allowNulls"), "false", StringComparison.OrdinalIgnoreCase),
            DataType = data_type,
            DataTypeEnum = ParseDataType(data_type),
            DataFormatString = NullIfEmpty(Attr(el, "dataFormatString")),
            HyperlinkFormatString = NullIfEmpty(Attr(el, "hyperlinkFormatString")),
            ItemsStyle = items is null ? null : NullIfEmpty(Attr(items, "style")),
            ItemsController = items is null ? null : NullIfEmpty(Attr(items, "controller")),
            ItemsReference = items is null ? null : NullIfEmpty(Attr(items, "reference")),
            ItemsKey = items is null ? null : NullIfEmpty(Attr(items, "key")),
            ItemsCheck = items is null ? null : NullIfEmpty(Attr(items, "check")),
            ItemsInformation = items is null ? null : NullIfEmpty(Attr(items, "information")),
            ItemsNew = items is null ? null : NullIfEmpty(Attr(items, "new")),
            DefaultValue = NullIfEmpty(Attr(el, "defaultValue")),
            ClientDefault = NullIfEmpty(Attr(el, "clientDefault")),
            Align = NullIfEmpty(Attr(el, "align")),
            ReadOnly = IsTrue(Attr(el, "readOnly")),
            Inactivate = IsTrue(Attr(el, "inactivate")),
            Hidden = IsTrue(Attr(el, "hidden")),
            Disabled = IsTrue(Attr(el, "disabled")),
            External = IsTrue(Attr(el, "external")),
            When = IsTrue(Attr(el, "when")),
            Width = int.TryParse(Attr(el, "width"), out var w) ? w : null,
            MaxLength = int.TryParse(Attr(el, "maxLength"), out var ml) ? ml : null,
            Columns = int.TryParse(Attr(el, "columns"), out var cols) ? cols : null,
            Rows = int.TryParse(Attr(el, "rows"), out var rows) ? rows : null,
            CategoryIndex = int.TryParse(Attr(el, "categoryIndex"), out var ci) ? ci : null,
            Aggregate = ParseAggregate(Attr(el, "aggregate")),
            AllowContain = IsTrue(Attr(el, "allowContain")),
            AllowQbe = IsTrue(Attr(el, "allowQBE")),
            AllowSorting = IsTrue(Attr(el, "allowSorting")),
            AllowFilter = IsTrue(Attr(el, "allowFilter")),
            Operation = NullIfEmpty(Attr(el, "operation")),
            FilterSource = NullIfEmpty(Attr(el, "filterSource"))
        };

        if (items is not null)
            field.DropDownItems = ParseDropDownItems(items);

        return field;
    }

    private static List<FboDropDownItem> ParseDropDownItems(XElement items_el)
    {
        return items_el.Elements()
            .Where(e => e.Name.LocalName.Equals("item", StringComparison.OrdinalIgnoreCase))
            .Select(e => new FboDropDownItem
            {
                Value = Attr(e, "value"),
                Text = ReadLocalized(FindChild(e, "text"))
            })
            .Where(i => !string.IsNullOrWhiteSpace(i.Value) || !string.IsNullOrWhiteSpace(i.Text.V))
            .ToList();
    }

    private static Domain.Models.Fbo.Schema.FboDataType? ParseDataType(string? value)
    {
        if (string.IsNullOrWhiteSpace(value)) return null;
        return Enum.TryParse<Domain.Models.Fbo.Schema.FboDataType>(value, ignoreCase: true, out var dt)
            ? dt
            : null;
    }

    private static Domain.Models.Fbo.Schema.FboAggregateType ParseAggregate(string value)
    {
        if (string.IsNullOrWhiteSpace(value)) return Domain.Models.Fbo.Schema.FboAggregateType.None;
        return Enum.TryParse(value, ignoreCase: true, out Domain.Models.Fbo.Schema.FboAggregateType agg)
            ? agg
            : Domain.Models.Fbo.Schema.FboAggregateType.None;
    }

    // ── XML helpers ──────────────────────────────────────────────────

    /// <summary>
    /// Bỏ DOCTYPE/ENTITY (Include) để XDocument đọc được &lt;fields&gt;/&lt;views&gt;.
    /// </summary>
    internal static string SanitizeXml(string xml)
    {
        var result = xml;
        result = Regex.Replace(result, @"<!DOCTYPE[\s\S]*?\[[\s\S]*?\]\s*>", string.Empty, RegexOptions.IgnoreCase);
        result = Regex.Replace(result, @"<!DOCTYPE[^>]*>", string.Empty, RegexOptions.IgnoreCase);
        // Comment không cần cho Fbo* model; bỏ trước khi LoadXml (phòng ClearText cũ từng
        // expand entity vào comment tạo "--" bất hợp lệ — IgnoreComments không cứu được).
        result = Regex.Replace(result, @"<!--[\s\S]*?-->", string.Empty);
        // Entity tùy biến (&ScriptIrregular; ...) → bỏ; giữ &amp; &lt; ...
        result = Regex.Replace(
            result,
            @"&(?!(amp|lt|gt|quot|apos|#\d+|#x[0-9a-fA-F]+);)([A-Za-z_][\w.-]*);",
            string.Empty);
        return result;
    }

    private static XDocument LoadXml(string xml)
    {
        var settings = new XmlReaderSettings
        {
            DtdProcessing = DtdProcessing.Prohibit,
            XmlResolver = null,
            IgnoreComments = true,
            IgnoreWhitespace = true
        };

        using var reader = XmlReader.Create(new StringReader(xml), settings);
        return XDocument.Load(reader);
    }

    private static XElement? FindChild(XElement? parent, string local_name) =>
        parent?.Elements().FirstOrDefault(e =>
            e.Name.LocalName.Equals(local_name, StringComparison.OrdinalIgnoreCase));

    private static LocalizedText ReadLocalized(XElement? el)
    {
        if (el is null) return new LocalizedText();
        return new LocalizedText
        {
            V = Decode(Attr(el, "v")),
            E = Decode(Attr(el, "e"))
        };
    }

    private static string Attr(XElement el, string name) =>
        (string?)el.Attribute(name) ?? string.Empty;

    private static string Decode(string value) =>
        string.IsNullOrEmpty(value) ? value : WebUtility.HtmlDecode(value);

    private static bool IsTrue(string value) =>
        string.Equals(value, "true", StringComparison.OrdinalIgnoreCase)
        || value == "1";

    private static string? NullIfEmpty(string value) =>
        string.IsNullOrWhiteSpace(value) ? null : value;

    private static string ResolveControllerName(string? file_path, XElement root)
    {
        if (!string.IsNullOrWhiteSpace(file_path))
            return Path.GetFileNameWithoutExtension(file_path);

        var table = Attr(root, "table");
        return string.IsNullOrWhiteSpace(table) ? root.Name.LocalName : table;
    }
}
