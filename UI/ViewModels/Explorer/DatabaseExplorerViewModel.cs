using System.Collections.ObjectModel;
using System.Data;
using System.Windows;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Infrastructure.Services;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>
/// Tree database objects — load SQL async, build tree nền, filter debounce.
/// </summary>
public sealed class DatabaseExplorerViewModel : ViewModelBase, IExplorerTreeSource, IDisposable
{
    private readonly IProgramSession _program_session;
    private readonly ISqlScriptRunner _sql_runner;
    private readonly AppConfigStore _config;
    private readonly DatabaseObjectScripter _scripter;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly DebouncedTreeFilter _filter;
    private readonly Dictionary<string, DatabaseObjectTypeOption> _type_map;

    private SqlConnectionTargetVm? _selected_target;
    private string _status_text = "Chọn Program rồi Refresh để tải object.";
    private string _filter_text = string.Empty;
    private bool _is_busy;
    private CancellationTokenSource? _load_cts;
    private CancellationTokenSource? _click_cts;
    private int _refresh_generation;
    private List<ExplorerTreeFilterEngine.FilterIndexItem> _filter_index = [];
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

        ConnectionTargets = [];
        TreeRoots = [];
        RefreshCommand = new AsyncRelayCommand(() => RefreshAsync(), () => !IsBusy);

        _filter = new DebouncedTreeFilter(
            config.Database.FilterDebounceMs,
            ApplyFilterAsync);

