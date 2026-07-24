using System.Collections.ObjectModel;
using System.Data;
using System.IO;
using System.Windows;
using System.Windows.Input;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Domain.Models.Sql;
using DevWorkFlow.Infrastructure.Services;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels;

/// <summary>Một document SQL Studio (file .sql hoặc buffer trích từ XML).</summary>
public sealed class SqlDocumentViewModel : ViewModelBase
{
    private readonly ISqlScriptRunner _runner;
    private readonly IProgramSession _program_session;

    private string _script_text = string.Empty;
    private string _baseline_text = string.Empty;
    private string _selected_script = string.Empty;
    private string? _file_path;
    private string _title = "SQL";
    private bool _is_dirty;
    private bool _is_busy;
    private SqlConnectionTargetVm? _selected_target;
    private string _messages_text = string.Empty;
    private DataView? _selected_result_view;
    private SqlResultSetVm? _selected_result_set;
    private string _status = "Ready";
    private CancellationTokenSource? _run_cts;
    private string _result_filter = string.Empty;
    private string _result_focus_status = string.Empty;

    public SqlDocumentViewModel(ISqlScriptRunner runner, IProgramSession program_session)
    {
        _runner = runner;
        _program_session = program_session;
        _program_session.ProgramChanged += (_, _) => RebuildConnectionTargets();
        _program_session.ProgramUpdated += (_, _) => RebuildConnectionTargets();

        ExecuteCommand = new AsyncRelayCommand(ExecuteAsync, () => !IsBusy && !string.IsNullOrWhiteSpace(ScriptToRun));
        CancelCommand = new RelayCommand(CancelExecute, () => IsBusy);
        SaveCommand = new RelayCommand(Save, () => IsDirty && HasDiskFile);

        RebuildConnectionTargets();
    }

    public ObservableCollection<SqlResultSetVm> ResultSets { get; } = [];
    public ObservableCollection<SqlConnectionTargetVm> ConnectionTargets { get; } = [];

    public string ScriptText
    {
        get => _script_text;
        set
        {
            if (!SetProperty(ref _script_text, value ?? string.Empty)) return;
            IsDirty = !string.Equals(_script_text, _baseline_text, StringComparison.Ordinal);
            CommandManager.InvalidateRequerySuggested();
            OnPropertyChanged(nameof(ScriptToRun));
            OnPropertyChanged(nameof(HasSelection));
            OnPropertyChanged(nameof(ExecuteButtonLabel));
        }
    }

    /// <summary>Vùng bôi đen trong editor — nếu có thì F5 chạy vùng này.</summary>
    public string SelectedScript
    {
        get => _selected_script;
        set
        {
            if (!SetProperty(ref _selected_script, value ?? string.Empty)) return;
            CommandManager.InvalidateRequerySuggested();
            OnPropertyChanged(nameof(ScriptToRun));
            OnPropertyChanged(nameof(HasSelection));
            OnPropertyChanged(nameof(ExecuteButtonLabel));
        }
    }

    public bool HasSelection => !string.IsNullOrWhiteSpace(SelectedScript);

    public string ScriptToRun =>
        HasSelection ? SelectedScript.Trim() : ScriptText;

    public string ExecuteButtonLabel => HasSelection ? "Execute selection" : "Execute";

    public string? FilePath
    {
        get => _file_path;
        private set
        {
            if (!SetProperty(ref _file_path, value)) return;
            OnPropertyChanged(nameof(HasDiskFile));
        }
    }

    public bool HasDiskFile =>
        !string.IsNullOrWhiteSpace(FilePath)
        && !FilePath.StartsWith("sql://", StringComparison.OrdinalIgnoreCase);

    public string Title
    {
        get => _title;
        private set => SetProperty(ref _title, value);
    }

    public bool IsDirty
    {
        get => _is_dirty;
        private set => SetProperty(ref _is_dirty, value);
    }

    public bool IsBusy
    {
        get => _is_busy;
        private set
        {
            if (!SetProperty(ref _is_busy, value)) return;
            CommandManager.InvalidateRequerySuggested();
        }
    }

