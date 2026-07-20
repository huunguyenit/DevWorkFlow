using System.Windows.Controls;
using UI.Docking;
using UI.Docking.Avalon;
using UI.ViewModels;
using UI.Views.Explorer;
using UI.Views.Properties;

namespace UI.Views.Shell;

public partial class IdeDockWorkspace
{
    private bool _initialized;

    public IdeDockWorkspace()
    {
        InitializeComponent();
        Loaded += OnLoaded;
    }

    private void OnLoaded(object sender, System.Windows.RoutedEventArgs e)
    {
        if (DataContext is not MainViewModel main_vm) return;
        if (_initialized) return;

        _initialized = true;
        var dock_manager = main_vm.Shell.DockManager;
        var host = new AvalonDockWorkspaceHost();
        host.Attach(AvalonDockManager);
        dock_manager.AttachHost(host);

        dock_manager.RegisterPanelContent(DockPanelId.LeftTop, new LeftExplorerDockHost { DataContext = main_vm });
        dock_manager.RegisterPanelContent(DockPanelId.LeftBottom, new OutlinePanel { DataContext = main_vm.OutlineVm });
        dock_manager.RegisterPanelContent(DockPanelId.RightBottom, new PropertyGridPanel { DataContext = main_vm.PropertyGridVm });
        dock_manager.RegisterPanelContent(DockPanelId.RightTop, new RightToolDockHost { DataContext = main_vm });
        dock_manager.RegisterPanelContent(DockPanelId.CenterBottom, new BottomToolDockHost { DataContext = main_vm });
        dock_manager.RestoreLayout();
    }
}
