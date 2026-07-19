using System.Windows;
using System.Windows.Input;
using UI.Commands;
using UI.Services;
using UI.ViewModels;
using UI.ViewModels.Shell;
using UI.Views.Controls;

namespace UI;

public partial class MainWindow
{
    public MainWindow()
    {
        InitializeComponent();
        Loaded += OnLoaded;
    }

    private void OnSourceInitialized(object? sender, EventArgs e)
    {
        WindowMaximizeFix.Attach(this);
        ApplyMaximizedChrome();
    }

    private void OnWindowStateChanged(object? sender, EventArgs e)
    {
        ApplyMaximizedChrome();
    }

    /// <summary>
    /// Maximized: bỏ border cửa sổ (tránh double-inset). Work area do WM_GETMINMAXINFO.
    /// </summary>
    private void ApplyMaximizedChrome()
    {
        if (RootLayout is null) return;

        if (WindowState == WindowState.Maximized)
        {
            BorderThickness = new Thickness(0);
            RootLayout.Margin = new Thickness(0);
        }
        else
        {
            BorderThickness = new Thickness(1);
            RootLayout.Margin = new Thickness(0);
        }
    }

    private void OnLoaded(object sender, RoutedEventArgs e)
    {
        ApplyMaximizedChrome();

        // Routed commands — phần lớn NoOp; Save/Parse ủy quyền FormBuilder
        CommandBindings.Add(new CommandBinding(IdeCommands.Exit, (_, _) =>
        {
            if (DataContext is MainViewModel vm) vm.ExitCommand.Execute(null);
        }));

        CommandBindings.Add(new CommandBinding(IdeCommands.Save, OnSave, CanSave));
        CommandBindings.Add(new CommandBinding(IdeCommands.SaveAll, OnSave, CanSave));
        CommandBindings.Add(new CommandBinding(IdeCommands.Parse, OnParse, CanWhenFormBuilder));
        CommandBindings.Add(new CommandBinding(IdeCommands.ClearText, OnClearText, CanWhenFormBuilder));
        CommandBindings.Add(new CommandBinding(IdeCommands.Entity, OnEntity, CanWhenFormBuilder));
        CommandBindings.Add(new CommandBinding(IdeCommands.ExecuteSql, OnExecuteSql, CanWhenSqlDocument));
        CommandBindings.Add(new CommandBinding(IdeCommands.OpenSqlFromForm, OnOpenSqlFromForm, CanOpenSqlFromForm));
        CommandBindings.Add(new CommandBinding(IdeCommands.OpenSqlFile, OnOpenSqlFile));

        CommandBindings.Add(new CommandBinding(IdeCommands.ToggleLeftDock, (_, _) =>
        {
            if (DataContext is MainViewModel vm) vm.Shell.ToggleLeftDockCommand.Execute(null);
        }));
        CommandBindings.Add(new CommandBinding(IdeCommands.ToggleRightDock, (_, _) =>
        {
            if (DataContext is MainViewModel vm) vm.Shell.ToggleRightDockCommand.Execute(null);
        }));
        CommandBindings.Add(new CommandBinding(IdeCommands.ToggleBottomDock, (_, _) =>
        {
            if (DataContext is MainViewModel vm) vm.Shell.ToggleBottomDockCommand.Execute(null);
        }));

        // Open Program → Explorer
        CommandBindings.Add(new CommandBinding(IdeCommands.Open, (_, _) =>
        {
            if (DataContext is not MainViewModel vm) return;
            if (!vm.Shell.IsLeftDockOpen)
                vm.Shell.ToggleLeftDockCommand.Execute(null);
            vm.ExplorerVm.SelectProgramCommand.Execute(null);
        }));

        CommandBindings.Add(new CommandBinding(IdeCommands.Search, OnSearch, CanSearchEditor));
        CommandBindings.Add(new CommandBinding(IdeCommands.Replace, OnReplace, CanSearchEditor));
        CommandBindings.Add(new CommandBinding(IdeCommands.GoToDefinition, OnGoToDefinition, CanWhenFormBuilder));
        CommandBindings.Add(new CommandBinding(IdeCommands.FindReferences, OnFindReferences, CanWhenFormBuilder));

        // Stubs an toàn — không crash. CHÚ Ý: Undo/Redo/Cut/Copy/Paste/Delete KHÔNG được đặt
        // ở đây dù chưa có implementation IDE-wide thật — RoutedUICommand của chúng có
        // InputGesture trùng phím tắt chuẩn (Ctrl+Z/Y/X/C/V, Delete). Một CommandBinding
        // NoOp ở MainWindow (root) sẽ chặn phím đó trước khi tới Editor: với AvalonEdit
        // (WPF control thật) trước đây, TextArea tự xử lý các phím này trước khi bubbling
        // lên tới MainWindow nên không bị lộ; với MonacoEditorHost (WebView2 — native HWND
        // "airspace" island), WPF interop dịch native key event thành routed KeyDown ở
        // chính cấp HwndHost, không có control WPF trung gian nào "giành" xử lý trước —
        // CommandBinding NoOp ở MainWindow sẽ thắng và nuốt mất phím, khiến Monaco/WebView2
        // không bao giờ nhận được Ctrl+C/V/X/Delete/Z/Y thật. Không có CommandBinding nào ở
        // đây cho các phím này → WPF không đánh dấu Handled → phím tới Monaco bình thường,
        // dùng Undo/Redo/Copy/Paste/Delete NGUYÊN SINH của Monaco. Menu Edit tương ứng
        // (IdeMenuBar.xaml) sẽ hiện disabled (đúng — chưa có IDE-wide command thật) thay vì
        // giả vờ hoạt động mà không làm gì.
        foreach (var cmd in new[]
                 {
                     IdeCommands.New,
                     IdeCommands.Add, IdeCommands.ValidateXml, IdeCommands.Preview,
                     IdeCommands.Settings
                 })
        {
            CommandBindings.Add(new CommandBinding(cmd, NoOp, (_, ev) => ev.CanExecute = true));
        }
    }

