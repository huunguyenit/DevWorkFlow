using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

public sealed class BottomListItemVm : ViewModelBase, IBottomListItem
{
    public required string PrimaryText { get; init; }
    public string SecondaryText { get; init; } = string.Empty;
    public string TrailingText { get; init; } = string.Empty;
    public string IconKind { get; init; } = "InformationOutline";
    public string IconBrush { get; init; } = "#555555";
    public bool CanNavigate { get; init; }
    public BottomNavigateTarget? NavigateTarget { get; init; }
}
