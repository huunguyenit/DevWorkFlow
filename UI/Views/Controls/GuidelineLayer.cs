using System.Collections.Specialized;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;
using UI.ViewModels.Design;

namespace UI.Views.Controls;

/// <summary>Vẽ guideline người dùng + alignment guides tạm (Figma-style).</summary>
public sealed class GuidelineLayer : Canvas
{
    public static readonly DependencyProperty GuidelinesProperty =
        DependencyProperty.Register(
            nameof(Guidelines),
            typeof(IEnumerable<GuidelineVm>),
            typeof(GuidelineLayer),
            new PropertyMetadata(null, OnGuidelinesChanged));

    public static readonly DependencyProperty ActiveGuideXsProperty =
        DependencyProperty.Register(
            nameof(ActiveGuideXs),
            typeof(IEnumerable<double>),
            typeof(GuidelineLayer),
            new PropertyMetadata(null, (_, __) => { /* rebuilt via collection */ }));

    public static readonly DependencyProperty ActiveGuideYsProperty =
        DependencyProperty.Register(
            nameof(ActiveGuideYs),
            typeof(IEnumerable<double>),
            typeof(GuidelineLayer),
            new PropertyMetadata(null));

    public static readonly DependencyProperty ShowGuidelinesProperty =
        DependencyProperty.Register(
            nameof(ShowGuidelines),
            typeof(bool),
            typeof(GuidelineLayer),
            new PropertyMetadata(true, (d, _) => ((GuidelineLayer)d).Rebuild()));

    public static readonly DependencyProperty SizeBadgeTextProperty =
        DependencyProperty.Register(
            nameof(SizeBadgeText),
            typeof(string),
            typeof(GuidelineLayer),
            new PropertyMetadata(null, (d, _) => ((GuidelineLayer)d).Rebuild()));

    public static readonly DependencyProperty CanvasPaddingXProperty =
        DependencyProperty.Register(
            nameof(CanvasPaddingX),
            typeof(double),
            typeof(GuidelineLayer),
            new PropertyMetadata(32.0, (d, _) => ((GuidelineLayer)d).Rebuild()));

    public static readonly DependencyProperty CanvasPaddingYProperty =
        DependencyProperty.Register(
            nameof(CanvasPaddingY),
            typeof(double),
            typeof(GuidelineLayer),
            new PropertyMetadata(32.0, (d, _) => ((GuidelineLayer)d).Rebuild()));

    private INotifyCollectionChanged? _guidelines_notify;
    private INotifyCollectionChanged? _xs_notify;
    private INotifyCollectionChanged? _ys_notify;
    private bool _rebuilding;

    private static readonly Brush GuideBrush = CreateBrush(0xE0, 0x00, 0xB8, 0xD4);
    private static readonly Brush ActiveBrush = CreateBrush(0xE0, 0xE9, 0x1E, 0x63);
    private static readonly Pen GuidePen = CreatePen(GuideBrush, 1, [4, 3]);
    private static readonly Pen ActivePen = CreatePen(ActiveBrush, 1, [3, 2]);

    public GuidelineLayer()
    {
        IsHitTestVisible = false;
        ClipToBounds = false;
        Background = Brushes.Transparent;
        SizeChanged += (_, _) => Rebuild();
    }

    public IEnumerable<GuidelineVm>? Guidelines
    {
        get => (IEnumerable<GuidelineVm>?)GetValue(GuidelinesProperty);
        set => SetValue(GuidelinesProperty, value);
    }

    public IEnumerable<double>? ActiveGuideXs
    {
        get => (IEnumerable<double>?)GetValue(ActiveGuideXsProperty);
        set => SetValue(ActiveGuideXsProperty, value);
    }

    public IEnumerable<double>? ActiveGuideYs
    {
        get => (IEnumerable<double>?)GetValue(ActiveGuideYsProperty);
        set => SetValue(ActiveGuideYsProperty, value);
    }

    public bool ShowGuidelines
    {
        get => (bool)GetValue(ShowGuidelinesProperty);
        set => SetValue(ShowGuidelinesProperty, value);
    }

    public string? SizeBadgeText
    {
        get => (string?)GetValue(SizeBadgeTextProperty);
        set => SetValue(SizeBadgeTextProperty, value);
    }

    public double CanvasPaddingX
    {
        get => (double)GetValue(CanvasPaddingXProperty);
        set => SetValue(CanvasPaddingXProperty, value);
    }

    public double CanvasPaddingY
    {
        get => (double)GetValue(CanvasPaddingYProperty);
        set => SetValue(CanvasPaddingYProperty, value);
    }

