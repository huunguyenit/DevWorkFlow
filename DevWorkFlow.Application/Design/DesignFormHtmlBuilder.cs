using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Dựng thân HTML cho Form (Dir/Filter): bọc <c>FormParent</c> (tương đương runtime
/// <c>updateDlgPanel</c> / <c>UpdateDlgPanel</c>) gồm title (<c>UpdateDlgTitle</c>), vùng main,
/// tabs, footer. Cell input ủy quyền <see cref="DesignControlHtmlBuilder"/>; Grid-style nhúng
/// detail đã render; Footer/Description sanitize allowlist thẻ an toàn.
/// </summary>
internal sealed class DesignFormHtmlBuilder
{
    private static readonly HashSet<string> AllowedFragmentTags =
        new(StringComparer.OrdinalIgnoreCase) { "u", "span", "div", "br" };

    private static readonly Regex TagRegex = new(
        "<(/?)([a-zA-Z][a-zA-Z0-9]*)((?:[^>\"']|\"[^\"]*\"|'[^']*')*)>",
        RegexOptions.Compiled);

    private static readonly Regex ClassAttrRegex = new(
        "class\\s*=\\s*(\"[^\"]*\"|'[^']*')",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private readonly DesignControlHtmlBuilder _control = new();
    private readonly DesignGridHtmlBuilder _grid = new();

    public string Build(
        FboFormModel form,
        bool vietnamese,
        FboOptionsCatalog options,
        IReadOnlyDictionary<string, DesignElementIdentity> identities,
        IReadOnlyDictionary<string, FboControllerDocument> detail_documents,
        int grid_placeholder_rows = 5,
        DesignImageBundle? images = null,
        IReadOnlySet<string>? css_toolbar_classes = null,
        DesignToolbarBundle? toolbar_bundle = null)
    {
        _ = images;
        _ = css_toolbar_classes;
        var layout = form.Layout;
        if (layout is null) return string.Empty;

        var sb = new StringBuilder(4096);
        var ctx = new RenderContext(
            form, vietnamese, options, identities, detail_documents, grid_placeholder_rows,
            toolbar_bundle);

        // FormParent ≡ runtime updateDlgPanel / UpdateDlgPanel — bọc title + toàn bộ form/tab/footer.
        sb.Append("<div class=\"FormParent UpdateDlgPanel\" data-dwf-region=\"form-parent\">\n");
        sb.Append(RenderTitle(form, vietnamese));

        // Vùng chính — KHÔNG đặt view@height (runtime FBO co theo nội dung; height thuộc tab non-grid).
        sb.Append("<div class=\"FormRegion\" data-dwf-region=\"main\">\n");
        sb.Append(RenderTable(
            layout.TopRows, layout.ColumnWidths, ctx, MainRegionId,
            split: layout.Split, anchor: layout.Anchor, allow_spare: true));
        sb.Append("\n</div>\n");

        // Tabs — chỉ index &gt; 0, thứ tự khai báo categories/category.
        if (layout.HasTabCategories)
        {
            sb.Append("<div class=\"DwfTabs\">\n<div class=\"DwfTabList\" role=\"tablist\">\n");
            var first = true;
            foreach (var cat in layout.TabCategories)
            {
                sb.Append("<button type=\"button\" class=\"DwfTabButton\" role=\"tab\" aria-selected=\"")
                  .Append(first ? "true" : "false").Append("\" data-target=\"dwf-tab-").Append(cat.Index)
                  .Append("\">").Append(DesignHtmlEncoder.Text(cat.GetHeader(vietnamese))).Append("</button>\n");
                first = false;
            }
            sb.Append("</div>\n");

            first = true;
            foreach (var cat in layout.TabCategories)
            {
                var widths = cat.ColumnWidths.Count > 0 ? cat.ColumnWidths : layout.ColumnWidths;
                // view@height chỉ áp cho tab KHÔNG chứa Grid; tab có Grid dùng field@rows trên DwfGridBody.
                var tab_height = !CategoryHasGrid(cat, form) && layout.HeightPx is { } th and > 0
                    ? $" style=\"height:{th}px\""
                    : string.Empty;
                // Tab Normal (không seed Grid/Post/List) được spare row visible → luôn có ô thả.
                var normal_tab = !CategoryHasSpecialSeed(cat, form);
                sb.Append("<section id=\"dwf-tab-").Append(cat.Index).Append("\" class=\"DwfTabPanel")
                  .Append(first ? " DwfActive" : string.Empty).Append("\" role=\"tabpanel\" data-category-index=\"")
                  .Append(cat.Index).Append('"').Append(tab_height).Append(">\n")
                  .Append(RenderTable(cat.Rows, widths, ctx, CategoryRegionId(cat.Index), allow_spare: normal_tab))
                  .Append("\n</section>\n");
                first = false;
            }
            sb.Append("</div>\n");
        }

        // Vùng footer — bọc UpdateDlgContent (padding 8px + viền), khớp runtime.
        if (layout.BottomRows.Count > 0)
        {
            sb.Append("<div class=\"FormRegion\" data-dwf-region=\"footer\">\n");
            sb.Append("<div class=\"UpdateDlgContent\">\n");
            sb.Append(RenderTable(
                layout.BottomRows, layout.FooterColumnWidths, ctx, FooterRegionId,
                table_padding: false, allow_spare: true));
            sb.Append("\n</div>\n</div>\n");
        }

        sb.Append("</div>\n"); // FormParent
        return sb.ToString();
    }

    /// <summary>Thanh title ≡ <c>updateDlgTitle</c>: luôn «Thêm » + <c>&lt;title v/e&gt;</c>.</summary>
    private static string RenderTitle(FboFormModel form, bool vietnamese)
    {
        var title = DesignHtmlEncoder.Text("Thêm " + form.Title.Get(vietnamese));
        return "<div class=\"UpdateDlgTitle\" data-dwf-region=\"title\">\n"
               + "<div class=\"UpdateDlgTitleText\" unselectable=\"on\">"
               + title
               + "</div>\n</div>\n";
    }

    private string RenderTable(
        IReadOnlyList<FormViewRow> rows,
        IReadOnlyList<int> widths,
        RenderContext ctx,
        string region_id,
        bool table_padding = true,
        int? split = null,
        int? anchor = null,
        bool allow_spare = false)
    {
        // Vùng rỗng vẫn render nếu được phép spare (tab Normal mới thêm phải có ô thả).
        if (rows.Count == 0 && !allow_spare) return string.Empty;
        if (widths.Count == 0 && rows.Count == 0) return string.Empty;

        var sb = new StringBuilder();
        // split/anchor (1-based) chỉ gắn ở bảng main để Blueprint vẽ line chia + icon neo (đọc, không sửa DOM).
        var meta = (split is { } s ? $" data-dwf-split=\"{s}\"" : string.Empty)
                   + (anchor is { } a ? $" data-dwf-anchor=\"{a}\"" : string.Empty);
        var table_attrs = (widths.Count > 0
            ? $" data-dwf-region-table=\"{region_id}\" data-dwf-col-widths=\"{string.Join(",", widths)}\""
            : $" data-dwf-region-table=\"{region_id}\"") + meta;

        if (widths.Count > 0)
        {
            // Footer: padding ở UpdateDlgContent; main/tab: padding 8px trên table (theo quyết định Design).
            var sum = widths.Sum();
            var pad = table_padding ? ";padding:8px" : string.Empty;
            sb.Append($"<table class=\"FormTable\" style=\"width:{sum}px;table-layout:fixed{pad}\"{table_attrs}>\n");
            sb.Append("<tr class=\"DwfColRow\" aria-hidden=\"true\">");
            foreach (var w in widths)
                sb.Append($"<th style=\"width:{w}px\"></th>");
            sb.Append("</tr>\n");
        }
        else
        {
            sb.Append($"<table class=\"FormTable\"{table_attrs}>\n");
        }

        // 4b.1: hàng hidden-only không emit (giữ nguyên trong model/XML); giữ row_index theo model để slot map đúng.
        for (var row_index = 0; row_index < rows.Count; row_index++)
        {
            if (IsHiddenOnlyRow(rows[row_index], ctx.Form)) continue;
            sb.Append("<tr class=\"FormRow\">");
            foreach (var cell in rows[row_index].Cells)
                sb.Append(RenderCell(cell, ctx, region_id, row_index));
            sb.Append("</tr>\n");
        }

        // 4b.2: spare row render-side — đúng một hàng cuối visible toàn Empty (không đụng model → không duplicate).
        if (allow_spare && widths.Count > 0 && !LastVisibleRowAllEmpty(rows, ctx.Form))
            sb.Append(RenderSpareRow(region_id, rows.Count, widths.Count));

        sb.Append("</table>");
        return sb.ToString();
    }

    private const string MainRegionId = "main";
    private const string FooterRegionId = "footer";

    private static string CategoryRegionId(int index) => $"cat:{index}";

    /// <summary>
    /// Định danh Slot cho Blueprint hit-test: <c>{region}:{row}:{col}:{span}</c> — khớp
    /// <c>LayoutRegionId</c>/<c>LayoutSlotId</c> phía Application (không dùng offset px).
    /// </summary>
    private static string SlotAttr(string region_id, int row_index, FormViewCell cell) =>
        $" data-dwf-slot=\"{region_id}:{row_index}:{cell.ColumnIndex}:{Math.Max(cell.ColumnSpan, 1)}\"";

    /// <summary>Cell hidden ⇔ có control (Kind != Empty) và field.Hidden. Ô Empty KHÔNG tính hidden.</summary>
    private static bool IsCellHidden(FormViewCell cell, FboFormModel form) =>
        cell.Kind != FormViewCellKind.Empty
        && cell.FieldName is { } name
        && form.FindField(name)?.Hidden == true;

    /// <summary>Hàng hidden-only: có ≥1 ô hidden và KHÔNG ô control visible nào (ô Empty được phép).</summary>
    private static bool IsHiddenOnlyRow(FormViewRow row, FboFormModel form)
    {
        var any_hidden = false;
        foreach (var cell in row.Cells)
        {
            if (cell.Kind == FormViewCellKind.Empty) continue;
            if (IsCellHidden(cell, form)) any_hidden = true;
            else return false; // control visible → hàng hỗn hợp, không phải hidden-only
        }
        return any_hidden;
    }

    /// <summary>Hàng visible cuối cùng có phải toàn ô Empty (spare) không — bỏ qua hàng hidden-only.</summary>
    private static bool LastVisibleRowAllEmpty(IReadOnlyList<FormViewRow> rows, FboFormModel form)
    {
        for (var i = rows.Count - 1; i >= 0; i--)
        {
            if (IsHiddenOnlyRow(rows[i], form)) continue;
            return rows[i].Cells.All(c => c.Kind == FormViewCellKind.Empty);
        }
        return false; // không có hàng visible → cần spare
    }

    private static string RenderSpareRow(string region_id, int row_index, int column_count)
    {
        var sb = new StringBuilder();
        sb.Append("<tr class=\"FormRow DwfSpareRow\">");
        for (var col = 0; col < column_count; col++)
            sb.Append($"<td class=\"FormCell DwfEmptyCell\" data-dwf-slot=\"{region_id}:{row_index}:{col}:1\" nowrap"
                      + " style=\"overflow:hidden;width:100%;padding:4px!important;\"></td>");
        sb.Append("</tr>\n");
        return sb.ToString();
    }

    private string RenderCell(FormViewCell cell, RenderContext ctx, string region_id, int row_index)
    {
        var span = Math.Max(cell.ColumnSpan, 1);

        // Ô hidden trong hàng hỗn hợp: giữ cột nhưng KHÔNG là drop target (không data-dwf-slot), không hiện control.
        if (IsCellHidden(cell, ctx.Form))
            return $"<td class=\"FormCell DwfHiddenCell\" colspan=\"{span}\" nowrap"
                   + " style=\"overflow:hidden;width:100%;padding:4px!important;\"></td>";

        var slot = SlotAttr(region_id, row_index, cell);
        var field = cell.FieldName is null ? null : ctx.Form.FindField(cell.FieldName);

        switch (cell.Kind)
        {
            case FormViewCellKind.Empty:
                return $"<td class=\"FormCell DwfEmptyCell\" colspan=\"{span}\"{slot} nowrap"
                       + " style=\"overflow:hidden;width:100%;padding:4px!important;\"></td>";

            case FormViewCellKind.Label:
                var label = field is null
                    ? string.Empty
                    : SanitizeFragment(WebUtility.HtmlDecode(field.Header.Get(ctx.Vietnamese)));
                var req = field?.IsRequired == true ? " FormRequiredLabel" : string.Empty;
                // Runtime: max-height:13px chỉ inline trên FormContainer của header/label, không trong class CSS.
                // Header có thể chứa HTML an toàn (vd. span.LabelDescription) — decode entity rồi sanitize.
                return $"<td class=\"FormCell FormLabel{req}\" colspan=\"{span}\"{slot} nowrap"
                       + " style=\"overflow:hidden;width:100%;padding:4px!important;\">"
                       + "<div class=\"FormContainer\" style=\"width:100%;max-height:13px;overflow:hidden;vertical-align:middle;\">"
                       + label
                       + "</div></td>";

            case FormViewCellKind.Description:
                return $"<td class=\"FormCell FormDescription\" colspan=\"{span}\"{slot} nowrap"
                       + " style=\"overflow:hidden;width:100%;padding:4px!important;\">"
                       + RenderDescription(field, ctx.Vietnamese) + "</td>";

            case FormViewCellKind.Input:
                return RenderInputCell(field, span, slot, ctx);

            default:
                return $"<td class=\"FormCell\" colspan=\"{span}\"{slot}></td>";
        }
    }

    private string RenderInputCell(FboField? field, int span, string slot, RenderContext ctx)
    {
        if (field is null)
            return $"<td class=\"FormCell\" colspan=\"{span}\"{slot} nowrap"
                   + " style=\"overflow:hidden;width:100%;padding:4px!important;\"></td>";

        var required = field.IsRequired ? " Required" : string.Empty;
        var cell_open = $"<td class=\"FormCell{required}\" colspan=\"{span}\"{slot} nowrap"
                        + " style=\"overflow:hidden;width:100%;padding:4px!important;\">";

        // Field kiểu Grid → nhúng Grid Detail (cấu trúc ERP GridTabPanel), chiều cao theo field@rows.
        if (string.Equals(field.ItemsStyle, "Grid", StringComparison.OrdinalIgnoreCase))
        {
            var controller = field.ItemsController ?? string.Empty;
            var cell_open_grid = $"<td class=\"FormCellGrid\" colspan=\"{span}\"{slot} nowrap"
                                 + " style=\"overflow:hidden;width:100%;padding:0px!important;\">"
                                 + "<div tabindex=\"-1\" tabstop=\"false\" style=\"outline:none;\">";

            if (!ctx.DetailDocuments.TryGetValue(controller, out var detail_doc)
                || detail_doc.Grid is null)
            {
                var warning = $"<div class=\"DwfDesignWarning\">Không tìm thấy Grid Detail: {DesignHtmlEncoder.Text(controller)}</div>";
                return $"{cell_open_grid}{warning}</div></td>";
            }

            var grid_html = _grid.Build(
                detail_doc.Grid,
                ctx.Vietnamese,
                ctx.GridPlaceholderRows,
                detail_mode: true,
                embedded_in_form: true,
                body_height_px: field.Rows,
                toolbar_bundle: ctx.ToolbarBundle);

            return $"{cell_open_grid}{grid_html}</div></td>";
        }

        ctx.Identities.TryGetValue(field.Name, out var identity);
        var control = _control.Build(field, ctx.Vietnamese, ctx.Options, identity);
        // Input: KHÔNG max-height (khác label). Class chỉ border-bottom; width/overflow là inline.
        var container_class = field.Rows is > 1
            ? "FormContainer FormContainerInput FormContainerTextArea"
            : "FormContainer FormContainerInput";
        return $"{cell_open}<div class=\"{container_class}\" style=\"width:100%;overflow:hidden;vertical-align:middle;\">{control}</div></td>";
    }

    /// <summary>Tab có chứa field Grid-style không (quyết định dùng field@rows thay view@height).</summary>
    private static bool CategoryHasGrid(FormCategory cat, FboFormModel form)
    {
        foreach (var row in cat.Rows)
        foreach (var cell in row.Cells)
        {
            if (cell.Kind != FormViewCellKind.Input || cell.FieldName is null) continue;
            var field = form.FindField(cell.FieldName);
            if (field is not null
                && string.Equals(field.ItemsStyle, "Grid", StringComparison.OrdinalIgnoreCase))
                return true;
        }
        return false;
    }

    /// <summary>Category có seed đặc biệt (Grid/Post/List) → không ép spare form row (khác tab Normal).</summary>
    private static bool CategoryHasSpecialSeed(FormCategory cat, FboFormModel form)
    {
        foreach (var row in cat.Rows)
        foreach (var cell in row.Cells)
        {
            if (cell.Kind == FormViewCellKind.Empty || cell.FieldName is null) continue;
            var style = form.FindField(cell.FieldName)?.ItemsStyle;
            if (style is not null
                && (style.Equals("Grid", StringComparison.OrdinalIgnoreCase)
                    || style.Equals("Post", StringComparison.OrdinalIgnoreCase)
                    || style.Equals("List", StringComparison.OrdinalIgnoreCase)))
                return true;
        }
        return false;
    }

    private static string RenderDescription(FboField? field, bool vietnamese)
    {
        if (field is null) return string.Empty;
        // .Description hiển thị footer nếu có; không có footer → fallback header (có thể chứa HTML).
        var raw = field.Footer is not null
            ? field.Footer.Get(vietnamese)
            : field.Header.Get(vietnamese);
        return SanitizeFragment(WebUtility.HtmlDecode(raw));
    }

    /// <summary>Giữ thẻ u/span/div/br (chỉ attr class); mọi thẻ/attr khác encode thành text — tránh chèn
    /// script/handler controller vào WebView. Gọi kèm <see cref="WebUtility.HtmlDecode"/> nếu nguồn còn entity.</summary>
    internal static string SanitizeFragment(string html)
    {
        if (string.IsNullOrEmpty(html)) return string.Empty;

        return TagRegex.Replace(html, match =>
        {
            var closing = match.Groups[1].Value == "/";
            var tag = match.Groups[2].Value.ToLowerInvariant();
            if (!AllowedFragmentTags.Contains(tag))
                return WebUtility.HtmlEncode(match.Value);

            if (closing) return $"</{tag}>";

            var class_match = ClassAttrRegex.Match(match.Groups[3].Value);
            var class_attr = class_match.Success ? $" class={class_match.Groups[1].Value}" : string.Empty;
            return $"<{tag}{class_attr}>";
        });
    }

    private sealed record RenderContext(
        FboFormModel Form,
        bool Vietnamese,
        FboOptionsCatalog Options,
        IReadOnlyDictionary<string, DesignElementIdentity> Identities,
        IReadOnlyDictionary<string, FboControllerDocument> DetailDocuments,
        int GridPlaceholderRows,
        DesignToolbarBundle? ToolbarBundle);
}
