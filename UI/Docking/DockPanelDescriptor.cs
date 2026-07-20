namespace UI.Docking;

/// <summary>Metadata panel — ViewModel chỉ expose Id, Title, Icon, DockState.</summary>
public sealed class DockPanelDescriptor
{
    public required DockPanelId PanelId { get; init; }
    public required string Title { get; init; }
    public required string ContentId { get; init; }
    public required DockSide Side { get; init; }
    public string? IconKey { get; init; }
    public DockState State { get; internal set; } = DockState.Docked;
}
