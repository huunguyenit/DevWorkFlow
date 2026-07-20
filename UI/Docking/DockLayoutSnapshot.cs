namespace UI.Docking;

/// <summary>Snapshot layout workspace — restore on startup.</summary>
public sealed class DockLayoutSnapshot
{
    public int Version { get; set; } = 1;
    public double BottomBandHeight { get; set; } = 180;
    public Dictionary<string, DockPanelLayoutEntry> Panels { get; set; } = new();
}
