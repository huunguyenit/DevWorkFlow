using System.Collections.Specialized;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using UI.ViewModels.Design;

namespace UI.Views.Controls;

/// <summary>
/// Ruler cột Form/Grid/Lookup – nhãn px, vạch đỏ chia cột (theo DIP).
/// </summary>
public class FormRuler : Canvas
{
    public static readonly DependencyProperty TicksProperty =
        DependencyProperty.Register(
            nameof(Ticks),
            typeof(IEnumerable<RulerTickVm>),
            typeof(FormRuler),
            new PropertyMetadata(null, OnTicksChanged));

    public IEnumerable<RulerTickVm>? Ticks
    {
        get => (IEnumerable<RulerTickVm>?)GetValue(TicksProperty);
        set => SetValue(TicksProperty, value);
    }

    public FormRuler()
    {
        Height = 28;
        Background = new SolidColorBrush(Color.FromRgb(0xF0, 0xF0, 0xF0));
        ClipToBounds = true;
    }

    private static void OnTicksChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not FormRuler ruler) return;

        if (e.OldValue is INotifyCollectionChanged old_col)
            old_col.CollectionChanged -= ruler.OnTicksCollectionChanged;
        ruler.DetachTicks(e.OldValue as IEnumerable<RulerTickVm>);

        if (e.NewValue is INotifyCollectionChanged new_col)
            new_col.CollectionChanged += ruler.OnTicksCollectionChanged;
        ruler.AttachTicks(e.NewValue as IEnumerable<RulerTickVm>);

        ruler.Rebuild();
    }

    private void OnTicksCollectionChanged(object? sender, NotifyCollectionChangedEventArgs e)
    {
        AttachTicks(Ticks);
        Rebuild();
    }

    private void AttachTicks(IEnumerable<RulerTickVm>? ticks)
    {
        if (ticks is null) return;
        foreach (var t in ticks)
        {
            t.PropertyChanged -= OnTickPropertyChanged;
            t.PropertyChanged += OnTickPropertyChanged;
        }
    }

    private void DetachTicks(IEnumerable<RulerTickVm>? ticks)
    {
        if (ticks is null) return;
        foreach (var t in ticks)
            t.PropertyChanged -= OnTickPropertyChanged;
    }

    private void OnTickPropertyChanged(object? sender, PropertyChangedEventArgs e) => Rebuild();

    protected override Size MeasureOverride(Size availableSize)
    {
        // Let children measure themselves first (Canvas base always returns 0x0 desired,
        // but we want to report the total tick width so the parent can size us correctly).
        base.MeasureOverride(availableSize);
        if (Ticks is null) return new Size(1, Height);
        var total_dip = Ticks.Sum(t => t.WidthDip);
        return new Size(Math.Max(total_dip, 1), Height);
    }

    protected virtual void Rebuild()
    {
        Children.Clear();
        if (Ticks is null) return;

        var ticks = Ticks.ToList();
        if (ticks.Count == 0) return;

        var total_dip = ticks.Sum(t => t.WidthDip);

        // Invalidate measure so MeasureOverride re-reports the correct width.
        // Do NOT set Width= here; doing so inside a layout callback causes an infinite loop.
        InvalidateMeasure();

        Children.Add(new Line
        {
            X1 = 0, Y1 = 27, X2 = total_dip, Y2 = 27,
            Stroke = new SolidColorBrush(Color.FromRgb(0x90, 0x90, 0x90)),
            StrokeThickness = 1
        });

        AddRedLine(0);

        foreach (var tick in ticks)
        {
            AddRedLine(tick.OffsetDip + tick.WidthDip);

            var label = new TextBlock
            {
                Text = tick.Label,
                FontSize = 10,
                Foreground = new SolidColorBrush(Color.FromRgb(0x33, 0x33, 0x33)),
                FontFamily = new FontFamily("Consolas")
            };
            SetLeft(label, tick.OffsetDip + 2);
            SetTop(label, 4);
            Children.Add(label);
        }
    }

    protected void AddRedLine(double x)
    {
        Children.Add(new Line
        {
            X1 = x, Y1 = 0, X2 = x, Y2 = 28,
            Stroke = Brushes.Red,
            StrokeThickness = 1,
            SnapsToDevicePixels = true
        });
    }
}
