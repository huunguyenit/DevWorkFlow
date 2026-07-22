namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Gợi ý base_url site ERP từ đường dẫn Program theo quy ước FBO: 2 segment cuối của path là
/// tên dự án/phiên bản (giống <see cref="DevWorkFlow.Domain.Models.ProgramPathHelper"/>), vd
/// <c>\\172.168.5.14\CustomerPro\FBI\AMERICAN\FBISP2422</c> → project=<c>AMERICAN</c>.
/// Chỉ là gợi ý điền sẵn — user luôn sửa được trước khi capture.
/// </summary>
public static class SkinUrlHelper
{
    public const string DefaultHost = "https://dev.fast.com.vn";

    /// <summary>Gợi ý base_url = {host}/{tên dự án}, suy từ segment áp chót của program_path.</summary>
    public static string BuildDefaultBaseUrl(string program_path, string host = DefaultHost)
    {
        var project = ExtractProjectName(program_path);
        var trimmed_host = host.TrimEnd('/');
        return string.IsNullOrEmpty(project) ? trimmed_host : $"{trimmed_host}/{project}";
    }

    /// <summary>URL trang đăng nhập = {base_url}/Main/Login.aspx.</summary>
    public static string BuildLoginUrl(string base_url) =>
        string.IsNullOrWhiteSpace(base_url) ? string.Empty : $"{base_url.TrimEnd('/')}/Main/Login.aspx";

    private static string ExtractProjectName(string program_path)
    {
        if (string.IsNullOrWhiteSpace(program_path)) return string.Empty;

        var parts = program_path
            .TrimEnd('\\', '/')
            .Split('\\', '/')
            .Where(p => !string.IsNullOrWhiteSpace(p))
            .ToList();

        // \\...\FBI\AMERICAN\FBISP2422 → project = segment áp chót (AMERICAN).
        return parts.Count >= 2 ? parts[^2] : string.Empty;
    }
}
