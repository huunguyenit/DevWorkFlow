using System.Collections.ObjectModel;
using System.Windows;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Infrastructure.Services;
using DevWorkFlow.Infrastructure.Tree;
using DevWorkFlow.Tree;
using UI.Services;
using UI.Tree;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>
/// Tree database objects — load SQL async, build tree nền, filter debounce.
/// </summary>
public sealed class DatabaseExplorerViewModel : ViewModelBase, IDisposable
{
    private readonly IProgramSession _program_session;
    private readonly ISqlScriptRunner _sql_runner;
    private readonly AppConfigStore _config;
    private readonly DatabaseObjectScripter _scripter;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly Dictionary<string, DatabaseObjectTypeOption> _type_map;
    private readonly DatabaseDataSource _db_source;
    private readonly TreeFrameworkHost _tree_host;

    private SqlConnectionTargetVm? _selected_target;
    private string _status_text = "Chọn Program rồi Refresh để tải object.";
    private string _filter_text = string.Empty;
    private bool _is_busy;
    private CancellationTokenSource? _load_cts;
    private CancellationTokenSource? _click_cts;
    private int _refresh_generation;
    private bool _suppress_target_refresh;

    public DatabaseExplorerViewModel(
        IProgramSession program_session,
        ISqlScriptRunner sql_runner,
        AppConfigStore config,
        DatabaseObjectScripter scripter,
        SqlStudioNavigator sql_navigator)
    {
        _program_session = program_session;
        _sql_runner = sql_runner;
        _config = config;
        _scripter = scripter;
        _sql_navigator = sql_navigator;
        _type_map = config.DatabaseObjectTypes
            .ToDictionary(t => t.Code, t => t, StringComparer.OrdinalIgnoreCase);

        _db_source = new DatabaseDataSource();
        _tree_host = new TreeFrameworkHost(config.Database.FilterDebounceMs, ApplyTreeFilterAsync);

        ConnectionTargets = [];
        RefreshCommand = new AsyncRelayCommand(() => RefreshAsync(), () => !IsBusy);

        RebuildConnectionTargets();
        _program_session.ProgramUpdated += OnProgramUpdated;
    }

    public TreeRenderingEngine? TreeRendering => _tree_host.Rendering;

    private void OnProgramUpdated(object? sender, EventArgs e)
    {
        var dispatcher = Application.Current?.Dispatcher;
        if (dispatcher is not null && !dispatcher.CheckAccess())
        {
            _ = dispatcher.InvokeAsync(() => OnProgramUpdated(sender, e));
            return;
        }

        RebuildConnectionTargets();
        _ = RefreshAsync();
    }

    /// <summary>Gọi từ coordinator — rebuild target rồi load catalog.</summary>
    public async Task RefreshAfterProgramChangeAsync(CancellationToken ct = default)
    {
        RebuildConnectionTargets();
        await RefreshAsync(ct);
    }

    public ObservableCollection<SqlConnectionTargetVm> ConnectionTargets { get; }

    public SqlConnectionTargetVm? SelectedTarget
    {
        get => _selected_target;
        set
        {
            if (!SetProperty(ref _selected_target, value)) return;
            if (!_suppress_target_refresh)
                _ = RefreshAsync();
        }
    }

    public string FilterText
    {
        get => _filter_text;
        set
        {
            if (!SetProperty(ref _filter_text, value)) return;
            _tree_host.FilterText = value;
        }
    }

    public string StatusText
    {
        get => _status_text;
        private set
        {
            if (!SetProperty(ref _status_text, value)) return;
            _tree_host.StatusText = value;
        }
    }

    public int ActivationDelayMs => 0;

    public bool IsBusy
    {
        get => _is_busy;
        private set => SetProperty(ref _is_busy, value);
    }

    public AsyncRelayCommand RefreshCommand { get; }

    public void OnTreeNodeActivated(TreeNode node, bool is_double_click)
    {
        if (node.Metadata is not DatabaseNodeMeta meta || meta.IsFolder) return;
        if (string.IsNullOrWhiteSpace(meta.Schema) || string.IsNullOrWhiteSpace(meta.ObjectName))
            return;

        var kind = ExplorerTreeNodeMapper.ParseDatabaseKind(
            _type_map.TryGetValue(meta.ObjectType ?? "", out var opt) ? opt.Kind : "Folder");
        if (kind == DatabaseObjectKind.Folder) return;

        var tag = new DatabaseObjectTag { Schema = meta.Schema, Kind = kind };
        _ = OpenObjectScriptAsync(meta.ObjectName, tag, is_double_click);
    }

