namespace UI.Docking;

/// <summary>
/// Owns panel states. Pin: Docked ⇄ AutoHide. One AutoHide flyout per side.
/// Never destroys panel content — chỉ đổi DockState.
/// </summary>
public sealed class DockManager : IDockManager
{
    private const double MinBottomBandHeight = 80;
    private const double MaxBottomBandHeight = 600;

    private readonly IDockLayoutStore _layout_store;
    private readonly Dictionary<DockPanelId, DockState> _states = new();
    private IWorkspaceDockHost? _host;

    public DockManager(IDockLayoutStore? layout_store = null)
    {
        _layout_store = layout_store ?? new JsonDockLayoutStore();
        foreach (var panel_id in DockPanelRegistry.All.Keys)
            _states[panel_id] = DockState.Docked;
    }

    public IReadOnlyDictionary<DockPanelId, DockPanelDescriptor> Panels => DockPanelRegistry.All;

    public double BottomBandHeight { get; set; } = 180;

    public event EventHandler<DockPanelEventArgs>? PanelPinned;
    public event EventHandler<DockPanelEventArgs>? PanelAutoHidden;
    public event EventHandler<DockPanelEventArgs>? PanelFloating;
    public event EventHandler<DockPanelEventArgs>? PanelClosed;
    public event EventHandler<DockPanelEventArgs>? PanelActivated;
    public event EventHandler? DockLayoutChanged;

    public void AttachHost(IWorkspaceDockHost host)
    {
        if (_host is not null)
        {
            _host.PanelStateChangedByHost -= OnHostStateChanged;
            _host.PanelActivated -= OnHostActivated;
        }

        _host = host;
        _host.PanelStateChangedByHost += OnHostStateChanged;
        _host.PanelActivated += OnHostActivated;
    }

    public void RegisterPanelContent(DockPanelId panel_id, object content) =>
        _host?.RegisterPanel(panel_id, content);

    public DockState GetState(DockPanelId panel_id) => _states[panel_id];

    public DockPanelDescriptor GetDescriptor(DockPanelId panel_id)
    {
        var desc = DockPanelRegistry.Get(panel_id);
        desc.State = _states[panel_id];
        return desc;
    }

    public void TogglePin(DockPanelId panel_id)
    {
        var current = _states[panel_id];
        var next = current switch
        {
            DockState.Docked => DockState.AutoHide,
            DockState.AutoHide => DockState.Docked,
            DockState.Floating => DockState.Docked,
            DockState.Hidden => DockState.Docked,
            _ => DockState.Docked
        };
        SetState(panel_id, next);
    }

    public void SetState(DockPanelId panel_id, DockState state)
    {
        if (_states[panel_id] == state) return;

        var previous = _states[panel_id];
        var side = DockPanelRegistry.GetSide(panel_id);

        if (state == DockState.AutoHide)
            CloseOtherFlyoutsOnSide(side, panel_id);

        _states[panel_id] = state;
        DockPanelRegistry.Get(panel_id).State = state;
        _host?.ApplyState(panel_id, state);

        RaiseStateEvent(panel_id, state, previous);
        DockLayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void Activate(DockPanelId panel_id)
    {
        if (_states[panel_id] == DockState.Hidden)
            SetState(panel_id, DockState.Docked);
        else if (_states[panel_id] == DockState.AutoHide)
        {
            CloseOtherFlyoutsOnSide(DockPanelRegistry.GetSide(panel_id), panel_id);
            _host?.ActivatePanel(panel_id);
        }
        else
            _host?.ActivatePanel(panel_id);

        RaiseActivated(panel_id);
    }

    public void Show(DockPanelId panel_id)
    {
        if (_states[panel_id] == DockState.Hidden)
            SetState(panel_id, DockState.Docked);
        else if (_states[panel_id] == DockState.AutoHide)
            SetState(panel_id, DockState.Docked);
    }

    public void Hide(DockPanelId panel_id) => SetState(panel_id, DockState.Hidden);

    public void AdjustBottomBandHeight(double delta)
    {
        BottomBandHeight = Math.Clamp(BottomBandHeight + delta, MinBottomBandHeight, MaxBottomBandHeight);
        DockLayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void RestoreLayout()
    {
        var snapshot = _layout_store.Load();
        if (snapshot is null) return;

        BottomBandHeight = snapshot.BottomBandHeight;

        foreach (var (key, entry) in snapshot.Panels)
        {
            if (!Enum.TryParse<DockPanelId>(key, ignoreCase: true, out var panel_id))
                continue;
            if (!_states.ContainsKey(panel_id)) continue;
            SetState(panel_id, entry.State);
        }

        _host?.ApplyLayout(snapshot);
        DockLayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    public void SaveLayout()
    {
        var snapshot = _host?.CaptureLayout() ?? new DockLayoutSnapshot();
        snapshot.BottomBandHeight = BottomBandHeight;

        foreach (var (panel_id, state) in _states)
        {
            snapshot.Panels[panel_id.ToString()] = new DockPanelLayoutEntry
            {
                PanelId = panel_id.ToString(),
                State = state
            };
        }

        _layout_store.Save(snapshot);
    }

    private void CloseOtherFlyoutsOnSide(DockSide side, DockPanelId except)
    {
        if (_host is null) return;

        foreach (var (panel_id, state) in _states)
        {
            if (panel_id == except) continue;
            if (DockPanelRegistry.GetSide(panel_id) != side) continue;
            if (state != DockState.AutoHide) continue;
            if (_host.IsFlyoutOpen(panel_id))
                _host.CloseFlyout(panel_id);
        }
    }

    private void OnHostStateChanged(object? sender, DockPanelEventArgs e)
    {
        if (!_states.ContainsKey(e.PanelId)) return;
        if (_states[e.PanelId] == e.State) return;

        var previous = _states[e.PanelId];
        _states[e.PanelId] = e.State;
        DockPanelRegistry.Get(e.PanelId).State = e.State;
        RaiseStateEvent(e.PanelId, e.State, previous);
        DockLayoutChanged?.Invoke(this, EventArgs.Empty);
    }

    private void OnHostActivated(object? sender, DockPanelEventArgs e) =>
        RaiseActivated(e.PanelId);

    private void RaiseStateEvent(DockPanelId panel_id, DockState state, DockState previous)
    {
        var args = new DockPanelEventArgs
        {
            PanelId = panel_id,
            State = state,
            PreviousState = previous
        };

        switch (state)
        {
            case DockState.Docked:
                PanelPinned?.Invoke(this, args);
                break;
            case DockState.AutoHide:
                PanelAutoHidden?.Invoke(this, args);
                break;
            case DockState.Floating:
                PanelFloating?.Invoke(this, args);
                break;
            case DockState.Hidden:
                PanelClosed?.Invoke(this, args);
                break;
        }
    }

    private void RaiseActivated(DockPanelId panel_id)
    {
        PanelActivated?.Invoke(this, new DockPanelEventArgs
        {
            PanelId = panel_id,
            State = _states[panel_id],
            PreviousState = _states[panel_id]
        });
    }
}
