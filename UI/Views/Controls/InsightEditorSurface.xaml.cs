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
        // Offset caret nuôi lịch sử Back/Forward (P6-01) — line/column không đủ.
        SourceEditor.CaretOffsetChanged += offset =>
        {
            if (DataContext is FormBuilderViewModel vm)
                vm.UpdateCaretOffset(offset);
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
                SourceEditor.ShowEntityHover(
                    offset, view.Name, view.Value, view.IsError, view.Kind);
        };

        // Phase 4 — Completion / Signature Help lấy từ catalog qua Language Service.
        // Một request phục vụ cả hai island: JS trước, trượt thì thử SQL (command/query/response
        // action). Hai island không chồng nhau nên không có chuyện trộn nhầm danh sách.
        SourceEditor.FboJsCompleteRequested += (offset, insight) =>
        {
            if (DataContext is not FormBuilderViewModel vm) return null;

            var js_items = vm.CompleteFboJsAssist(offset, insight).Items;
            if (js_items.Count > 0)
                return js_items
                    .Select(i => new
                    {
                        label = i.Label,
                        insertText = i.InsertText,
                        kind = i.Kind,
                        detail = i.Detail,
                        documentation = i.Documentation
                    })
                    .ToArray();

            return SqlCompletionMapper.ToBridgeItems(vm.CompleteSqlAssist(offset, insight));
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
