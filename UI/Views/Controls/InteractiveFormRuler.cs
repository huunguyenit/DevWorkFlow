using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Shapes;
using DevWorkFlow.Application.Engine;
using UI.ViewModels.Design;

namespace UI.Views.Controls;

public enum RulerColumnAction
{
    Insert,
    Delete,
    Split,
    Merge
}

/// <summary>
/// Ruler tương tác: kéo đổi width cột (realtime số px), chọn cột, chuột phải
/// gộp/chia/chèn/xóa. Hover gần vạch | hiện nút (+).
/// </summary>
public class InteractiveFormRuler : FormRuler
{
    public static readonly RoutedEvent ColumnWidthChangedEvent =
        EventManager.RegisterRoutedEvent(
            nameof(ColumnWidthChanged),
            RoutingStrategy.Bubble,
            typeof(ColumnWidthChangedEventHandler),
            typeof(InteractiveFormRuler));

    public event ColumnWidthChangedEventHandler ColumnWidthChanged
    {
        add => AddHandler(ColumnWidthChangedEvent, value);
        remove => RemoveHandler(ColumnWidthChangedEvent, value);
    }

    public static readonly RoutedEvent ColumnActionEvent =
        EventManager.RegisterRoutedEvent(
            nameof(ColumnAction),
            RoutingStrategy.Bubble,
            typeof(RulerColumnActionEventHandler),
            typeof(InteractiveFormRuler));

    public event RulerColumnActionEventHandler ColumnAction
    {
        add => AddHandler(ColumnActionEvent, value);
        remove => RemoveHandler(ColumnActionEvent, value);
    }

    /// <summary>true nếu đây là ruler của tab (category), false nếu vùng trên.</summary>
    public bool IsCategory { get; set; }

    private int _drag_col_index = -1;
    private double _drag_start_x;
    private int _drag_start_px;
    private readonly List<int> _selected = [];
    private int _anchor = -1;
    private int _hover_boundary = -1;

    public InteractiveFormRuler()
    {
        Cursor = Cursors.Arrow;
        Height = 30;
        ToolTip = "Click chọn cột · Shift chọn dải · Kéo vạch | đổi width · Chuột phải: Gộp/Chia";
    }

    private int BoundaryHitIndex(double x)
    {
        if (Ticks is null) return -1;
        var ticks = Ticks.ToList();
        for (var i = 0; i < ticks.Count; i++)
        {
            var edge = ticks[i].OffsetDip + ticks[i].WidthDip;
            if (Math.Abs(x - edge) <= 6) return i;
        }
        // biên trái
        if (ticks.Count > 0 && Math.Abs(x) <= 6) return -2; // sentinel: đầu ruler
        return -1;
    }

    private int ColumnHitIndex(double x)
    {
        if (Ticks is null) return -1;
        var ticks = Ticks.ToList();
        for (var i = 0; i < ticks.Count; i++)
        {
            if (x >= ticks[i].OffsetDip && x < ticks[i].OffsetDip + ticks[i].WidthDip)
                return i;
        }
        return ticks.Count > 0 ? ticks.Count - 1 : -1;
    }

    protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
    {
        base.OnMouseLeftButtonDown(e);
        if (Ticks is null) return;
        var pos = e.GetPosition(this).X;

        // 1) Kéo đổi width nếu bấm trúng biên cột (không phải biên trái)
        var boundary = BoundaryHitIndex(pos);
        if (boundary >= 0)
        {
            var ticks = Ticks.ToList();
            _drag_col_index = boundary;
            _drag_start_x = pos;
            _drag_start_px = ticks[boundary].WidthPx;
            CaptureMouse();
            e.Handled = true;
            return;
        }

        // 2) Chọn cột (Shift = chọn dải, Ctrl = toggle)
        var col = ColumnHitIndex(pos);
        if (col < 0) return;

        if ((Keyboard.Modifiers & ModifierKeys.Shift) == ModifierKeys.Shift && _anchor >= 0)
        {
            _selected.Clear();
            var a = Math.Min(_anchor, col);
            var b = Math.Max(_anchor, col);
            for (var i = a; i <= b; i++) _selected.Add(i);
        }
        else if ((Keyboard.Modifiers & ModifierKeys.Control) == ModifierKeys.Control)
        {
            if (!_selected.Remove(col)) _selected.Add(col);
            _anchor = col;
        }
        else
        {
            _selected.Clear();
            _selected.Add(col);
            _anchor = col;
        }
        Rebuild();
        e.Handled = true;
    }

