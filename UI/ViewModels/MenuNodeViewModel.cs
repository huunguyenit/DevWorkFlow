using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Media;
using DevWorkFlow.Domain.Models;
using UI.ViewModels.Base;

namespace UI.ViewModels;

/// <summary>
/// Node TreeView: menu wcommand hoặc file resource (aspx/xml) gắn dưới menu.
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

    private bool _is_expanded;
    private bool _is_selected;
    private bool _is_visible = true;

    public MenuNodeViewModel(MenuTreeNode node)
    {
        Node = node;
        FileItem = null;
        Children = new ObservableCollection<MenuNodeViewModel>(
            node.Children.Select(c => new MenuNodeViewModel(c)));
        _is_expanded = node.Level <= 1 && !node.IsSeparator;
    }

    public MenuNodeViewModel(ControllerFileItem file_item)
    {
        Node = null;
        FileItem = file_item;
        Children = [];
        _is_expanded = false;
    }

    public MenuTreeNode? Node { get; }
    public ControllerFileItem? FileItem { get; }
    public ObservableCollection<MenuNodeViewModel> Children { get; }

    public bool IsFileNode => FileItem is not null;
    public bool IsMenuNode => Node is not null;
    public bool IsSeparator => Node?.IsSeparator == true;

    public string Title => IsFileNode
        ? FileItem!.DisplayName
        : Node!.Title;

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

    /// <summary>
    /// Lọc LIKE: bar (Title), sysid, wmenu_id (+ syscode/link phụ).
    /// Chỉ set Visibility — không đụng IsExpanded khi đang gõ.
    /// </summary>
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
            // Hiện separator chỉ khi còn anh/em khớp — quyết định ở parent
            IsVisible = true;
            return false;
        }

        var self_match = IsFileNode
            ? Contains(Title, keyword) || Contains(FileItem?.ControllerName, keyword)
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

        // Ẩn separator nếu không còn sibling/con hữu ích
        foreach (var child in Children.Where(c => c.IsSeparator))
            child.IsVisible = any_visible_child || self_match;

        var visible = self_match || child_match;
        if (IsVisible != visible)
            IsVisible = visible;

        // Không auto-expand khi gõ — tránh layout thrash
        return visible;
    }

    /// <summary>Khôi phục expand mặc định (cấp ≤ 1) sau khi xóa filter.</summary>
    public void RestoreDefaultExpand()
    {
        if (IsMenuNode && Node is not null)
        {
            var should_expand = Node.Level <= 1 && !Node.IsSeparator;
            if (_is_expanded != should_expand)
                IsExpanded = should_expand;
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

    public void AttachResourceFiles(IEnumerable<ControllerFileItem> files)
    {
        var menu_children = Children.Where(c => c.IsMenuNode).ToList();
        Children.Clear();
        foreach (var child in menu_children)
            Children.Add(child);

        foreach (var file in files.OrderBy(f => f.SortOrder)
                                  .ThenBy(f => f.DisplayName, StringComparer.OrdinalIgnoreCase))
            Children.Add(new MenuNodeViewModel(file));

        ResourcesLoaded = true;
        IsExpanded = true;
    }

    private static Brush BrushFrom(string hex)
    {
        var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
        brush.Freeze();
        return brush;
    }
}
