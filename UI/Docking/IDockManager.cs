namespace UI.Docking;

/// <summary>
/// DevWorkFlow owns dock UX. Flow: User → DockManager → Workspace → AvalonDock.
/// ViewModels never manipulate AvalonDock directly.
/// </summary>
public interface IDockManager
{
    IReadOnlyDictionary<DockPanelId, DockPanelDescriptor> Panels { get; }

    DockState GetState(DockPanelId panel_id);
    DockPanelDescriptor GetDescriptor(DockPanelId panel_id);

    void TogglePin(DockPanelId panel_id);
    void SetState(DockPanelId panel_id, DockState state);
    void Activate(DockPanelId panel_id);
    void Show(DockPanelId panel_id);
    void Hide(DockPanelId panel_id);

    double BottomBandHeight { get; set; }
    void AdjustBottomBandHeight(double delta);

    void RestoreLayout();
    void SaveLayout();

    void AttachHost(IWorkspaceDockHost host);
    void RegisterPanelContent(DockPanelId panel_id, object content);

    event EventHandler<DockPanelEventArgs>? PanelPinned;
    event EventHandler<DockPanelEventArgs>? PanelAutoHidden;
    event EventHandler<DockPanelEventArgs>? PanelFloating;
    event EventHandler<DockPanelEventArgs>? PanelClosed;
    event EventHandler<DockPanelEventArgs>? PanelActivated;
    event EventHandler? DockLayoutChanged;
}
