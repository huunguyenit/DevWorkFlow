using System.Windows;
using System.Windows.Input;
using UI.Commands;
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

    private void OnLoaded(object sender, RoutedEventArgs e)
    {
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

        // Stubs an toàn — không crash
        foreach (var cmd in new[]
                 {
                     IdeCommands.New, IdeCommands.Undo, IdeCommands.Redo,
                     IdeCommands.Cut, IdeCommands.Copy, IdeCommands.Paste, IdeCommands.Delete,
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
