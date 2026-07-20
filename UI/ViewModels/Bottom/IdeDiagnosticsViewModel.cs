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

public sealed class LogEntryVm
{
    public DateTime Time { get; init; } = DateTime.Now;
    public LogLevel Level { get; init; } = LogLevel.Info;
    public string Message { get; init; } = string.Empty;
    public string Source { get; init; } = "IDE";

    public string TimeText => Time.ToString("HH:mm:ss");
    public string LevelText => Level.ToString().ToUpperInvariant();
    public string Display => $"[{TimeText}] {LevelText}: {Message}";
}

/// <summary>Hub log/output/problems dùng chung Bottom dock.</summary>
public sealed class IdeDiagnosticsViewModel : ViewModelBase
{
    private const int MaxEntries = 500;
    private readonly IReadOnlyDictionary<string, DiagnosticCatalogEntry> _diagnostics_catalog;
    private int _error_count;
    private int _warning_count;
    private int _hint_count;

    public ObservableCollection<LogEntryVm> LogEntries { get; } = [];
    public ObservableCollection<LogEntryVm> OutputEntries { get; } = [];
    public ObservableCollection<ProblemItemVm> Problems { get; } = [];

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
        ClearLogCommand = new RelayCommand(() => LogEntries.Clear());
        ClearOutputCommand = new RelayCommand(() => OutputEntries.Clear());
        ClearProblemsCommand = new RelayCommand(ClearProblems);
        Info("DevWorkFlow ready.", "Shell");
    }

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
    }

    public void ClearProblems()
    {
        Problems.Clear();
        ErrorCount = 0;
        WarningCount = 0;
        HintCount = 0;
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
        if (to_output)
        {
            OutputEntries.Insert(0, entry);
            Trim(OutputEntries);
        }
    }

    private static void Trim<T>(ObservableCollection<T> list)
    {
        while (list.Count > MaxEntries)
            list.RemoveAt(list.Count - 1);
    }
}