    private async Task OpenObjectScriptAsync(
        string object_name,
        DatabaseObjectTag tag,
        bool is_double_click)
    {
        _click_cts?.Cancel();
        _click_cts = new CancellationTokenSource();
        var ct = _click_cts.Token;

        var click = is_double_click ? 2 : 1;
        var delay_ms = _config.Database.SingleClickDelayMs;
        if (!is_double_click && delay_ms > 0)
        {
            try
            {
                await Task.Delay(Math.Max(50, delay_ms), ct).ConfigureAwait(true);
            }
            catch (OperationCanceledException)
            {
                return;
            }
        }

        if (SelectedTarget is null || string.IsNullOrWhiteSpace(SelectedTarget.ConnectionString))
        {
            StatusText = "Chưa có target Sys/App.";
            return;
        }

        StatusText = click == 1
            ? $"Đang sinh script (click 1) {tag.Schema}.{object_name}…"
            : $"Đang sinh script (click 2) {tag.Schema}.{object_name}…";

        try
        {
            var built = await _scripter.BuildAsync(
                SelectedTarget.ConnectionString,
                tag.Schema,
                object_name,
                tag.Kind,
                click,
                ct).ConfigureAwait(true);

            if (built is null)
            {
                StatusText = $"Chưa khai báo action click={click} cho {tag.Kind} trong Config.";
                return;
            }

            var (title, script) = built.Value;
            var buffer_id = $"db:{tag.Kind}:{tag.Schema}.{object_name}:c{click}";
            _sql_navigator.OpenBuffer(buffer_id, title, script, SelectedTarget.Id);
            StatusText = title;
        }
        catch (OperationCanceledException)
        {
            // double-click hủy single-click
        }
        catch (Exception ex)
        {
            StatusText = ex.Message;
        }
    }

    public void Dispose()
    {
        _program_session.ProgramUpdated -= OnProgramUpdated;
        _load_cts?.Cancel();
        _load_cts?.Dispose();
        _click_cts?.Cancel();
        _click_cts?.Dispose();
        _ = _tree_host.DisposeAsync().AsTask();
    }

    private void RebuildConnectionTargets()
    {
        var prev_id = SelectedTarget?.Id;
        _suppress_target_refresh = true;
        try
        {
            ConnectionTargets.Clear();

            var program = _program_session.Current;
            if (program is null)
            {
                SelectedTarget = null;
                return;
            }

            if (!string.IsNullOrWhiteSpace(program.SysConnectionString))
            {
                var sys_db = AppConnectionResolver.TryGetDatabaseName(program.SysConnectionString) ?? "Sys";
                ConnectionTargets.Add(new SqlConnectionTargetVm
                {
                    Id = "sys",
                    Display = sys_db,
                    ConnectionString = program.SysConnectionString,
                    IsSys = true,
                    DatabaseName = sys_db
                });
            }

            if (program.AppDatabases.Count > 0)
            {
                foreach (var app in program.AppDatabases)
                {
                    var cs = AppConnectionResolver.ResolveAppConnection(program, app.DatabaseName);
                    ConnectionTargets.Add(new SqlConnectionTargetVm
                    {
                        Id = $"app:{app.Code}:{app.DatabaseName}",
                        Display = app.DatabaseName,
                        ConnectionString = cs,
                        IsSys = false,
                        Code = app.Code,
                        DatabaseName = app.DatabaseName
                    });
                }
            }
            else if (!string.IsNullOrWhiteSpace(program.AppConnectionString)
                     && !program.AppConnectionString.Contains("%Database", StringComparison.OrdinalIgnoreCase))
            {
                var app_db = !string.IsNullOrWhiteSpace(program.AppDatabaseName)
                    ? program.AppDatabaseName
                    : AppConnectionResolver.TryGetDatabaseName(program.AppConnectionString) ?? "App";
                ConnectionTargets.Add(new SqlConnectionTargetVm
                {
                    Id = "app:default",
                    Display = app_db,
                    ConnectionString = program.AppConnectionString,
                    IsSys = false,
                    DatabaseName = app_db
                });
            }

            var prefer_app = string.Equals(
                _config.Database.DefaultTarget, "App", StringComparison.OrdinalIgnoreCase);
            var has_app = ConnectionTargets.Any(t => !t.IsSys);

            // Giữ target trước đó; nhưng không giữ Sys khi mặc định App và đã có App
            // (tránh kẹt Sys sau lần load đầu khi App chưa resolve).
            SqlConnectionTargetVm? pick = null;
            if (!string.IsNullOrWhiteSpace(prev_id))
            {
                var prev = ConnectionTargets.FirstOrDefault(t => t.Id == prev_id);
                if (prev is not null && !(prefer_app && has_app && prev.IsSys))
                    pick = prev;
            }

            if (pick is null && !string.IsNullOrWhiteSpace(program.AppDatabaseName))
            {
                pick = ConnectionTargets.FirstOrDefault(t =>
                    !t.IsSys
                    && string.Equals(t.DatabaseName, program.AppDatabaseName, StringComparison.OrdinalIgnoreCase));
            }

            SelectedTarget = pick
                             ?? (prefer_app
                                 ? ConnectionTargets.FirstOrDefault(t => !t.IsSys)
                                 : ConnectionTargets.FirstOrDefault(t => t.IsSys))
                             ?? ConnectionTargets.FirstOrDefault();
        }
        finally
        {
            _suppress_target_refresh = false;
        }
    }

