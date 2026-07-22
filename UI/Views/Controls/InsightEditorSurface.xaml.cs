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
        SourceEditor.EntityOffsetActivated += offset =>
        {
            if (DataContext is FormBuilderViewModel vm)
                vm.OnEntityOffsetActivated(offset);
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
    }

    public void OpenSearch() => SourceEditor.OpenSearch();

    public void OpenReplace() => SourceEditor.OpenReplace();

    public bool TryGoToDefinition() => SourceEditor.TryGoToDefinition();
}
