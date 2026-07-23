using System.Collections.ObjectModel;
using System.Windows.Input;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

public enum LogLevel
{
    Info,
    Warning,
    Error
}

public sealed class LogEntryVm : IBottomListItem
{
    public DateTime Time { get; init; } = DateTime.Now;
    public LogLevel Level { get; init; } = LogLevel.Info;
    public string Message { get; init; } = string.Empty;
    public string Source { get; init; } = "IDE";

    /// <summary>Line trong editor (SQL/script) — navigate bổ sung sau; &gt;0 thì cho phép activate.</summary>
    public int Line { get; init; }

    public string TimeText => Time.ToString("HH:mm:ss");

    public string PrimaryText => Message;
    public string SecondaryText => Source;
    public string TrailingText => TimeText;

    public string IconKind => Level switch
    {
        LogLevel.Error => "CloseCircle",
        LogLevel.Warning => "Alert",
        _ => "InformationOutline"
    };

    public string IconBrush => Level switch
    {
        LogLevel.Error => "#C62828",
        LogLevel.Warning => "#F57F17",
        _ => "#455A64"
    };

    /// <summary>Error tô đỏ cả dòng chữ (panel Message).</summary>
    public bool IsError => Level == LogLevel.Error;

    public bool CanNavigate => Line > 0;
    public BottomNavigateTarget? NavigateTarget => CanNavigate
        ? new BottomNavigateTarget { Line = Line }
        : null;
}

/// <summary>Hub Problems / Message (gộp Log+Output) / Search.</summary>
public sealed class IdeDiagnosticsViewModel : ViewModelBase
{
    private const int MaxEntries = 500;
    private readonly IReadOnlyDictionary<string, DiagnosticCatalogEntry> _diagnostics_catalog;
    private Action<IBottomListItem>? _item_activator;
    private int _error_count;
    private int _warning_count;
    private int _hint_count;

    public ObservableCollection<LogEntryVm> MessageEntries { get; } = [];
    public ObservableCollection<ProblemItemVm> Problems { get; } = [];
    public ObservableCollection<BottomListItemVm> SearchResults { get; } = [];

    public BottomPaneVm ProblemsPane { get; }
    public BottomPaneVm MessagePane { get; }
    public BottomPaneVm SearchPane { get; }

    /// <summary>API cũ — redirect Message.</summary>
    public ObservableCollection<LogEntryVm> LogEntries => MessageEntries;
    public ObservableCollection<LogEntryVm> OutputEntries => MessageEntries;

    public int ErrorCount
    {
        get => _error_count;
        private set => SetProperty(ref _error_count, value);
    }

    public int WarningCount
    {
        get => _warning_count;
        private set => SetProperty(ref _warning_count, value);
    }

    public int HintCount
    {
        get => _hint_count;
        private set => SetProperty(ref _hint_count, value);
    }

    public RelayCommand ClearMessageCommand { get; }
    public RelayCommand ClearProblemsCommand { get; }

    public IdeDiagnosticsViewModel(AppConfigStore? app_config = null)
    {
        _diagnostics_catalog = app_config?.DiagnosticsCatalog
            ?? new Dictionary<string, DiagnosticCatalogEntry>();

        ClearProblemsCommand = new RelayCommand(ClearProblems);
        var activate = new RelayCommand<IBottomListItem>(OnActivateItem);

        ProblemsPane = new BottomPaneVm(
            "PROBLEMS", Problems, ClearProblemsCommand, activate, use_severity_filter: true);

        BottomPaneVm message_pane = null!;
        message_pane = new BottomPaneVm(
            "MESSAGE",
            MessageEntries,
            new RelayCommand(() =>
            {
                MessageEntries.Clear();
                RefreshCountBadge(message_pane, 0);
            }),
            activate);
        MessagePane = message_pane;
        ClearMessageCommand = (RelayCommand)message_pane.ClearCommand;

        SearchPane = new BottomPaneVm(
            "SEARCH",
            SearchResults,
            new RelayCommand(ClearSearch),
            activate);

        RefreshProblemBadges();
        RefreshCountBadge(message_pane, 0);
        RefreshCountBadge(SearchPane, 0);

        Info("DevWorkFlow ready.", "Shell");
    }

    public void SetItemActivator(Action<IBottomListItem> activator) =>
        _item_activator = activator;

    public void Info(string message, string source = "IDE") =>
        Add(LogLevel.Info, message, source);

    public void Warn(string message, string source = "IDE") =>
        Add(LogLevel.Warning, message, source);

    public void Error(string message, string source = "IDE", string? file = null, int line = 0) =>
        Add(LogLevel.Error, message, source, line);

