using UI.ViewModels.Base;

namespace UI.ViewModels.Design;

public enum GuidelineKind
{
    Horizontal,
    Vertical
}

/// <summary>Guideline người dùng kéo từ thước (kiểu Photoshop).</summary>
public sealed class GuidelineVm : ViewModelBase
{
    private double _position_px;

    public GuidelineVm(GuidelineKind kind, double position_px)
    {
        Kind = kind;
        _position_px = position_px;
    }

    public GuidelineKind Kind { get; }

    public bool IsVertical => Kind == GuidelineKind.Vertical;
    public bool IsHorizontal => Kind == GuidelineKind.Horizontal;

    /// <summary>Vị trí theo đơn vị px nội dung (trước zoom).</summary>
    public double PositionPx
    {
        get => _position_px;
        set => SetProperty(ref _position_px, value);
    }
}
