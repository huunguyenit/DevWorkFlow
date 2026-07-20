using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>Map ErpDiagnostic → hàng grid Problems (UI-agnostic).</summary>
public sealed class DiagnosticGridRow
{
    /// <summary>Mã ổn định (ví dụ ERP3001) — dùng để tra cứu diagnostics.catalog.xml.</summary>
    public string Code { get; init; } = string.Empty;
    public string Description { get; init; } = string.Empty;
    public string File { get; init; } = string.Empty;
    public int Line { get; init; }
    public int Column { get; init; }
    public string Type { get; init; } = "Info";
    public string SeverityBadge { get; init; } = "H";

    /// <summary>Offset trên source XML — điều hướng chính xác hơn Line/Column.</summary>
    public int StartOffset { get; init; }

    /// <summary>File entity liên quan (.ent / SYSTEM) — mở được từ Problems. Null nếu cùng file.</summary>
    public string? RelatedPath { get; init; }

    public string? EntityName { get; init; }
}

public static class DiagnosticGridMapper
{
    public static IReadOnlyList<DiagnosticGridRow> MapProblems(
        IEnumerable<ErpDiagnostic> diagnostics,
        string? default_file = null)
    {
        var rows = new List<DiagnosticGridRow>();
        foreach (var diagnostic in diagnostics)
        {
            if (diagnostic.Severity == ErpDiagnosticSeverity.Hidden)
                continue;

            var (badge, type) = diagnostic.Severity switch
            {
                ErpDiagnosticSeverity.Error => ("E", "Error"),
                ErpDiagnosticSeverity.Warning => ("W", "Warning"),
                _ => ("H", "Hint")
            };

            var file = string.IsNullOrWhiteSpace(diagnostic.Location.Path)
                ? default_file ?? string.Empty
                : diagnostic.Location.Path;

            rows.Add(new DiagnosticGridRow
            {
                Code = diagnostic.Id,
                Description = diagnostic.Message,
                File = file,
                Line = diagnostic.Location.Line,
                Column = diagnostic.Location.Column,
                Type = type,
                SeverityBadge = badge,
                StartOffset = diagnostic.Location.Span.StartOffset,
                RelatedPath = diagnostic.RelatedPath,
                EntityName = diagnostic.EntityName
            });
        }

        return rows;
    }

    public static (int Errors, int Warnings, int Hints) CountBySeverity(
        IEnumerable<ErpDiagnostic> diagnostics)
    {
        var errors = 0;
        var warnings = 0;
        var hints = 0;
        foreach (var diagnostic in diagnostics)
        {
            switch (diagnostic.Severity)
            {
                case ErpDiagnosticSeverity.Error:
                    errors++;
                    break;
                case ErpDiagnosticSeverity.Warning:
                    warnings++;
                    break;
                case ErpDiagnosticSeverity.Info:
                    hints++;
                    break;
            }
        }

        return (errors, warnings, hints);
    }
}
