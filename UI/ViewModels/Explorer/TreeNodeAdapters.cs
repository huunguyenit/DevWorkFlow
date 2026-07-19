using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Tree;
using DevWorkFlow.Tree;
using UI.Tree;
using UI.ViewModels;

namespace UI.ViewModels.Explorer;

/// <summary>Maps domain models into generic TreeNode graphs for DataSources.</summary>
public static class TreeNodeAdapters
{
    public static void FillCommandDataSource(CommandDataSource target, IEnumerable<MenuNodeViewModel> roots)
    {
        var root_nodes = new List<TreeNode>();
        var children = new Dictionary<Guid, IReadOnlyList<TreeNode>>();

        foreach (var root in roots)
            root_nodes.Add(MapMenu(root, parent_id: null, children));

        target.SetTree(root_nodes, children);
    }

    private static TreeNode MapMenu(
        MenuNodeViewModel menu,
        Guid? parent_id,
        Dictionary<Guid, IReadOnlyList<TreeNode>> children)
    {
        var id = Guid.NewGuid();
        var kid_list = new List<TreeNode>();
        foreach (var child in menu.Children)
            kid_list.Add(MapMenu(child, id, children));

        if (kid_list.Count > 0)
            children[id] = kid_list;

        var visual = ResolveMenuVisual(menu);
        return new TreeNode
        {
            Id = id,
            ParentId = parent_id,
            DisplayName = menu.Title,
            Icon = visual.Icon,
            IconColor = visual.IconColor,
            TextColor = visual.TextColor,
            IsItalic = visual.IsItalic,
            IsSelectable = visual.IsSelectable,
            Kind = menu.IsSeparator
                ? TreeNodeKind.Separator
                : menu.IsFileNode
                    ? TreeNodeKind.File
                    : menu.IsKindFolder || kid_list.Count > 0 || menu.HasLink
                        ? TreeNodeKind.Folder
                        : TreeNodeKind.Leaf,
            State = TreeNodeState.Loaded,
            HasChildren = kid_list.Count > 0 || (menu.IsMenuNode && menu.HasLink && !menu.ResourcesLoaded),
            SearchKey = string.Join('\u001F', menu.Title, menu.SysId ?? "", menu.WmenuId ?? "",
                menu.FileItem?.ControllerName ?? "", menu.FileItem?.RelativePath ?? "",
                menu.FolderKind?.ToString() ?? ""),
            Metadata = new CommandNodeMeta
            {
                SysId = menu.SysId,
                WmenuId = menu.WmenuId,
                Link = menu.Link,
                Type = menu.Type,
                IsFile = menu.IsFileNode,
                FilePath = menu.FileItem?.FullPath,
                Source = menu
            }
        };
    }

    private static (string Icon, string IconColor, string TextColor, bool IsItalic, bool IsSelectable)
        ResolveMenuVisual(MenuNodeViewModel menu)
    {
        if (menu.IsSeparator)
            return ("Minus", TreeIconCatalog.ColorMuted, string.Empty, false, false);

        if (menu.IsKindFolder)
        {
            var color = menu.FolderKind switch
            {
                ControllerFileKind.Dir => TreeIconCatalog.ColorXml,
                ControllerFileKind.Filter => TreeIconCatalog.ColorFilter,
                ControllerFileKind.Grid => TreeIconCatalog.ColorGrid,
                ControllerFileKind.Lookup => TreeIconCatalog.ColorLookup,
                ControllerFileKind.Report => TreeIconCatalog.ColorReport,
                ControllerFileKind.TemplateUpload
                    or ControllerFileKind.TemplateExcel
                    or ControllerFileKind.TemplateRpt => "#038387",
                ControllerFileKind.Aspx => TreeIconCatalog.ColorAspx,
                _ => TreeIconCatalog.ColorFolder
            };
            return ("Folder", color, string.Empty, false, true);
        }

        if (menu.IsFileNode && menu.FileItem is not null)
        {
            var file = menu.FileItem;
            var (icon, color, is_italic) = file.Kind switch
            {
                ControllerFileKind.Dir => ("FileDocumentOutline", TreeIconCatalog.ColorXml, false),
                ControllerFileKind.Filter => ("FilterOutline", TreeIconCatalog.ColorFilter, false),
                ControllerFileKind.Grid => ("TableLarge", TreeIconCatalog.ColorGrid, false),
                ControllerFileKind.Lookup => ("Magnify", TreeIconCatalog.ColorLookup, false),
                ControllerFileKind.Report => ("FileChartOutline", TreeIconCatalog.ColorReport, false),
                ControllerFileKind.TemplateUpload => ("Upload", "#038387", false),
                ControllerFileKind.TemplateExcel => ("FileExcel", TreeIconCatalog.ColorExcel, false),
                ControllerFileKind.TemplateRpt => ("FilePdfBox", TreeIconCatalog.ColorPdf, false),
                ControllerFileKind.Aspx => ("LanguageHtml5", TreeIconCatalog.ColorAspx, false),
                _ => TreeIconCatalog.ForExplorerPath(file.FullPath, is_directory: false)
            };
            // .f italic giống Explorer
            if (file.IsEncrypted) is_italic = true;
            return (icon, color, string.Empty, is_italic, true);
        }

        var sys_id = menu.SysId ?? string.Empty;
        var type = menu.Type ?? string.Empty;

        string icon_kind;
        string icon_color;
        if (sys_id.StartsWith("rpt", StringComparison.OrdinalIgnoreCase)
            || sys_id.StartsWith("zcrpt", StringComparison.OrdinalIgnoreCase))
        {
            icon_kind = "Finance";
            icon_color = TreeIconCatalog.ColorFinance;
        }
        else if (string.Equals(type, "V", StringComparison.OrdinalIgnoreCase))
        {
            icon_kind = "Octagram";
            icon_color = TreeIconCatalog.ColorTypeV;
        }
        else if (string.Equals(type, "D", StringComparison.OrdinalIgnoreCase))
        {
            icon_kind = "ListBoxOutline";
            icon_color = TreeIconCatalog.ColorTypeD;
        }
        else if (menu.HasLink)
        {
            icon_kind = "FileLink";
            icon_color = TreeIconCatalog.ColorLink;
        }
        else
        {
            icon_kind = "Folder";
            icon_color = TreeIconCatalog.ColorFolder;
        }

        var text_color = TreeIconCatalog.HasControllerMarker(menu.Title)
            ? TreeIconCatalog.ColorMenuHighlight
            : string.Empty;
        return (icon_kind, icon_color, text_color, false, true);
    }

