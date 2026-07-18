using System.Collections.ObjectModel;
using UI.ViewModels.Base;

namespace UI.ViewModels.Design;

/// <summary>
/// Design Surface canvas: zoom, grid, snap, guidelines, alignment guides tạm.
/// </summary>
public sealed class DesignViewportVm : ViewModelBase
{
    public const double MinZoom = 0.25;
    public const double MaxZoom = 4.0;

    private static readonly double[] ZoomSteps =
    [
        0.25, 0.33, 0.50, 0.67, 0.75, 1.0, 1.25, 1.5, 2.0, 3.0, 4.0
    ];

    public static IReadOnlyList<int> SnapSizeOptions { get; } = [2, 4, 5, 8, 10];

    private double _zoom = 1.0;
    private bool _show_grid = true;
    private int _grid_size_px = 10;
    private bool _snap_enabled = true;
    private int _snap_size_px = 5;
    private bool _show_guidelines = true;
    private double _scroll_offset_x;
    private double _scroll_offset_y;
    private double? _mouse_content_x;
    private double? _mouse_content_y;
    private double? _selection_marker_x;
    private double? _selection_marker_y;
    private string? _size_badge_text;
    private bool _is_interaction_active;

    public DesignViewportVm()
    {
        Guidelines = [];
        ActiveGuideXs = [];
        ActiveGuideYs = [];

        ZoomInCommand = new RelayCommand(ZoomIn, () => Zoom < MaxZoom - 0.001);
        ZoomOutCommand = new RelayCommand(ZoomOut, () => Zoom > MinZoom + 0.001);
        ZoomResetCommand = new RelayCommand(() => Zoom = 1.0);
        ToggleGridCommand = new RelayCommand(() => ShowGrid = !ShowGrid);
        ToggleSnapCommand = new RelayCommand(() => SnapEnabled = !SnapEnabled);
        ToggleGuidelinesCommand = new RelayCommand(() => ShowGuidelines = !ShowGuidelines);
        ClearGuidelinesCommand = new RelayCommand(() => Guidelines.Clear(), () => Guidelines.Count > 0);
        CycleSnapSizeCommand = new RelayCommand(CycleSnapSize);
        Guidelines.CollectionChanged += (_, _) => ClearGuidelinesCommand.RaiseCanExecuteChanged();
    }

    public ObservableCollection<GuidelineVm> Guidelines { get; }
    public ObservableCollection<double> ActiveGuideXs { get; }
    public ObservableCollection<double> ActiveGuideYs { get; }

    public double Zoom
    {
        get => _zoom;
        set
        {
            var clamped = Math.Clamp(value, MinZoom, MaxZoom);
            if (!SetProperty(ref _zoom, clamped)) return;
            OnPropertyChanged(nameof(ZoomPercent));
            OnPropertyChanged(nameof(ZoomText));
            ZoomInCommand.RaiseCanExecuteChanged();
            ZoomOutCommand.RaiseCanExecuteChanged();
        }
    }

    public int ZoomPercent => (int)Math.Round(Zoom * 100);
    public string ZoomText => $"{ZoomPercent}%";

    public bool ShowGrid
    {
        get => _show_grid;
        set => SetProperty(ref _show_grid, value);
    }

    public int GridSizePx
    {
        get => _grid_size_px;
        set => SetProperty(ref _grid_size_px, Math.Clamp(value, 4, 100));
    }

    public bool SnapEnabled
    {
        get => _snap_enabled;
        set
        {
            if (!SetProperty(ref _snap_enabled, value)) return;
            OnPropertyChanged(nameof(SnapStatusText));
        }
    }

    public int SnapSizePx
    {
        get => _snap_size_px;
        set
        {
            if (!SetProperty(ref _snap_size_px, Math.Clamp(value, 1, 100))) return;
            OnPropertyChanged(nameof(SnapStatusText));
        }
    }

    public string SnapStatusText => SnapEnabled ? $"Snap {SnapSizePx}px" : "Snap Off";

