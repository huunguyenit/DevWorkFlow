using System.Collections;
using System.Collections.ObjectModel;
using System.Windows.Input;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

public sealed class BottomPaneVm : ViewModelBase
{
    public BottomPaneVm(
        string title,
        IEnumerable items,
        ICommand clear_command,
        ICommand activate_item_command)
    {
        Title = title;
        Items = items;
        ClearCommand = clear_command;
        ActivateItemCommand = activate_item_command;
    }

    public string Title { get; }
    public ObservableCollection<BottomBadgeVm> Badges { get; } = [];
    public IEnumerable Items { get; }
    public ICommand ClearCommand { get; }
    public ICommand ActivateItemCommand { get; }

    public void ReplaceBadges(IEnumerable<BottomBadgeVm> badges)
    {
        Badges.Clear();
        foreach (var badge in badges)
            Badges.Add(badge);
    }
}
