using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels;

namespace UI.Views.Controls;

public partial class NavigationPanel : UserControl
{
    public NavigationPanel()
    {
        InitializeComponent();
    }

    private void MenuTree_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
    {
        if (DataContext is not NavigationViewModel nav_vm) return;
        if (e.NewValue is MenuNodeViewModel node)
            nav_vm.SelectedNode = node;
    }

    private void TreeViewItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (sender is not TreeViewItem { DataContext: MenuNodeViewModel node }) return;
        if (DataContext is not NavigationViewModel nav_vm) return;

        if (node.IsSeparator) return;
        if (node.IsFileNode || node.HasLink)
        {
            nav_vm.OpenNodeCommand.Execute(node);
            e.Handled = true;
        }
    }

    /// <summary>
    /// Chặn TreeView tự BringIntoView theo chiều ngang khi click/expand
    /// (tránh scrollbar nhảy sang phải).
    /// </summary>
    private void MenuTree_RequestBringIntoView(object sender, RequestBringIntoViewEventArgs e)
    {
        e.Handled = true;
    }

    private void TreeViewItem_RequestBringIntoView(object sender, RequestBringIntoViewEventArgs e)
    {
        e.Handled = true;
    }
}