    protected override void OnMouseMove(MouseEventArgs e)
    {
        base.OnMouseMove(e);
        var pos = e.GetPosition(this).X;

        if (_drag_col_index >= 0 && IsMouseCaptured)
        {
            var delta_dip = pos - _drag_start_x;
            var delta_px = (int)Math.Round(FboLayoutUnits.DipToPx(delta_dip));
            var new_px = Math.Max(8, _drag_start_px + delta_px);
            RaiseEvent(new ColumnWidthChangedEventArgs(ColumnWidthChangedEvent, _drag_col_index, new_px, preview: true));
            return;
        }

        var boundary = BoundaryHitIndex(pos);
        Cursor = boundary != -1 ? Cursors.SizeWE : Cursors.Arrow;
        if (boundary != _hover_boundary)
        {
            _hover_boundary = boundary;
            Rebuild();
        }
    }

    protected override void OnMouseLeave(MouseEventArgs e)
    {
        base.OnMouseLeave(e);
        if (_drag_col_index >= 0) return;
        if (_hover_boundary != -1)
        {
            _hover_boundary = -1;
            Cursor = Cursors.Arrow;
            Rebuild();
        }
    }

    protected override void OnMouseLeftButtonUp(MouseButtonEventArgs e)
    {
        if (_drag_col_index >= 0)
        {
            var delta_dip = e.GetPosition(this).X - _drag_start_x;
            var delta_px = (int)Math.Round(FboLayoutUnits.DipToPx(delta_dip));
            var new_px = Math.Max(8, _drag_start_px + delta_px);
            RaiseEvent(new ColumnWidthChangedEventArgs(ColumnWidthChangedEvent, _drag_col_index, new_px, preview: false));
            _drag_col_index = -1;
            ReleaseMouseCapture();
            e.Handled = true;
        }
        base.OnMouseLeftButtonUp(e);
    }

    protected override void OnMouseRightButtonUp(MouseButtonEventArgs e)
    {
        base.OnMouseRightButtonUp(e);
        if (Ticks is null) return;
        var pos = e.GetPosition(this).X;
        var col = ColumnHitIndex(pos);
        if (col < 0) return;

        if (!_selected.Contains(col))
        {
            _selected.Clear();
            _selected.Add(col);
            _anchor = col;
            Rebuild();
        }

        ShowColumnMenu(col);
        e.Handled = true;
    }

    private void ShowColumnMenu(int col)
    {
        var menu = new ContextMenu();

        if (_selected.Count >= 2)
        {
            var start = _selected.Min();
            var count = _selected.Max() - start + 1;
            var merge = new MenuItem { Header = $"Gộp {_selected.Count} cột đã chọn (→ 1 cột)" };
            merge.Click += (_, _) => RaiseColumnAction(RulerColumnAction.Merge, start, count);
            menu.Items.Add(merge);
            menu.Items.Add(new Separator());
        }

        var split = new MenuItem { Header = $"Chia đôi cột {col + 1} (50% / 50%)" };
        split.Click += (_, _) => RaiseColumnAction(RulerColumnAction.Split, col, 1);
        menu.Items.Add(split);

        menu.Items.Add(new Separator());

        var insert_left = new MenuItem { Header = "Chèn cột bên trái" };
        insert_left.Click += (_, _) => RaiseColumnAction(RulerColumnAction.Insert, col, 1);
        menu.Items.Add(insert_left);

        var insert_right = new MenuItem { Header = "Chèn cột bên phải" };
        insert_right.Click += (_, _) => RaiseColumnAction(RulerColumnAction.Insert, col + 1, 1);
        menu.Items.Add(insert_right);

        menu.Items.Add(new Separator());

        var delete = new MenuItem { Header = $"Xóa cột {col + 1}" };
        delete.Click += (_, _) => RaiseColumnAction(RulerColumnAction.Delete, col, 1);
        menu.Items.Add(delete);

        menu.PlacementTarget = this;
        menu.IsOpen = true;
    }

