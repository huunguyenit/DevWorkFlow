namespace UI.Docking;

/// <summary>
/// Rendering engine contract — AvalonDock implements; ViewModels never reference it.
/// DockManager gọi ApplyState; host báo Floating/Activated qua events.
/// </summary>
public interface IWorkspaceDockHost
{
    void Attach(object workspace_root);
    void RegisterPanel(DockPanelId panel_id, object content);
    void ApplyState(DockPanelId panel_id, DockState state);
    void ApplyLayout(DockLayoutSnapshot snapshot);
    DockLayoutSnapshot CaptureLayout();
    bool IsFlyoutOpen(DockPanelId panel_id);
    void CloseFlyout(DockPanelId panel_id);
    void ActivatePanel(DockPanelId panel_id);

    event EventHandler<DockPanelEventArgs>? PanelStateChangedByHost;
    event EventHandler<DockPanelEventArgs>? PanelActivated;
}
