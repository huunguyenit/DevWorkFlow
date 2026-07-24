using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using UI.Services;
using UI.ViewModels.Toolbox;

namespace UI.Views.Toolbox;

/// <summary>
/// Nguồn kéo của Designer (P6). WebView2 là HWND riêng nên KHÔNG dùng <c>DragDrop.DoDragDrop</c>: capture chuột
/// tại panel rồi bơm toạ độ màn hình qua <see cref="DesignToolboxDragBroker"/>; ghost + drop target được
/// <c>DesignWebViewHost</c> vẽ bên trong trang. Chỉ control <c>IsEnabled</c> kéo được.
/// </summary>
public partial class ToolboxPanel : UserControl
{
    private const double DragThresholdPx = 4;

    private DesignToolboxDragPayload? _pending;
    private Point _press_point;
    private bool _dragging;

    public ToolboxPanel()
    {
        InitializeComponent();
        Unloaded += (_, _) => CancelDrag();
    }

    private void OnControlItemPressed(object sender, MouseButtonEventArgs e)
    {
        if (sender is not FrameworkElement el || el.DataContext is not ToolboxItemVm item || !item.IsEnabled)
            return;

        // Highlight selection ngay khi click (độc lập với drag broker).
        if (DataContext is ToolboxViewModel vm)
            vm.SelectControl(item);

        _pending = item.IsTab && item.TabKind is { Length: > 0 } tab_kind
            ? DesignToolboxDragPayload.Tab(tab_kind, item.Name)
            : item.ControlKind is { } kind
                ? DesignToolboxDragPayload.NewControl(kind, item.Name)
                : null;
        if (_pending is null) return;

        _press_point = e.GetPosition(this);
        _dragging = false;
        CaptureMouse();
        e.Handled = true;
    }

    private void OnPanelMouseMove(object sender, MouseEventArgs e)
    {
        if (_pending is not { } payload) return;

        var point = e.GetPosition(this);
        if (!_dragging)
        {
            if (Math.Abs(point.X - _press_point.X) + Math.Abs(point.Y - _press_point.Y) < DragThresholdPx)
                return;
            _dragging = true;
            Mouse.OverrideCursor = Cursors.Hand;
            DesignToolboxDragBroker.Current.Start(payload);
        }

        DesignToolboxDragBroker.Current.Move(PointToScreen(point));
    }

    private void OnPanelMouseUp(object sender, MouseButtonEventArgs e)
    {
        if (_pending is null) return;

        var was_dragging = _dragging;
        var screen_point = PointToScreen(e.GetPosition(this));
        ResetDragState();

        if (was_dragging)
            DesignToolboxDragBroker.Current.Drop(screen_point);
        else
            DesignToolboxDragBroker.Current.Cancel();
    }

    private void OnPanelKeyDown(object sender, KeyEventArgs e)
    {
        if (e.Key == Key.Escape && _pending is not null)
        {
            CancelDrag();
            e.Handled = true;
        }
    }

    private void CancelDrag()
    {
        if (_pending is null) return;
        ResetDragState();
        DesignToolboxDragBroker.Current.Cancel();
    }

    private void ResetDragState()
    {
        _pending = null;
        _dragging = false;
        Mouse.OverrideCursor = null;
        if (IsMouseCaptured) ReleaseMouseCapture();
    }
}