    private void RaiseColumnAction(RulerColumnAction action, int start, int count)
    {
        _selected.Clear();
        RaiseEvent(new RulerColumnActionEventArgs(ColumnActionEvent, IsCategory, action, start, count));
    }

    protected override void Rebuild()
    {
        base.Rebuild();
        if (Ticks is null) return;
        var ticks = Ticks.ToList();

        // Highlight cột đang chọn
        foreach (var i in _selected)
        {
            if (i < 0 || i >= ticks.Count) continue;
            var hl = new Rectangle
            {
                Width = Math.Max(1, ticks[i].WidthDip),
                Height = 28,
                Fill = new SolidColorBrush(Color.FromArgb(0x55, 0x21, 0x96, 0xF3))
            };
            SetLeft(hl, ticks[i].OffsetDip);
            SetTop(hl, 0);
            Children.Add(hl);
        }

        // Grip kéo width ở mỗi biên phải
        for (var i = 0; i < ticks.Count; i++)
        {
            var edge = ticks[i].OffsetDip + ticks[i].WidthDip;
            var grip = new Rectangle
            {
                Width = 6,
                Height = 28,
                Fill = Brushes.Transparent,
                Cursor = Cursors.SizeWE,
                ToolTip = $"Kéo đổi width cột {i + 1}"
            };
            SetLeft(grip, edge - 3);
            SetTop(grip, 0);
            Children.Add(grip);
        }

        // Chỉ hiện (+) khi trỏ gần vạch |
        if (_hover_boundary == -2)
        {
            AddInsertButton(0, 0);
        }
        else if (_hover_boundary >= 0 && _hover_boundary < ticks.Count)
        {
            var edge = ticks[_hover_boundary].OffsetDip + ticks[_hover_boundary].WidthDip;
            AddInsertButton(edge, _hover_boundary + 1);
        }
    }

    private void AddInsertButton(double x, int at_index)
    {
        var btn = new Border
        {
            Width = 16,
            Height = 16,
            CornerRadius = new CornerRadius(8),
            Background = new SolidColorBrush(Color.FromRgb(0x2E, 0x7D, 0x32)),
            Cursor = Cursors.Hand,
            ToolTip = "Chèn cột tại đây",
            Child = new TextBlock
            {
                Text = "+",
                Foreground = Brushes.White,
                FontSize = 12,
                FontWeight = FontWeights.Bold,
                HorizontalAlignment = HorizontalAlignment.Center,
                VerticalAlignment = VerticalAlignment.Center,
                Margin = new Thickness(0, -2, 0, 0)
            }
        };
        SetLeft(btn, x - 8);
        SetTop(btn, 12);
        btn.MouseLeftButtonUp += (_, e) =>
        {
            e.Handled = true;
            RaiseColumnAction(RulerColumnAction.Insert, at_index, 1);
        };
        Children.Add(btn);
    }
}

public delegate void ColumnWidthChangedEventHandler(object sender, ColumnWidthChangedEventArgs e);

public class ColumnWidthChangedEventArgs : RoutedEventArgs
{
    public ColumnWidthChangedEventArgs(RoutedEvent routed_event, int column_index, int new_width_px, bool preview)
        : base(routed_event)
    {
        ColumnIndex = column_index;
        NewWidthPx = new_width_px;
        IsPreview = preview;
    }

    public int ColumnIndex { get; }
    public int NewWidthPx { get; }
    public bool IsPreview { get; }
}

public delegate void RulerColumnActionEventHandler(object sender, RulerColumnActionEventArgs e);

public class RulerColumnActionEventArgs : RoutedEventArgs
{
    public RulerColumnActionEventArgs(
        RoutedEvent routed_event, bool is_category, RulerColumnAction action, int start, int count)
        : base(routed_event)
    {
        IsCategory = is_category;
        Action = action;
        Start = start;
        Count = count;
    }

    public bool IsCategory { get; }
    public RulerColumnAction Action { get; }
    public int Start { get; }
    public int Count { get; }
}
