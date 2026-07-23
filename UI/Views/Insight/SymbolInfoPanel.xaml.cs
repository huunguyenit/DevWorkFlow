using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels.Insight;

namespace UI.Views.Insight;

public partial class SymbolInfoPanel : UserControl
{
    public SymbolInfoPanel()
    {
        InitializeComponent();
    }

    private void ReferencesList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (DataContext is not SymbolInfoViewModel vm) return;
        if (sender is not ListBox list) return;
        if (list.SelectedItem is not SymbolReferenceRowVm row) return;
        if (vm.ActivateReferenceCommand.CanExecute(row))
            vm.ActivateReferenceCommand.Execute(row);
    }
}