    public static void FillXmlSemanticFromDocumentNodes(
        XmlSemanticDataSource target,
        IEnumerable<DocumentNode> roots)
    {
        var flat = new List<(TreeNode Node, Guid? ParentId)>();
        foreach (var root in roots)
            WalkDocument(root, parent_id: null, flat);
        target.SetHierarchy(flat);
    }

    private static void WalkDocument(
        DocumentNode node,
        Guid? parent_id,
        List<(TreeNode Node, Guid? ParentId)> flat)
    {
        var id = Guid.NewGuid();
        var display = string.IsNullOrWhiteSpace(node.DisplayName) ? node.NodeType : node.DisplayName;
        var tree_node = new TreeNode
        {
            Id = id,
            ParentId = parent_id,
            DisplayName = display,
            Icon = IconFor(node.NodeType),
            IconColor = TreeIconCatalog.ColorXml,
            Kind = node.Children.Count > 0 ? TreeNodeKind.Group : TreeNodeKind.Leaf,
            State = TreeNodeState.Loaded,
            HasChildren = node.Children.Count > 0,
            SearchKey = $"{node.NodeType} {display} {node.SymbolId}",
            Metadata = new OutlineNavTag
            {
                NodeId = node.Id,
                NodeType = node.NodeType,
                SymbolId = node.SymbolId,
                DisplayName = display
            }
        };
        flat.Add((tree_node, parent_id));
        foreach (var child in node.Children)
            WalkDocument(child, id, flat);
    }

    private static string IconFor(string node_type) =>
        node_type.ToLowerInvariant() switch
        {
            "field" => "FormTextbox",
            "view" => "ViewDashboard",
            "command" or "query" => "Database",
            "action" or "response" or "responseaction" or "entityref" => "Reply",
            "function" or "scriptfunction" => "CodeBraces",
            "entity" => "Variable",
            "title" => "FormatTitle",
            "css" => "LanguageCss3",
            "item" or "category" => "TableColumn",
            "dir" or "grid" or "lookup" or "report" or "notify" or "controller" => "FileDocumentOutline",
            "fields" => "FormTextbox",
            "views" => "ViewDashboard",
            "commands" => "Database",
            "script" => "LanguageJavascript",
            "entities" => "Variable",
            _ => "CodeTags"
        };

    public static Dictionary<string, DatabaseFolderInfo> ToFolderMap(
        IEnumerable<(string Code, string Folder, int Order, string Icon, string Color)> types)
    {
        var map = new Dictionary<string, DatabaseFolderInfo>(StringComparer.OrdinalIgnoreCase);
        foreach (var t in types)
        {
            var object_visual = NormalizeDbIcon(t.Icon, t.Code, t.Color);
            var folder_visual = TreeIconCatalog.ForDatabaseFolder(t.Folder);
            map[t.Code] = new DatabaseFolderInfo
            {
                FolderName = t.Folder,
                Order = t.Order,
                Icon = object_visual.Icon,
                Color = object_visual.Color,
                FolderIcon = folder_visual.Icon,
                FolderColor = folder_visual.Color
            };
        }

        return map;
    }

    private static (string Icon, string Color) NormalizeDbIcon(string icon, string code, string color)
    {
        if (string.IsNullOrWhiteSpace(icon)
            || icon.Equals("Function", StringComparison.OrdinalIgnoreCase))
            return TreeIconCatalog.ForDatabaseObject(code);

        var fallback_color = TreeIconCatalog.ForDatabaseObject(code).Color;
        return (icon, string.IsNullOrWhiteSpace(color) ? fallback_color : color);
    }
}
