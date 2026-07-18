using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace UI.Views.Controls;

/// <summary>
/// Thước pixel kiểu VS/WinForms Designer.
/// OriginOffset = mép form trên canvas (0 của thước = mép form).
/// MouseMarker / SelectionMarker tính theo toạ độ form (px).
/// </summary>
public sealed class PixelRuler : FrameworkElement
{
    public static readonly DependencyProperty OrientationProperty =
        DependencyProperty.Register(
            nameof(Orientation), typeof(Orientation), typeof(PixelRuler),
            new FrameworkPropertyMetadata(Orientation.Horizontal, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty ZoomProperty =
        DependencyProperty.Register(
            nameof(Zoom), typeof(double), typeof(PixelRuler),
            new FrameworkPropertyMetadata(1.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty OffsetProperty =
        DependencyProperty.Register(
            nameof(Offset), typeof(double), typeof(PixelRuler),
            new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsRender));

    /// <summary>Vị trí mép form trên canvas (DIP, trước zoom). 0 thước = điểm này.</summary>
    public static readonly DependencyProperty OriginOffsetProperty =
        DependencyProperty.Register(
            nameof(OriginOffset), typeof(double), typeof(PixelRuler),
            new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty MajorStepProperty =
        DependencyProperty.Register(
            nameof(MajorStep), typeof(double), typeof(PixelRuler),
            new FrameworkPropertyMetadata(100.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty MinorStepProperty =
        DependencyProperty.Register(
            nameof(MinorStep), typeof(double), typeof(PixelRuler),
            new FrameworkPropertyMetadata(10.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty MouseMarkerProperty =
        DependencyProperty.Register(
            nameof(MouseMarker), typeof(double?), typeof(PixelRuler),
            new FrameworkPropertyMetadata(null, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty SelectionMarkerProperty =
        DependencyProperty.Register(
            nameof(SelectionMarker), typeof(double?), typeof(PixelRuler),
            new FrameworkPropertyMetadata(null, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly RoutedEvent GuidelineDragStartEvent =
        EventManager.RegisterRoutedEvent(
            nameof(GuidelineDragStart), RoutingStrategy.Bubble,
            typeof(RoutedEventHandler), typeof(PixelRuler));

    private static readonly Brush BgBrush = new SolidColorBrush(Color.FromRgb(0xF3, 0xF3, 0xF3));
    private static readonly Pen MajorPen = new(new SolidColorBrush(Color.FromRgb(0x60, 0x60, 0x60)), 1);
    private static readonly Pen MinorPen = new(new SolidColorBrush(Color.FromRgb(0xA0, 0xA0, 0xA0)), 1);
    private static readonly Pen MousePen = new(new SolidColorBrush(Color.FromRgb(0xE5, 0x39, 0x35)), 1);
    private static readonly Pen SelectionPen = new(new SolidColorBrush(Color.FromRgb(0x15, 0x65, 0xC0)), 2);
    private static readonly Typeface Typeface = new("Segoe UI");

    static PixelRuler()
    {
        BgBrush.Freeze();
        MajorPen.Freeze();
        MinorPen.Freeze();
        MousePen.Freeze();
        SelectionPen.Freeze();
    }

    public PixelRuler()
    {
        Cursor = Cursors.SizeAll;
        ToolTip = "0 = mép form · kéo vào canvas để tạo guideline";
    }

    public Orientation Orientation
    {
        get => (Orientation)GetValue(OrientationProperty);
        set => SetValue(OrientationProperty, value);
    }

    public double Zoom
    {
        get => (double)GetValue(ZoomProperty);
        set => SetValue(ZoomProperty, value);
    }

    public double Offset
    {
        get => (double)GetValue(OffsetProperty);
        set => SetValue(OffsetProperty, value);
    }

    public double OriginOffset
    {
        get => (double)GetValue(OriginOffsetProperty);
        set => SetValue(OriginOffsetProperty, value);
    }

    public double MajorStep
    {
        get => (double)GetValue(MajorStepProperty);
        set => SetValue(MajorStepProperty, value);
    }

    public double MinorStep
    {
        get => (double)GetValue(MinorStepProperty);
        set => SetValue(MinorStepProperty, value);
    }

    public double? MouseMarker
    {
        get => (double?)GetValue(MouseMarkerProperty);
        set => SetValue(MouseMarkerProperty, value);
    }

    public double? SelectionMarker
    {
        get => (double?)GetValue(SelectionMarkerProperty);
        set => SetValue(SelectionMarkerProperty, value);
    }

    public event RoutedEventHandler GuidelineDragStart
    {
        add => AddHandler(GuidelineDragStartEvent, value);
        remove => RemoveHandler(GuidelineDragStartEvent, value);
    }

    /// <summary>Toạ độ trên thước (màn hình) → px trên form (0 = mép form).</summary>
    public double ScreenToFormPx(double screen_pos)
    {
        var zoom = Zoom <= 0.01 ? 1.0 : Zoom;
        return (screen_pos + Offset) / zoom - OriginOffset;
    }

    protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
    {
        RaiseEvent(new RoutedEventArgs(GuidelineDragStartEvent, this));
        e.Handled = true;
        base.OnMouseLeftButtonDown(e);
    }

    protected override void OnRender(DrawingContext dc)
    {
        var width = ActualWidth;
        var height = ActualHeight;
        if (width <= 0 || height <= 0) return;

        dc.DrawRectangle(BgBrush, null, new Rect(0, 0, width, height));
        var dpi = GetPixelsPerDip();

        var zoom = Zoom <= 0.01 ? 1.0 : Zoom;
        var minor = Math.Max(MinorStep, 1);
        var major = Math.Max(MajorStep, minor);
        var scroll = Offset;
        var origin = OriginOffset;

        while (minor * zoom < 6)
            minor *= 2;
        while (major < minor * 5)
            major *= 2;

        if (Orientation == Orientation.Horizontal)
        {
            // Phạm vi nhìn thấy theo px form (0 = mép form)
            var form_start = scroll / zoom - origin;
            var form_end = (scroll + width) / zoom - origin;
            var first = Math.Floor(form_start / minor) * minor;
            for (var form_px = first; form_px <= form_end + minor; form_px += minor)
            {
                var x = (origin + form_px) * zoom - scroll;
                if (x < -1 || x > width + 1) continue;
                var is_major = IsMajorTick(form_px, major);
                var tick_h = is_major ? height : height * 0.45;
                dc.DrawLine(is_major ? MajorPen : MinorPen,
                    new Point(x, height - tick_h), new Point(x, height));
                if (is_major)
                {
                    var text = CreateText(FormatLabel(form_px), dpi);
                    text.MaxTextWidth = 48;
                    dc.DrawText(text, new Point(x + 2, 1));
                }
            }

            DrawMarker(dc, SelectionMarker, origin, zoom, scroll, width, height, true, SelectionPen);
            DrawMarker(dc, MouseMarker, origin, zoom, scroll, width, height, true, MousePen);
        }
        else
        {
            var form_start = scroll / zoom - origin;
            var form_end = (scroll + height) / zoom - origin;
            var first = Math.Floor(form_start / minor) * minor;
            for (var form_px = first; form_px <= form_end + minor; form_px += minor)
            {
                var y = (origin + form_px) * zoom - scroll;
                if (y < -1 || y > height + 1) continue;
                var is_major = IsMajorTick(form_px, major);
                var tick_w = is_major ? width : width * 0.45;
                dc.DrawLine(is_major ? MajorPen : MinorPen,
                    new Point(width - tick_w, y), new Point(width, y));
                if (is_major)
                {
                    var text = CreateText(FormatLabel(form_px), dpi);
                    dc.PushTransform(new RotateTransform(-90, 2, y + 2));
                    dc.DrawText(text, new Point(2, y + 2));
                    dc.Pop();
                }
            }

            DrawMarker(dc, SelectionMarker, origin, zoom, scroll, width, height, false, SelectionPen);
            DrawMarker(dc, MouseMarker, origin, zoom, scroll, width, height, false, MousePen);
        }
    }

    private static bool IsMajorTick(double form_px, double major)
    {
        var m = form_px % major;
        return Math.Abs(m) < 0.001 || Math.Abs(m - major) < 0.001 || Math.Abs(m + major) < 0.001;
    }

    private static void DrawMarker(
        DrawingContext dc, double? form_px, double origin, double zoom, double scroll,
        double width, double height, bool is_horizontal, Pen pen)
    {
        if (form_px is not { } px) return;
        if (is_horizontal)
        {
            var x = (origin + px) * zoom - scroll;
            if (x < -1 || x > width + 1) return;
            dc.DrawLine(pen, new Point(x, 0), new Point(x, height));
        }
        else
        {
            var y = (origin + px) * zoom - scroll;
            if (y < -1 || y > height + 1) return;
            dc.DrawLine(pen, new Point(0, y), new Point(width, y));
        }
    }

    private static string FormatLabel(double px) => ((int)Math.Round(px)).ToString();

    private FormattedText CreateText(string text, double pixels_per_dip) =>
        new(text, System.Globalization.CultureInfo.InvariantCulture,
            FlowDirection.LeftToRight, Typeface, 9,
            new SolidColorBrush(Color.FromRgb(0x50, 0x50, 0x50)),
            pixels_per_dip);

    private double GetPixelsPerDip()
    {
        try { return VisualTreeHelper.GetDpi(this).PixelsPerDip; }
        catch { return 1.0; }
    }
}
