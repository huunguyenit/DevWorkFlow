using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Windows.Data;
using UI.ViewModels.Base;
using UI.ViewModels.Design;

namespace UI.ViewModels.Properties;

/// <summary>
/// Property Grid — bind FieldProperties từ FormBuilder đang active (theo tab).
/// </summary>
public sealed class PropertyGridViewModel : ViewModelBase
{
    private FormBuilderViewModel? _form_builder_vm;
    private string _search_text = string.Empty;
    private string _selected_category = "All";
    private bool _show_favorites_only;
    private readonly HashSet<string> _favorites = new(StringComparer.OrdinalIgnoreCase);
    private ICollectionView? _filtered_view;
    private readonly NotifyCollectionChangedEventHandler _props_changed;

    public PropertyGridViewModel(FormBuilderViewModel? form_builder_vm = null)
    {
        Categories = ["All", "Basic", "Appearance", "Layout", "Behavior", "Data", "Validation", "Advanced"];
        ToggleFavoriteCommand = new RelayCommand<DesignFieldPropertyVm>(ToggleFavorite);
        _props_changed = (_, _) => RefreshView();
        BindTo(form_builder_vm);
    }

    public FormBuilderViewModel? FormBuilder => _form_builder_vm;

    public ObservableCollection<string> Categories { get; }

    public ICollectionView? FilteredProperties
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
            FilteredProperties?.Refresh();
        }
    }

    public string SelectedCategory
    {
        get => _selected_category;
        set
        {
            if (!SetProperty(ref _selected_category, value)) return;
            FilteredProperties?.Refresh();
        }
    }

    public bool ShowFavoritesOnly
    {
        get => _show_favorites_only;
        set
        {
            if (!SetProperty(ref _show_favorites_only, value)) return;
            FilteredProperties?.Refresh();
        }
    }

    public bool HasSelectedCell => _form_builder_vm?.HasSelectedCell == true;
    public string SelectedFieldName => _form_builder_vm?.SelectedCell?.FieldName ?? string.Empty;
    public string SelectionHint => HasSelectedCell
        ? SelectedFieldName
        : "Chọn một control trên Design để sửa thuộc tính.";

    public RelayCommand<DesignFieldPropertyVm> ToggleFavoriteCommand { get; }

    public bool IsFavorite(DesignFieldPropertyVm? prop) =>
        prop is not null && _favorites.Contains(prop.Name);

    public void BindTo(FormBuilderViewModel? form_builder_vm)
    {
        if (ReferenceEquals(_form_builder_vm, form_builder_vm)) return;

        if (_form_builder_vm is not null)
        {
            _form_builder_vm.PropertyChanged -= OnFormBuilderChanged;
            _form_builder_vm.FieldProperties.CollectionChanged -= _props_changed;
        }

        _form_builder_vm = form_builder_vm;

        if (_form_builder_vm is not null)
        {
            _form_builder_vm.PropertyChanged += OnFormBuilderChanged;
            _form_builder_vm.FieldProperties.CollectionChanged += _props_changed;
        }

        RefreshView();
    }

    private void OnFormBuilderChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName is nameof(FormBuilderViewModel.HasSelectedCell)
            or nameof(FormBuilderViewModel.SelectedCell)
            or nameof(FormBuilderViewModel.Document))
        {
            OnPropertyChanged(nameof(HasSelectedCell));
            OnPropertyChanged(nameof(SelectedFieldName));
            OnPropertyChanged(nameof(SelectionHint));
            RefreshView();
        }
    }

    private void RefreshView()
    {
        if (_form_builder_vm is null)
        {
            FilteredProperties = null;
            OnPropertyChanged(nameof(HasSelectedCell));
            OnPropertyChanged(nameof(SelectedFieldName));
            OnPropertyChanged(nameof(SelectionHint));
            return;
        }

        var view = CollectionViewSource.GetDefaultView(_form_builder_vm.FieldProperties);
        if (view is not null)
        {
            view.Filter = FilterProperty;
            view.GroupDescriptions.Clear();
            view.GroupDescriptions.Add(new PropertyGroupDescription(nameof(DesignFieldPropertyVm.Category)));
            FilteredProperties = view;
            view.Refresh();
        }

        OnPropertyChanged(nameof(HasSelectedCell));
        OnPropertyChanged(nameof(SelectedFieldName));
        OnPropertyChanged(nameof(SelectionHint));
    }

    private bool FilterProperty(object obj)
    {
        if (obj is not DesignFieldPropertyVm prop) return false;

        if (_show_favorites_only && !_favorites.Contains(prop.Name))
            return false;

        if (!string.IsNullOrWhiteSpace(_search_text))
        {
            var q = _search_text.Trim();
            if (prop.DisplayName.Contains(q, StringComparison.OrdinalIgnoreCase) != true
                && prop.Name.Contains(q, StringComparison.OrdinalIgnoreCase) != true
                && (prop.Category?.Contains(q, StringComparison.OrdinalIgnoreCase) != true))
                return false;
        }

        if (!string.IsNullOrWhiteSpace(_selected_category)
            && !_selected_category.Equals("All", StringComparison.OrdinalIgnoreCase))
        {
            var mapped = MapIdeCategory(prop.Category);
            if (!mapped.Equals(_selected_category, StringComparison.OrdinalIgnoreCase))
                return false;
        }

        return true;
    }

    public static string MapIdeCategory(string? category) => category switch
    {
        "Identity" or "Header" or "Footer" or "Type" => "Basic",
        "Display" => "Appearance",
        "Layout" => "Layout",
        "Behavior" => "Behavior",
        "Items" or "Default" => "Data",
        _ => "Advanced"
    };

    private void ToggleFavorite(DesignFieldPropertyVm? prop)
    {
        if (prop is null) return;
        if (!_favorites.Remove(prop.Name))
            _favorites.Add(prop.Name);
        FilteredProperties?.Refresh();
        OnPropertyChanged(nameof(ShowFavoritesOnly));
    }
}