    public SqlConnectionTargetVm? SelectedTarget
    {
        get => _selected_target;
        set
        {
            if (!SetProperty(ref _selected_target, value)) return;
            OnPropertyChanged(nameof(TargetDbLabel));
            SyncProgramAppIfNeeded();
        }
    }

    public string TargetDbLabel => SelectedTarget?.Display ?? "(chưa chọn)";

    public string MessagesText
    {
        get => _messages_text;
        private set => SetProperty(ref _messages_text, value);
    }

    public DataView? SelectedResultView
    {
        get => _selected_result_view;
        private set => SetProperty(ref _selected_result_view, value);
    }

    /// <summary>Lọc mọi cột (substring, case-insensitive) trên DataView.</summary>
    public string ResultFilter
    {
        get => _result_filter;
        set
        {
            if (!SetProperty(ref _result_filter, value ?? string.Empty)) return;
            ApplyResultFilter();
        }
    }

    /// <summary>Status bar Result: Row # / Col name (index).</summary>
    public string ResultFocusStatus
    {
        get => _result_focus_status;
        private set => SetProperty(ref _result_focus_status, value);
    }

    public string ResultSummary
    {
        get
        {
            var table = SelectedResultSet?.Table;
            if (table is null) return string.Empty;
            return $"{table.Rows.Count} dòng × {table.Columns.Count} cột";
        }
    }

    public SqlResultSetVm? SelectedResultSet
    {
        get => _selected_result_set;
        set
        {
            if (!SetProperty(ref _selected_result_set, value)) return;
            SelectedResultView = value?.Table.DefaultView;
            ResultFilter = string.Empty;
            OnPropertyChanged(nameof(ResultSummary));
            ApplyResultFilter();
            ResultFocusStatus = ResultSummary;
        }
    }

    public void NotifyResultCellFocused(int row_index_1based, string? column_name, int column_index_1based)
    {
        if (row_index_1based <= 0)
        {
            ResultFocusStatus = ResultSummary;
            return;
        }

        var col = string.IsNullOrEmpty(column_name)
            ? $"Col #{column_index_1based}"
            : $"{column_name} (#{column_index_1based})";
        ResultFocusStatus = $"Row #{row_index_1based}  ·  {col}  ·  {ResultSummary}";
    }

    private void ApplyResultFilter()
    {
        var view = SelectedResultView;
        if (view is null) return;

        try
        {
            if (string.IsNullOrWhiteSpace(ResultFilter))
            {
                view.RowFilter = string.Empty;
                return;
            }

            var table = view.Table;
            if (table is null || table.Columns.Count == 0)
            {
                view.RowFilter = string.Empty;
                return;
            }

            var escaped = ResultFilter.Replace("'", "''");
            var parts = new List<string>();
            foreach (DataColumn col in table.Columns)
            {
                // Convert tất cả sang string để lọc substring.
                parts.Add($"Convert([{col.ColumnName}], 'System.String') LIKE '%{escaped}%'");
            }

            view.RowFilter = string.Join(" OR ", parts);
        }
        catch
        {
            view.RowFilter = string.Empty;
        }
    }

    public string Status
    {
        get => _status;
        private set => SetProperty(ref _status, value);
    }

    public AsyncRelayCommand ExecuteCommand { get; }
    public RelayCommand CancelCommand { get; }
    public RelayCommand SaveCommand { get; }

    public void Initialize(string title, string text, string? file_path)
    {
        Title = title;
        FilePath = file_path;
        _baseline_text = text ?? string.Empty;
        _script_text = _baseline_text;
        _selected_script = string.Empty;
        OnPropertyChanged(nameof(ScriptText));
        OnPropertyChanged(nameof(SelectedScript));
        OnPropertyChanged(nameof(ScriptToRun));
        OnPropertyChanged(nameof(HasSelection));
        OnPropertyChanged(nameof(ExecuteButtonLabel));
        IsDirty = false;
        ClearResults();
        RebuildConnectionTargets();
        Status = HasDiskFile ? file_path! : "Buffer (chưa gắn file)";
    }

