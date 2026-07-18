using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;

namespace UI.Views.Controls;

/// <summary>
/// Khung chọn: border xanh + 8 handles. Handle Đông kéo span (bubble events).
/// </summary>
public partial class SelectionChrome : UserControl
{
    public static readonly RoutedEvent EastDragStartedEvent =
        EventManager.RegisterRoutedEvent(
            nameof(EastDragStarted), RoutingStrategy.Bubble,
            typeof(DragStartedEventHandler), typeof(SelectionChrome));

    public static readonly RoutedEvent EastDragDeltaEvent =
        EventManager.RegisterRoutedEvent(
            nameof(EastDragDelta), RoutingStrategy.Bubble,
            typeof(DragDeltaEventHandler), typeof(SelectionChrome));

    public static readonly RoutedEvent EastDragCompletedEvent =
        EventManager.RegisterRoutedEvent(
            nameof(EastDragCompleted), RoutingStrategy.Bubble,
            typeof(DragCompletedEventHandler), typeof(SelectionChrome));

    public SelectionChrome() => InitializeComponent();

    public event DragStartedEventHandler EastDragStarted
    {
        add => AddHandler(EastDragStartedEvent, value);
        remove => RemoveHandler(EastDragStartedEvent, value);
    }

    public event DragDeltaEventHandler EastDragDelta
    {
        add => AddHandler(EastDragDeltaEvent, value);
        remove => RemoveHandler(EastDragDeltaEvent, value);
    }

    public event DragCompletedEventHandler EastDragCompleted
    {
        add => AddHandler(EastDragCompletedEvent, value);
        remove => RemoveHandler(EastDragCompletedEvent, value);
    }

    private void East_DragStarted(object sender, DragStartedEventArgs e) =>
        RaiseEvent(new DragStartedEventArgs(e.HorizontalOffset, e.VerticalOffset) { RoutedEvent = EastDragStartedEvent });

    private void East_DragDelta(object sender, DragDeltaEventArgs e) =>
        RaiseEvent(new DragDeltaEventArgs(e.HorizontalChange, e.VerticalChange) { RoutedEvent = EastDragDeltaEvent });

    private void East_DragCompleted(object sender, DragCompletedEventArgs e) =>
        RaiseEvent(new DragCompletedEventArgs(e.HorizontalChange, e.VerticalChange, e.Canceled)
        {
            RoutedEvent = EastDragCompletedEvent
        });
}
