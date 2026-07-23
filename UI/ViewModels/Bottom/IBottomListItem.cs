namespace UI.ViewModels.Bottom;

public interface IBottomListItem
{
    string PrimaryText { get; }
    string SecondaryText { get; }
    string TrailingText { get; }
    /// <summary>MaterialDesign PackIcon kind name, e.g. CloseCircle.</summary>
    string IconKind { get; }
    /// <summary>Brush hex or resource-like color string for icon, e.g. #C62828.</summary>
    string IconBrush { get; }
    bool CanNavigate { get; }
    BottomNavigateTarget? NavigateTarget { get; }

    /// <summary>True → chữ primary màu đỏ (Message error / Problem Error).</summary>
    bool IsError { get; }
}
