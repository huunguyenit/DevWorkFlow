using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Application.Abstractions;

/// <summary>Điều hướng giữa các workspace panel.</summary>
public interface INavigationService
{
    string CurrentPage { get; }
    event EventHandler<string> PageChanged;
    void NavigateTo(string page, object? parameter = null);
    object? CurrentParameter { get; }
}

/// <summary>Quản lý danh sách template items.</summary>
public interface ITemplateService
{
    Task<IEnumerable<TemplateItem>> GetAllAsync();
    Task<TemplateItem?> GetByIdAsync(string id);
    Task<TemplateItem> CreateAsync(string name, TemplateType type);
    Task DeleteAsync(string id);
    Task<bool> UpdateAsync(TemplateItem item);
}

/// <summary>Đọc connectionStrings từ web.config của Program FBO.</summary>
public interface IWebConfigReader
{
    ProgramContext Read(string program_path);
}

/// <summary>Đọc bảng wcommand từ database sys.</summary>
public interface IWcommandRepository
{
    Task<IReadOnlyList<WCommandItem>> GetAllAsync(
        string sys_connection_string,
        CancellationToken cancellation_token = default);
}

/// <summary>Dựng cây menu; resolve resource từ file main (aspx) → Controller → XML tồn tại.</summary>
public interface IMenuService
{
    Task<IReadOnlyList<MenuTreeNode>> LoadMenuTreeAsync(
        ProgramContext program,
        CancellationToken cancellation_token = default);

    /// <summary>
    /// Đọc link (.aspx) của menu, parse Controller, liệt kê các file XML/aspx thật sự có trên disk.
    /// </summary>
    MenuResourceBundle ResolveFromMenu(ProgramContext program, MenuTreeNode menu_node);
}

/// <summary>Đọc bảng entity (sys) — danh sách database app (cột cdata).</summary>
public interface IEntityRepository
{
    Task<IReadOnlyList<AppDatabaseInfo>> GetAppDatabasesAsync(
        string sys_connection_string,
        CancellationToken cancellation_token = default);
}

/// <summary>Session Program đang mở trong tool.</summary>
public interface IProgramSession
{
    ProgramContext? Current { get; }

    /// <summary>Program mới được chọn / clear (rebuild Explorer, Menu, …).</summary>
    event EventHandler? ProgramChanged;

    /// <summary>
    /// Program context cập nhật in-place (vd. resolve App DB) — không đổi Program path.
    /// Consumer: Database / SQL Studio rebuild ConnectionTargets.
    /// </summary>
    event EventHandler? ProgramUpdated;

    void SetProgram(ProgramContext program);
    void UpdateProgram(ProgramContext program);
    void Clear();
}
