namespace DevWorkFlow.Domain.Models;

/// <summary>Một dòng menu từ bảng wcommand (sys).</summary>
public class WCommandItem
{
    public string WmenuId { get; set; } = string.Empty;
    public string? WmenuId0 { get; set; }
    public string? MenuId { get; set; }
    public string? Bar { get; set; }
    public string? Bar2 { get; set; }
    public string? Link { get; set; }
    public string? Parameter { get; set; }
    public string? IconUrl { get; set; }
    public string? Status { get; set; }
    public string? Icon { get; set; }
    public string? SysId { get; set; }
    /// <summary>D = List, V = Voucher.</summary>
    public string? Type { get; set; }
    public string? SysCode { get; set; }
    public string? MSys { get; set; }
    public string? Target { get; set; }
    public string? XType { get; set; }
    public string? Edition { get; set; }
    public string? ExplIcon { get; set; }

    public string DisplayName =>
        IsSeparator ? "────────────" :
        !string.IsNullOrWhiteSpace(Bar) ? Bar! :
        !string.IsNullOrWhiteSpace(Bar2) ? Bar2! :
        WmenuId;

    /// <summary>bar = "-" → separator (1 line ----).</summary>
    public bool IsSeparator =>
        string.Equals(Bar?.Trim(), "-", StringComparison.Ordinal);

    public bool IsVoucher => string.Equals(Type, "V", StringComparison.OrdinalIgnoreCase);
    public bool IsList => string.Equals(Type, "D", StringComparison.OrdinalIgnoreCase);
    public bool HasController => !string.IsNullOrWhiteSpace(SysId);
}
