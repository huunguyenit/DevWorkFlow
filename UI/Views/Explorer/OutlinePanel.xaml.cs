using System.Windows;
using UI.ViewModels.Explorer;

namespace UI.Views.Explorer;

public partial class OutlinePanel
{
    public OutlinePanel() => InitializeComponent();

    private void ExplorerTreePanel_NodeActivated(object sender, RoutedEventArgs e)
    {
        if (e is not ExplorerTreeNodeActivatedEventArgs args) return;
        if (DataContext is not OutlineViewModel vm) return;
        vm.OnTreeNodeActivated(args.Node, args.IsDoubleClick);
    }
}
