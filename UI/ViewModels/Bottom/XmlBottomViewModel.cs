using System.ComponentModel;
using DevWorkFlow.Domain.Language;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>
/// Tab XML Bottom — bind FormBuilder đang active (theo tab) + Structure outline.
/// </summary>
public sealed class XmlBottomViewModel : ViewModelBase
{
    private FormBuilderViewModel? _form_builder_vm;
    private readonly RelayCommand _noop_toggle = new(() => { });

    public XmlBottomViewModel(FormBuilderViewModel? form_builder_vm = null)
    {
        StructureOutline = new XmlStructureOutlineViewModel(form_builder_vm);
        BindTo(form_builder_vm);
    }

    public FormBuilderViewModel? FormBuilder => _form_builder_vm;

    public XmlStructureOutlineViewModel StructureOutline { get; }

    public void BindTo(FormBuilderViewModel? form_builder_vm)
    {
        if (ReferenceEquals(_form_builder_vm, form_builder_vm))
        {
            StructureOutline.BindTo(form_builder_vm);
            return;
        }

        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnFormBuilderChanged;
        _form_builder_vm = form_builder_vm;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged += OnFormBuilderChanged;

        StructureOutline.BindTo(form_builder_vm);
        RaiseAll();
    }

    public string EditorText
    {
        get => _form_builder_vm?.EditorText ?? string.Empty;
        set
        {
            if (_form_builder_vm is not null)
                _form_builder_vm.EditorText = value;
        }
    }

    public bool IsEditorReadOnly => _form_builder_vm?.IsEditorReadOnly ?? true;

    public ErpEditorMode ActiveEditorMode =>
        _form_builder_vm?.ActiveEditorMode ?? ErpEditorMode.Insight;

    public bool ShowInsights => _form_builder_vm?.ShowInsights ?? false;

    public IReadOnlyList<InsightItem> Insights =>
        _form_builder_vm?.Insights ?? [];

    public IReadOnlyList<ClearTextSegment> ClearTextSegments =>
        _form_builder_vm?.ClearTextSegments ?? [];

    public string EditorModeText => _form_builder_vm?.EditorModeText ?? string.Empty;

    public string EditorModeButtonText =>
        _form_builder_vm?.EditorModeButtonText ?? "Insight";

    public RelayCommand ToggleInsightCommand =>
        _form_builder_vm?.ToggleInsightCommand ?? _noop_toggle;

    public int CaretLine => _form_builder_vm?.CaretLine ?? 1;

    public int CaretOffset => _form_builder_vm?.CaretOffset ?? -1;

    public string FilePath => _form_builder_vm?.LoadedFilePath ?? string.Empty;

    public string Header
    {
        get
        {
            var file = string.IsNullOrWhiteSpace(FilePath)
                ? "XML"
                : $"XML — {System.IO.Path.GetFileName(FilePath)}";
            return $"{file}  ·  {ActiveEditorMode}";
        }
    }

    public bool HasDocument => _form_builder_vm?.HasDocument == true;

    private void OnFormBuilderChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName is nameof(FormBuilderViewModel.XmlSource)
            or nameof(FormBuilderViewModel.EditorText)
            or nameof(FormBuilderViewModel.ActiveEditorMode)
            or nameof(FormBuilderViewModel.ShowInsights)
            or nameof(FormBuilderViewModel.Insights)
            or nameof(FormBuilderViewModel.ClearTextSegments)
            or nameof(FormBuilderViewModel.HasDocument))
            RaiseAll();
        else if (e.PropertyName is nameof(FormBuilderViewModel.CaretLine))
            OnPropertyChanged(nameof(CaretLine));
        else if (e.PropertyName is nameof(FormBuilderViewModel.CaretOffset))
            OnPropertyChanged(nameof(CaretOffset));
        else if (e.PropertyName is nameof(FormBuilderViewModel.LoadedFilePath)
                 or nameof(FormBuilderViewModel.LoadedTitle)
                 or nameof(FormBuilderViewModel.EditorModeText))
            OnPropertyChanged(nameof(Header));
    }

    private void RaiseAll()
    {
        OnPropertyChanged(nameof(EditorText));
        OnPropertyChanged(nameof(HasDocument));
        OnPropertyChanged(nameof(Header));
        OnPropertyChanged(nameof(IsEditorReadOnly));
        OnPropertyChanged(nameof(ActiveEditorMode));
        OnPropertyChanged(nameof(ShowInsights));
        OnPropertyChanged(nameof(Insights));
        OnPropertyChanged(nameof(ClearTextSegments));
        OnPropertyChanged(nameof(EditorModeText));
        OnPropertyChanged(nameof(EditorModeButtonText));
        OnPropertyChanged(nameof(ToggleInsightCommand));
        OnPropertyChanged(nameof(FilePath));
        OnPropertyChanged(nameof(CaretLine));
        OnPropertyChanged(nameof(CaretOffset));
    }
}