    /// <summary>Ghi đè nội dung tab SQL hiện tại (script object từ Database panel).</summary>
    public void ReplaceScript(string title, string text)
    {
        Title = title;
        var body = text ?? string.Empty;
        _selected_script = string.Empty;

        if (!HasDiskFile)
        {
            _baseline_text = body;
            _script_text = body;
            IsDirty = false;
            Status = "Buffer (chưa gắn file)";
        }
        else
        {
            _script_text = body;
            IsDirty = !string.Equals(_script_text, _baseline_text, StringComparison.Ordinal);
            Status = FilePath!;
        }

        OnPropertyChanged(nameof(ScriptText));
        OnPropertyChanged(nameof(SelectedScript));
        OnPropertyChanged(nameof(ScriptToRun));
        OnPropertyChanged(nameof(HasSelection));
        OnPropertyChanged(nameof(ExecuteButtonLabel));
        ClearResults();
        CommandManager.InvalidateRequerySuggested();
    }

    public void TrySelectTarget(string? target_id)
    {
        if (string.IsNullOrWhiteSpace(target_id)) return;
        var match = ConnectionTargets.FirstOrDefault(t =>
            string.Equals(t.Id, target_id, StringComparison.OrdinalIgnoreCase));
        if (match is not null)
            SelectedTarget = match;
    }

    /// <summary>
    /// Chọn connection theo CSDL của controller (Phase 5): <c>@database="Sys"</c> → target Sys,
    /// còn lại → target App đầu tiên. Không có target phù hợp thì giữ nguyên lựa chọn hiện tại.
    /// </summary>
    public void TrySelectTargetKind(DevWorkFlow.Domain.Language.ControllerDatabaseKind kind)
    {
        var want_sys = kind == DevWorkFlow.Domain.Language.ControllerDatabaseKind.Sys;
        var match = ConnectionTargets.FirstOrDefault(t => t.IsSys == want_sys);
        if (match is not null)
            SelectedTarget = match;
    }

    /// <summary>Chạy script ngay sau khi mở tab (F5 từ Form Source).</summary>
    public void ExecuteAfterOpen()
    {
        if (ExecuteCommand.CanExecute(null))
            ExecuteCommand.Execute(null);
    }

    public void Save()
    {
        if (!HasDiskFile || string.IsNullOrWhiteSpace(FilePath))
        {
            IdeMessage.Info(
                "Buffer SQL từ XML chưa gắn file disk. Dùng Save As ở bước sau — không ghi đè XML.",
                "SQL Studio");
            return;
        }

        try
        {
            File.WriteAllText(FilePath, ScriptText);
            _baseline_text = ScriptText;
            IsDirty = false;
            Status = $"Saved: {FilePath}";
        }
        catch (Exception ex)
        {
            IdeMessage.Danger(ex.Message, "SQL Studio — Save");
        }
    }

    private void RebuildConnectionTargets()
    {
        var prev_id = SelectedTarget?.Id;
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

        var has_app = ConnectionTargets.Any(t => !t.IsSys);

        // Mặc định App; không giữ Sys khi đã có App.
        SqlConnectionTargetVm? pick = null;
        if (!string.IsNullOrWhiteSpace(prev_id))
        {
            var prev = ConnectionTargets.FirstOrDefault(t => t.Id == prev_id);
            if (prev is not null && !(has_app && prev.IsSys))
                pick = prev;
        }

        if (pick is null && !string.IsNullOrWhiteSpace(program.AppDatabaseName))
            pick = ConnectionTargets.FirstOrDefault(t =>
                !t.IsSys
                && string.Equals(t.DatabaseName, program.AppDatabaseName, StringComparison.OrdinalIgnoreCase));

        SelectedTarget = pick
                         ?? ConnectionTargets.FirstOrDefault(t => !t.IsSys)
                         ?? ConnectionTargets.FirstOrDefault();
    }

