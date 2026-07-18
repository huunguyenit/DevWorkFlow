using System.ComponentModel;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>
/// Sync diagnostics từ FormBuilder ErpDocument → Problems/Output + status message bridge.
/// </summary>
public sealed class FormBuilderDiagnosticsBridge
{
    private FormBuilderViewModel? _form_builder_vm;
    private readonly IdeDiagnosticsViewModel _diagnostics;
    private readonly IErpLanguageService? _language_service;

    public FormBuilderDiagnosticsBridge(
        IdeDiagnosticsViewModel diagnostics,
        IErpLanguageService? language_service = null,
        FormBuilderViewModel? form_builder_vm = null)
    {
        _diagnostics = diagnostics;
        _language_service = language_service;
        BindTo(form_builder_vm);
    }

    public void BindTo(FormBuilderViewModel? form_builder_vm)
    {
        if (ReferenceEquals(_form_builder_vm, form_builder_vm)) return;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnChanged;
        _form_builder_vm = form_builder_vm;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged += OnChanged;
        SyncDocumentDiagnostics();
    }

    private void OnChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (_form_builder_vm is null) return;

        if (e.PropertyName is nameof(FormBuilderViewModel.ErpDocument)
            or nameof(FormBuilderViewModel.Insights)
            or nameof(FormBuilderViewModel.SemanticModel)
            or nameof(FormBuilderViewModel.SelectedInsightLine)
            or nameof(FormBuilderViewModel.CaretLine))
        {
            SyncDocumentDiagnostics();
            return;
        }

        if (e.PropertyName == nameof(FormBuilderViewModel.StatusMessage))
            ForwardStatusMessage(_form_builder_vm.StatusMessage);
    }

    private void SyncDocumentDiagnostics()
    {
        if (_form_builder_vm is null) return;

        var diagnostics = _form_builder_vm.ErpDocument?.Diagnostics
                          ?? _form_builder_vm.SemanticModel?.Diagnostics
                          ?? [];
        _diagnostics.SyncProblems(diagnostics, _form_builder_vm.LoadedFilePath);

        var symbol_id = _form_builder_vm.SelectedInsightLine?.SymbolId;
        if (string.IsNullOrWhiteSpace(symbol_id))
            symbol_id = ResolveSymbolAtCaret();

        if (!string.IsNullOrWhiteSpace(symbol_id) && _language_service is not null)
            _diagnostics.SyncReferences(_language_service.FindSymbolReferences(symbol_id));
        else
            _diagnostics.References.Clear();
    }

    private string? ResolveSymbolAtCaret()
    {
        var semantic = _form_builder_vm?.SemanticModel;
        if (semantic is null || _form_builder_vm!.CaretLine <= 0)
            return null;

        var line = _form_builder_vm.CaretLine;
        var field = semantic.GetFields().FirstOrDefault(item => item.Definition.Line == line);
        if (field is not null) return field.Id;

        var entity = semantic.GetEntities().FirstOrDefault(item => item.Definition.Line == line);
        return entity?.Id;
    }

    private void ForwardStatusMessage(string msg)
    {
        if (string.IsNullOrWhiteSpace(msg)) return;

        var file = _form_builder_vm?.LoadedFilePath;
        if (msg.StartsWith('✘') || msg.Contains("lỗi", StringComparison.OrdinalIgnoreCase)
            || msg.Contains("Lỗi", StringComparison.OrdinalIgnoreCase))
        {
            _diagnostics.Error(msg, "FormBuilder", file);
        }
        else if (msg.StartsWith('✔'))
        {
            _diagnostics.Info(msg, "FormBuilder");
        }
        else
        {
            _diagnostics.Info(msg, "FormBuilder");
        }
    }
}
