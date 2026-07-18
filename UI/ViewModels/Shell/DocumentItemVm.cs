using UI.ViewModels.Base;

namespace UI.ViewModels.Shell;

/// <summary>Một document tab trong IDE (XML Designer, SQL, …).</summary>
public sealed class DocumentItemVm : ViewModelBase
{
    private string _title = string.Empty;
    private bool _is_dirty;
    private bool _is_active;

    public required string Id { get; init; }

    public string Title
    {
        get => _title;
        set => SetProperty(ref _title, value);
    }

    public bool IsDirty
    {
        get => _is_dirty;
        set
        {
            if (!SetProperty(ref _is_dirty, value)) return;
            OnPropertyChanged(nameof(DisplayTitle));
        }
    }

    public bool IsActive
    {
        get => _is_active;
        set => SetProperty(ref _is_active, value);
    }

    /// <summary>ViewModel nội dung (FormBuilder, …).</summary>
    public required ViewModelBase ContentVm { get; init; }

    public string? FilePath { get; set; }

    public string DisplayTitle => IsDirty ? $"{Title}*" : Title;
}
