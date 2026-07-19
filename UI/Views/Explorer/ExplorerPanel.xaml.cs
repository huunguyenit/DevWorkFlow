using System.Windows;
using DevWorkFlow.Tree;
using UI.Tree;
using UI.ViewModels.Explorer;

namespace UI.Views.Explorer;

public partial class ExplorerPanel
{
    public ExplorerPanel()
    {
        InitializeComponent();
        DataContextChanged += (_, _) => SyncActivationDelay();
        Loaded += (_, _) => SyncActivationDelay();
    }

    private void SyncActivationDelay()
    {
        if (DataContext is ProjectExplorerViewModel vm)
            Tree.ActivationDelayMs = vm.ActivationDelayMs;
    }

    private void Tree_NodeActivated(object sender, RoutedEventArgs e)
    {
        if (e is not TreeControlNodeActivatedEventArgs args) return;
        if (DataContext is not ProjectExplorerViewModel vm) return;
        vm.OnTreeNodeActivated(args.Node, args.IsDoubleClick);
    }
}