    public async Task RefreshAsync(CancellationToken external_ct = default)
    {
        var dispatcher = Application.Current?.Dispatcher;
        if (dispatcher is not null && !dispatcher.CheckAccess())
        {
            var tcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
            _ = dispatcher.InvokeAsync(async () =>
            {
                try
                {
                    await RefreshAsync(external_ct);
                    tcs.TrySetResult();
                }
                catch (Exception ex)
                {
                    tcs.TrySetException(ex);
                }
            });
            await tcs.Task;
            return;
        }

        _load_cts?.Cancel();
        _load_cts = CancellationTokenSource.CreateLinkedTokenSource(external_ct);
        var ct = _load_cts.Token;
        var generation = ++_refresh_generation;

        if (_program_session.Current is null)
        {
            StatusText = "Chưa chọn Program.";
            await _tree_host.DetachAsync().ConfigureAwait(true);
            OnPropertyChanged(nameof(TreeRendering));
            return;
        }

        if (SelectedTarget is null || string.IsNullOrWhiteSpace(SelectedTarget.ConnectionString))
        {
            StatusText = "Chưa có target Sys/App.";
            return;
        }

        if (SelectedTarget.ConnectionString.Contains("%Database", StringComparison.OrdinalIgnoreCase))
        {
            StatusText = "App connection còn %Database — mở lại Program.";
            return;
        }

        var target = SelectedTarget;
        IsBusy = true;
        StatusText = $"Đang tải object từ {target.Display}…";
        try
        {
            var result = await _sql_runner.ExecuteAsync(
                target.ConnectionString,
                _config.CatalogSql,
                command_timeout_seconds: ResolveCommandTimeout(),
                cancellation_token: ct).ConfigureAwait(true);

            if (!result.Succeeded)
            {
                StatusText = result.ErrorMessage ?? "Không tải được database objects.";
                return;
            }

            var table = result.ResultSets.FirstOrDefault()?.Table;
            if (table is null)
            {
                StatusText = "Không có dữ liệu object.";
                return;
            }

            ct.ThrowIfCancellationRequested();
            if (generation != _refresh_generation) return;

            var folder_map = TreeNodeAdapters.ToFolderMap(
                _config.DatabaseObjectTypes.Select(t => (t.Code, t.Folder, t.Order, t.Icon, t.Color)));
            _db_source.SetCatalog(table, folder_map, target.ConnectionString);
            await _tree_host.AttachAsync(_db_source, Application.Current?.Dispatcher, ct)
                .ConfigureAwait(true);
            OnPropertyChanged(nameof(TreeRendering));

            if (!string.IsNullOrWhiteSpace(_filter_text))
                await ApplyTreeFilterAsync(_filter_text, ct).ConfigureAwait(true);

            StatusText = $"{target.Display} · {table.Rows.Count} object(s)";
        }
        catch (OperationCanceledException)
        {
            StatusText = "Đã hủy tải object.";
        }
        catch (Exception ex)
        {
            StatusText = ex.Message;
            if (IdeMessage.IsConnectionFailure(ex))
                IdeMessage.ShowException(ex, "Không tải được object database.");
        }
        finally
        {
            if (generation == _refresh_generation)
                IsBusy = false;
        }
    }

    private int ResolveCommandTimeout()
    {
        var program_timeout = _program_session.Current?.CommandTimeoutSeconds ?? 0;
        if (program_timeout > 0)
            return program_timeout;
        return Math.Max(1, _config.Database.CommandTimeoutSeconds);
    }

    private async Task ApplyTreeFilterAsync(string raw, CancellationToken ct)
    {
        var engine = _tree_host.Engine;
        if (engine is null) return;
        var keyword = raw.Trim();
        if (string.IsNullOrEmpty(keyword)
            || keyword.Length < _config.Database.FilterMinLength)
        {
            engine.ClearSearchFilter();
            return;
        }

        var hits = await _db_source.SearchAsync(keyword, ct).ConfigureAwait(true);
        await engine.ApplySearchMatchesAsync(hits, ct).ConfigureAwait(true);
        StatusText = $"Lọc \"{keyword}\" · {hits.Count} object";
    }
}