        RebuildConnectionTargets();
    }

    /// <summary>Gọi từ coordinator — rebuild target rồi load catalog.</summary>
    public async Task RefreshAfterProgramChangeAsync(CancellationToken ct = default)
    {
        RebuildConnectionTargets();
        await RefreshAsync(ct);
    }

    public ObservableCollection<SqlConnectionTargetVm> ConnectionTargets { get; }
    public ObservableCollection<ExplorerTreeNodeVm> TreeRoots { get; }

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
            _filter.Schedule(value);
        }
    }

    public string StatusText
    {
        get => _status_text;
        private set => SetProperty(ref _status_text, value);
    }

    public int ActivationDelayMs => 0;

    public bool IsBusy
    {
        get => _is_busy;
        private set => SetProperty(ref _is_busy, value);
    }

    public AsyncRelayCommand RefreshCommand { get; }

    public void OnTreeNodeActivated(ExplorerTreeNodeVm node, bool is_double_click)
    {
        if (node.Tag is not DatabaseObjectTag tag) return;
        if (tag.Kind == DatabaseObjectKind.Folder) return;
        _ = OpenObjectScriptAsync(node, tag, is_double_click);
    }

    private async Task OpenObjectScriptAsync(
        ExplorerTreeNodeVm node,
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
            ? $"Đang sinh script (click 1) {tag.Schema}.{node.Name}…"
            : $"Đang sinh script (click 2) {tag.Schema}.{node.Name}…";

        try
        {
            var built = await _scripter.BuildAsync(
                SelectedTarget.ConnectionString,
                tag.Schema,
                node.Name,
                tag.Kind,
                click,
                ct).ConfigureAwait(true);

            if (built is null)
            {
                StatusText = $"Chưa khai báo action click={click} cho {tag.Kind} trong Config.";
                return;
            }

            var (title, script) = built.Value;
            var buffer_id = $"db:{tag.Kind}:{tag.Schema}.{node.Name}:c{click}";
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
        _filter.Dispose();
        _load_cts?.Cancel();
        _load_cts?.Dispose();
        _click_cts?.Cancel();
        _click_cts?.Dispose();
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
                ConnectionTargets.Add(new SqlConnectionTargetVm
                {
                    Id = "sys",
                    Display = "Sys",
                    ConnectionString = program.SysConnectionString,
                    IsSys = true
                });
            }

            if (program.AppDatabases.Count > 0)
            {
                foreach (var app in program.AppDatabases)
                {
                    var cs = AppConnectionResolver.ResolveAppConnection(program, app.DatabaseName);
                    var label = string.IsNullOrWhiteSpace(app.Code)
                        ? $"App · {app.DatabaseName}"
                        : $"App · {app.Code} · {app.DatabaseName}";
                    ConnectionTargets.Add(new SqlConnectionTargetVm
                    {
                        Id = $"app:{app.Code}:{app.DatabaseName}",
                        Display = label,
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
                ConnectionTargets.Add(new SqlConnectionTargetVm
                {
                    Id = "app:default",
                    Display = string.IsNullOrWhiteSpace(program.AppDatabaseName)
                        ? "App"
                        : $"App · {program.AppDatabaseName}",
                    ConnectionString = program.AppConnectionString,
                    IsSys = false,
                    DatabaseName = program.AppDatabaseName
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

        TreeRoots.Clear();
        _filter_index = [];

        if (_program_session.Current is null)
        {
            StatusText = "Chưa chọn Program.";
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
                command_timeout_seconds: _config.Database.CommandTimeoutSeconds,
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

            var roots = await Task.Run(() => BuildTreeOffline(table), ct).ConfigureAwait(true);
            ct.ThrowIfCancellationRequested();
            if (generation != _refresh_generation) return;

            foreach (var root in roots)
                TreeRoots.Add(root);

            _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);
            if (!string.IsNullOrWhiteSpace(_filter_text))
                await _filter.FlushAsync();

            StatusText = $"{target.Display} · {_filter_index.Count(i => i.ParentIndex >= 0)} object(s)";
        }
        catch (OperationCanceledException)
        {
            StatusText = "Đã hủy tải object.";
        }
        catch (Exception ex)
        {
            StatusText = ex.Message;
        }
        finally
        {
            if (generation == _refresh_generation)
                IsBusy = false;
        }
    }

    private List<ExplorerTreeNodeVm> BuildTreeOffline(DataTable table)
    {
        var folder_map = new Dictionary<string, ExplorerTreeNodeVm>(StringComparer.OrdinalIgnoreCase);
        var folder_order = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);

        foreach (var type in _config.DatabaseObjectTypes)
        {
            if (folder_map.ContainsKey(type.Folder)) continue;
            folder_map[type.Folder] = ExplorerTreeNodeMapper.CreateDatabaseFolder(type.Folder);
            folder_order[type.Folder] = type.Order;
        }

        var show_modified = _config.Database.ShowModifiedDate;
        var buckets = folder_map.Keys.ToDictionary(
            k => k,
            _ => new List<ExplorerTreeNodeVm>(),
            StringComparer.OrdinalIgnoreCase);

        foreach (DataRow row in table.Rows)
        {
            var schema = Convert.ToString(row["schema_name"]) ?? "dbo";
            var name = Convert.ToString(row["object_name"]) ?? string.Empty;
            var type_code = (Convert.ToString(row["object_type"]) ?? string.Empty).Trim();
            if (string.IsNullOrWhiteSpace(name)) continue;
            if (!_type_map.TryGetValue(type_code, out var type_option)) continue;

            DateTime? modified_at = row["modify_date"] is DateTime dt ? dt : null;
            var kind = ExplorerTreeNodeMapper.ParseDatabaseKind(type_option.Kind);
            if (kind == DatabaseObjectKind.Folder) continue;

            var node = ExplorerTreeNodeMapper.CreateDatabaseObject(
                schema, name, kind, modified_at, type_option, show_modified);

            if (!buckets.TryGetValue(type_option.Folder, out var list))
            {
                list = [];
                buckets[type_option.Folder] = list;
                if (!folder_map.ContainsKey(type_option.Folder))
                {
                    folder_map[type_option.Folder] = ExplorerTreeNodeMapper.CreateDatabaseFolder(type_option.Folder);
                    folder_order[type_option.Folder] = type_option.Order;
                }
            }

            list.Add(node);
        }

        var sort_desc = _config.Database.SortByModifiedDesc;
        foreach (var (folder_name, list) in buckets)
        {
            IEnumerable<ExplorerTreeNodeVm> ordered = sort_desc
                ? list.OrderByDescending(c => c.ModifiedAt ?? DateTime.MinValue)
                    .ThenBy(c => c.Name, StringComparer.OrdinalIgnoreCase)
                : list.OrderBy(c => c.Name, StringComparer.OrdinalIgnoreCase);

            var folder = folder_map[folder_name];
            foreach (var item in ordered)
                folder.Children.Add(item);
        }

        return folder_map
            .OrderBy(kv => folder_order.GetValueOrDefault(kv.Key, 99))
            .ThenBy(kv => kv.Key, StringComparer.OrdinalIgnoreCase)
            .Select(kv => kv.Value)
            .Where(f => f.Children.Count > 0)
            .ToList();
    }

    private async Task ApplyFilterAsync(string raw, CancellationToken ct)
    {
        var keyword = raw.Trim();
        var min_len = _config.Database.FilterMinLength;
        if (!string.IsNullOrEmpty(keyword) && keyword.Length < min_len)
            return;

        if (_filter_index.Count == 0)
            _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);

        var index = _filter_index;
        var visible = await Task.Run(
            () => ExplorerTreeFilterEngine.CalculateVisibility(index, keyword, ct),
            ct).ConfigureAwait(true);

        ct.ThrowIfCancellationRequested();
        await ExplorerTreeFilterEngine.ApplyVisibilityAsync(
            index,
            visible,
            keyword,
            batch_size: _config.Database.BatchUiSize,
            expand_matches: !string.IsNullOrEmpty(keyword),
            ct);

        var match_leaves = 0;
        for (var i = 0; i < index.Count; i++)
        {
            if (index[i].ParentIndex >= 0 && visible[i])
                match_leaves++;
        }

        StatusText = string.IsNullOrEmpty(keyword)
            ? $"{SelectedTarget?.Display} · {match_leaves} object(s)"
            : $"Lọc \"{keyword}\" · {match_leaves} object(s)";
    }
}
