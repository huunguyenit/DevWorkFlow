namespace UI.Docking;

/// <summary>Args sự kiện panel dock — ViewModel không tham chiếu AvalonDock.</summary>
public sealed class DockPanelEventArgs : EventArgs
{
    public required DockPanelId PanelId { get; init; }
    public required DockState State { get; init; }
    public DockState PreviousState { get; init; }
}
