using System.Collections.ObjectModel;

namespace UI.ViewModels.Explorer;

/// <summary>VM host cây Explorer dùng chung UI.</summary>
public interface IExplorerTreeSource
{
    ObservableCollection<ExplorerTreeNodeVm> TreeRoots { get; }

    string FilterText { get; set; }

    string StatusText { get; }

    /// <summary>Debounce single-click activation (ms). 0 = phát ngay.</summary>
    int ActivationDelayMs { get; }

    void OnTreeNodeActivated(ExplorerTreeNodeVm node, bool is_double_click);
}
