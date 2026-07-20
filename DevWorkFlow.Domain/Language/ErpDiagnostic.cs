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

    /// <summary>
    /// Vị trí chính của lỗi. Với lỗi nằm TRONG nội dung một entity, <see cref="Location"/> trỏ
    /// tới điểm điều hướng chính (khai báo entity hoặc tham chiếu trong file đang mở); file/dòng
    /// thật của lỗi nằm ở <see cref="RelatedPath"/>/<see cref="RelatedLine"/>.
    /// </summary>
    public SourceLocation Location { get; init; } = SourceLocation.None;

    /// <summary>
    /// File phụ liên quan (file .ent / SYSTEM chứa lỗi, hoặc file controller gốc) — Problems panel
    /// dùng cho action "mở file entity". Null nếu lỗi chỉ nằm trong file đang mở.
    /// </summary>
    public string? RelatedPath { get; init; }

    /// <summary>Dòng (1-based) của lỗi trong <see cref="RelatedPath"/>; null nếu không rõ.</summary>
    public int? RelatedLine { get; init; }

    /// <summary>Tên entity liên quan (ERP30xx) — Problems hiển thị và điều hướng tới khai báo.</summary>
    public string? EntityName { get; init; }

    /// <summary>ErpSymbol.Id liên quan (nếu có) — điều hướng qua NavigationTarget/GoToDefinition.</summary>
    public string? SymbolId { get; init; }
}
