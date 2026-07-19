using DevWorkFlow.Application.Language;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>Một dòng trong Problems grid.</summary>
public sealed class ProblemItemVm : ViewModelBase
{
    public string Code { get; init; } = string.Empty;
    public required string Description { get; init; }
    public required string File { get; init; }
    public int Line { get; init; }
    public int Column { get; init; }
    public required string Type { get; init; }
    public required string SeverityBadge { get; init; }

    /// <summary>Gợi ý cách xử lý, tra theo Code trong diagnostics.catalog.xml (rỗng nếu không có mục khớp).</summary>
    public string Resolution { get; init; } = string.Empty;

    public string LocationText => Line > 0
        ? Column > 0 ? $"Ln {Line}, Col {Column}" : $"Ln {Line}"
        : string.Empty;

    public static ProblemItemVm FromGridRow(
        DiagnosticGridRow row,
        IReadOnlyDictionary<string, DiagnosticCatalogEntry>? catalog = null)
    {
        var resolution = string.Empty;
        if (!string.IsNullOrWhiteSpace(row.Code)
            && catalog is not null
            && catalog.TryGetValue(row.Code, out var entry))
            resolution = entry.Resolution;

        return new ProblemItemVm
        {
            Code = row.Code,
            Description = row.Description,
            File = row.File,
            Line = row.Line,
            Column = row.Column,
            Type = row.Type,
            SeverityBadge = row.SeverityBadge,
            Resolution = resolution
        };
    }
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
