namespace DevWorkFlow.Domain.Language;

/// <summary>Mức độ diagnostic ERP Language Service.</summary>
public enum ErpDiagnosticSeverity
{
    Hidden = 0,
    Info = 1,
    Warning = 2,
    Error = 3
}

/// <summary>
/// Thông báo phân tích trên document (không validate chuỗi XML trực tiếp từ UI).
/// </summary>
public sealed class ErpDiagnostic
{
    /// <summary>Mã ổn định (ví dụ ERP0001).</summary>
    public string Id { get; init; } = string.Empty;

    public ErpDiagnosticSeverity Severity { get; init; }

    public string Message { get; init; } = string.Empty;

    public SourceLocation Location { get; init; } = SourceLocation.None;
}
