namespace UI.Docking;

/// <summary>
/// [Obsolete] Replaced by <see cref="IDockManager"/>. Kept for reference during migration.
/// </summary>
[Obsolete("Use IDockManager instead.")]
public interface IDockService
{
    bool IsPanelVisible(DockPanelId panel);
    void ShowPanel(DockPanelId panel);
    void HidePanel(DockPanelId panel);
    void TogglePanel(DockPanelId panel);
    event EventHandler? LayoutChanged;
}
