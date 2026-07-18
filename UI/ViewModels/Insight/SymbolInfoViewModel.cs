using System.Collections.ObjectModel;
using System.ComponentModel;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using UI.ViewModels;
using UI.ViewModels.Base;

namespace UI.ViewModels.Insight;

public sealed class SymbolReferenceRowVm
{
    public string Kind { get; init; } = string.Empty;
    public string File { get; init; } = string.Empty;
    public int Line { get; init; }
    public int Column { get; init; }
    public string Display => Line > 0 ? $"{Kind}  {File}:{Line}" : Kind;
}

/// <summary>Right dock — symbol tại caret/selection.</summary>
public sealed class SymbolInfoViewModel : ViewModelBase
{
    private readonly IErpLanguageService? _language_service;
    private FormBuilderViewModel? _form_builder_vm;
    private string _symbol_name = "(none)";
    private string _symbol_type = "—";
    private string _category = "—";
    private string _data_type = "—";
    private string _read_only = "—";
    private string? _selected_symbol_id;

    public SymbolInfoViewModel(
        IErpLanguageService? language_service = null,
        FormBuilderViewModel? form_builder_vm = null)
    {
        _language_service = language_service;
        References = [];
        BindTo(form_builder_vm);
    }

    public ObservableCollection<SymbolReferenceRowVm> References { get; }

    public string SymbolName
    {
        get => _symbol_name;
        private set => SetProperty(ref _symbol_name, value);
    }

    public string SymbolType
    {
        get => _symbol_type;
        private set => SetProperty(ref _symbol_type, value);
    }

    public string Category
    {
        get => _category;
        private set => SetProperty(ref _category, value);
    }

    public string DataType
    {
        get => _data_type;
        private set => SetProperty(ref _data_type, value);
    }

    public string ReadOnlyText
    {
        get => _read_only;
        private set => SetProperty(ref _read_only, value);
    }

    public string? SelectedSymbolId => _selected_symbol_id;

    public void BindTo(FormBuilderViewModel? form_builder_vm)
    {
        if (ReferenceEquals(_form_builder_vm, form_builder_vm)) return;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnFormChanged;
        _form_builder_vm = form_builder_vm;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged += OnFormChanged;
        Refresh();
    }

    private void OnFormChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName is nameof(FormBuilderViewModel.CaretLine)
            or nameof(FormBuilderViewModel.SelectedInsightLine)
            or nameof(FormBuilderViewModel.SemanticModel)
            or nameof(FormBuilderViewModel.ErpDocument))
            Refresh();
    }

    public void Refresh()
    {
        References.Clear();
        _selected_symbol_id = null;

        var semantic = _form_builder_vm?.SemanticModel;
        if (semantic is null)
        {
            SymbolName = "(none)";
            SymbolType = "—";
            Category = "—";
            DataType = "—";
            ReadOnlyText = "—";
            return;
        }

        ErpSymbol? symbol = null;
        if (_form_builder_vm?.SelectedInsightLine?.SymbolId is { } insight_symbol_id)
            symbol = semantic.Symbols.FirstOrDefault(item => item.Id == insight_symbol_id);

        if (symbol is null && _form_builder_vm?.CaretLine > 0)
        {
            var line = _form_builder_vm.CaretLine;
            symbol = semantic.GetFields()
                .FirstOrDefault(field => field.Definition.Line == line)
                as ErpSymbol
                ?? semantic.GetEntities()
                    .FirstOrDefault(entity => entity.Definition.Line == line);
        }

        if (symbol is null)
        {
            SymbolName = "(none)";
            SymbolType = "—";
            Category = "—";
            DataType = "—";
            ReadOnlyText = "—";
            return;
        }

        _selected_symbol_id = symbol.Id;
        SymbolName = symbol.Name;
        SymbolType = symbol.Kind.ToString();
        Category = symbol switch
        {
            FieldSymbol field => field.CategoryIndex switch
            {
                null or 0 => "Top",
                -1 => "Bottom",
                _ => $"Tab {field.CategoryIndex}"
            },
            EntitySymbol => "Entity",
            _ => symbol.Kind.ToString()
        };
        DataType = symbol is FieldSymbol fs ? fs.DataType ?? "—" : "—";
        ReadOnlyText = symbol is FieldSymbol { AllowNulls: false } ? "Required" : "—";

        if (_language_service is not null)
        {
            foreach (var reference in _language_service.FindSymbolReferences(symbol.Id))
            {
                References.Add(new SymbolReferenceRowVm
                {
                    Kind = reference.Kind,
                    File = reference.Location.Path,
                    Line = reference.Location.Line,
                    Column = reference.Location.Column
                });
            }
        }
        else if (symbol is EntitySymbol entity)
        {
            foreach (var reference in entity.References)
            {
                References.Add(new SymbolReferenceRowVm
                {
                    Kind = reference.Kind,
                    File = reference.Location.Path,
                    Line = reference.Location.Line,
                    Column = reference.Location.Column
                });
            }
        }
    }
}
