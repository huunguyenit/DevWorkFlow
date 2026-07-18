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

public static class ExplorerTreeNodeMapper
{
    private static readonly Brush BrushMuted = Freeze("#6B6B6B");

    public static ExplorerTreeNodeVm CreateFileNode(
        string name,
        string full_path,
        bool is_directory,
        ExplorerNodeKind kind,
        ExplorerOptions options)
    {
        var tag = new ExplorerFileTag
        {
            FullPath = full_path,
            IsDirectory = is_directory,
            Kind = kind
        };

        var node = new ExplorerTreeNodeVm
        {
            Name = name,
            DisplayText = name,
            SearchKey = name,
            IconKind = is_directory ? options.FolderIcon : options.FileIcon,
            IconForeground = is_directory ? options.FolderBrush : options.FileBrush,
            Badge = null,
            Tooltip = full_path,
            Tag = tag,
            ChildrenLoaded = !is_directory
        };

        // Placeholder để TreeView hiện expander — folder trống Children sẽ không sổ được.
        if (is_directory)
            node.Children.Add(CreateLoadingPlaceholder());

        return node;
    }

    public static ExplorerTreeNodeVm CreateLoadingPlaceholder() =>
        new()
        {
            Name = ".",
            DisplayText = "…",
            SearchKey = string.Empty,
            IconKind = "DotsHorizontal",
            IconForeground = BrushMuted,
            Tooltip = string.Empty,
            Tag = null,
            ChildrenLoaded = true,
            IsVisible = false
        };

    public static bool IsLoadingPlaceholder(ExplorerTreeNodeVm? node) =>
        node is { Tag: null, Name: "." };

    public static ExplorerTreeNodeVm CreateDatabaseFolder(string name) =>
        new()
        {
            Name = name,
            DisplayText = name,
            SearchKey = name,
            IconKind = "FolderOutline",
            IconForeground = BrushMuted,
            Tooltip = name,
            IsExpanded = false,
            ChildrenLoaded = true
        };

    public static ExplorerTreeNodeVm CreateDatabaseObject(
        string schema,
        string name,
        DatabaseObjectKind kind,
        DateTime? modified_at,
        DatabaseObjectTypeOption? type_option,
        bool show_modified)
    {
        var display = string.IsNullOrWhiteSpace(schema) ? name : $"{schema}.{name}";
        return new ExplorerTreeNodeVm
        {
            Name = name,
            DisplayText = display,
            SearchKey = name,
            IconKind = type_option?.Icon ?? "Database",
            IconForeground = type_option?.Brush ?? BrushMuted,
            Tooltip = display,
            ModifiedAt = show_modified ? modified_at : null,
            Tag = new DatabaseObjectTag { Schema = schema, Kind = kind },
            ChildrenLoaded = true
        };
    }

    public static ExplorerTreeNodeVm FromMenuNode(UI.ViewModels.MenuNodeViewModel menu_node)
    {
        var badge = menu_node.IsSeparator
            ? null
            : string.IsNullOrWhiteSpace(menu_node.TypeBadge)
                ? null
                : menu_node.TypeBadge;

        var node = new ExplorerTreeNodeVm
        {
            Name = menu_node.Title,
            DisplayText = menu_node.IsSeparator ? "────────" : menu_node.Title,
            SearchKey = menu_node.Title,
            IconKind = menu_node.IconKind,
            IconForeground = menu_node.IconForeground,
            Badge = badge,
            Tooltip = menu_node.Tooltip,
            Tag = menu_node,
            IsVisible = menu_node.IsVisible,
            IsExpanded = menu_node.IsExpanded,
            ChildrenLoaded = true
        };

        foreach (var child in menu_node.Children)
            node.Children.Add(FromMenuNode(child));

        return node;
    }

    public static ExplorerNodeKind ParseFolderKind(string kind_name) =>
        Enum.TryParse<ExplorerNodeKind>(kind_name, ignoreCase: true, out var kind)
            ? kind
            : ExplorerNodeKind.Folder;

    public static DatabaseObjectKind ParseDatabaseKind(string kind_name) =>
        Enum.TryParse<DatabaseObjectKind>(kind_name, ignoreCase: true, out var kind)
            ? kind
            : DatabaseObjectKind.Folder;

    private static SolidColorBrush Freeze(string hex)
    {
        var brush = (SolidColorBrush)new BrushConverter().ConvertFromString(hex)!;
        brush.Freeze();
        return brush;
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
