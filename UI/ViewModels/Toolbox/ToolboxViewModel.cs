using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Data;
using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Design;
using UI.ViewModels.Base;

namespace UI.ViewModels.Toolbox;

/// <summary>
/// Một mục palette Toolbox (config <c>toolbox-controls.xml</c>). Kéo được khi <see cref="IsEnabled"/>:
/// TextBox-family → tạo field mới; Tab* → mở dialog thêm category.
/// </summary>
public sealed class ToolboxItemVm : ViewModelBase
{
    private bool _is_selected;

    public required string Name { get; init; }
    public required string Group { get; init; }
    public required string IconKind { get; init; }
    public string Description { get; init; } = string.Empty;
    public bool IsEnabled { get; init; }

    /// <summary>Kind FBO nếu id khớp <see cref="ToolboxControlKind"/>; null = stub không kéo.</summary>
    public ToolboxControlKind? ControlKind { get; init; }

    public bool IsTab { get; init; }
    public string? TabKind { get; init; }

    /// <summary>Đang được chọn trong palette (click) → highlight; độc lập với hover/drag.</summary>
    public bool IsSelected
    {
        get => _is_selected;
        set => SetProperty(ref _is_selected, value);
    }

    public double Opacity => IsEnabled ? 1.0 : 0.5;
    public string Cursor => IsEnabled ? "Hand" : "Arrow";
}

/// <summary>
/// Toolbox palette (P6) — CHỈ control từ config, không còn danh sách FIELDS. Kéo control vào Slot Blueprint
/// hoặc Tab* để thêm category. Nguồn dữ liệu: <see cref="ToolboxControlCatalogData"/> (fail-closed).
/// </summary>
public sealed class ToolboxViewModel : ViewModelBase
{
    private string _search_text = string.Empty;
    private ICollectionView? _filtered_view;

    public ToolboxViewModel() : this(ToolboxControlCatalogData.Empty)
    {
    }

    public ToolboxViewModel(ToolboxControlCatalogData catalog)
    {
        Items = new ObservableCollection<ToolboxItemVm>(BuildItems(catalog));
        RefreshView();
    }

    private ToolboxItemVm? _selected_control;

    public ObservableCollection<ToolboxItemVm> Items { get; }

    public ICollectionView? FilteredItems
    {
        get => _filtered_view;
        private set => SetProperty(ref _filtered_view, value);
    }

    /// <summary>Control đang chọn trong palette; set qua <see cref="SelectControl"/> để highlight độc quyền.</summary>
    public ToolboxItemVm? SelectedControl
    {
        get => _selected_control;
        private set => SetProperty(ref _selected_control, value);
    }

    /// <summary>Click một control → highlight nó, bỏ highlight control trước (chọn độc quyền).</summary>
    public void SelectControl(ToolboxItemVm? item)
    {
        if (ReferenceEquals(_selected_control, item)) return;
        if (_selected_control is not null)
            _selected_control.IsSelected = false;
        SelectedControl = item;
        if (item is not null)
            item.IsSelected = true;
    }

    public string SearchText
    {
        get => _search_text;
        set
        {
            if (!SetProperty(ref _search_text, value)) return;
            FilteredItems?.Refresh();
        }
    }

    public string Hint =>
        "Kéo control (TextBox, DateTime, CheckBox…) vào Slot trống để tạo field. Kéo Tab* để thêm category.";

    private static IEnumerable<ToolboxItemVm> BuildItems(ToolboxControlCatalogData catalog)
    {
        foreach (var group in catalog.Groups)
        foreach (var control in group.Controls)
        {
            var kind = Enum.TryParse<ToolboxControlKind>(control.Id, out var parsed) ? parsed : (ToolboxControlKind?)null;
            yield return new ToolboxItemVm
            {
                Name = control.Name,
                Group = string.IsNullOrWhiteSpace(control.GroupTitle) ? control.GroupId : control.GroupTitle,
                IconKind = string.IsNullOrWhiteSpace(control.Icon) ? "SquareOutline" : control.Icon,
                Description = control.Id,
                IsEnabled = control.Enabled && kind is not null,
                ControlKind = kind,
                IsTab = control.IsTab,
                TabKind = control.TabKind
            };
        }
    }

    private void RefreshView()
    {
        var view = CollectionViewSource.GetDefaultView(Items);
        if (view is null) return;
        view.Filter = FilterItem;
        view.GroupDescriptions.Clear();
        view.GroupDescriptions.Add(new PropertyGroupDescription(nameof(ToolboxItemVm.Group)));
        FilteredItems = view;
        view.Refresh();
    }

    private bool FilterItem(object obj)
    {
        if (obj is not ToolboxItemVm item) return false;
        if (string.IsNullOrWhiteSpace(_search_text)) return true;
        var q = _search_text.Trim();
        return item.Name.Contains(q, StringComparison.OrdinalIgnoreCase)
               || item.Group.Contains(q, StringComparison.OrdinalIgnoreCase);
    }
}
