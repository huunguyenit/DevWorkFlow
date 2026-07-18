using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Data;
using UI.ViewModels.Base;

namespace UI.ViewModels.Toolbox;

public sealed class ToolboxItemVm
{
    public required string Name { get; init; }
    public required string Group { get; init; }
    public required string IconKind { get; init; }
    public string Description { get; init; } = string.Empty;
    public bool IsEnabled { get; init; } = false; // Step 3: stub — drag-drop sau
}

/// <summary>Toolbox stub — danh sách control theo nhóm; chưa kéo thả.</summary>
public sealed class ToolboxViewModel : ViewModelBase
{
    private string _search_text = string.Empty;
    private ICollectionView? _filtered_view;

    public ToolboxViewModel()
    {
        Items = new ObservableCollection<ToolboxItemVm>(BuildCatalog());
        RefreshView();
    }

    public ObservableCollection<ToolboxItemVm> Items { get; }

    public ICollectionView? FilteredItems
    {
        get => _filtered_view;
        private set => SetProperty(ref _filtered_view, value);
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

    public string Hint => "Kéo thả control sẽ có ở bước Design Surface. Hiện chỉ danh mục.";

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
               || item.Group.Contains(q, StringComparison.OrdinalIgnoreCase)
               || item.Description.Contains(q, StringComparison.OrdinalIgnoreCase);
    }

    private static IEnumerable<ToolboxItemVm> BuildCatalog()
    {
        // Basic Controls
        yield return Item("TextBox", "Basic Controls", "FormTextbox", "Ô nhập text");
        yield return Item("TextArea", "Basic Controls", "TextBox", "Nhập nhiều dòng");
        yield return Item("ComboBox", "Basic Controls", "FormDropdown", "DropDownList");
        yield return Item("DatePicker", "Basic Controls", "Calendar", "DateTime");
        yield return Item("CheckBox", "Basic Controls", "CheckboxMarkedOutline", "Boolean");
        yield return Item("RadioButton", "Basic Controls", "RadioboxMarked", "RadioButtonList");
        yield return Item("Button", "Basic Controls", "ButtonCursor", "Nút lệnh");
        yield return Item("Label", "Basic Controls", "FormatTitle", "Nhãn header");
        yield return Item("Image", "Basic Controls", "ImageOutline", "Hình ảnh");
        yield return Item("Link", "Basic Controls", "LinkVariant", "Hyperlink");

        // Layout
        yield return Item("GroupBox", "Layout", "Group", "Nhóm field");
        yield return Item("Panel", "Layout", "ViewDashboardOutline", "Panel");
        yield return Item("Tab Control", "Layout", "Tab", "Category tabs");
        yield return Item("Split Container", "Layout", "ArrowSplitVertical", "Split");
        yield return Item("Table Layout", "Layout", "Table", "View columns");

        // Advanced
        yield return Item("Data Grid", "Advanced", "TableLarge", "Grid controller");
        yield return Item("Lookup", "Advanced", "Magnify", "AutoComplete / Lookup");
        yield return Item("Tree View", "Advanced", "FileTree", "Cây dữ liệu");
        yield return Item("List View", "Advanced", "ViewList", "Danh sách");
        yield return Item("Repeater", "Advanced", "Repeat", "Lặp dòng");
        yield return Item("Upload", "Advanced", "Upload", "Upload file");
        yield return Item("Rich Text", "Advanced", "FormatText", "Rich text");
        yield return Item("Report Viewer", "Advanced", "FileChartOutline", "Báo cáo");
        yield return Item("Workflow", "Advanced", "Sitemap", "Workflow node");
    }

    private static ToolboxItemVm Item(string name, string group, string icon, string desc) =>
        new()
        {
            Name = name,
            Group = group,
            IconKind = icon,
            Description = desc,
            IsEnabled = false
        };
}
