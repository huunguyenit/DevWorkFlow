using System.Collections.ObjectModel;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels;

/// <summary>ViewModel dùng chung cho Catalog / Document / Report / Stored.</summary>
public class TemplateManagerViewModel : ViewModelBase
{
    private readonly ITemplateService _templateSvc;
    private readonly INavigationService _nav;
    private readonly TemplateType     _type;

    private TemplateItem? _selectedItem;
    private string _searchText  = string.Empty;
    private string _statusMessage = string.Empty;
    private bool   _isBusy;

    public TemplateManagerViewModel(
        ITemplateService templateSvc,
        INavigationService nav,
        TemplateType type)
    {
        _templateSvc = templateSvc;
        _nav         = nav;
        _type        = type;

        Items           = [];
        FilteredItems   = [];
        Title           = type switch
        {
            TemplateType.Catalog  => "Quản lý Danh mục",
            TemplateType.Document => "Quản lý Chứng từ",
            TemplateType.Report   => "Quản lý Báo cáo",
            TemplateType.Stored   => "Quản lý Stored",
            _                     => "Quản lý"
        };

        NewCommand      = new AsyncRelayCommand(CreateNewAsync);
        DeleteCommand   = new AsyncRelayCommand(DeleteAsync, () => SelectedItem is not null && !IsBusy);
        OpenFormCommand = new RelayCommand(OpenForm, () => SelectedItem is not null);
        RefreshCommand  = new AsyncRelayCommand(LoadAsync);

        _ = LoadAsync();
    }

    public string Title { get; }

    public ObservableCollection<TemplateItem> Items         { get; }
    public ObservableCollection<TemplateItem> FilteredItems { get; }

    public TemplateItem? SelectedItem
    {
        get => _selectedItem;
        set => SetProperty(ref _selectedItem, value);
    }

    public string SearchText
    {
        get => _searchText;
        set { SetProperty(ref _searchText, value); ApplyFilter(); }
    }

    public string StatusMessage
    {
        get => _statusMessage;
        set => SetProperty(ref _statusMessage, value);
    }

    public bool IsBusy
    {
        get => _isBusy;
        private set => SetProperty(ref _isBusy, value);
    }

    public AsyncRelayCommand NewCommand      { get; }
    public AsyncRelayCommand DeleteCommand   { get; }
    public RelayCommand      OpenFormCommand { get; }
    public AsyncRelayCommand RefreshCommand  { get; }

    private async Task LoadAsync()
    {
        IsBusy = true;
        var all = await _templateSvc.GetAllAsync();
        Items.Clear();
        foreach (var item in all.Where(i => i.TemplateType == _type))
            Items.Add(item);
        ApplyFilter();
        IsBusy = false;
    }

    private void ApplyFilter()
    {
        FilteredItems.Clear();
        var q = SearchText.Trim();
        foreach (var item in Items)
            if (string.IsNullOrEmpty(q) || item.Name.Contains(q, StringComparison.OrdinalIgnoreCase))
                FilteredItems.Add(item);
    }

    private async Task CreateNewAsync()
    {
        var item = await _templateSvc.CreateAsync($"Mới – {_type} {DateTime.Now:HHmmss}", _type);
        Items.Add(item);
        ApplyFilter();
        SelectedItem  = item;
        StatusMessage = $"✔ Tạo mới '{item.Name}'.";
    }

    private async Task DeleteAsync()
    {
        if (SelectedItem is null) return;
        await _templateSvc.DeleteAsync(SelectedItem.Id);
        Items.Remove(SelectedItem);
        ApplyFilter();
        StatusMessage = "✔ Đã xóa.";
        SelectedItem  = null;
    }

    private void OpenForm()
    {
        if (SelectedItem is null) return;
        _nav.NavigateTo(Pages.FormBuilder, SelectedItem);
    }
}
