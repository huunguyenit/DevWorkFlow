namespace UI.Docking;

/// <summary>Registry panel shell — không destroy/recreate VM.</summary>
public static class DockPanelRegistry
{
    private static readonly Dictionary<DockPanelId, DockPanelDescriptor> _panels = new()
    {
        [DockPanelId.LeftTop] = new()
        {
            PanelId = DockPanelId.LeftTop,
            Title = "Explorer",
            ContentId = "dock.left.top",
            Side = DockSide.Left,
            IconKey = "FolderOpenOutline"
        },
        [DockPanelId.LeftBottom] = new()
        {
            PanelId = DockPanelId.LeftBottom,
            Title = "Outline",
            ContentId = "dock.left.bottom",
            Side = DockSide.Left,
            IconKey = "FileTreeOutline"
        },
        [DockPanelId.CenterBottom] = new()
        {
            PanelId = DockPanelId.CenterBottom,
            Title = "Output",
            ContentId = "dock.center.bottom",
            Side = DockSide.Bottom,
            IconKey = "Console"
        },
        [DockPanelId.RightTop] = new()
        {
            PanelId = DockPanelId.RightTop,
            Title = "Insight",
            ContentId = "dock.right.top",
            Side = DockSide.Right,
            IconKey = "LightbulbOnOutline"
        },
        [DockPanelId.RightBottom] = new()
        {
            PanelId = DockPanelId.RightBottom,
            Title = "Properties",
            ContentId = "dock.right.bottom",
            Side = DockSide.Right,
            IconKey = "Tune"
        }
    };

    public static IReadOnlyDictionary<DockPanelId, DockPanelDescriptor> All => _panels;

    public static DockPanelDescriptor Get(DockPanelId panel_id) => _panels[panel_id];

    public static DockSide GetSide(DockPanelId panel_id) => _panels[panel_id].Side;
}
