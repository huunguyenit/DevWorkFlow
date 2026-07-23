using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Dựng lại <c>FormViewRow.Pattern</c> từ danh sách <c>Cells</c> theo quy tắc FBO:
/// <c>1</c> = ô bắt đầu, <c>0</c> = cột nối tiếp, <c>-</c> = cột trống (không control).
/// Ô Empty span 1 ghi <c>-</c>; Empty span &gt; 1 vẫn cần <c>1</c>+<c>0…</c> để giữ số cột khi parse lại.
/// Cột không ô nào phủ → <c>-</c>.
/// </summary>
public static class ViewRowPatternBuilder
{
    public static void Rebuild(FormViewRow row, int column_count)
    {
        if (column_count <= 0)
        {
            row.Pattern = string.Empty;
            return;
        }

        var chars = new char[column_count];
        Array.Fill(chars, '-');

        foreach (var cell in row.Cells)
        {
            var start = cell.ColumnIndex;
            var span = Math.Max(cell.ColumnSpan, 1);
            if (start < 0 || start >= column_count) continue;

            if (cell.Kind == FormViewCellKind.Empty && span == 1)
            {
                chars[start] = '-';
                continue;
            }

            chars[start] = '1';
            for (var i = 1; i < span && start + i < column_count; i++)
                chars[start + i] = '0';
        }

        row.Pattern = new string(chars);
    }
}
