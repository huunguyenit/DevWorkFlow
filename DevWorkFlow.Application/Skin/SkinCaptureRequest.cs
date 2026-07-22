using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Yêu cầu lưu skin từ HTML đã capture. UI (WebView2) lo phần login + lấy outerHTML rồi truyền
/// chuỗi HTML thô vào đây; service không tự mở trình duyệt (giữ ranh giới layer).
/// </summary>
public sealed class SkinCaptureRequest
{
    public string ProjectId { get; set; } = string.Empty;

    public string BaseUrl { get; set; } = string.Empty;

    /// <summary>URL thực tế của trang lúc capture (dùng để so khớp host khi rewrite asset tuyệt đối).</summary>
    public string CapturedFromUrl { get; set; } = string.Empty;

    /// <summary><c>document.documentElement.outerHTML</c> lấy từ WebView2 sau khi trang shell ổn định.</summary>
    public string RawHtml { get; set; } = string.Empty;

    /// <summary>Program root để mirror CSS/JS/image (ProgramContext.ProgramPath).</summary>
    public string ProgramRoot { get; set; } = string.Empty;

    /// <summary>Loại controller (Form/Grid/Lookup) của document đang mở lúc capture, nếu có.</summary>
    public ControllerDisplayKind? DocKind { get; set; }
}
