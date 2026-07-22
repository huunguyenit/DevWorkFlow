using System.Text;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Dựng HTML lưới (Grid list hoặc Grid Detail). Cột theo <see cref="FboGridModel.VisibleColumns"/> (đúng thứ
/// tự, bỏ field ẩn); cột index đầu 24px; đúng <paramref name="placeholder_rows"/> dòng "…". Header/body mang
/// data-field-name + data-symbol-id để overlay định danh. Detail mode thêm class DwfDetailGrid, bỏ toolbar.
/// Nút toolbar bất động (render-only).
/// </summary>
internal sealed class DesignGridHtmlBuilder
{
    public string Build(FboGridModel grid, bool vietnamese, int placeholder_rows, bool detail_mode = false)
    {
        var is_detail = detail_mode || grid.IsDetail;
        var columns = grid.VisibleColumns;
        var sb = new StringBuilder(2048);

        if (!is_detail && grid.Toolbar.Count > 0)
        {
            sb.Append("<div class=\"DwfGridToolbar\">");
            foreach (var button in grid.Toolbar)
            {
                if (button.IsSeparator)
                {
                    sb.Append("<span class=\"DwfToolbarSep\"></span>");
                    continue;
                }
                sb.Append("<button type=\"button\" class=\"DwfToolbarButton\" disabled>")
                  .Append(DesignHtmlEncoder.Text(button.Title.Get(vietnamese))).Append("</button>");
            }
            sb.Append("</div>\n");
        }

        sb.Append("<table class=\"").Append(is_detail ? "GridTable DwfDetailGrid" : "GridTable").Append("\">\n");

        // Header: cột index + cột dữ liệu
        sb.Append("<tr class=\"GridHeader\"><th style=\"width:24px\"></th>");
        foreach (var field in columns)
            sb.Append(HeaderCell(field, vietnamese));
        sb.Append("</tr>\n");

        // Body: đúng số dòng placeholder, ô "…"
        for (var r = 0; r < placeholder_rows; r++)
        {
            sb.Append("<tr class=\"GridDataRow\"><td class=\"GridIndexCell\"></td>");
            foreach (var field in columns)
                sb.Append(BodyCell(field));
            sb.Append("</tr>\n");
        }

        sb.Append("</table>");
        return sb.ToString();
    }

    private static string HeaderCell(FboField field, bool vietnamese)
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
        var align = string.IsNullOrEmpty(field.Align)
            ? string.Empty
            : $" style=\"text-align:{field.Align.ToLowerInvariant()}\"";
        return $"<td data-field-name=\"{DesignHtmlEncoder.Attribute(name)}\"{align}>…</td>";
    }
}
