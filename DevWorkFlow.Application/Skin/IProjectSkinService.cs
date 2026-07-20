namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Dịch vụ Project Web Skin (nền Designer Platform — docs/04-DESIGNER_PLATFORM.md): capture shell
/// (chrome-only) của site ERP, chuẩn hoá vùng host trống theo heuristic FBO, mirror CSS/JS/image từ
/// Program trên đĩa, và cho phép xem "skin trống" trong WebView2.
///
/// Ranh giới cứng: KHÔNG parse XML, KHÔNG đụng Semantic/Layout Model, KHÔNG sinh HTML form. Việc login
/// + lấy outerHTML do UF (WebView2) thực hiện; service chỉ nhận HTML thô rồi normalize/lưu/resolve.
/// </summary>
public interface IProjectSkinService
{
    /// <summary>Đã có skin (shell.html + manifest.json) cho project chưa.</summary>
    bool HasSkin(string project_id);

    /// <summary>Đọc manifest hiện có (null nếu chưa có skin / lỗi đọc).</summary>
    SkinManifest? GetManifest(string project_id);

    /// <summary>Thư mục skin %AppData%/DevWorkFlow/skins/&lt;project_id&gt;.</summary>
    string GetSkinDirectory(string project_id);

    /// <summary>Đường dẫn shell.html để Navigate xem skin.</summary>
    string GetSkinEntryPath(string project_id);

    /// <summary>
    /// Chuẩn hoá + lưu shell từ HTML đã capture, rồi mirror assets từ program_root và ghi manifest.
    /// Đây là hiện thực của "CaptureShellAsync" — bước login/lấy HTML nằm ở UI, không ở service.
    /// </summary>
    Task<SkinCaptureResult> SaveCapturedShellAsync(SkinCaptureRequest request, CancellationToken ct = default);

    /// <summary>
    /// Chỉ mirror lại CSS/JS/image từ Program (giữ nguyên shell.html/host) — KHÔNG yêu cầu login lại.
    /// Ném <see cref="InvalidOperationException"/> nếu chưa có skin để refresh.
    /// </summary>
    Task<AssetSyncResult> RefreshAssetsAsync(string project_id, string program_root, CancellationToken ct = default);
}
