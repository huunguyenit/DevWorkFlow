using System.Windows.Input;
using UI.ViewModels.Base;

namespace UI.ViewModels.Bottom;

/// <summary>
/// Badge Severity (Problems) hoặc count — click Toggle lọc + đổi màu active/inactive.
/// </summary>
public sealed class BottomBadgeVm : ViewModelBase
{
    private bool _is_filter_active = true;
    private string _background = "#ECEFF1";
    private string _foreground = "#455A64";

    public required string IconKind { get; init; }
    public required string CountText { get; init; }

    /// <summary>E / W / H cho Problems; null = badge đếm thường (không lọc).</summary>
    public string? SeverityKey { get; init; }

    public string Background
    {
        get => _background;
        set => SetProperty(ref _background, value);
    }

    public string Foreground
    {
        get => _foreground;
        set => SetProperty(ref _foreground, value);
    }

    public bool IsFilterActive
    {
        get => _is_filter_active;
        set
        {
            if (!SetProperty(ref _is_filter_active, value)) return;
            ApplyChrome();
        }
    }

    /// <summary>Màu khi bật lọc (hiển thị severity đó).</summary>
    public string ActiveBackground { get; init; } = "#ECEFF1";
    public string ActiveForeground { get; init; } = "#455A64";

    public ICommand? ToggleCommand { get; init; }

    public void ApplyChrome()
    {
        if (SeverityKey is null)
        {
            Background = ActiveBackground;
            Foreground = ActiveForeground;
            return;
        }

        if (IsFilterActive)
        {
            Background = ActiveBackground;
            Foreground = ActiveForeground;
        }
        else
        {
            Background = "#F5F5F5";
            Foreground = "#9E9E9E";
        }
    }
}
