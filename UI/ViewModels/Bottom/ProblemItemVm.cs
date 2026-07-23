using DevWorkFlow.Application.Language;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>Một dòng trong Problems grid.</summary>
public sealed class ProblemItemVm : ViewModelBase, IBottomListItem
{
    public string Code { get; init; } = string.Empty;
    public required string Description { get; init; }
    public required string File { get; init; }
    public int Line { get; init; }
    public int Column { get; init; }
    public required string Type { get; init; }
    public required string SeverityBadge { get; init; }

    /// <summary>Offset trên source XML — double-click điều hướng chính xác tới vị trí lỗi.</summary>
    public int StartOffset { get; init; }

    /// <summary>File entity liên quan (.ent / SYSTEM) — mở được từ Problems. Null nếu cùng file.</summary>
    public string? RelatedPath { get; init; }

    public string? EntityName { get; init; }

    /// <summary>Gợi ý cách xử lý, tra theo Code trong diagnostics.catalog.xml (rỗng nếu không có mục khớp).</summary>
    public string Resolution { get; init; } = string.Empty;

    public string LocationText => Line > 0
        ? Column > 0 ? $"Ln {Line}, Col {Column}" : $"Ln {Line}"
        : string.Empty;

    public string PrimaryText => Description;

    public string SecondaryText
    {
        get
        {
            var parts = new List<string>();
            if (!string.IsNullOrWhiteSpace(Code))
                parts.Add(Code);
            if (!string.IsNullOrWhiteSpace(Resolution))
                parts.Add(Resolution);
            return string.Join(" — ", parts);
        }
    }

    public bool IsError => SeverityBadge == "E";

    public string TrailingText
    {
        get
        {
            if (string.IsNullOrEmpty(File) && string.IsNullOrEmpty(LocationText))
                return string.Empty;
            if (string.IsNullOrEmpty(LocationText))
                return File;
            if (string.IsNullOrEmpty(File))
                return LocationText;
            return $"{File}  {LocationText}";
        }
    }

    public string IconKind => SeverityBadge switch
    {
        "E" => "CloseCircle",
        "W" => "Alert",
        _ => "LightbulbOutline"
    };

    public string IconBrush => SeverityBadge switch
    {
        "E" => "#C62828",
        "W" => "#F57F17",
        _ => "#1565C0"
    };

    public bool CanNavigate =>
        !string.IsNullOrWhiteSpace(RelatedPath)
        || StartOffset > 0
        || Line > 0;

    public BottomNavigateTarget? NavigateTarget => CanNavigate
        ? new BottomNavigateTarget
        {
            Path = RelatedPath,
            Line = Line,
            Offset = StartOffset
        }
        : null;

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
            Resolution = resolution,
            StartOffset = row.StartOffset,
            RelatedPath = row.RelatedPath,
            EntityName = row.EntityName
        };
    }
}
