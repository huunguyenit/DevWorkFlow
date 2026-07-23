using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using UI.ViewModels;

namespace UI.Views.Shell;

public partial class BottomToolDockHost : UserControl
{
    public BottomToolDockHost()
    {
        InitializeComponent();
    }

    private void SqlResultGrid_CurrentCellChanged(object? sender, EventArgs e)
    {
        if (sender is not DataGrid grid) return;
        if (grid.DataContext is not SqlDocumentViewModel sql) return;

        var cell = grid.CurrentCell;
        if (cell.Item is null || cell.Column is null)
        {
            sql.NotifyResultCellFocused(0, null, 0);
            return;
        }

        var row_index = grid.Items.IndexOf(cell.Item) + 1;
        var col_index = cell.Column.DisplayIndex + 1;
        var col_name = cell.Column.Header?.ToString();
        sql.NotifyResultCellFocused(row_index, col_name, col_index);
    }
}
