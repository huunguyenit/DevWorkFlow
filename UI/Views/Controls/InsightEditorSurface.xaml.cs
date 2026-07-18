using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DevWorkFlow.Domain.Language;
using UI.ViewModels;
using UI.ViewModels.Design;

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
        SourceEditor.TextArea.Caret.PositionChanged += (_, _) =>
        {
            if (DataContext is not FormBuilderViewModel vm) return;
            var line = SourceEditor.TextArea.Caret.Line;
            var column = SourceEditor.TextArea.Caret.Column;
            vm.UpdateCaretPosition(line, column);
        };
    }

    private void InsightLine_Click(object sender, MouseButtonEventArgs e)
    {
        if (sender is not FrameworkElement { DataContext: InsightEditorLineVm line }) return;
        if (DataContext is FormBuilderViewModel vm)
            vm.NavigateToLine(line.LineNumber);
    }

    private void ResolvedValue_LostFocus(object sender, RoutedEventArgs e)
    {
        if (sender is not TextBox text_box
            || text_box.Tag is not InsightEditorLineVm line
            || !line.CanEdit
            || string.IsNullOrWhiteSpace(line.EntityName)
            || DataContext is not FormBuilderViewModel vm)
            return;

        vm.CommitEntityValue(line.EntityName, text_box.Text);
    }

    public void OpenSearch() => SourceEditor.OpenSearch();

    public void OpenReplace() => SourceEditor.OpenReplace();

    public bool TryGoToDefinition() => SourceEditor.TryGoToDefinition();
}
