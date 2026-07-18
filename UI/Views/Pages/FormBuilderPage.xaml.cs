using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Input;
using UI.ViewModels;
using UI.ViewModels.Design;

namespace UI.Views.Pages;

public partial class FormBuilderPage
{
    private DesignCellVm? _span_drag_cell;
    private double _span_drag_width;

    public FormBuilderPage() => InitializeComponent();

    private void Cell_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        if (DataContext is not FormBuilderViewModel vm) return;
        if (sender is FrameworkElement fe && fe.DataContext is DesignCellVm cell)
        {
            var additive = Keyboard.Modifiers.HasFlag(ModifierKeys.Control);
            vm.SelectCell(cell, additive);
            e.Handled = true;
        }
    }

    /// <summary>
    /// Design-mode: click/enter bất kỳ đâu trên ô (kể cả vùng text) → chọn + show properties.
    /// Ctrl+click = multi-select.
    /// </summary>
    private void Cell_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        if (e.OriginalSource is Thumb) return;
        if (DataContext is not FormBuilderViewModel vm) return;
        if (sender is FrameworkElement fe && fe.DataContext is DesignCellVm cell)
        {
            var additive = Keyboard.Modifiers.HasFlag(ModifierKeys.Control);
            vm.SelectCell(cell, additive);
        }
    }

    private void Chrome_EastDragStarted(object sender, DragStartedEventArgs e)
    {
        if (sender is not FrameworkElement { DataContext: DesignCellVm cell }) return;
        _span_drag_cell = cell;
        _span_drag_width = cell.WidthDip;
        if (DataContext is FormBuilderViewModel vm)
            vm.SelectCell(cell);
    }

    private void Chrome_EastDragDelta(object sender, DragDeltaEventArgs e)
    {
        if (_span_drag_cell is null || DataContext is not FormBuilderViewModel vm) return;
        _span_drag_width = System.Math.Max(8, _span_drag_width + e.HorizontalChange);
        vm.ResizeCellSpanToWidth(_span_drag_cell, _span_drag_width, commit: false);
    }

    private void Chrome_EastDragCompleted(object sender, DragCompletedEventArgs e)
    {
        if (_span_drag_cell is null || DataContext is not FormBuilderViewModel vm) return;
        vm.ResizeCellSpanToWidth(_span_drag_cell, _span_drag_width, commit: true);
        _span_drag_cell = null;
    }
}
