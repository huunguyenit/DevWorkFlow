using System.Collections.ObjectModel;
using System.IO;
using System.Windows;
using System.Windows.Media;
using DevWorkFlow.Domain.Models;
using UI.ViewModels.Base;

namespace UI.ViewModels;

/// <summary>
/// Node TreeView: menu wcommand, folder Kind (Dir/Grid/…), hoặc file resource.
/// Cấu trúc giống Explorer: Menu → Folder(Kind) → File.
/// </summary>
public class MenuNodeViewModel : ViewModelBase
{
    private static readonly Brush BrushMuted = BrushFrom("#6B6B6B");
    private static readonly Brush BrushLink = BrushFrom("#CA5010");
    private static readonly Brush BrushDir = BrushFrom("#0078D4");
    private static readonly Brush BrushFilter = BrushFrom("#CA5010");
    private static readonly Brush BrushGrid = BrushFrom("#107C10");
    private static readonly Brush BrushLookup = BrushFrom("#8764B8");
    private static readonly Brush BrushReport = BrushFrom("#C19C00");
    private static readonly Brush BrushTemplate = BrushFrom("#038387");
    private static readonly Brush BrushMain = BrushFrom("#5C2D91");
    private static readonly Brush BrushSeparator = BrushFrom("#A0A0A0");
    private static readonly Brush BrushFolder = BrushFrom("#C9A227");

    private readonly string? _folder_title;
    private bool _is_expanded;
    private bool _is_selected;
    private bool _is_visible = true;

    public MenuNodeViewModel(MenuTreeNode node)
    {
        Node = node;
        FileItem = null;
        FolderKind = null;
        Children = new ObservableCollection<MenuNodeViewModel>(
            node.Children.Select(c => new MenuNodeViewModel(c)));
        _is_expanded = node.Level <= 1 && !node.IsSeparator;
    }

    public MenuNodeViewModel(ControllerFileItem file_item)
    {
        Node = null;
        FileItem = file_item;
        FolderKind = null;
        Children = [];
        _is_expanded = false;
    }

    /// <summary>Folder tổng hợp theo Kind (Dir / Grid / Filter / …) — giống folder Explorer.</summary>
    public MenuNodeViewModel(ControllerFileKind folder_kind, IEnumerable<ControllerFileItem> files)
    {
        Node = null;
        FileItem = null;
        FolderKind = folder_kind;
        _folder_title = FolderLabel(folder_kind);
        Children = new ObservableCollection<MenuNodeViewModel>(
            files
                .OrderBy(f => Path.GetFileName(f.FullPath), StringComparer.OrdinalIgnoreCase)
                .Select(f => new MenuNodeViewModel(f)));
        // Mở sẵn như vừa expand folder Explorer sau khi load
        _is_expanded = true;
    }

    public MenuTreeNode? Node { get; }
    public ControllerFileItem? FileItem { get; }
    public ControllerFileKind? FolderKind { get; }
    public ObservableCollection<MenuNodeViewModel> Children { get; }

    public bool IsFileNode => FileItem is not null;
    public bool IsKindFolder => FolderKind is not null;
    public bool IsMenuNode => Node is not null;
    public bool IsSeparator => Node?.IsSeparator == true;

    public string Title
    {
        get
        {
            if (IsKindFolder) return _folder_title ?? FolderKind!.Value.ToString();
            if (IsFileNode)
                return Path.GetFileName(FileItem!.FullPath);
            return Node!.Title;
        }
    }

    public string? SysId => Node?.SysId;
    public string? SysCode => Node?.SysCode;
    public string? Type => Node?.Type;
    public string? Link => Node?.Link;
    public string? WmenuId => Node?.WmenuId;

    public bool HasLink => Node?.HasLink == true;

    public bool HasControllerBadge =>
        !IsSeparator
        && IsMenuNode
        && (!string.IsNullOrWhiteSpace(Type) || HasLink);

