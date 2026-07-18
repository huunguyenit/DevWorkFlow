using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels;
using UI.ViewModels.Bottom;

namespace UI.Views.Bottom;

public partial class ProblemsPanel : UserControl
{
    public ProblemsPanel()
    {
        InitializeComponent();
    }

    private void ProblemsGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (sender is not DataGrid grid
            || grid.SelectedItem is not ProblemItemVm problem
            || DataContext is not IdeDiagnosticsViewModel)
            return;

        var window = System.Windows.Window.GetWindow(this);
        if (window?.DataContext is not MainViewModel main_vm)
            return;

        if (problem.Line > 0)
            main_vm.FormBuilderVm.NavigateToLine(problem.Line);
    }
}
