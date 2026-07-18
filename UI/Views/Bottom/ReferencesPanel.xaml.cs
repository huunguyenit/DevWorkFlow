using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels;
using UI.ViewModels.Bottom;

namespace UI.Views.Bottom;

public partial class ReferencesPanel : UserControl
{
    public ReferencesPanel()
    {
        InitializeComponent();
    }

    private void ReferencesList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (sender is not ListBox list
            || list.SelectedItem is not ReferenceItemVm reference
            || DataContext is not IdeDiagnosticsViewModel)
            return;

        var window = System.Windows.Window.GetWindow(this);
        if (window?.DataContext is not MainViewModel main_vm)
            return;

        if (reference.Line > 0)
            main_vm.FormBuilderVm.NavigateToLine(reference.Line);
    }
}