    public string TypeBadge
    {
        get
        {
            if (IsSeparator) return string.Empty;
            if (IsKindFolder) return string.Empty;
            if (IsFileNode) return FileItem!.KindLabel;
            return string.Equals(Type, "V", StringComparison.OrdinalIgnoreCase) ? "V" :
                   string.Equals(Type, "D", StringComparison.OrdinalIgnoreCase) ? "D" : "";
        }
    }

    public string IconKind
    {
        get
        {
            if (IsSeparator) return "Minus";
            if (IsKindFolder) return "Folder";
            if (IsFileNode && FileItem is not null)
            {
                return FileItem.Kind switch
                {
                    ControllerFileKind.Dir => "FileDocumentOutline",
                    ControllerFileKind.Filter => "FilterOutline",
                    ControllerFileKind.Grid => "TableLarge",
                    ControllerFileKind.Lookup => "Magnify",
                    ControllerFileKind.Report => "FileChartOutline",
                    ControllerFileKind.TemplateUpload => "Upload",
                    ControllerFileKind.TemplateExcel => "FileExcelOutline",
                    ControllerFileKind.TemplateRpt => "FileChart",
                    ControllerFileKind.Aspx => "LanguageHtml5",
                    _ => "FileCodeOutline"
                };
            }

            if (HasLink) return "FileLink";
            return "FolderOutline";
        }
    }

    public Brush IconForeground
    {
        get
        {
            if (IsSeparator) return BrushSeparator;
            if (IsKindFolder)
            {
                return FolderKind switch
                {
                    ControllerFileKind.Dir => BrushDir,
                    ControllerFileKind.Filter => BrushFilter,
                    ControllerFileKind.Grid => BrushGrid,
                    ControllerFileKind.Lookup => BrushLookup,
                    ControllerFileKind.Report => BrushReport,
                    ControllerFileKind.TemplateUpload
                        or ControllerFileKind.TemplateExcel
                        or ControllerFileKind.TemplateRpt => BrushTemplate,
                    ControllerFileKind.Aspx => BrushMain,
                    _ => BrushFolder
                };
            }

            if (IsFileNode && FileItem is not null)
            {
                return FileItem.Kind switch
                {
                    ControllerFileKind.Dir => BrushDir,
                    ControllerFileKind.Filter => BrushFilter,
                    ControllerFileKind.Grid => BrushGrid,
                    ControllerFileKind.Lookup => BrushLookup,
                    ControllerFileKind.Report => BrushReport,
                    ControllerFileKind.TemplateUpload
                        or ControllerFileKind.TemplateExcel
                        or ControllerFileKind.TemplateRpt => BrushTemplate,
                    ControllerFileKind.Aspx => BrushMain,
                    _ => BrushDir
                };
            }

            if (HasLink) return BrushLink;
            return BrushMuted;
        }
    }

    public string Tooltip
    {
        get
        {
            if (IsSeparator) return "Separator";
            if (IsKindFolder)
                return $"Folder: {Title} ({Children.Count} file)";
            if (IsFileNode)
                return $"{FileItem!.KindLabel}: {FileItem.FullPath}";

            var parts = new List<string> { Title };
            if (!string.IsNullOrWhiteSpace(WmenuId)) parts.Add($"wmenu_id: {WmenuId}");
            if (!string.IsNullOrWhiteSpace(Link)) parts.Add($"link: {Link}");
            if (!string.IsNullOrWhiteSpace(SysId)) parts.Add($"sysid: {SysId}");
            if (!string.IsNullOrWhiteSpace(SysCode)) parts.Add($"syscode: {SysCode}");
            if (!string.IsNullOrWhiteSpace(Type)) parts.Add($"type: {Type}");
            return string.Join(" | ", parts);
        }
    }

    public bool ResourcesLoaded { get; set; }

    public bool IsExpanded
    {
        get => _is_expanded;
        set => SetProperty(ref _is_expanded, value);
    }

    public bool IsSelected
    {
        get => _is_selected;
        set => SetProperty(ref _is_selected, value);
    }

