namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Controller chạy trên CSDL nào — quyết định connection khi Execute SQL / lấy definition
/// object. Mặc định là App; chỉ <c>@database="Sys"</c> trên root mới là Sys.
/// </summary>
public enum ControllerDatabaseKind
{
    App = 0,
    Sys = 1
}
