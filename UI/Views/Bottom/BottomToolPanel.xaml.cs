using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels.Bottom;

namespace UI.Views.Bottom;

public partial class BottomToolPanel : UserControl
{
    public BottomToolPanel()
    {
        InitializeComponent();
    }

    private void ItemsList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (DataContext is not BottomPaneVm pane) return;
        if (sender is not ListBox list) return;
        if (list.SelectedItem is not IBottomListItem item) return;
        if (pane.ActivateItemCommand.CanExecute(item))
            pane.ActivateItemCommand.Execute(item);
    }
}
