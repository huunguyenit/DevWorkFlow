using System.Windows;
using System.Windows.Threading;
using AvalonDock;
using AvalonDock.Layout;

namespace UI.Docking.Avalon;

/// <summary>
/// AvalonDock rendering adapter — animation/hover/delay do engine xử lý.
/// DockManager owns state; host chỉ sync LayoutAnchorable.
/// </summary>
public sealed class AvalonDockWorkspaceHost : IWorkspaceDockHost
{
    private const int AutoHideHideDelayMs = 250;

    private DockingManager? _manager;
    private readonly Dictionary<DockPanelId, LayoutAnchorable> _anchorables = new();
    private readonly Dictionary<string, DockPanelId> _content_id_map = new();
    private readonly DispatcherTimer _hide_timer;
    private LayoutAnchorable? _pending_hide;

    public AvalonDockWorkspaceHost()
    {
        _hide_timer = new DispatcherTimer { Interval = TimeSpan.FromMilliseconds(AutoHideHideDelayMs) };
        _hide_timer.Tick += (_, _) =>
        {
            _hide_timer.Stop();
            if (_pending_hide?.IsAutoHidden == false && _pending_hide.IsActive)
                _pending_hide.ToggleAutoHide();
            _pending_hide = null;
        };
    }

    public event EventHandler<DockPanelEventArgs>? PanelStateChangedByHost;
    public event EventHandler<DockPanelEventArgs>? PanelActivated;

    public void Attach(object workspace_root)
    {
        if (workspace_root is not DockingManager manager)
            throw new ArgumentException("Expected DockingManager.", nameof(workspace_root));

        _manager = manager;
        _manager.ActiveContentChanged += (_, _) =>
        {
            if (_manager.ActiveContent is LayoutAnchorable anchor)
                RaiseActivated(anchor);
        };
    }

    public void RegisterPanel(DockPanelId panel_id, object content)
    {
        if (_manager is null) return;

        var meta = DockPanelRegistry.Get(panel_id);
        if (_anchorables.TryGetValue(panel_id, out var existing))
        {
            existing.Content = content;
            return;
        }

        var anchorable = FindOrCreateAnchorable(meta.ContentId, meta.Title);
        anchorable.Content = content;
        anchorable.CanAutoHide = true;
        anchorable.CanFloat = true;
        anchorable.CanClose = false;
        anchorable.AutoHideWidth = panel_id is DockPanelId.CenterBottom ? 0 : 240;
        anchorable.AutoHideHeight = panel_id is DockPanelId.CenterBottom ? 200 : 0;

        _anchorables[panel_id] = anchorable;
        _content_id_map[meta.ContentId] = panel_id;

        anchorable.IsVisibleChanged += (_, _) => SyncFromAnchorable(panel_id, anchorable);
        anchorable.IsSelectedChanged += (_, _) =>
        {
            if (anchorable.IsSelected)
                RaiseActivated(anchorable);
        };
        anchorable.PropertyChanged += (_, e) =>
        {
            if (e.PropertyName is nameof(LayoutAnchorable.IsAutoHidden)
                or nameof(LayoutAnchorable.IsFloating)
                or nameof(LayoutAnchorable.IsVisible))
                SyncFromAnchorable(panel_id, anchorable);
        };
    }

    public void ApplyState(DockPanelId panel_id, DockState state)
    {
        if (!_anchorables.TryGetValue(panel_id, out var anchorable)) return;

        _hide_timer.Stop();
        _pending_hide = null;

        switch (state)
        {
            case DockState.Docked:
                if (anchorable.IsAutoHidden)
                    anchorable.ToggleAutoHide();
                anchorable.Show();
                anchorable.IsActive = true;
                break;

            case DockState.AutoHide:
                anchorable.Show();
                if (!anchorable.IsAutoHidden)
                    anchorable.ToggleAutoHide();
                break;

            case DockState.Floating:
                if (anchorable.IsAutoHidden)
                    anchorable.ToggleAutoHide();
                anchorable.Float();
                break;

            case DockState.Hidden:
                anchorable.Hide();
                break;
        }
    }

