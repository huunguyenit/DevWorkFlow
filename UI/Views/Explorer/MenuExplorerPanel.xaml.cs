using System.Windows;
using UI.ViewModels;
using UI.ViewModels.Explorer;

namespace UI.Views.Explorer;

public partial class MenuExplorerPanel
{
    public MenuExplorerPanel() => InitializeComponent();

    private void ExplorerTreePanel_NodeActivated(object sender, RoutedEventArgs e)
    {
        if (e is not ExplorerTreeNodeActivatedEventArgs args) return;
        if (DataContext is not NavigationViewModel vm) return;
        vm.OnTreeNodeActivated(args.Node, args.IsDoubleClick);
    }
}