    private void CanSearchEditor(object sender, CanExecuteRoutedEventArgs e)
    {
        e.CanExecute = FindInsightEditorSurface() is not null
                       || FindXmlBottomPanel() is not null;
    }

    private void OnSearch(object sender, ExecutedRoutedEventArgs e)
    {
        if (FindInsightEditorSurface() is not null)
        {
            FindInsightEditorSurface()?.OpenSearch();
            return;
        }
        EnsureXmlBottomVisible();
        FindXmlBottomPanel()?.OpenSearch();
    }

    private void OnReplace(object sender, ExecutedRoutedEventArgs e)
    {
        if (FindInsightEditorSurface() is not null)
        {
            FindInsightEditorSurface()?.OpenReplace();
            return;
        }
        EnsureXmlBottomVisible();
        FindXmlBottomPanel()?.OpenReplace();
    }

    private void OnGoToDefinition(object sender, ExecutedRoutedEventArgs e)
    {
        if (FindInsightEditorSurface()?.TryGoToDefinition() == true)
            return;

        if (DataContext is not MainViewModel vm)
            return;
        if (vm.Shell.ActiveContent is not FormBuilderViewModel fb)
            return;

        var symbol_id = fb.SelectedInsightLine?.SymbolId;
        if (string.IsNullOrWhiteSpace(symbol_id))
            return;

        var location = vm.LanguageService.GetSymbolDefinition(symbol_id);
        if (location?.Line > 0)
            fb.NavigateToLine(location.Line);
    }

