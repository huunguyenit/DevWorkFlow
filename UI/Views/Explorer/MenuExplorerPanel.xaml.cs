using System.Windows;
using UI.Tree;
using UI.ViewModels;

namespace UI.Views.Explorer;

public partial class MenuExplorerPanel
{
    public MenuExplorerPanel()
    {
        InitializeComponent();
        DataContextChanged += (_, _) => SyncDelay();
        Loaded += (_, _) => SyncDelay();
    }

    private void SyncDelay()
    {
        if (DataContext is NavigationViewModel vm)
        {
            Tree.ActivationDelayMs = vm.ActivationDelayMs;
            Tree.CommandProvider = vm.CommandSource;
        }
    }

    private void Tree_NodeActivated(object sender, RoutedEventArgs e)
    {
        if (e is not TreeControlNodeActivatedEventArgs args) return;
        if (DataContext is not NavigationViewModel vm) return;
        vm.OnTreeNodeActivated(args.Node, args.IsDoubleClick);
    }

    private void Tree_NodeExpanding(object sender, RoutedEventArgs e)
    {
        if (e is not TreeControlNodeActivatedEventArgs args) return;
        if (DataContext is not NavigationViewModel vm) return;
        vm.OnTreeNodeExpanding(args.Node);
    }
}
