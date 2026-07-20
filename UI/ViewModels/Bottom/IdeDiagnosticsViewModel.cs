using System.Collections.ObjectModel;
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

    public string TimeText => Time.ToString("HH:mm:ss");
    public string LevelText => Level.ToString().ToUpperInvariant();
    public string Display => $"[{TimeText}] {LevelText}: {Message}";

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
        _ => "#555555"
    };

    public bool CanNavigate => false;
    public BottomNavigateTarget? NavigateTarget => null;
}

/// <summary>Hub log/output/problems/search dùng chung Bottom dock.</summary>
public sealed class IdeDiagnosticsViewModel : ViewModelBase
{
    private const int MaxEntries = 500;
    private readonly IReadOnlyDictionary<string, DiagnosticCatalogEntry> _diagnostics_catalog;
    private Action<IBottomListItem>? _item_activator;
    private int _error_count;
    private int _warning_count;
    private int _hint_count;

    public ObservableCollection<LogEntryVm> LogEntries { get; } = [];
    public ObservableCollection<LogEntryVm> OutputEntries { get; } = [];
    public ObservableCollection<ProblemItemVm> Problems { get; } = [];
    public ObservableCollection<BottomListItemVm> SearchResults { get; } = [];

    public BottomPaneVm ProblemsPane { get; }
    public BottomPaneVm OutputPane { get; }
    public BottomPaneVm LogPane { get; }
    public BottomPaneVm SearchPane { get; }

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

    public RelayCommand ClearLogCommand { get; }
    public RelayCommand ClearOutputCommand { get; }
    public RelayCommand ClearProblemsCommand { get; }

    public IdeDiagnosticsViewModel(AppConfigStore? app_config = null)
    {
        _diagnostics_catalog = app_config?.DiagnosticsCatalog
            ?? new Dictionary<string, DiagnosticCatalogEntry>();

        ClearLogCommand = new RelayCommand(() =>
        {
            LogEntries.Clear();
            RefreshCountBadge(LogPane, 0);
        });
        ClearOutputCommand = new RelayCommand(() =>
        {
            OutputEntries.Clear();
            RefreshCountBadge(OutputPane, 0);
        });
        ClearProblemsCommand = new RelayCommand(ClearProblems);

        var activate = new RelayCommand<IBottomListItem>(OnActivateItem);

        ProblemsPane = new BottomPaneVm("PROBLEMS", Problems, ClearProblemsCommand, activate);
        OutputPane = new BottomPaneVm("OUTPUT", OutputEntries, ClearOutputCommand, activate);
        LogPane = new BottomPaneVm("LOG", LogEntries, ClearLogCommand, activate);
        SearchPane = new BottomPaneVm(
            "SEARCH",
            SearchResults,
            new RelayCommand(ClearSearch),
            activate);

        RefreshProblemBadges();
        RefreshCountBadge(OutputPane, OutputEntries.Count);
        RefreshCountBadge(LogPane, LogEntries.Count);
        RefreshCountBadge(SearchPane, 0);

        Info("DevWorkFlow ready.", "Shell");
    }

    public void SetItemActivator(Action<IBottomListItem> activator) =>
        _item_activator = activator;

    public void Info(string message, string source = "IDE") =>
        Add(LogLevel.Info, message, source, to_output: true);

    public void Warn(string message, string source = "IDE") =>
        Add(LogLevel.Warning, message, source, to_output: true);

    public void Error(string message, string source = "IDE", string? file = null, int line = 0) =>
        Add(LogLevel.Error, message, source, to_output: true);

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
        ProblemsPane.ReplaceBadges(
        [
            new BottomBadgeVm
            {
                IconKind = "CloseCircle",
                CountText = ErrorCount.ToString(),
                Background = "#FFEBEE",
                Foreground = "#C62828"
            },
            new BottomBadgeVm
            {
                IconKind = "Alert",
                CountText = WarningCount.ToString(),
                Background = "#FFF8E1",
                Foreground = "#F57F17"
            },
            new BottomBadgeVm
            {
                IconKind = "LightbulbOutline",
                CountText = HintCount.ToString(),
                Background = "#E3F2FD",
                Foreground = "#1565C0"
            }
        ]);
    }

    private static void RefreshCountBadge(BottomPaneVm pane, int count)
    {
        if (count <= 0)
        {
            pane.ReplaceBadges([]);
            return;
        }

        pane.ReplaceBadges(
        [
            new BottomBadgeVm
            {
                IconKind = "FormatListBulleted",
                CountText = count.ToString(),
                Background = "#ECEFF1",
                Foreground = "#455A64"
            }
        ]);
    }

    private void Add(LogLevel level, string message, string source, bool to_output)
    {
        var entry = new LogEntryVm
        {
            Time = DateTime.Now,
            Level = level,
            Message = message,
            Source = source
        };
        LogEntries.Insert(0, entry);
        Trim(LogEntries);
        RefreshCountBadge(LogPane, LogEntries.Count);
        if (to_output)
        {
            OutputEntries.Insert(0, entry);
            Trim(OutputEntries);
            RefreshCountBadge(OutputPane, OutputEntries.Count);
        }
    }

    private static void Trim<T>(ObservableCollection<T> list)
    {
        while (list.Count > MaxEntries)
            list.RemoveAt(list.Count - 1);
    }
}
