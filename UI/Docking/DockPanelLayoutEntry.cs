namespace UI.Docking;

/// <summary>Một mục layout lưu/restores — JSON-friendly.</summary>
public sealed class DockPanelLayoutEntry
{
    public string PanelId { get; set; } = string.Empty;
    public DockState State { get; set; } = DockState.Docked;
    public double? Width { get; set; }
    public double? Height { get; set; }
    public double? FloatingLeft { get; set; }
    public double? FloatingTop { get; set; }
    public double? FloatingWidth { get; set; }
    public double? FloatingHeight { get; set; }
}
