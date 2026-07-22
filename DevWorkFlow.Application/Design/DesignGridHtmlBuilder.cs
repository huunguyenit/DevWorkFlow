using System.Text;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Dựng HTML lưới (Grid list hoặc Grid Detail nhúng Form). Cột theo
/// <see cref="FboGridModel.VisibleColumns"/> (đúng thứ tự, bỏ field@hidden); cột index đầu 24px.
/// Grid nhúng Form: cấu trúc ERP (GridTabPanel → ToolbarStyle → HeaderStyle → divGrid → FooterStyle).
/// Toolbar: class = command (Insert/Grow/…); ảnh lấy từ CSS class — không gắn base64 inline.
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
        IReadOnlySet<string>? css_toolbar_classes = null)
    {
        // images giữ tham số tương thích gọi cũ; toolbar luôn dùng class CSS, không gắn data-URI.
        _ = images;
        _ = css_toolbar_classes;

        if (embedded_in_form)
            return BuildFormEmbeddedGrid(grid, vietnamese, placeholder_rows, body_height_px);

        var is_detail = detail_mode || grid.IsDetail;
        if (is_detail)
            return BuildSimpleDetailTable(grid, vietnamese, placeholder_rows);

        return BuildListGrid(grid, vietnamese, placeholder_rows);
    }

    private string BuildFormEmbeddedGrid(
        FboGridModel grid,
        bool vietnamese,
        int placeholder_rows,
        int? body_height_px)
    {
        var columns = grid.VisibleColumns;
        var sb = new StringBuilder(4096);

        sb.Append("<div class=\"GridTabPanel\" style=\"width:100%\">\n<div>\n");

        if (grid.Toolbar.Count > 0)
            sb.Append(RenderErpToolbar(grid.Toolbar, vietnamese));

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
        int placeholder_rows)
    {
        var columns = grid.VisibleColumns;
        var sb = new StringBuilder(2048);

        if (grid.Toolbar.Count > 0)
            sb.Append(RenderErpToolbar(grid.Toolbar, vietnamese));

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
        bool vietnamese)
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

            sb.Append(RenderToolbarButton(button, vietnamese));
            sb.Append("<td nowrap=\"\" width=\"1\">&nbsp;</td>\n");
        }

        sb.Append("</tr></tbody></table>\n</div>\n");
        return sb.ToString();
    }

    private static string RenderToolbarButton(GridToolbarButton button, bool vietnamese)
    {
        var command = button.Command;
        var css_class = DesignToolbarImageMap.ToolbarDivClass(command);
        var title = DesignHtmlEncoder.Attribute(button.Title.Get(vietnamese));
        var shows_label = DesignToolbarImageMap.ToolbarShowsLabel(command);
        var label = shows_label ? DesignHtmlEncoder.Text(button.Title.Get(vietnamese)) : string.Empty;
        var width_class = shows_label ? " ToolbarWidthButton" : string.Empty;
        var style = shows_label
            ? "height:22px;border-width:0px;"
            : "height:22px;border-width:0px;max-width:22px;width:22px;";

        // Ảnh từ CSS class (Config/image hoặc Program/Images) — không gắn base64 inline.
        return $"<td nowrap=\"\"><div class=\"ToolbarBackgroundImage {css_class} ToolbarTextButton{width_class}\""
               + $" style=\"{style}\" title=\"{title}\">{label}</div></td>\n";
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