    public bool IsVisible
    {
        get => _is_visible;
        set
        {
            if (SetProperty(ref _is_visible, value))
                OnPropertyChanged(nameof(Visibility));
        }
    }

    public Visibility Visibility => IsVisible ? Visibility.Visible : Visibility.Collapsed;

    public bool ApplyFilter(string keyword, bool expand_matches = false)
    {
        if (string.IsNullOrWhiteSpace(keyword))
        {
            if (!IsVisible) IsVisible = true;
            foreach (var child in Children)
                child.ApplyFilter(keyword, expand_matches: false);
            return true;
        }

        if (IsSeparator)
        {
            IsVisible = true;
            return false;
        }

        var self_match = IsFileNode
            ? Contains(Title, keyword) || Contains(FileItem?.ControllerName, keyword)
            : IsKindFolder
                ? Contains(Title, keyword)
                : Node?.MatchesFilter(keyword) == true;

        var child_match = false;
        var any_visible_child = false;
        foreach (var child in Children)
        {
            var child_ok = child.ApplyFilter(keyword, expand_matches: false);
            child_match |= child_ok;
            if (child.IsVisible && !child.IsSeparator)
                any_visible_child = true;
        }

        foreach (var child in Children.Where(c => c.IsSeparator))
            child.IsVisible = any_visible_child || self_match;

        var visible = self_match || child_match;
        if (IsVisible != visible)
            IsVisible = visible;

        return visible;
    }

    public void RestoreDefaultExpand()
    {
        if (IsMenuNode && Node is not null)
        {
            var should_expand = Node.Level <= 1 && !Node.IsSeparator;
            if (_is_expanded != should_expand)
                IsExpanded = should_expand;
        }
        else if (IsKindFolder)
        {
            if (!_is_expanded)
                IsExpanded = true;
        }
        else if (IsFileNode && _is_expanded)
        {
            IsExpanded = false;
        }

        foreach (var child in Children)
            child.RestoreDefaultExpand();
    }

    private static bool Contains(string? source, string keyword) =>
        !string.IsNullOrEmpty(source)
        && source.Contains(keyword, StringComparison.OrdinalIgnoreCase);

    /// <summary>
    /// Gắn file theo cấu trúc Explorer: Folder(Kind) → File (tên file ngắn).
    /// </summary>
    public void AttachResourceFiles(IEnumerable<ControllerFileItem> files)
    {
        var menu_children = Children.Where(c => c.IsMenuNode).ToList();
        Children.Clear();
        foreach (var child in menu_children)
            Children.Add(child);

        var groups = files
            .GroupBy(f => f.Kind)
            .OrderBy(g => (int)g.Key)
            .ThenBy(g => FolderLabel(g.Key), StringComparer.OrdinalIgnoreCase);

        foreach (var group in groups)
        {
            var items = group.ToList();
            if (items.Count == 0) continue;
            Children.Add(new MenuNodeViewModel(group.Key, items));
        }

        ResourcesLoaded = true;
        IsExpanded = true;
    }

    /// <summary>Duyệt mọi file dưới menu (kể cả trong Kind folder).</summary>
    public IEnumerable<MenuNodeViewModel> EnumerateFileNodes()
    {
        foreach (var child in Children)
        {
            if (child.IsFileNode)
                yield return child;
            else if (child.IsKindFolder)
            {
                foreach (var file in child.Children.Where(c => c.IsFileNode))
                    yield return file;
            }
        }
    }

    public static string FolderLabel(ControllerFileKind kind) => kind switch
    {
        ControllerFileKind.Aspx => "Main",
        ControllerFileKind.TemplateUpload => "Templates/Upload",
        ControllerFileKind.TemplateExcel => "Templates/Excel",
        ControllerFileKind.TemplateRpt => "Templates/Rpt",
        _ => kind.ToString()
    };

    private static Brush BrushFrom(string hex)
    {
        var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
        brush.Freeze();
        return brush;
    }
}
