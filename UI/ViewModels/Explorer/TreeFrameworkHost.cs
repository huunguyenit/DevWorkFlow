using System.Windows.Threading;
using DevWorkFlow.Tree;
using UI.Tree;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>
/// Shared host: VirtualTreeEngine + TreeRenderingEngine + filter debounce.
/// Business stays in DataSource / activation handlers.
/// </summary>
public sealed class TreeFrameworkHost : ViewModelBase, IAsyncDisposable
{
    private readonly Func<string, CancellationToken, Task> _on_filter;
    private VirtualTreeEngine? _engine;
    private TreeRenderingEngine? _rendering;
    private string _filter_text = string.Empty;
    private string _status_text = string.Empty;
    private CancellationTokenSource? _filter_cts;
    private readonly int _filter_debounce_ms;

    public TreeFrameworkHost(
        int filter_debounce_ms,
        Func<string, CancellationToken, Task> on_filter)
    {
        _filter_debounce_ms = Math.Max(0, filter_debounce_ms);
        _on_filter = on_filter;
    }

    public TreeRenderingEngine? Rendering
    {
        get => _rendering;
        private set => SetProperty(ref _rendering, value);
    }

    public VirtualTreeEngine? Engine => _engine;

    public string FilterText
    {
        get => _filter_text;
        set
        {
            if (!SetProperty(ref _filter_text, value)) return;
            _ = DebounceFilterAsync(value);
        }
    }

    public string StatusText
    {
        get => _status_text;
        set => SetProperty(ref _status_text, value);
    }

    public async Task AttachAsync(
        ITreeDataSource data_source,
        Dispatcher? dispatcher = null,
        CancellationToken cancellation_token = default)
    {
        await DetachAsync().ConfigureAwait(true);

        _engine = new VirtualTreeEngine(data_source);
        _rendering = new TreeRenderingEngine(_engine, dispatcher);
        OnPropertyChanged(nameof(Rendering));
        OnPropertyChanged(nameof(Engine));
        await _rendering.InitializeAsync(cancellation_token).ConfigureAwait(true);
    }

    public async Task DetachAsync()
    {
        _filter_cts?.Cancel();
        if (_rendering is not null)
        {
            _rendering.Dispose();
            _rendering = null;
            OnPropertyChanged(nameof(Rendering));
        }

        if (_engine is not null)
        {
            await _engine.DisposeAsync().ConfigureAwait(true);
            _engine = null;
            OnPropertyChanged(nameof(Engine));
        }
    }

    private async Task DebounceFilterAsync(string raw)
    {
        _filter_cts?.Cancel();
        _filter_cts = new CancellationTokenSource();
        var ct = _filter_cts.Token;
        try
        {
            if (_filter_debounce_ms > 0)
                await Task.Delay(_filter_debounce_ms, ct).ConfigureAwait(true);
            await _on_filter(raw, ct).ConfigureAwait(true);
        }
        catch (OperationCanceledException)
        {
            // newer keystroke
        }
    }

    public async ValueTask DisposeAsync() => await DetachAsync().ConfigureAwait(true);
}
