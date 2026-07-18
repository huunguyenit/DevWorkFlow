using System.Collections.ObjectModel;
using System.Windows.Media;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>Node cây dùng chung cho Explorer / Menu / Database.</summary>
public sealed class ExplorerTreeNodeVm : ViewModelBase
{
    private bool _is_expanded;
    private bool _is_selected;
    private bool _is_visible = true;
    private bool _children_loaded;

    public required string Name { get; init; }

    public string DisplayText { get; init; } = string.Empty;

    public string IconKind { get; init; } = "FileOutline";

    public Brush IconForeground { get; init; } = Brushes.Gray;

    public string? Badge { get; init; }

    public bool HasBadge => !string.IsNullOrWhiteSpace(Badge);

    public string Tooltip { get; init; } = string.Empty;

    public DateTime? ModifiedAt { get; init; }

    public bool ShowModified => ModifiedAt.HasValue;

    public string ModifiedText => ModifiedAt?.ToString("yyyy-MM-dd HH:mm") ?? string.Empty;

    /// <summary>Payload gốc (FullPath, MenuNode, …).</summary>
    public object? Tag { get; init; }

    public ObservableCollection<ExplorerTreeNodeVm> Children { get; } = [];

    public Action<ExplorerTreeNodeVm>? EnsureChildren { get; set; }

    public bool IsExpanded
    {
        get => _is_expanded;
        set
        {
            if (!SetProperty(ref _is_expanded, value)) return;
            if (value) EnsureChildren?.Invoke(this);
        }
    }

    public bool IsSelected
    {
        get => _is_selected;
        set => SetProperty(ref _is_selected, value);
    }

    public bool IsVisible
    {
        get => _is_visible;
        set => SetProperty(ref _is_visible, value);
    }

    public bool ChildrenLoaded
    {
        get => _children_loaded;
        set => SetProperty(ref _children_loaded, value);
    }

    public string SearchKey { get; init; } = string.Empty;

    public string SearchText =>
        !string.IsNullOrWhiteSpace(SearchKey)
            ? SearchKey
            : string.IsNullOrWhiteSpace(DisplayText) ? Name : DisplayText;
}
