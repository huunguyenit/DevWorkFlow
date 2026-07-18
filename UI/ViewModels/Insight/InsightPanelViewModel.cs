using System.Collections.ObjectModel;
using System.ComponentModel;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using UI.ViewModels;
using UI.ViewModels.Base;

namespace UI.ViewModels.Insight;

public sealed class InsightEntityRowVm
{
    public string ReferenceText { get; init; } = string.Empty;
    public string ResolvedValue { get; init; } = string.Empty;
    public string StatusText { get; init; } = string.Empty;
    public bool IsOk { get; init; }
    public string? EntityName { get; init; }
}

public sealed class InsightValidationRowVm
{
    public string Message { get; init; } = string.Empty;
    public string SeverityBadge { get; init; } = "H";
    public int Line { get; init; }
}

/// <summary>Right dock — Entity Resolution, Validation, summary badges.</summary>
public sealed class InsightPanelViewModel : ViewModelBase
{
    private FormBuilderViewModel? _form_builder_vm;
    private int _error_count;
    private int _warning_count;
    private int _hint_count;

    public InsightPanelViewModel(FormBuilderViewModel? form_builder_vm = null)
    {
        EntityRows = [];
        ValidationRows = [];
        BindTo(form_builder_vm);
    }

    public ObservableCollection<InsightEntityRowVm> EntityRows { get; }
    public ObservableCollection<InsightValidationRowVm> ValidationRows { get; }

    public int ErrorCount
    {
        get => _error_count;
        private set => SetProperty(ref _error_count, value);
    }

    public int WarningCount
    {
        get => _warning_count;
        private set => SetProperty(ref _warning_count, value);
    }

    public int HintCount
    {
        get => _hint_count;
        private set => SetProperty(ref _hint_count, value);
    }

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
        if (e.PropertyName is nameof(FormBuilderViewModel.ErpDocument)
            or nameof(FormBuilderViewModel.Insights)
            or nameof(FormBuilderViewModel.SemanticModel))
            Refresh();
    }

    public void Refresh()
    {
        EntityRows.Clear();
        ValidationRows.Clear();

        var diagnostics = _form_builder_vm?.ErpDocument?.Diagnostics
                          ?? _form_builder_vm?.SemanticModel?.Diagnostics
                          ?? [];
        var (errors, warnings, hints) = DiagnosticGridMapper.CountBySeverity(diagnostics);
        ErrorCount = errors;
        WarningCount = warnings;
        HintCount = hints;

        foreach (var insight in _form_builder_vm?.Insights ?? [])
        {
            if (insight.Type == InsightType.Entity)
            {
                insight.Metadata.TryGetValue("entity_name", out var entity_name);
                EntityRows.Add(new InsightEntityRowVm
                {
                    ReferenceText = insight.ReferenceText,
                    ResolvedValue = insight.ResolvedValue,
                    EntityName = entity_name,
                    IsOk = !string.IsNullOrWhiteSpace(insight.ResolvedValue),
                    StatusText = string.IsNullOrWhiteSpace(insight.ResolvedValue) ? "Missing" : "OK"
                });
            }
            else if (insight.Type == InsightType.Validation)
            {
                ValidationRows.Add(new InsightValidationRowVm
                {
                    Message = insight.DisplayContent,
                    Line = insight.Range.Line,
                    SeverityBadge = insight.Layer switch
                    {
                        InsightLayer.Error => "E",
                        InsightLayer.Warning => "W",
                        _ => "H"
                    }
                });
            }
        }

        foreach (var diagnostic in diagnostics)
        {
            if (diagnostic.Severity == ErpDiagnosticSeverity.Hidden)
                continue;
            ValidationRows.Add(new InsightValidationRowVm
            {
                Message = diagnostic.Message,
                Line = diagnostic.Location.Line,
                SeverityBadge = diagnostic.Severity switch
                {
                    ErpDiagnosticSeverity.Error => "E",
                    ErpDiagnosticSeverity.Warning => "W",
                    _ => "H"
                }
            });
        }
    }
}
