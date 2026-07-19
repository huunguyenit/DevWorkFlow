using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels.Bottom;

namespace UI.Views.Bottom;

public partial class XmlBottomPanel
{
    public XmlBottomPanel()
    {
        InitializeComponent();
        XmlEditor.OpenFileRequested += path =>
        {
            if (DataContext is XmlBottomViewModel vm)
                vm.FormBuilder?.OpenEntityFile(path);
        };
    }

    private void StructureTree_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
    {
        if (e.NewValue is not XmlStructureNodeVm node) return;
        if (DataContext is not XmlBottomViewModel vm) return;
        vm.StructureOutline.SelectNodeCommand.Execute(node);
    }

    private void StructureItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (sender is not TreeViewItem { DataContext: XmlStructureNodeVm node }) return;
        if (DataContext is not XmlBottomViewModel vm) return;
        vm.StructureOutline.SelectNodeCommand.Execute(node);
        e.Handled = true;
    }

    /// <summary>Ribbon / menu Find — mở SearchPanel trên editor.</summary>
    public void OpenSearch() => XmlEditor.OpenSearch();

    public void OpenReplace() => XmlEditor.OpenReplace();
}
