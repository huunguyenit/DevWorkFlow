using DevWorkFlow.Application.Abstractions;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// In-memory NavigationService.
/// Publish/Subscribe qua event – MainViewModel lắng nghe để swap workspace.
/// </summary>
public class NavigationService : INavigationService
{
    public string CurrentPage { get; private set; } = Pages.FormBuilder;
    public object? CurrentParameter { get; private set; }

    public event EventHandler<string>? PageChanged;

    public void NavigateTo(string page, object? parameter = null)
    {
        CurrentPage      = page;
        CurrentParameter = parameter;
        PageChanged?.Invoke(this, page);
    }
}

/// <summary>Hằng tên page dùng chung – tránh magic string.</summary>
public static class Pages
{
    public const string FormBuilder       = nameof(FormBuilder);
    public const string CatalogManager    = nameof(CatalogManager);
    public const string DocumentManager   = nameof(DocumentManager);
    public const string ReportManager     = nameof(ReportManager);
    public const string StoredManager     = nameof(StoredManager);
    public const string SqlStudio         = nameof(SqlStudio);
}