    private void SyncProgramAppIfNeeded()
    {
        if (SelectedTarget is null || SelectedTarget.IsSys) return;
        var program = _program_session.Current;
        if (program is null) return;
        if (!string.IsNullOrWhiteSpace(SelectedTarget.DatabaseName))
            program.AppDatabaseName = SelectedTarget.DatabaseName;
        if (!string.IsNullOrWhiteSpace(SelectedTarget.ConnectionString))
            program.AppConnectionString = SelectedTarget.ConnectionString;
    }

    private async Task ExecuteAsync()
    {
        var program = _program_session.Current;
        if (program is null)
        {
            MessagesText = "Chưa chọn Program.";
            Status = "No Program";
            return;
        }

        if (SelectedTarget is null || string.IsNullOrWhiteSpace(SelectedTarget.ConnectionString))
        {
            MessagesText = "Chưa chọn target (Sys / App). Mở lại Program nếu danh sách trống.";
            Status = "No target";
            return;
        }

        var cs = SelectedTarget.ConnectionString;
        if (cs.Contains("%Database", StringComparison.OrdinalIgnoreCase))
        {
            MessagesText = "appConnectionString còn %Database — chưa resolve từ sys.entity.cdata. Mở lại Program.";
            Status = "Unresolved %Database";
            return;
        }

        var script = ScriptToRun;
        if (string.IsNullOrWhiteSpace(script))
        {
            MessagesText = "Không có SQL để chạy.";
            Status = "Empty";
            return;
        }

        _run_cts?.Cancel();
        _run_cts = new CancellationTokenSource();
        var ct = _run_cts.Token;

        IsBusy = true;
        var scope = HasSelection ? "selection" : "script";
        Status = $"Running {scope} on {SelectedTarget.Display}…";
        ClearResults();
        MessagesText = string.Empty;

        try
        {
            var command_timeout = program.CommandTimeoutSeconds > 0
                ? program.CommandTimeoutSeconds
                : 60;
            var result = await _runner.ExecuteAsync(cs, script, command_timeout, ct);
            MessagesText = string.Join(Environment.NewLine, result.Messages);
            foreach (var set in result.ResultSets)
                ResultSets.Add(new SqlResultSetVm(set.Title, set.Table));

            SelectedResultSet = ResultSets.FirstOrDefault();
            Status = result.Succeeded
                ? $"OK · {scope} · {SelectedTarget.Display} · {result.Elapsed.TotalSeconds:0.###}s · {ResultSets.Count} set(s)"
                : $"Error · {result.ErrorMessage}";

            // Lỗi thì gộp vào Message để panel dưới hiện được nguyên nhân, không chỉ Status bar.
            if (!result.Succeeded && !string.IsNullOrWhiteSpace(result.ErrorMessage))
            {
                MessagesText = string.IsNullOrWhiteSpace(MessagesText)
                    ? result.ErrorMessage!
                    : $"{result.ErrorMessage}{Environment.NewLine}{MessagesText}";
            }

            ExecutionCompleted?.Invoke(this, result.Succeeded);
        }
        finally
        {
            IsBusy = false;
            _run_cts = null;
        }
    }

    /// <summary>
    /// Bắn sau mỗi lần chạy xong (true = thành công). Shell dùng để đưa panel dưới về đúng tab:
    /// thành công → Result, lỗi → Message.
    /// </summary>
    public event EventHandler<bool>? ExecutionCompleted;

    private void CancelExecute()
    {
        _run_cts?.Cancel();
        Status = "Cancelling…";
    }

    private void ClearResults()
    {
        ResultSets.Clear();
        SelectedResultSet = null;
        SelectedResultView = null;
    }
}

/// <summary>Một mục trong combobox target: Sys hoặc một App DB.</summary>
public sealed class SqlConnectionTargetVm
{
    public required string Id { get; init; }
    public required string Display { get; init; }
    public required string ConnectionString { get; init; }
    public bool IsSys { get; init; }
    public string? Code { get; init; }
    public string? DatabaseName { get; init; }
}

public sealed class SqlResultSetVm
{
    public SqlResultSetVm(string title, DataTable table)
    {
        Title = title;
        Table = table;
    }

    public string Title { get; }
    public DataTable Table { get; }
    public string Header => $"{Title} ({Table.Rows.Count})";
}
