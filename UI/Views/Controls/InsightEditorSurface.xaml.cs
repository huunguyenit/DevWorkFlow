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
    }

    public void OpenSearch() => SourceEditor.OpenSearch();

    public void OpenReplace() => SourceEditor.OpenReplace();

    public bool TryGoToDefinition() => SourceEditor.TryGoToDefinition();
}
