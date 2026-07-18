namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Symbol ERP — đơn vị định danh semantic (không phải chuỗi XML).
/// </summary>
public class ErpSymbol
{
    /// <summary>Id ổn định trong document/workspace (ví dụ controller:Customer / field:ma_kh).</summary>
    public string Id { get; init; } = string.Empty;

    /// <summary>Tên symbol (thường khớp attribute name / entity name).</summary>
    public string Name { get; init; } = string.Empty;

    /// <summary>Tên hiển thị (header localized ưu tiên).</summary>
    public string DisplayName { get; init; } = string.Empty;

    public ErpSymbolKind Kind { get; init; }

    /// <summary>Định nghĩa trong source (có thể None ở Phase 1 stub).</summary>
    public SourceLocation Definition { get; init; } = SourceLocation.None;

    /// <summary>Symbol cha (controller chứa field, …).</summary>
    public string? ParentSymbolId { get; init; }

    /// <summary>NodeId trong Document Model / Navigation Map (ổn định theo Symbol.Id).</summary>
    public NodeId NodeId { get; init; }
}
