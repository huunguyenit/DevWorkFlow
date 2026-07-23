using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Windows.Input;
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

    /// <summary>Offset trong file <see cref="File"/> để điều hướng; -1 nếu không áp dụng.</summary>
    public int TargetOffset { get; init; } = -1;

    /// <summary>Dòng code tại vị trí này (Language Service cung cấp, UI không đọc file).</summary>
    public string Preview { get; init; } = string.Empty;

    /// <summary>Tên file ngắn để hiển thị; đường dẫn đầy đủ nằm ở <see cref="File"/>.</summary>
    public string FileName =>
        string.IsNullOrWhiteSpace(File) ? string.Empty : Path.GetFileName(File);

    public string LineText => Line > 0 ? $"Line {Line}" : string.Empty;

    public string Display => Line > 0 ? $"{Kind}  {FileName}:{Line}" : Kind;
}

/// <summary>Một mắt xích trong sơ đồ RELATIONSHIP (request → action → case / definition).</summary>
public sealed class SymbolRelationRowVm
{
    public string Label { get; init; } = string.Empty;
    public string RoleText { get; init; } = string.Empty;
    public string File { get; init; } = string.Empty;
    public int Line { get; init; }
    public int TargetOffset { get; init; } = -1;

    public string LineText => Line > 0 ? $"{Path.GetFileName(File)}:{Line}" : string.Empty;
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

    /// <summary>Danh sách reference đang được ghim (xem <see cref="ShowReferences"/>).</summary>
    private bool _pinned;

    public SymbolInfoViewModel(
        IErpLanguageService? language_service = null,
        FormBuilderViewModel? form_builder_vm = null)
    {
        _language_service = language_service;
        References = [];
        Relations = [];
        ActivateReferenceCommand = new RelayCommand<SymbolReferenceRowVm>(ActivateReference);
        ActivateRelationCommand = new RelayCommand<SymbolRelationRowVm>(ActivateRelation);
        BindTo(form_builder_vm);
    }

    public ObservableCollection<SymbolReferenceRowVm> References { get; }

    /// <summary>Sơ đồ quan hệ hai chiều quanh symbol (rỗng = không hiện section).</summary>
    public ObservableCollection<SymbolRelationRowVm> Relations { get; }

    public ICommand ActivateRelationCommand { get; }

    public bool HasRelations => Relations.Count > 0;

    public bool HasReferences => References.Count > 0;

    /// <summary>Badge "N References" ở header.</summary>
    public string ReferenceCountText => $"{References.Count} reference";

    private void ActivateRelation(SymbolRelationRowVm? row)
    {
        if (row is null || row.TargetOffset < 0 || _form_builder_vm is null) return;
        NavigateTo(row.File, row.TargetOffset);
    }

    private void NavigateTo(string file, int offset)
    {
        if (_form_builder_vm is null) return;

        var loaded = _form_builder_vm.LoadedFilePath;
        var is_other_file = !string.IsNullOrWhiteSpace(file)
                            && !string.IsNullOrWhiteSpace(loaded)
                            && !string.Equals(
                                Path.GetFullPath(file),
                                Path.GetFullPath(loaded),
                                StringComparison.OrdinalIgnoreCase);

        if (is_other_file)
            _form_builder_vm.OpenEntityFile(file, offset);
        else
            _form_builder_vm.NavigateToOffset(offset);
    }

    /// <summary>Double-click một reference → NavigateToOffset trong document hiện tại.</summary>
    public ICommand ActivateReferenceCommand { get; }

    private void ActivateReference(SymbolReferenceRowVm? row)
    {
        // Call site có thể nằm trong file entity include khác — NavigateTo mở đúng file rồi focus.
        if (row is null || row.TargetOffset < 0) return;
        NavigateTo(row.File, row.TargetOffset);
    }

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
        {
            _form_builder_vm.PropertyChanged -= OnFormChanged;
            _form_builder_vm.ReferencesRequested -= OnReferencesRequested;
        }
        _form_builder_vm = form_builder_vm;
        if (_form_builder_vm is not null)
        {
            _form_builder_vm.PropertyChanged += OnFormChanged;
            _form_builder_vm.ReferencesRequested += OnReferencesRequested;
        }
        Refresh();
    }

    private void OnReferencesRequested(JsRuntimeNavHit hit) => ShowSymbol(hit);

    /// <summary>
    /// Hiển thị symbol JS runtime (Phase 3) — tên + loại, sơ đồ RELATIONSHIP hai chiều và danh
    /// sách references kèm file:line:code.
    ///
    /// Ctrl+Click cũng làm Monaco dời caret → <see cref="OnFormChanged"/> bắn ngay sau đó và
    /// <see cref="Refresh"/> sẽ xoá sạch những gì vừa dựng. Vì vậy phải "ghim" (pin) kết quả
    /// cho tới khi người dùng chủ động đổi document.
    /// </summary>
    public void ShowSymbol(JsRuntimeNavHit hit)
    {
        _pinned = true;
        References.Clear();
        Relations.Clear();
        _selected_symbol_id = string.IsNullOrEmpty(hit.SymbolId) ? null : hit.SymbolId;

        SymbolName = string.IsNullOrWhiteSpace(hit.SymbolName) ? hit.DisplayLabel : hit.SymbolName;
        SymbolType = string.IsNullOrWhiteSpace(hit.SymbolKindText) ? "—" : hit.SymbolKindText;
        Category = "—";
        DataType = "—";
        ReadOnlyText = "—";

        foreach (var relation in hit.Relations)
        {
            Relations.Add(new SymbolRelationRowVm
            {
                Label = relation.Label,
                RoleText = RoleText(relation.Role),
                File = relation.TargetPath,
                Line = relation.Line,
                TargetOffset = relation.TargetOffset
            });
        }

        foreach (var target in hit.References)
        {
            References.Add(new SymbolReferenceRowVm
            {
                Kind = target.NodeType,
                File = target.DocumentUri,
                Line = target.StartLine,
                TargetOffset = target.TextRange.StartOffset,
                Preview = target.Preview
            });
        }

        OnPropertyChanged(nameof(HasRelations));
        OnPropertyChanged(nameof(HasReferences));
        OnPropertyChanged(nameof(ReferenceCountText));
    }

    private static string RoleText(JsRuntimeRelationRole role) => role switch
    {
        JsRuntimeRelationRole.RequestSite => "gọi",
        JsRuntimeRelationRole.ActionDeclaration => "khai báo",
        JsRuntimeRelationRole.ResponseCase => "xử lý",
        JsRuntimeRelationRole.FunctionDefinition => "định nghĩa",
        _ => string.Empty
    };

    private void OnFormChanged(object? sender, PropertyChangedEventArgs e)
    {
        // Đổi document / semantic model → kết quả ghim không còn đúng ngữ cảnh nữa.
        if (e.PropertyName is nameof(FormBuilderViewModel.SemanticModel)
            or nameof(FormBuilderViewModel.ErpDocument))
        {
            _pinned = false;
            Refresh();
            return;
        }

        // Caret/selection đổi: bỏ qua khi đang ghim danh sách reference.
        if (e.PropertyName is nameof(FormBuilderViewModel.CaretLine)
            or nameof(FormBuilderViewModel.SelectedInsightLine))
        {
            if (_pinned) return;
            Refresh();
        }
    }

    public void Refresh()
    {
        _pinned = false;
        References.Clear();
        Relations.Clear();
        OnPropertyChanged(nameof(HasRelations));
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

        OnPropertyChanged(nameof(HasReferences));
        OnPropertyChanged(nameof(ReferenceCountText));
    }
}
