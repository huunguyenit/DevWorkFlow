using System.Text;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Dựng HTML lưới (Grid list hoặc Grid Detail nhúng Form). Cột theo
/// <see cref="FboGridModel.VisibleColumns"/> (đúng thứ tự, bỏ field@hidden); cột index đầu 24px.
/// Toolbar: class = command hoặc Text{command} khi title có $$width; nhãn Toolbar.* từ catalog.
/// </summary>
internal sealed class DesignGridHtmlBuilder
{
    public string Build(
        FboGridModel grid,
        bool vietnamese,
        int placeholder_rows,
        bool detail_mode = false,
        bool embedded_in_form = false,
        int? body_height_px = null,
        DesignImageBundle? images = null,
        IReadOnlySet<string>? css_toolbar_classes = null,
        DesignToolbarBundle? toolbar_bundle = null)
    {
        _ = images;
        _ = css_toolbar_classes;

        if (embedded_in_form)
            return BuildFormEmbeddedGrid(grid, vietnamese, placeholder_rows, body_height_px, toolbar_bundle);

        var is_detail = detail_mode || grid.IsDetail;
        if (is_detail)
            return BuildSimpleDetailTable(grid, vietnamese, placeholder_rows);

        return BuildListGrid(grid, vietnamese, placeholder_rows, toolbar_bundle);
    }

    private string BuildFormEmbeddedGrid(
        FboGridModel grid,
        bool vietnamese,
        int placeholder_rows,
        int? body_height_px,
        DesignToolbarBundle? toolbar_bundle)
    {
        var columns = grid.VisibleColumns;
        var sb = new StringBuilder(4096);

        sb.Append("<div class=\"GridTabPanel\" style=\"width:100%\">\n<div>\n");

        if (grid.Toolbar.Count > 0)
            sb.Append(RenderErpToolbar(grid.Toolbar, vietnamese, toolbar_bundle));

        sb.Append("<div class=\"HeaderStyle\" tabindex=\"-1\" tabstop=\"false\" style=\"overflow:hidden;outline:none;\">\n");
        sb.Append("<table cellpadding=\"0\" cellspacing=\"0\" style=\"position:relative;\"><tbody><tr><td>\n");
        sb.Append("<table class=\"GridTable\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\n");
        sb.Append("<tr class=\"GridHeader\" style=\"height:30px;\">");
        sb.Append(IndexHeaderCell());
        foreach (var field in columns)
            sb.Append(HeaderCell(field, vietnamese));
        sb.Append("</tr>\n</tbody></table>\n</td></tr></tbody></table>\n</div>\n");

        var grid_height = body_height_px is > 0 ? body_height_px.Value : 184;
        sb.Append("<div class=\"divGrid GridStyle\" tabindex=\"-1\" tabstop=\"false\"")
          .Append(" style=\"overflow:auto;position:relative;height:")
          .Append(grid_height)
          .Append("px;outline:none;\">\n");
        sb.Append("<table class=\"GridTable\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\n");
        for (var r = 0; r < placeholder_rows; r++)
        {
            sb.Append("<tr class=\"GridDataRow\">");
            sb.Append("<td class=\"IndexCellBody GridIndexCell\"><div style=\"width:24px;height:17px;\"></div></td>");
            foreach (var field in columns)
                sb.Append(BodyCell(field));
            sb.Append("</tr>\n");
        }
        sb.Append("</tbody></table>\n</div>\n");

        sb.Append("<div class=\"SplitStyle\" tabindex=\"-1\" tabstop=\"false\" style=\"height:8px;outline:none;\"></div>\n");

        sb.Append("<div class=\"FooterStyle\" tabindex=\"-1\" tabstop=\"false\" style=\"overflow-y:hidden;height:22px;outline:none;\">\n");
        sb.Append("<table class=\"GridTable\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\n");
        sb.Append("<tr class=\"GridFooter\">");
        sb.Append("<td class=\"IndexCellFooter\" style=\"width:24px;\"><div style=\"width:24px;height:17px;\"></div></td>");
        foreach (var field in columns)
            sb.Append(FooterCell(field));
        sb.Append("<td style=\"visibility:hidden\"><div style=\"width:17px\"></div></td>");
        sb.Append("</tr>\n</tbody></table>\n</div>\n");

        sb.Append("</div>\n</div>");
        return sb.ToString();
    }

