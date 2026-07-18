namespace DevWorkFlow.Domain.Models;

/// <summary>Một dòng bảng entity (sys) — khai báo database app.</summary>
public sealed class AppDatabaseInfo
{
    public string Code { get; init; } = string.Empty;
    public string Name { get; init; } = string.Empty;

    /// <summary>Tên database app (cột cdata).</summary>
    public string DatabaseName { get; init; } = string.Empty;
}
