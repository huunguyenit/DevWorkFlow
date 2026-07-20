using System.Windows.Input;
using UI.Docking;
using UI.ViewModels.Base;

namespace UI.ViewModels.Shell;

/// <summary>Tab auto-hide ở cạnh màn hình — hiện khi panel unpinned, click để mở lại.</summary>
public sealed class DockAutoHideTabVm : ViewModelBase
{
    public required string Title { get; init; }
    public required DockPanelId PanelId { get; init; }
    public required ICommand ShowCommand { get; init; }
}
