using DevWorkFlow.Application.Language;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>Một dòng trong Problems grid.</summary>
public sealed class ProblemItemVm : ViewModelBase
{
    public required string Description { get; init; }
    public required string File { get; init; }
    public int Line { get; init; }
    public int Column { get; init; }
    public required string Type { get; init; }
    public required string SeverityBadge { get; init; }

    public string LocationText => Line > 0
        ? Column > 0 ? $"Ln {Line}, Col {Column}" : $"Ln {Line}"
        : string.Empty;

    public static ProblemItemVm FromGridRow(DiagnosticGridRow row) =>
        new()
        {
            Description = row.Description,
            File = row.File,
            Line = row.Line,
            Column = row.Column,
            Type = row.Type,
            SeverityBadge = row.SeverityBadge
        };
}

public sealed class ReferenceItemVm
{
    public string SymbolId { get; init; } = string.Empty;
    public string Kind { get; init; } = string.Empty;
    public string File { get; init; } = string.Empty;
    public int Line { get; init; }
    public int Column { get; init; }

    public string Display => Line > 0
        ? $"{Kind}  {File}:{Line}"
        : Kind;
}
