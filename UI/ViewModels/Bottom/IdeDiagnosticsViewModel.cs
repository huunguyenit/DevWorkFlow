using System.Collections.ObjectModel;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
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

public sealed class ErrorItemVm
{
    public string Description { get; init; } = string.Empty;
    public string File { get; init; } = string.Empty;
    public int Line { get; init; }
    public string Category { get; init; } = "Error";

    public string Display => Line > 0
        ? $"{Description}  ({File}:{Line})"
        : Description;
}

/// <summary>Hub log/output/problems/references dùng chung Bottom dock.</summary>
public sealed class IdeDiagnosticsViewModel : ViewModelBase
{
    private const int MaxEntries = 500;
    private int _error_count;
    private int _warning_count;
    private int _hint_count;

    public ObservableCollection<LogEntryVm> LogEntries { get; } = [];
    public ObservableCollection<LogEntryVm> OutputEntries { get; } = [];
    public ObservableCollection<ErrorItemVm> Errors { get; } = [];
    public ObservableCollection<ProblemItemVm> Problems { get; } = [];
    public ObservableCollection<ReferenceItemVm> References { get; } = [];

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
    public RelayCommand ClearErrorsCommand { get; }
    public RelayCommand ClearProblemsCommand { get; }

    public IdeDiagnosticsViewModel()
    {
        ClearLogCommand = new RelayCommand(() => LogEntries.Clear());
        ClearOutputCommand = new RelayCommand(() => OutputEntries.Clear());
        ClearErrorsCommand = new RelayCommand(ClearProblems);
        ClearProblemsCommand = new RelayCommand(ClearProblems);
        Info("FBO Studio ready.", "Shell");
    }

    public void Info(string message, string source = "IDE") =>
        Add(LogLevel.Info, message, source, to_output: true);

    public void Warn(string message, string source = "IDE") =>
        Add(LogLevel.Warning, message, source, to_output: true);

    public void Error(string message, string source = "IDE", string? file = null, int line = 0)
    {
        Add(LogLevel.Error, message, source, to_output: true);
        Errors.Insert(0, new ErrorItemVm
        {
            Description = message,
            File = file ?? string.Empty,
            Line = line,
            Category = "Error"
        });
        Trim(Errors);
    }

    public void SyncProblems(IEnumerable<ErpDiagnostic> diagnostics, string? default_file = null)
    {
        Problems.Clear();
        Errors.Clear();

        foreach (var row in DiagnosticGridMapper.MapProblems(diagnostics, default_file))
        {
            var problem = ProblemItemVm.FromGridRow(row);
            Problems.Add(problem);
            if (row.SeverityBadge == "E")
            {
                Errors.Add(new ErrorItemVm
                {
                    Description = row.Description,
                    File = row.File,
                    Line = row.Line,
                    Category = row.Type
                });
            }
        }

        var (errors, warnings, hints) = DiagnosticGridMapper.CountBySeverity(diagnostics);
        ErrorCount = errors;
        WarningCount = warnings;
        HintCount = hints;
    }

    public void SyncReferences(IEnumerable<SymbolReference> references)
    {
        References.Clear();
        foreach (var reference in references)
        {
            References.Add(new ReferenceItemVm
            {
                SymbolId = reference.SymbolId,
                Kind = reference.Kind,
                File = reference.Location.Path,
                Line = reference.Location.Line,
                Column = reference.Location.Column
            });
        }
    }

    public void ClearProblems()
    {
        Problems.Clear();
        Errors.Clear();
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