    /// <summary>Đổ dòng Message từ SQL run (error → đỏ).</summary>
    public void AppendSqlMessages(IEnumerable<string> lines, bool run_failed, string source = "SQL")
    {
        foreach (var line in lines)
        {
            if (string.IsNullOrWhiteSpace(line)) continue;
            var is_error = run_failed
                || line.Contains("error", StringComparison.OrdinalIgnoreCase)
                || line.Contains("exception", StringComparison.OrdinalIgnoreCase);
            Add(is_error ? LogLevel.Error : LogLevel.Info, line.Trim(), source);
        }
    }

    public void SyncProblems(IEnumerable<ErpDiagnostic> diagnostics, string? default_file = null)
    {
        Problems.Clear();

        foreach (var row in DiagnosticGridMapper.MapProblems(diagnostics, default_file))
        {
            var problem = ProblemItemVm.FromGridRow(row, _diagnostics_catalog);
            Problems.Add(problem);
        }

        var (errors, warnings, hints) = DiagnosticGridMapper.CountBySeverity(diagnostics);
        ErrorCount = errors;
        WarningCount = warnings;
        HintCount = hints;
        RefreshProblemBadges();
    }

    public void ClearProblems()
    {
        Problems.Clear();
        ErrorCount = 0;
        WarningCount = 0;
        HintCount = 0;
        RefreshProblemBadges();
    }

    public void SetSearchResults(IEnumerable<BottomListItemVm> items)
    {
        SearchResults.Clear();
        foreach (var item in items)
            SearchResults.Add(item);
        RefreshCountBadge(SearchPane, SearchResults.Count);
    }

    /// <summary>
    /// Kết quả Find trong editor: mỗi hit = line number + nội dung dòng.
    /// </summary>
    public void SetEditorSearchHits(IEnumerable<(int line, string line_text, string? path)> hits)
    {
        SearchResults.Clear();
        foreach (var (line, line_text, path) in hits)
        {
            SearchResults.Add(new BottomListItemVm
            {
                PrimaryText = line_text.TrimEnd(),
                SecondaryText = string.IsNullOrWhiteSpace(path) ? string.Empty : path,
                TrailingText = line > 0 ? $"Ln {line}" : string.Empty,
                IconKind = "Magnify",
                IconBrush = "#1565C0",
                CanNavigate = line > 0,
                NavigateTarget = new BottomNavigateTarget
                {
                    Path = path,
                    Line = line
                }
            });
        }

        RefreshCountBadge(SearchPane, SearchResults.Count);
    }

    public void ClearSearch()
    {
        SearchResults.Clear();
        RefreshCountBadge(SearchPane, 0);
    }

    private void OnActivateItem(IBottomListItem? item)
    {
        if (item is null || !item.CanNavigate) return;
        _item_activator?.Invoke(item);
    }

    private void RefreshProblemBadges()
    {
        ICommand toggle = new RelayCommand<string>(key => ProblemsPane.ToggleSeverityFilter(key));
        var badges = new[]
        {
            CreateSeverityBadge("CloseCircle", ErrorCount, "E", "#FFEBEE", "#C62828", toggle),
            CreateSeverityBadge("Alert", WarningCount, "W", "#FFF8E1", "#F57F17", toggle),
            CreateSeverityBadge("LightbulbOutline", HintCount, "H", "#E3F2FD", "#1565C0", toggle)
        };
        ProblemsPane.ReplaceBadges(badges);
    }

    private static BottomBadgeVm CreateSeverityBadge(
        string icon,
        int count,
        string severity_key,
        string active_bg,
        string active_fg,
        ICommand toggle)
    {
        var badge = new BottomBadgeVm
        {
            IconKind = icon,
            CountText = count.ToString(),
            SeverityKey = severity_key,
            ActiveBackground = active_bg,
            ActiveForeground = active_fg,
            ToggleCommand = toggle,
            IsFilterActive = true
        };
        badge.ApplyChrome();
        return badge;
    }

    private static void RefreshCountBadge(BottomPaneVm pane, int count)
    {
        if (count <= 0)
        {
            pane.ReplaceBadges([]);
            return;
        }

        var badge = new BottomBadgeVm
        {
            IconKind = "FormatListBulleted",
            CountText = count.ToString(),
            ActiveBackground = "#ECEFF1",
            ActiveForeground = "#455A64",
            IsFilterActive = true
        };
        badge.ApplyChrome();
        pane.ReplaceBadges([badge]);
    }

    private void Add(LogLevel level, string message, string source, int line = 0)
    {
        var entry = new LogEntryVm
        {
            Time = DateTime.Now,
            Level = level,
            Message = message,
            Source = source,
            Line = line
        };
        MessageEntries.Insert(0, entry);
        Trim(MessageEntries);
        RefreshCountBadge(MessagePane, MessageEntries.Count);
    }

    private static void Trim<T>(ObservableCollection<T> list)
    {
        while (list.Count > MaxEntries)
            list.RemoveAt(list.Count - 1);
    }
}
