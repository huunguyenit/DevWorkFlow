using System.Collections;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using UI.ViewModels.Design;

namespace UI.Views.Controls;

/// <summary>
/// Viewport Design Surface: thước px, grid, zoom/pan, snap, guideline từ ruler.
/// </summary>
[ContentProperty(nameof(Body))]
public partial class DesignViewport : UserControl
{
    public const double ContentPadding = 32;

    public static readonly DependencyProperty BodyProperty =
        DependencyProperty.Register(nameof(Body), typeof(object), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty ZoomProperty =
        DependencyProperty.Register(nameof(Zoom), typeof(double), typeof(DesignViewport),
            new FrameworkPropertyMetadata(1.0, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault, OnZoomChanged));

    public static readonly DependencyProperty ShowGridProperty =
        DependencyProperty.Register(nameof(ShowGrid), typeof(bool), typeof(DesignViewport), new PropertyMetadata(true));

    public static readonly DependencyProperty GridSizePxProperty =
        DependencyProperty.Register(nameof(GridSizePx), typeof(double), typeof(DesignViewport), new PropertyMetadata(10.0));

    public static readonly DependencyProperty ScrollOffsetXProperty =
        DependencyProperty.Register(nameof(ScrollOffsetX), typeof(double), typeof(DesignViewport),
            new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public static readonly DependencyProperty ScrollOffsetYProperty =
        DependencyProperty.Register(nameof(ScrollOffsetY), typeof(double), typeof(DesignViewport),
            new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public static readonly DependencyProperty ShowGuidelinesProperty =
        DependencyProperty.Register(nameof(ShowGuidelines), typeof(bool), typeof(DesignViewport), new PropertyMetadata(true));

    public static readonly DependencyProperty GuidelinesProperty =
        DependencyProperty.Register(nameof(Guidelines), typeof(IEnumerable), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty ActiveGuideXsProperty =
        DependencyProperty.Register(nameof(ActiveGuideXs), typeof(IEnumerable), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty ActiveGuideYsProperty =
        DependencyProperty.Register(nameof(ActiveGuideYs), typeof(IEnumerable), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty SizeBadgeTextProperty =
        DependencyProperty.Register(nameof(SizeBadgeText), typeof(string), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty MouseMarkerXProperty =
        DependencyProperty.Register(nameof(MouseMarkerX), typeof(double?), typeof(DesignViewport),
            new FrameworkPropertyMetadata(null, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public static readonly DependencyProperty MouseMarkerYProperty =
        DependencyProperty.Register(nameof(MouseMarkerY), typeof(double?), typeof(DesignViewport),
            new FrameworkPropertyMetadata(null, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public static readonly DependencyProperty SelectionMarkerXProperty =
        DependencyProperty.Register(nameof(SelectionMarkerX), typeof(double?), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty SelectionMarkerYProperty =
        DependencyProperty.Register(nameof(SelectionMarkerY), typeof(double?), typeof(DesignViewport), new PropertyMetadata(null));

    public static readonly DependencyProperty SnapEnabledProperty =
        DependencyProperty.Register(nameof(SnapEnabled), typeof(bool), typeof(DesignViewport), new PropertyMetadata(true));

    public static readonly DependencyProperty SnapSizePxProperty =
        DependencyProperty.Register(nameof(SnapSizePx), typeof(double), typeof(DesignViewport), new PropertyMetadata(5.0));

    public static readonly DependencyProperty OriginOffsetXProperty =
        DependencyProperty.Register(nameof(OriginOffsetX), typeof(double), typeof(DesignViewport),
            new FrameworkPropertyMetadata(ContentPadding, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty OriginOffsetYProperty =
        DependencyProperty.Register(nameof(OriginOffsetY), typeof(double), typeof(DesignViewport),
            new FrameworkPropertyMetadata(ContentPadding, FrameworkPropertyMetadataOptions.AffectsRender));

    private readonly ScaleTransform _content_scale = new(1, 1);
    private bool _is_panning;
    private Point _pan_start;
    private double _pan_scroll_x;
    private double _pan_scroll_y;
    private bool _space_down;

    private bool _is_placing_guideline;
    private GuidelineKind _placing_kind;
    private GuidelineVm? _placing_guide;

    public DesignViewport()
    {
        InitializeComponent();
        ScaledCanvas.LayoutTransform = _content_scale;
        Focusable = true;
        Loaded += (_, _) => Focus();
        LayoutUpdated += (_, _) => UpdateFormOrigin();
    }

    public object? Body
    {
        get => GetValue(BodyProperty);
        set => SetValue(BodyProperty, value);
    }

    public double Zoom
    {
        get => (double)GetValue(ZoomProperty);
        set => SetValue(ZoomProperty, value);
    }

    public bool ShowGrid
    {
        get => (bool)GetValue(ShowGridProperty);
        set => SetValue(ShowGridProperty, value);
    }

    public double GridSizePx
    {
        get => (double)GetValue(GridSizePxProperty);
        set => SetValue(GridSizePxProperty, value);
    }

    public double ScrollOffsetX
    {
        get => (double)GetValue(ScrollOffsetXProperty);
        set => SetValue(ScrollOffsetXProperty, value);
    }

    public double ScrollOffsetY
    {
        get => (double)GetValue(ScrollOffsetYProperty);
        set => SetValue(ScrollOffsetYProperty, value);
    }

    public bool ShowGuidelines
    {
        get => (bool)GetValue(ShowGuidelinesProperty);
        set => SetValue(ShowGuidelinesProperty, value);
    }

    public IEnumerable? Guidelines
    {
        get => (IEnumerable?)GetValue(GuidelinesProperty);
        set => SetValue(GuidelinesProperty, value);
    }

    public IEnumerable? ActiveGuideXs
    {
        get => (IEnumerable?)GetValue(ActiveGuideXsProperty);
        set => SetValue(ActiveGuideXsProperty, value);
    }

    public IEnumerable? ActiveGuideYs
    {
        get => (IEnumerable?)GetValue(ActiveGuideYsProperty);
        set => SetValue(ActiveGuideYsProperty, value);
    }

    public string? SizeBadgeText
    {
        get => (string?)GetValue(SizeBadgeTextProperty);
        set => SetValue(SizeBadgeTextProperty, value);
    }

    public double? MouseMarkerX
    {
        get => (double?)GetValue(MouseMarkerXProperty);
        set => SetValue(MouseMarkerXProperty, value);
    }

    public double? MouseMarkerY
    {
        get => (double?)GetValue(MouseMarkerYProperty);
        set => SetValue(MouseMarkerYProperty, value);
    }

    public double? SelectionMarkerX
    {
        get => (double?)GetValue(SelectionMarkerXProperty);
        set => SetValue(SelectionMarkerXProperty, value);
    }

    public double? SelectionMarkerY
    {
        get => (double?)GetValue(SelectionMarkerYProperty);
        set => SetValue(SelectionMarkerYProperty, value);
    }

    public bool SnapEnabled
    {
        get => (bool)GetValue(SnapEnabledProperty);
        set => SetValue(SnapEnabledProperty, value);
    }

    public double SnapSizePx
    {
        get => (double)GetValue(SnapSizePxProperty);
        set => SetValue(SnapSizePxProperty, value);
    }

    /// <summary>Mép trái form trên canvas (DIP) — 0 của thước ngang.</summary>
    public double OriginOffsetX
    {
        get => (double)GetValue(OriginOffsetXProperty);
        set => SetValue(OriginOffsetXProperty, value);
    }

    /// <summary>Mép trên form trên canvas (DIP) — 0 của thước dọc.</summary>
    public double OriginOffsetY
    {
        get => (double)GetValue(OriginOffsetYProperty);
        set => SetValue(OriginOffsetYProperty, value);
    }

    private static void OnZoomChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not DesignViewport vp) return;
        var z = (double)e.NewValue;
        if (z <= 0.01) z = 1;
        vp._content_scale.ScaleX = z;
        vp._content_scale.ScaleY = z;
    }

    private void SurfaceScroll_ScrollChanged(object sender, ScrollChangedEventArgs e)
    {
        ScrollOffsetX = SurfaceScroll.HorizontalOffset;
        ScrollOffsetY = SurfaceScroll.VerticalOffset;
    }

    private void SurfaceScroll_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
    {
        if (Keyboard.Modifiers.HasFlag(ModifierKeys.Control))
        {
            var factor = e.Delta > 0 ? 1.1 : 1.0 / 1.1;
            Zoom = Math.Clamp(Zoom * factor, 0.25, 4.0);
            e.Handled = true;
        }
    }

    private void SurfaceScroll_PreviewMouseDown(object sender, MouseButtonEventArgs e)
    {
        if (e.ChangedButton == MouseButton.Middle
            || (e.ChangedButton == MouseButton.Left && _space_down))
        {
            _is_panning = true;
            _pan_start = e.GetPosition(SurfaceScroll);
            _pan_scroll_x = SurfaceScroll.HorizontalOffset;
            _pan_scroll_y = SurfaceScroll.VerticalOffset;
            SurfaceScroll.CaptureMouse();
            SurfaceScroll.Cursor = Cursors.SizeAll;
            e.Handled = true;
        }
    }

    private void SurfaceScroll_PreviewMouseMove(object sender, MouseEventArgs e)
    {
        UpdateMouseMarkers(e.GetPosition(ScaledCanvas));

        if (_is_placing_guideline && _placing_guide is not null)
        {
            var pos = e.GetPosition(ScaledCanvas);
            var form_x = pos.X - OriginOffsetX;
            var form_y = pos.Y - OriginOffsetY;
            _placing_guide.PositionPx = SnapValue(
                _placing_kind == GuidelineKind.Vertical ? form_x : form_y);
            e.Handled = true;
            return;
        }

        if (!_is_panning) return;
        var pan_pos = e.GetPosition(SurfaceScroll);
        SurfaceScroll.ScrollToHorizontalOffset(_pan_scroll_x - (pan_pos.X - _pan_start.X));
        SurfaceScroll.ScrollToVerticalOffset(_pan_scroll_y - (pan_pos.Y - _pan_start.Y));
        e.Handled = true;
    }

    private void SurfaceScroll_PreviewMouseUp(object sender, MouseButtonEventArgs e)
    {
        if (_is_placing_guideline)
        {
            _is_placing_guideline = false;
            _placing_guide = null;
            ReleaseMouseCapture();
            e.Handled = true;
            return;
        }

        if (!_is_panning) return;
        _is_panning = false;
        SurfaceScroll.ReleaseMouseCapture();
        SurfaceScroll.Cursor = _space_down ? Cursors.Hand : Cursors.Arrow;
        e.Handled = true;
    }

    private void HRuler_GuidelineDragStart(object sender, RoutedEventArgs e) =>
        BeginPlaceGuideline(GuidelineKind.Vertical, HRuler);

    private void VRuler_GuidelineDragStart(object sender, RoutedEventArgs e) =>
        BeginPlaceGuideline(GuidelineKind.Horizontal, VRuler);

    private void BeginPlaceGuideline(GuidelineKind kind, PixelRuler ruler)
    {
        if (Guidelines is not System.Collections.ObjectModel.ObservableCollection<GuidelineVm> list)
            return;

        _placing_kind = kind;
        _is_placing_guideline = true;
        var screen = Mouse.GetPosition(ruler);
        var form_px = SnapValue(ruler.ScreenToFormPx(
            kind == GuidelineKind.Vertical ? screen.X : screen.Y));
        _placing_guide = new GuidelineVm(kind, form_px);
        list.Add(_placing_guide);
        CaptureMouse();
    }

    private double SnapValue(double value)
    {
        if (!SnapEnabled || SnapSizePx <= 0) return value;
        return Math.Round(value / SnapSizePx) * SnapSizePx;
    }

    private void UpdateMouseMarkers(Point scaled_canvas_pos)
    {
        // Marker theo px trên form (0 = mép form)
        MouseMarkerX = scaled_canvas_pos.X - OriginOffsetX;
        MouseMarkerY = scaled_canvas_pos.Y - OriginOffsetY;
    }

    /// <summary>Đo mép form đang visible → gốc thước 0.</summary>
    private void UpdateFormOrigin()
    {
        if (!IsLoaded || BodyPresenter is null || ScaledCanvas is null) return;

        var surface = FindActiveSurface(BodyPresenter);
        double ox = ContentPadding;
        double oy = ContentPadding;
        if (surface is not null)
        {
            try
            {
                var p = surface.TransformToAncestor(ScaledCanvas).Transform(new Point(0, 0));
                ox = p.X;
                oy = p.Y;
            }
            catch
            {
                // visual chưa gắn đủ cây
            }
        }

        if (Math.Abs(OriginOffsetX - ox) > 0.05)
            OriginOffsetX = ox;
        if (Math.Abs(OriginOffsetY - oy) > 0.05)
            OriginOffsetY = oy;
    }

    private static FrameworkElement? FindActiveSurface(DependencyObject root)
    {
        var count = VisualTreeHelper.GetChildrenCount(root);
        for (var i = 0; i < count; i++)
        {
            if (VisualTreeHelper.GetChild(root, i) is not FrameworkElement fe)
                continue;
            if (fe.Visibility != Visibility.Visible || fe.ActualWidth < 1 || fe.ActualHeight < 1)
                continue;

            // Border form/grid/lookup thường là con trực tiếp của Grid Body
            if (fe is Border { ActualWidth: > 1, ActualHeight: > 1 })
                return fe;

            var nested = FindActiveSurface(fe);
            if (nested is not null)
                return nested;
        }
        return null;
    }

    protected override void OnPreviewKeyDown(KeyEventArgs e)
    {
        if (e.Key == Key.Space && !_space_down)
        {
            _space_down = true;
            SurfaceScroll.Cursor = Cursors.Hand;
        }
        else if (e.Key == Key.Escape && _is_placing_guideline && _placing_guide is not null
                 && Guidelines is System.Collections.ObjectModel.ObservableCollection<GuidelineVm> list)
        {
            list.Remove(_placing_guide);
            _is_placing_guideline = false;
            _placing_guide = null;
            ReleaseMouseCapture();
        }
        base.OnPreviewKeyDown(e);
    }

    protected override void OnPreviewKeyUp(KeyEventArgs e)
    {
        if (e.Key == Key.Space)
        {
            _space_down = false;
            if (!_is_panning)
                SurfaceScroll.Cursor = Cursors.Arrow;
        }
        base.OnPreviewKeyUp(e);
    }

    protected override void OnMouseMove(MouseEventArgs e)
    {
        if (_is_placing_guideline)
            SurfaceScroll_PreviewMouseMove(SurfaceScroll, e);
        base.OnMouseMove(e);
    }

    protected override void OnMouseUp(MouseButtonEventArgs e)
    {
        if (_is_placing_guideline)
            SurfaceScroll_PreviewMouseUp(SurfaceScroll, e);
        base.OnMouseUp(e);
    }
}
