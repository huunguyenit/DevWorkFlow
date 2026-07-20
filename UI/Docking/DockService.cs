namespace UI.Docking;

/// <summary>In-memory dock visibility — không undock/float ở Bước 1.</summary>
public sealed class DockService : IDockService
{
    private readonly Dictionary<DockPanelId, bool> _visible = new()
    {
        [DockPanelId.LeftTop] = true,
        [DockPanelId.LeftBottom] = true,
        [DockPanelId.CenterBottom] = true,
        [DockPanelId.RightTop] = true,
        [DockPanelId.RightBottom] = true
    };

    public event EventHandler? LayoutChanged;

    public bool IsPanelVisible(DockPanelId panel) => _visible[panel];

    public void ShowPanel(DockPanelId panel)
    {
        if (_visible[panel]) return;
        _visible[panel] = true;
        LayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void HidePanel(DockPanelId panel)
    {
        if (!_visible[panel]) return;
        _visible[panel] = false;
        LayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void TogglePanel(DockPanelId panel)
    {
        if (IsPanelVisible(panel)) HidePanel(panel);
        else ShowPanel(panel);
    }
}
