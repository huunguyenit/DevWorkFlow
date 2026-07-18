namespace DevWorkFlow.Domain.Models;

/// <summary>
/// Ngữ cảnh Program FBO đã chọn: đường dẫn thư mục + connection sys/app từ web.config.
/// </summary>
public class ProgramContext
{
    public string ProgramPath { get; set; } = string.Empty;
    public string ProgramName { get; set; } = string.Empty;

    /// <summary>Ví dụ: AEQN - SP2261.</summary>
    public string DisplayTitle { get; set; } = string.Empty;

    public string SysConnectionString { get; set; } = string.Empty;
    public string AppConnectionString { get; set; } = string.Empty;

    /// <summary>
    /// Template app CS còn %Database — dùng khi đổi app (1 sys, nhiều app).
    /// </summary>
    public string AppConnectionStringTemplate { get; set; } = string.Empty;

    /// <summary>Initial Catalog app đã resolve từ entity.cdata (thay %Database).</summary>
    public string AppDatabaseName { get; set; } = string.Empty;

    /// <summary>Danh sách app DB từ sys.entity (nhiều công ty / DB).</summary>
    public IReadOnlyList<AppDatabaseInfo> AppDatabases { get; set; } = [];

    public string ControllersPath => Path.Combine(ProgramPath, "App_Data", "Controllers");
}
