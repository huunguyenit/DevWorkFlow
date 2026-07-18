using System.Collections.Specialized;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using UI.ViewModels.Design;

namespace UI.Views.Controls;

/// <summary>
/// Lớp phủ vẽ đường đỏ gạch nối (dashed) theo biên cột, kéo dài hết chiều cao vùng form.
/// Đặt phía sau nội dung để làm lưới canh cột liên tục từ ruler xuống hết form.
/// </summary>
public class ColumnGuides : Canvas
{
    public static readonly DependencyProperty TicksProperty =
        DependencyProperty.Register(
            nameof(Ticks),
            typeof(IEnumerable<RulerTickVm>),
            typeof(ColumnGuides),
            new PropertyMetadata(null, OnTicksChanged));

    /// <summary>Khoảng trống phía trên (dip) — thường = chiều cao ruler để line bắt đầu từ dưới ruler.</summary>
    public static readonly DependencyProperty TopInsetProperty =
        DependencyProperty.Register(
            nameof(TopInset),
            typeof(double),
            typeof(ColumnGuides),
            new PropertyMetadata(0.0, (d, _) =>
            {
                if (d is ColumnGuides g) g.Rebuild();
            }));

    public IEnumerable<RulerTickVm>? Ticks
    {
        get => (IEnumerable<RulerTickVm>?)GetValue(TicksProperty);
        set => SetValue(TicksProperty, value);
    }

    public double TopInset
    {
        get => (double)GetValue(TopInsetProperty);
        set => SetValue(TopInsetProperty, value);
    }

    public ColumnGuides()
    {
        IsHitTestVisible = false;
        ClipToBounds = true;
        Background = Brushes.Transparent;
        // Canvas mặc định measure 0×0 — lắng nghe size để vẽ lại
        SizeChanged += (_, _) => Rebuild();
    }

    private static void OnTicksChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not ColumnGuides guides) return;
        if (e.OldValue is INotifyCollectionChanged old_col)
            old_col.CollectionChanged -= guides.OnCollectionChanged;
        guides.DetachItems(e.OldValue as IEnumerable<RulerTickVm>);
        if (e.NewValue is INotifyCollectionChanged new_col)
            new_col.CollectionChanged += guides.OnCollectionChanged;
        guides.AttachItems(e.NewValue as IEnumerable<RulerTickVm>);
        guides.Rebuild();
    }

    private void OnCollectionChanged(object? sender, NotifyCollectionChangedEventArgs e)
    {
        AttachItems(Ticks);
        Rebuild();
    }

    private void AttachItems(IEnumerable<RulerTickVm>? ticks)
    {
        if (ticks is null) return;
        foreach (var t in ticks)
        {
            t.PropertyChanged -= OnTickChanged;
            t.PropertyChanged += OnTickChanged;
        }
    }

    private void DetachItems(IEnumerable<RulerTickVm>? ticks)
    {
        if (ticks is null) return;
        foreach (var t in ticks)
            t.PropertyChanged -= OnTickChanged;
    }

    private void OnTickChanged(object? sender, PropertyChangedEventArgs e) => Rebuild();

    protected override Size MeasureOverride(Size availableSize)
    {
        // Nhận chiều rộng theo ticks; chiều cao lấy constraint (hoặc 1 để được arrange)
        var width = 0.0;
        if (Ticks is not null)
            foreach (var t in Ticks) width += t.WidthDip;

        var height = double.IsInfinity(availableSize.Height) ? 1 : Math.Max(0, availableSize.Height);
        if (double.IsInfinity(availableSize.Width) && width > 0)
            return new Size(width, height);
        if (!double.IsInfinity(availableSize.Width))
            width = Math.Max(width, availableSize.Width);
        return new Size(width, height);
    }

    protected override Size ArrangeOverride(Size finalSize)
    {
        // Do NOT call Rebuild() here — modifying Children during ArrangeOverride
        // invalidates layout and causes an infinite loop.
        // The SizeChanged handler in the constructor rebuilds after layout completes.
        return base.ArrangeOverride(finalSize);
    }

    private void Rebuild()
    {
        Children.Clear();
        if (Ticks is null) return;

        var ticks = Ticks.ToList();
        if (ticks.Count == 0) return;

        var height = ActualHeight > 1 ? ActualHeight : 1;
        var top = Math.Max(0, TopInset);
        if (top >= height) return;

        var stroke = new SolidColorBrush(Color.FromArgb(0xC0, 0xE5, 0x39, 0x35));

        void AddDashed(double x)
        {
            Children.Add(new Line
            {
                X1 = x, Y1 = top,
                X2 = x, Y2 = height,
                Stroke = stroke,
                StrokeThickness = 1,
                StrokeDashArray = new DoubleCollection { 2, 2 },
                SnapsToDevicePixels = true
            });
        }

        AddDashed(0.5);
        foreach (var tick in ticks)
            AddDashed(tick.OffsetDip + tick.WidthDip - 0.5);
    }
}
