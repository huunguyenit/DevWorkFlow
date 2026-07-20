namespace UI.Docking;

/// <summary>Trạng thái panel — DevWorkFlow owns UX; AvalonDock chỉ render.</summary>
public enum DockState
{
    Docked,
    AutoHide,
    Floating,
    Hidden
}
