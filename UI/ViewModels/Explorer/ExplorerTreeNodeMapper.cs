using System.IO;
using System.Windows.Media;
using DevWorkFlow.Domain.Models;
using UI.Services;

namespace UI.ViewModels.Explorer;

public sealed class ExplorerFileTag
{
    public required string FullPath { get; init; }
    public bool IsDirectory { get; init; }
    public ExplorerNodeKind Kind { get; init; }
    public int Depth { get; init; }

    public ControllerFileKind? ToControllerKind() => Kind switch
    {
        ExplorerNodeKind.XmlForm or ExplorerNodeKind.Dir => ControllerFileKind.Dir,
        ExplorerNodeKind.XmlGrid or ExplorerNodeKind.Grid => ControllerFileKind.Grid,
        ExplorerNodeKind.XmlFilter or ExplorerNodeKind.Filter => ControllerFileKind.Filter,
        ExplorerNodeKind.XmlLookup or ExplorerNodeKind.Lookup => ControllerFileKind.Lookup,
        ExplorerNodeKind.XmlReport or ExplorerNodeKind.Report => ControllerFileKind.Report,
        ExplorerNodeKind.Aspx => ControllerFileKind.Aspx,
        ExplorerNodeKind.Encrypted => GuessEncryptedKind(),
        _ => ControllerFileKind.Other
    };

    private ControllerFileKind GuessEncryptedKind()
    {
        var parent = Path.GetFileName(Path.GetDirectoryName(FullPath) ?? string.Empty);
        return parent.ToLowerInvariant() switch
        {
            "dir" => ControllerFileKind.Dir,
            "grid" => ControllerFileKind.Grid,
            "filter" => ControllerFileKind.Filter,
            "lookup" => ControllerFileKind.Lookup,
            "report" => ControllerFileKind.Report,
            _ => ControllerFileKind.Other
        };
    }
}

public sealed class DatabaseObjectTag
{
    public required string Schema { get; init; }
    public required DatabaseObjectKind Kind { get; init; }
}

public enum DatabaseObjectKind
{
    Folder,
    Table,
    View,
    Function,
    Procedure
}

public enum ExplorerNodeKind
{
    Project,
    Folder,
    Controllers,
    Dir,
    Grid,
    Filter,
    Lookup,
    Report,
    Include,
    XmlForm,
    XmlGrid,
    XmlFilter,
    XmlLookup,
    XmlReport,
    Encrypted,
    Aspx,
    Script,
    Css,
    Image,
    OtherFile
}

/// <summary>Helpers còn dùng sau khi UI chuyển sang DevWorkFlow.Tree.</summary>
public static class ExplorerTreeNodeMapper
{
    public static ExplorerNodeKind ParseFolderKind(string kind_name) =>
        Enum.TryParse<ExplorerNodeKind>(kind_name, ignoreCase: true, out var kind)
            ? kind
            : ExplorerNodeKind.Folder;

    public static DatabaseObjectKind ParseDatabaseKind(string kind_name) =>
        Enum.TryParse<DatabaseObjectKind>(kind_name, ignoreCase: true, out var kind)
            ? kind
            : DatabaseObjectKind.Folder;

    public static Brush FreezeBrush(string hex, Brush fallback)
    {
        try
        {
            var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
            brush.Freeze();
            return brush;
        }
        catch
        {
            return fallback;
        }
    }
}
