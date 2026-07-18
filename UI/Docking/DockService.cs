namespace UI.Docking;

/// <summary>In-memory dock visibility — không undock/float ở Bước 1.</summary>
public sealed class DockService : IDockService
{
    private readonly Dictionary<DockRegion, bool> _visible = new()
    {
        [DockRegion.Left] = true,
        [DockRegion.Right] = true,
        [DockRegion.Bottom] = true,
        [DockRegion.Center] = true
    };

    public event EventHandler? LayoutChanged;

    public bool IsVisible(DockRegion region) =>
        _visible.TryGetValue(region, out var v) && v;

    public void Show(DockRegion region)
    {
        if (_visible[region]) return;
        _visible[region] = true;
        LayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void Hide(DockRegion region)
    {
        if (region == DockRegion.Center) return;
        if (!_visible[region]) return;
        _visible[region] = false;
        LayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void Toggle(DockRegion region)
    {
        if (IsVisible(region)) Hide(region);
        else Show(region);
    }
}