    public bool ShowGuidelines
    {
        get => _show_guidelines;
        set => SetProperty(ref _show_guidelines, value);
    }

    public double ScrollOffsetX
    {
        get => _scroll_offset_x;
        set => SetProperty(ref _scroll_offset_x, value);
    }

    public double ScrollOffsetY
    {
        get => _scroll_offset_y;
        set => SetProperty(ref _scroll_offset_y, value);
    }

    /// <summary>Vị trí chuột trên canvas (px nội dung) — marker thước.</summary>
    public double? MouseContentX
    {
        get => _mouse_content_x;
        set => SetProperty(ref _mouse_content_x, value);
    }

    public double? MouseContentY
    {
        get => _mouse_content_y;
        set => SetProperty(ref _mouse_content_y, value);
    }

    /// <summary>Marker control đang chọn trên thước.</summary>
    public double? SelectionMarkerX
    {
        get => _selection_marker_x;
        set => SetProperty(ref _selection_marker_x, value);
    }

    public double? SelectionMarkerY
    {
        get => _selection_marker_y;
        set => SetProperty(ref _selection_marker_y, value);
    }

    public string? SizeBadgeText
    {
        get => _size_badge_text;
        set => SetProperty(ref _size_badge_text, value);
    }

    public bool IsInteractionActive
    {
        get => _is_interaction_active;
        set => SetProperty(ref _is_interaction_active, value);
    }

    public RelayCommand ZoomInCommand { get; }
    public RelayCommand ZoomOutCommand { get; }
    public RelayCommand ZoomResetCommand { get; }
    public RelayCommand ToggleGridCommand { get; }
    public RelayCommand ToggleSnapCommand { get; }
    public RelayCommand ToggleGuidelinesCommand { get; }
    public RelayCommand ClearGuidelinesCommand { get; }
    public RelayCommand CycleSnapSizeCommand { get; }

    public double Snap(double value_px)
    {
        if (!SnapEnabled || SnapSizePx <= 0) return value_px;
        return Math.Round(value_px / SnapSizePx) * SnapSizePx;
    }

    public void AddGuideline(GuidelineKind kind, double position_px)
    {
        var snapped = Snap(position_px);
        if (snapped < 0) snapped = 0;
        Guidelines.Add(new GuidelineVm(kind, snapped));
        ClearGuidelinesCommand.RaiseCanExecuteChanged();
    }

    public void ClearActiveGuides()
    {
        ActiveGuideXs.Clear();
        ActiveGuideYs.Clear();
        SizeBadgeText = null;
        IsInteractionActive = false;
    }

    public void SetResizeFeedback(double right_edge_px, int width_px, int height_px, IEnumerable<double>? align_xs = null)
    {
        IsInteractionActive = true;
        SizeBadgeText = $"{width_px} × {height_px}";
        ActiveGuideXs.Clear();
        ActiveGuideXs.Add(right_edge_px);
        if (align_xs is not null)
        {
            foreach (var x in align_xs)
                ActiveGuideXs.Add(x);
        }
        ActiveGuideYs.Clear();
    }

    public void ZoomIn() => Zoom = NextStep(Zoom, up: true);
    public void ZoomOut() => Zoom = NextStep(Zoom, up: false);

    private void CycleSnapSize()
    {
        var idx = SnapSizeOptions.ToList().IndexOf(SnapSizePx);
        SnapSizePx = SnapSizeOptions[(idx + 1) % SnapSizeOptions.Count];
        SnapEnabled = true;
    }

    private static double NextStep(double current, bool up)
    {
        if (up)
        {
            foreach (var step in ZoomSteps)
            {
                if (step > current + 0.001)
                    return step;
            }
            return MaxZoom;
        }

        for (var i = ZoomSteps.Length - 1; i >= 0; i--)
        {
            if (ZoomSteps[i] < current - 0.001)
                return ZoomSteps[i];
        }
        return MinZoom;
    }
}
