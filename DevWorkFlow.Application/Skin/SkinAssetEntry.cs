namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Một tài nguyên tĩnh (CSS/JS/image/icon) tham chiếu trong shell đã capture, cùng cách nó
/// được ánh xạ về file dưới Program và về đường dẫn cục bộ trong thư mục skin.
/// </summary>
public sealed class SkinAssetEntry
{
    /// <summary>URL gốc như trong HTML capture (có thể tương đối, ~/, ../, root-relative, tuyệt đối, kèm query).</summary>
    public string OriginalUrl { get; set; } = string.Empty;

    /// <summary>
    /// Đường dẫn tương đối đã chuẩn hoá dùng cho cả tra file dưới program_root lẫn nơi lưu trong
    /// <c>assets/</c> (vd "Css/Menu.css"). Rỗng nếu không map được (external/động).
    /// </summary>
    public string RelativePath { get; set; } = string.Empty;

    /// <summary>URL đã ghi lại trong shell.html — "assets/Css/Menu.css" nếu map được, hoặc giữ nguyên URL gốc nếu ngoại vi.</summary>
    public string RewrittenUrl { get; set; } = string.Empty;

    public SkinAssetKind Kind { get; set; } = SkinAssetKind.Other;

    public AssetResolveStatus Status { get; set; } = AssetResolveStatus.Pending;

    /// <summary>Lý do khi Unresolved (external host / dynamic .axd / file not found) — hiển thị/log.</summary>
    public string? Note { get; set; }
}