    public void ApplyLayout(DockLayoutSnapshot snapshot)
    {
        if (_manager is null) return;

        foreach (var (key, entry) in snapshot.Panels)
        {
            if (!Enum.TryParse<DockPanelId>(key, ignoreCase: true, out var panel_id)) continue;
            if (!_anchorables.TryGetValue(panel_id, out var anchorable)) continue;

            if (entry.Width is > 0 && anchorable.Parent is LayoutAnchorablePane pane)
                pane.DockWidth = new GridLength(entry.Width.Value);
            if (entry.Height is > 0 && anchorable.Parent is LayoutAnchorablePane pane_h)
                pane_h.DockHeight = new GridLength(entry.Height.Value);
        }
    }

    public DockLayoutSnapshot CaptureLayout()
    {
        var snapshot = new DockLayoutSnapshot();

        foreach (var (panel_id, anchorable) in _anchorables)
        {
            var entry = new DockPanelLayoutEntry { PanelId = panel_id.ToString() };

            if (anchorable.IsAutoHidden)
                entry.State = DockState.AutoHide;
            else if (anchorable.IsFloating)
                entry.State = DockState.Floating;
            else if (!anchorable.IsVisible)
                entry.State = DockState.Hidden;
            else
                entry.State = DockState.Docked;

            if (anchorable.Parent is LayoutAnchorablePane pane)
            {
                if (pane.DockWidth.Value > 0) entry.Width = pane.DockWidth.Value;
                if (pane.DockHeight.Value > 0) entry.Height = pane.DockHeight.Value;
            }

            snapshot.Panels[panel_id.ToString()] = entry;
        }

        return snapshot;
    }

    public bool IsFlyoutOpen(DockPanelId panel_id) =>
        _anchorables.TryGetValue(panel_id, out var a) && a.IsActive && !a.IsAutoHidden;

    public void CloseFlyout(DockPanelId panel_id)
    {
        if (!_anchorables.TryGetValue(panel_id, out var anchorable)) return;
        if (anchorable.IsActive && !anchorable.IsAutoHidden)
        {
            _pending_hide = anchorable;
            _hide_timer.Stop();
            _hide_timer.Start();
        }
    }

    public void ActivatePanel(DockPanelId panel_id)
    {
        if (!_anchorables.TryGetValue(panel_id, out var anchorable)) return;
        anchorable.Show();
        anchorable.IsActive = true;
    }

    private LayoutAnchorable FindOrCreateAnchorable(string content_id, string title)
    {
        if (_manager?.Layout is null)
            return CreateAnchorable(content_id, title);

        var existing = FindAnchorableRecursive(_manager.Layout, content_id);
        return existing ?? CreateAnchorable(content_id, title);
    }

    private static LayoutAnchorable? FindAnchorableRecursive(ILayoutElement element, string content_id)
    {
        if (element is LayoutAnchorable anchor &&
            string.Equals(anchor.ContentId, content_id, StringComparison.Ordinal))
            return anchor;

        if (element is ILayoutContainer container)
        {
            foreach (var child in container.Children)
            {
                var found = FindAnchorableRecursive(child, content_id);
                if (found is not null) return found;
            }
        }

        return null;
    }

    private static LayoutAnchorable CreateAnchorable(string content_id, string title) =>
        new() { ContentId = content_id, Title = title };

    private void SyncFromAnchorable(DockPanelId panel_id, LayoutAnchorable anchorable)
    {
        DockState state;
        if (anchorable.IsAutoHidden)
            state = DockState.AutoHide;
        else if (anchorable.IsFloating)
            state = DockState.Floating;
        else if (!anchorable.IsVisible)
            state = DockState.Hidden;
        else
            state = DockState.Docked;

        PanelStateChangedByHost?.Invoke(this, new DockPanelEventArgs
        {
            PanelId = panel_id,
            State = state,
            PreviousState = state
        });
    }

    private void RaiseActivated(LayoutAnchorable anchorable)
    {
        if (string.IsNullOrEmpty(anchorable.ContentId)) return;
        if (!_content_id_map.TryGetValue(anchorable.ContentId, out var panel_id)) return;

        PanelActivated?.Invoke(this, new DockPanelEventArgs
        {
            PanelId = panel_id,
            State = DockState.Docked,
            PreviousState = DockState.Docked
        });
    }
}