    private static void OnGuidelinesChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        var layer = (GuidelineLayer)d;
        layer.DetachNotify(ref layer._guidelines_notify, layer.OnAnyCollectionChanged);
        if (e.NewValue is INotifyCollectionChanged n)
        {
            layer._guidelines_notify = n;
            n.CollectionChanged += layer.OnAnyCollectionChanged;
            if (e.NewValue is IEnumerable<GuidelineVm> list)
            {
                foreach (var g in list)
                {
                    g.PropertyChanged -= layer.OnGuideProp;
                    g.PropertyChanged += layer.OnGuideProp;
                }
            }
        }
        layer.Rebuild();
    }

    protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
    {
        base.OnPropertyChanged(e);
        if (e.Property == ActiveGuideXsProperty)
        {
            DetachNotify(ref _xs_notify, OnAnyCollectionChanged);
            if (e.NewValue is INotifyCollectionChanged n)
            {
                _xs_notify = n;
                n.CollectionChanged += OnAnyCollectionChanged;
            }
            Rebuild();
        }
        else if (e.Property == ActiveGuideYsProperty)
        {
            DetachNotify(ref _ys_notify, OnAnyCollectionChanged);
            if (e.NewValue is INotifyCollectionChanged n)
            {
                _ys_notify = n;
                n.CollectionChanged += OnAnyCollectionChanged;
            }
            Rebuild();
        }
    }

    private void OnGuideProp(object? sender, PropertyChangedEventArgs e) => Rebuild();
    private void OnAnyCollectionChanged(object? sender, NotifyCollectionChangedEventArgs e) => Rebuild();

    private void DetachNotify(ref INotifyCollectionChanged? field, NotifyCollectionChangedEventHandler handler)
    {
        if (field is null) return;
        field.CollectionChanged -= handler;
        field = null;
    }

    private void Rebuild()
    {
        if (_rebuilding) return;
        _rebuilding = true;
        try
        {
        Children.Clear();
        var pad_x = CanvasPaddingX;
        var pad_y = CanvasPaddingY;
        var w = Math.Max(ActualWidth, 1600);
        var h = Math.Max(ActualHeight, 1200);

        if (ShowGuidelines && Guidelines is not null)
        {
            foreach (var g in Guidelines)
            {
                if (g.IsVertical)
                {
                    var x = pad_x + g.PositionPx;
                    Children.Add(MakeLine(x, 0, x, h, GuidePen));
                }
                else
                {
                    var y = pad_y + g.PositionPx;
                    Children.Add(MakeLine(0, y, w, y, GuidePen));
                }
            }
        }

        if (ActiveGuideXs is not null)
        {
            foreach (var gx in ActiveGuideXs)
            {
                var x = pad_x + gx;
                Children.Add(MakeLine(x, 0, x, h, ActivePen));
            }
        }

        if (ActiveGuideYs is not null)
        {
            foreach (var gy in ActiveGuideYs)
            {
                var y = pad_y + gy;
                Children.Add(MakeLine(0, y, w, y, ActivePen));
            }
        }

        if (!string.IsNullOrWhiteSpace(SizeBadgeText) && ActiveGuideXs is not null)
        {
            var edge = ActiveGuideXs.LastOrDefault();
            var badge = new Border
            {
                Background = new SolidColorBrush(Color.FromRgb(0x15, 0x65, 0xC0)),
                CornerRadius = new CornerRadius(2),
                Padding = new Thickness(6, 2, 6, 2),
                Child = new TextBlock
                {
                    Text = SizeBadgeText,
                    Foreground = Brushes.White,
                    FontSize = 11,
                    FontWeight = FontWeights.SemiBold
                }
            };
            SetLeft(badge, pad_x + edge + 6);
            SetTop(badge, pad_y + 8);
            Children.Add(badge);
        }
        }
        finally
        {
            _rebuilding = false;
        }
    }

    private static Line MakeLine(double x1, double y1, double x2, double y2, Pen pen) =>
        new()
        {
            X1 = x1, Y1 = y1, X2 = x2, Y2 = y2,
            Stroke = pen.Brush,
            StrokeThickness = pen.Thickness,
            StrokeDashArray = pen.DashStyle.Dashes,
            SnapsToDevicePixels = true
        };

    private static Brush CreateBrush(byte a, byte r, byte g, byte b)
    {
        var brush = new SolidColorBrush(Color.FromArgb(a, r, g, b));
        brush.Freeze();
        return brush;
    }

    private static Pen CreatePen(Brush brush, double thickness, double[] dashes)
    {
        var pen = new Pen(brush, thickness)
        {
            DashStyle = new DashStyle(dashes, 0)
        };
        pen.Freeze();
        return pen;
    }
}
