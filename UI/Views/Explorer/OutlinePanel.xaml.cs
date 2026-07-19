using System.Windows;
using UI.Tree;
using UI.ViewModels.Explorer;

namespace UI.Views.Explorer;

public partial class OutlinePanel
{
    public OutlinePanel()
    {
        InitializeComponent();
        DataContextChanged += (_, _) => SyncDelay();
        Loaded += (_, _) => SyncDelay();
    }

    private void SyncDelay()
    {
        if (DataContext is OutlineViewModel vm)
            Tree.ActivationDelayMs = vm.ActivationDelayMs;
    }

    private void Tree_NodeActivated(object sender, RoutedEventArgs e)
    {
        if (e is not TreeControlNodeActivatedEventArgs args) return;
        if (DataContext is not OutlineViewModel vm) return;
        vm.OnTreeNodeActivated(args.Node, args.IsDoubleClick);
    }
}
