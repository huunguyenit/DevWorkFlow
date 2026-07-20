using UI.ViewModels.Base;

namespace UI.ViewModels.Shell;

public enum ToolPaneKind
{
    Explorer,
    Outline,
    Snippet,
    RecentFiles,
    Favorites,
    Properties,
    Toolbox,
    Insight,
    SymbolInfo,
    Xml,
    Output,
    Problems,
    Log,
    SearchResult,
    Ai,
    Git
}

/// <summary>Pane placeholder trong Left/Right/Bottom dock.</summary>
public sealed class ToolPaneVm : ViewModelBase
{
    private bool _is_selected;
    private string _placeholder = string.Empty;

    public required string Title { get; init; }
    public required ToolPaneKind Kind { get; init; }

    /// <summary>Bước nào sẽ implement pane này (hiển thị trong placeholder).</summary>
    public int ComingInStep { get; init; }

    public bool IsSelected
    {
        get => _is_selected;
        set => SetProperty(ref _is_selected, value);
    }

    public string PlaceholderMessage
    {
        get => _placeholder;
        set => SetProperty(ref _placeholder, value);
    }

    public static ToolPaneVm CreatePlaceholder(string title, ToolPaneKind kind, int step) =>
        new()
        {
            Title = title,
            Kind = kind,
            ComingInStep = step,
            PlaceholderMessage = $"Coming in Step {step}"
        };
}
