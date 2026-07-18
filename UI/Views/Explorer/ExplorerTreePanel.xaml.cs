using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Threading;
using UI.ViewModels.Explorer;

namespace UI.Views.Explorer;

public partial class ExplorerTreePanel : UserControl
{
    private DispatcherTimer? _activation_timer;
    private ExplorerTreeNodeVm? _pending_node;

    public static readonly RoutedEvent NodeActivatedEvent =
        EventManager.RegisterRoutedEvent(
            nameof(NodeActivated),
            RoutingStrategy.Bubble,
            typeof(RoutedEventHandler),
            typeof(ExplorerTreePanel));

    public event RoutedEventHandler NodeActivated
    {
        add => AddHandler(NodeActivatedEvent, value);
        remove => RemoveHandler(NodeActivatedEvent, value);
    }

    public ExplorerTreePanel()
    {
        InitializeComponent();
    }

    private void TreeViewItem_Expanded(object sender, RoutedEventArgs e)
    {
        if (sender is not TreeViewItem { DataContext: ExplorerTreeNodeVm node }) return;
        if (e.OriginalSource is TreeViewItem src && !ReferenceEquals(src, sender))
            return;

        if (node.EnsureChildren is not null && !node.ChildrenLoaded)
            node.EnsureChildren(node);
    }

    private void TreeView_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
    {
        if (e.NewValue is not ExplorerTreeNodeVm node) return;

        _pending_node = node;
        var delay_ms = (DataContext as IExplorerTreeSource)?.ActivationDelayMs ?? 200;
        if (delay_ms <= 0)
        {
            RaiseNodeActivated(node, is_double_click: false);
            return;
        }

        _activation_timer ??= new DispatcherTimer(
            DispatcherPriority.Background,
            Dispatcher)
        {
            Interval = TimeSpan.FromMilliseconds(delay_ms)
        };
        _activation_timer.Interval = TimeSpan.FromMilliseconds(delay_ms);
        _activation_timer.Stop();
        _activation_timer.Tick -= ActivationTimer_Tick;
        _activation_timer.Tick += ActivationTimer_Tick;
        _activation_timer.Start();
    }

    private void ActivationTimer_Tick(object? sender, EventArgs e)
    {
        _activation_timer?.Stop();
        if (_pending_node is null) return;
        RaiseNodeActivated(_pending_node, is_double_click: false);
    }

    private void TreeViewItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (sender is not TreeViewItem { DataContext: ExplorerTreeNodeVm node } item) return;

        var source_item = FindAncestorTreeViewItem(e.OriginalSource as DependencyObject);
        if (source_item is not null && !ReferenceEquals(source_item, item))
            return;
        if (!item.IsSelected) return;

        _activation_timer?.Stop();
        _pending_node = null;
        RaiseNodeActivated(node, is_double_click: true);
        e.Handled = true;
    }

    private void RaiseNodeActivated(ExplorerTreeNodeVm node, bool is_double_click)
    {
        RaiseEvent(new ExplorerTreeNodeActivatedEventArgs(
            NodeActivatedEvent,
            node,
            is_double_click));
    }

    private static TreeViewItem? FindAncestorTreeViewItem(DependencyObject? current)
    {
        while (current is not null)
        {
            if (current is TreeViewItem item)
                return item;
            current = VisualTreeHelper.GetParent(current);
        }

        return null;
    }
}

public sealed class ExplorerTreeNodeActivatedEventArgs : RoutedEventArgs
{
    public ExplorerTreeNodeActivatedEventArgs(
        RoutedEvent routed_event,
        ExplorerTreeNodeVm node,
        bool is_double_click)
        : base(routed_event)
    {
        Node = node;
        IsDoubleClick = is_double_click;
    }

    public ExplorerTreeNodeVm Node { get; }
    public bool IsDoubleClick { get; }
}