    private static string BuildListGrid(
        FboGridModel grid,
        bool vietnamese,
        int placeholder_rows,
        DesignToolbarBundle? toolbar_bundle)
    {
        var columns = grid.VisibleColumns;
        var sb = new StringBuilder(2048);

        if (grid.Toolbar.Count > 0)
            sb.Append(RenderErpToolbar(grid.Toolbar, vietnamese, toolbar_bundle));

        sb.Append("<table class=\"GridTable\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\n");
        sb.Append("<tr class=\"GridHeader\">");
        sb.Append(IndexHeaderCell());
        foreach (var field in columns)
            sb.Append(HeaderCell(field, vietnamese));
        sb.Append("</tr>\n");

        for (var r = 0; r < placeholder_rows; r++)
        {
            sb.Append("<tr class=\"GridDataRow\">");
            sb.Append("<td class=\"IndexCellBody GridIndexCell\"></td>");
            foreach (var field in columns)
                sb.Append(BodyCell(field));
            sb.Append("</tr>\n");
        }

        sb.Append("</tbody></table>");
        return sb.ToString();
    }

    private static string BuildSimpleDetailTable(FboGridModel grid, bool vietnamese, int placeholder_rows)
    {
        var columns = grid.VisibleColumns;
        var sb = new StringBuilder(1024);
        sb.Append("<table class=\"GridTable DwfDetailGrid\" cellpadding=\"0\" cellspacing=\"0\"><tbody>\n");
        sb.Append("<tr class=\"GridHeader\"><th style=\"width:24px\"></th>");
        foreach (var field in columns)
            sb.Append(SimpleHeaderCell(field, vietnamese));
        sb.Append("</tr>\n");

        for (var r = 0; r < placeholder_rows; r++)
        {
            sb.Append("<tr class=\"GridDataRow\"><td class=\"GridIndexCell\"></td>");
            foreach (var field in columns)
                sb.Append(BodyCell(field));
            sb.Append("</tr>\n");
        }

        sb.Append("</tbody></table>");
        return sb.ToString();
    }

    private static string RenderErpToolbar(
        IReadOnlyList<GridToolbarButton> toolbar,
        bool vietnamese,
        DesignToolbarBundle? toolbar_bundle)
    {
        var sb = new StringBuilder(512);
        sb.Append("<div class=\"ToolbarStyle Green\" tabindex=\"-1\" tabstop=\"false\"")
          .Append(" style=\"overflow:hidden;display:inline-block;height:26px;width:100%;vertical-align:middle;padding-top:2px;outline:none;\">\n");
        sb.Append("<table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr nowrap=\"\">\n");
        sb.Append("<td nowrap=\"\" width=\"1\">&nbsp;</td>\n");

        foreach (var button in toolbar)
        {
            if (button.IsSeparator)
            {
                sb.Append("<td nowrap=\"\" width=\"1\">&nbsp;</td>\n");
                continue;
            }

            sb.Append(RenderToolbarButton(button, vietnamese, toolbar_bundle));
            sb.Append("<td nowrap=\"\" width=\"1\">&nbsp;</td>\n");
        }

        sb.Append("</tr></tbody></table>\n</div>\n");
        return sb.ToString();
    }

    private static string RenderToolbarButton(
        GridToolbarButton button,
        bool vietnamese,
        DesignToolbarBundle? toolbar_bundle)
    {
        var info = DesignToolbarTitleResolver.Resolve(button, vietnamese, toolbar_bundle);
        var title = DesignHtmlEncoder.Attribute(info.Tooltip);

        // Khớp ERP:
        // - group + text: TextGroupX ToolbarTextButton → <span class="ToolbarGroupSpan">text</span>
        // - group no text: GroupX, width 30px, rỗng
        // - thường + text: TextX ToolbarTextButton + text
        // - thường no text: X, 22px
        string td_style;
        string div_classes;
        string div_style;
        string inner;

        if (info.HasMenuItems && info.ShowLabel)
        {
            td_style = string.Empty;
            div_classes = $"ToolbarBackgroundImage {info.CssClass} ToolbarTextButton";
            div_style = info.HasFixedWidth
                ? $"height:22px;border-width:0px;max-width:{info.WidthPx}px;"
                : "height:22px;border-width:0px;";
            inner = $"<span class=\"ToolbarGroupSpan\">{DesignHtmlEncoder.Text(info.DisplayText)}</span>";
        }
        else if (info.HasMenuItems)
        {
            td_style = " style=\"width:30px;\"";
            div_classes = $"ToolbarBackgroundImage {info.CssClass}";
            div_style = "height:22px;width:30px;border-width:0px;";
            inner = string.Empty;
        }
        else if (info.ShowLabel)
        {
            td_style = string.Empty;
            div_classes = $"ToolbarBackgroundImage {info.CssClass} ToolbarTextButton ToolbarWidthButton";
            div_style = info.HasFixedWidth
                ? $"height:22px;border-width:0px;width:{info.WidthPx}px;max-width:{info.WidthPx}px;"
                : "height:22px;border-width:0px;";
            inner = DesignHtmlEncoder.Text(info.DisplayText);
        }
        else
        {
            td_style = string.Empty;
            div_classes = $"ToolbarBackgroundImage {info.CssClass} ToolbarTextButton";
            div_style = "height:22px;border-width:0px;max-width:22px;width:22px;";
            inner = string.Empty;
        }

        var sb = new StringBuilder();
        sb.Append("<td nowrap=\"\"")
          .Append(td_style)
          .Append("><div class=\"")
          .Append(div_classes)
          .Append("\" style=\"")
          .Append(div_style)
          .Append("\" title=\"")
          .Append(title)
          .Append("\">")
          .Append(inner)
          .Append("</div>");

        if (info.HasMenuItems)
            sb.Append(RenderToolbarMenu(button.MenuItems, vietnamese));

        sb.Append("</td>\n");
        return sb.ToString();
    }