    private void OnFindReferences(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is not MainViewModel vm) return;
        if (!vm.Shell.IsBottomDockOpen)
            vm.Shell.ToggleBottomDockCommand.Execute(null);
        var references_pane = vm.Shell.BottomPanes
            .FirstOrDefault(p => p.Kind == ToolPaneKind.References);
        if (references_pane is not null)
            vm.Shell.SelectBottomPaneCommand.Execute(references_pane);
    }

    private void EnsureXmlBottomVisible()
    {
        if (DataContext is not MainViewModel vm) return;
        if (!vm.Shell.IsBottomDockOpen)
            vm.Shell.ToggleBottomDockCommand.Execute(null);
        var xml_pane = vm.Shell.BottomPanes.FirstOrDefault(p => p.Kind == ToolPaneKind.Xml);
        if (xml_pane is not null)
            vm.Shell.SelectBottomPaneCommand.Execute(xml_pane);
    }

    private InsightEditorSurface? FindInsightEditorSurface() =>
        FindVisualChild<InsightEditorSurface>(this);

    private UI.Views.Bottom.XmlBottomPanel? FindXmlBottomPanel() =>
        FindVisualChild<UI.Views.Bottom.XmlBottomPanel>(this);

    private static T? FindVisualChild<T>(DependencyObject parent) where T : DependencyObject
    {
        var count = System.Windows.Media.VisualTreeHelper.GetChildrenCount(parent);
        for (var i = 0; i < count; i++)
        {
            var child = System.Windows.Media.VisualTreeHelper.GetChild(parent, i);
            if (child is T match) return match;
            var nested = FindVisualChild<T>(child);
            if (nested is not null) return nested;
        }
        return null;
    }

    private void CanWhenFormBuilder(object sender, CanExecuteRoutedEventArgs e)
    {
        e.CanExecute = DataContext is MainViewModel { Shell.ActiveContent: FormBuilderViewModel };
    }

    private void CanSave(object sender, CanExecuteRoutedEventArgs e)
    {
        if (DataContext is not MainViewModel vm)
        {
            e.CanExecute = false;
            return;
        }

        e.CanExecute = vm.Shell.ActiveContent is SqlDocumentViewModel sql
            ? sql.SaveCommand.CanExecute(null)
            : vm.Shell.ActiveContent is FormBuilderViewModel fb && fb.SaveCommand.CanExecute(null);
    }

    private void CanWhenSqlDocument(object sender, CanExecuteRoutedEventArgs e)
    {
        e.CanExecute = DataContext is MainViewModel { Shell.ActiveContent: SqlDocumentViewModel sql }
                       && sql.ExecuteCommand.CanExecute(null);
    }

    private void CanOpenSqlFromForm(object sender, CanExecuteRoutedEventArgs e)
    {
        e.CanExecute = DataContext is MainViewModel { Shell.ActiveContent: FormBuilderViewModel fb }
                       && fb.OpenSqlFromFormCommand.CanExecute(null);
    }

    private void OnSave(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is not MainViewModel vm) return;
        if (vm.Shell.ActiveContent is SqlDocumentViewModel sql)
            sql.SaveCommand.Execute(null);
        else if (vm.Shell.ActiveContent is FormBuilderViewModel fb)
            fb.SaveCommand.Execute(null);
    }

    private void OnParse(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is MainViewModel { Shell.ActiveContent: FormBuilderViewModel fb })
            fb.ParseCommand.Execute(null);
    }

    private void OnClearText(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is MainViewModel { Shell.ActiveContent: FormBuilderViewModel fb })
            fb.SetEditorModeCommand.Execute(DevWorkFlow.Domain.Language.ErpEditorMode.Insight);
    }

    private void OnEntity(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is not MainViewModel { Shell.ActiveContent: FormBuilderViewModel shell_fb }) return;
        if (!shell_fb.IsInsightMode)
            shell_fb.SetEditorModeCommand.Execute(DevWorkFlow.Domain.Language.ErpEditorMode.Insight);
    }

    private void OnExecuteSql(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is MainViewModel { Shell.ActiveContent: SqlDocumentViewModel sql })
            sql.ExecuteCommand.Execute(null);
    }

    private void OnOpenSqlFromForm(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is MainViewModel { Shell.ActiveContent: FormBuilderViewModel fb })
            fb.OpenSqlFromFormCommand.Execute(null);
    }

    private void OnOpenSqlFile(object sender, ExecutedRoutedEventArgs e)
    {
        if (DataContext is MainViewModel vm)
            vm.NavigationVm.OpenSqlFileCommand.Execute(null);
    }

    private static void NoOp(object sender, ExecutedRoutedEventArgs e)
    {
        // Stub — implement ở bước module tương ứng
    }
}
