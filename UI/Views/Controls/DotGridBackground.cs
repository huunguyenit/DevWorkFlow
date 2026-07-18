using System.Windows;
using System.Windows.Media;

namespace UI.Views.Controls;

/// <summary>Nền lưới chấm (dot grid) kiểu designer — đơn vị px nội dung × Zoom.</summary>
public sealed class DotGridBackground : FrameworkElement
{
    public static readonly DependencyProperty ZoomProperty =
        DependencyProperty.Register(
            nameof(Zoom),
            typeof(double),
            typeof(DotGridBackground),
            new FrameworkPropertyMetadata(1.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty OffsetXProperty =
        DependencyProperty.Register(
            nameof(OffsetX),
            typeof(double),
            typeof(DotGridBackground),
            new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty OffsetYProperty =
        DependencyProperty.Register(
            nameof(OffsetY),
            typeof(double),
            typeof(DotGridBackground),
            new FrameworkPropertyMetadata(0.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty GridSizePxProperty =
        DependencyProperty.Register(
            nameof(GridSizePx),
            typeof(double),
            typeof(DotGridBackground),
            new FrameworkPropertyMetadata(10.0, FrameworkPropertyMetadataOptions.AffectsRender));

    public static readonly DependencyProperty IsGridVisibleProperty =
        DependencyProperty.Register(
            nameof(IsGridVisible),
            typeof(bool),
            typeof(DotGridBackground),
            new FrameworkPropertyMetadata(true, FrameworkPropertyMetadataOptions.AffectsRender));

    private static readonly Brush FillBrush = new SolidColorBrush(Color.FromRgb(0xF0, 0xF0, 0xF0));
    private static readonly Brush DotBrush = new SolidColorBrush(Color.FromRgb(0xC0, 0xC0, 0xC0));
    private static readonly Brush MajorDotBrush = new SolidColorBrush(Color.FromRgb(0xA8, 0xA8, 0xA8));

    static DotGridBackground()
    {
        FillBrush.Freeze();
        DotBrush.Freeze();
        MajorDotBrush.Freeze();
    }

    public double Zoom
    {
        get => (double)GetValue(ZoomProperty);
        set => SetValue(ZoomProperty, value);
    }

    public double OffsetX
    {
        get => (double)GetValue(OffsetXProperty);
        set => SetValue(OffsetXProperty, value);
    }

    public double OffsetY
    {
        get => (double)GetValue(OffsetYProperty);
        set => SetValue(OffsetYProperty, value);
    }

    public double GridSizePx
    {
        get => (double)GetValue(GridSizePxProperty);
        set => SetValue(GridSizePxProperty, value);
    }

    public bool IsGridVisible
    {
        get => (bool)GetValue(IsGridVisibleProperty);
        set => SetValue(IsGridVisibleProperty, value);
    }

    protected override void OnRender(DrawingContext dc)
    {
        var width = ActualWidth;
        var height = ActualHeight;
        if (width <= 0 || height <= 0) return;

        dc.DrawRectangle(FillBrush, null, new Rect(0, 0, width, height));
        if (!IsGridVisible) return;

        var zoom = Zoom <= 0.01 ? 1.0 : Zoom;
        var step = Math.Max(GridSizePx, 4);
        var screen_step = step * zoom;
        // Tránh quá dày khi zoom nhỏ
        while (screen_step < 6)
        {
            step *= 2;
            screen_step = step * zoom;
        }

        var major_every = 5;
        var ox = OffsetX;
        var oy = OffsetY;

        var content_x0 = ox / zoom;
        var content_y0 = oy / zoom;
        var content_x1 = (ox + width) / zoom;
        var content_y1 = (oy + height) / zoom;

        var start_x = Math.Floor(content_x0 / step) * step;
        var start_y = Math.Floor(content_y0 / step) * step;

        for (var x = start_x; x <= content_x1 + step; x += step)
        {
            var sx = x * zoom - ox;
            if (sx < -1 || sx > width + 1) continue;
            var col_idx = (int)Math.Round(x / step);
            for (var y = start_y; y <= content_y1 + step; y += step)
            {
                var sy = y * zoom - oy;
                if (sy < -1 || sy > height + 1) continue;
                var row_idx = (int)Math.Round(y / step);
                var is_major = col_idx % major_every == 0 && row_idx % major_every == 0;
                var r = is_major ? 1.2 : 0.7;
                dc.DrawEllipse(is_major ? MajorDotBrush : DotBrush, null, new Point(sx, sy), r, r);
            }
        }
    }
}