    /// <summary>Dropdown tĩnh (Design render-only) — không gắn handler.</summary>
    private static string RenderToolbarMenu(IReadOnlyList<GridToolbarMenuItem> items, bool vietnamese)
    {
        var sb = new StringBuilder();
        sb.Append("<ul class=\"ToolbarGroupMenu\" role=\"menu\">");
        foreach (var item in items)
        {
            if (item.IsSeparator)
            {
                sb.Append("<li class=\"ToolbarGroupMenuSep\" role=\"separator\"></li>");
                continue;
            }

            var header = DesignHtmlEncoder.Text(item.Header.Get(vietnamese));
            var arg = DesignHtmlEncoder.Attribute(item.CommandArgument);
            sb.Append("<li class=\"ToolbarGroupMenuItem\" role=\"menuitem\" data-command-argument=\"")
              .Append(arg)
              .Append("\">")
              .Append(header)
              .Append("</li>");
        }

        sb.Append("</ul>");
        return sb.ToString();
    }

    private static string IndexHeaderCell() =>
        "<td class=\"IndexCellHeader\" style=\"width:24px;\"><div style=\"width:24px;height:21px;\"></div></td>";

    private static string HeaderCell(FboField field, bool vietnamese)
    {
        var name = field.Name.Split('%')[0];
        var width = field.Width is > 0 ? field.Width!.Value : 120;
        var req = field.IsRequired ? " Required" : string.Empty;
        var align = string.IsNullOrEmpty(field.Align) ? "center" : field.Align.ToLowerInvariant();
        var header_text = DesignHtmlEncoder.Text(field.Header.Get(vietnamese));

        return $"<td nowrap=\"\" class=\"HeaderCellDefault{req}\""
               + $" style=\"overflow:hidden;width:{width}px;\""
               + $" data-field-name=\"{DesignHtmlEncoder.Attribute(name)}\""
               + $" data-symbol-id=\"field:{DesignHtmlEncoder.Attribute(field.Name)}\">"
               + $"<div align=\"{align}\" class=\"HeaderCellContainer\""
               + $" style=\"display:inline-block;overflow:hidden;width:{width}px;vertical-align:middle;\">"
               + header_text
               + "</div></td>";
    }

    private static string SimpleHeaderCell(FboField field, bool vietnamese)
    {
        var name = field.Name.Split('%')[0];
        var style = $"width:{(field.Width is > 0 ? field.Width!.Value : 120)}px";
        if (!string.IsNullOrEmpty(field.Align))
            style += $";text-align:{field.Align.ToLowerInvariant()}";

        return $"<th style=\"{style}\" data-field-name=\"{DesignHtmlEncoder.Attribute(name)}\""
               + $" data-symbol-id=\"field:{DesignHtmlEncoder.Attribute(field.Name)}\">"
               + $"{DesignHtmlEncoder.Text(field.Header.Get(vietnamese))}</th>";
    }

    private static string BodyCell(FboField field)
    {
        var name = field.Name.Split('%')[0];
        var width = field.Width is > 0 ? field.Width!.Value : 120;
        var align = string.IsNullOrEmpty(field.Align)
            ? string.Empty
            : $"text-align:{field.Align.ToLowerInvariant()};";
        return $"<td class=\"CellDefault\" data-field-name=\"{DesignHtmlEncoder.Attribute(name)}\""
               + $" style=\"overflow:hidden;width:{width}px;{align}\">…</td>";
    }

    private static string FooterCell(FboField field)
    {
        var width = field.Width is > 0 ? field.Width!.Value : 120;
        return $"<td nowrap=\"\" class=\"FooterCellDefault\" style=\"overflow:hidden;width:{width}px;\">"
               + $"<div align=\"right\" class=\"FooterCellContainer\""
               + $" style=\"display:inline-block;overflow:hidden;width:{width}px;vertical-align:middle;height:17px;\"></div></td>";
    }
}
