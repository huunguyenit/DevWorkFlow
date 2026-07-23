using System.Windows;
using System.Windows.Controls;
using UI.ViewModels;

namespace UI.Views.Controls;

public partial class InsightEditorSurface : UserControl
{
    public InsightEditorSurface()
    {
        InitializeComponent();
        Loaded += (_, _) => WireCaretTracking();
    }

    private void WireCaretTracking()
    {
        SourceEditor.CaretPositionChanged += (line, column) =>
        {
            if (DataContext is not FormBuilderViewModel vm) return;
            vm.UpdateCaretPosition(line, column);
        };
        SourceEditor.OpenEntityRequested += request =>
        {
            if (DataContext is FormBuilderViewModel vm)
                vm.NavigateToEntity(request);
        };
        SourceEditor.EntityOffsetActivated += (offset, insight) =>
        {
            if (DataContext is FormBuilderViewModel vm)
                vm.OnEntityOffsetActivated(offset, insight);
        };
        SourceEditor.EntityHoverRequested += (offset, insight, entity_name) =>
        {
            if (DataContext is not FormBuilderViewModel vm) return;
            var view = vm.ResolveEntityHover(offset, insight, entity_name);
            if (view is null)
                SourceEditor.HideEntityHover(offset);
            else
                SourceEditor.ShowEntityHover(offset, view.Name, view.Value, view.IsError);
        };

        // Phase 4 — Completion / Signature Help lấy từ catalog qua Language Service.
        SourceEditor.FboJsCompleteRequested += (offset, insight) =>
        {
            if (DataContext is not FormBuilderViewModel vm) return null;
            return vm.CompleteFboJsAssist(offset, insight).Items
                .Select(i => new
                {
                    label = i.Label,
                    insertText = i.InsertText,
                    kind = i.Kind,
                    detail = i.Detail,
                    documentation = i.Documentation
                })
                .ToArray();
        };

        SourceEditor.OptionsSnippetRequested += (offset, line_text) =>
            DataContext is FormBuilderViewModel vm
                ? vm.TryExpandOptionsSnippet(offset, line_text)
                : null;

        SourceEditor.FboJsSignatureRequested += (offset, insight) =>
        {
            if (DataContext is not FormBuilderViewModel vm) return null;
            var help = vm.SignatureFboJsAssist(offset, insight);
            if (help is null) return null;
            return new
            {
                label = help.Label,
                documentation = help.Documentation,
                parameters = help.Parameters
                    .Select(p => new { label = p.Label, documentation = p.Documentation })
                    .ToArray(),
                activeParameter = help.ActiveParameter
            };
        };
    }

    public void OpenSearch() => SourceEditor.OpenSearch();

    public void OpenReplace() => SourceEditor.OpenReplace();

    public bool TryGoToDefinition() => SourceEditor.TryGoToDefinition();
}
