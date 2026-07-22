namespace DevWorkFlow.Application.Design;

/// <summary>
/// Map command toolbar → class CSS (khớp <c>fbo-toolbar.css</c> / controller &lt;css&gt;).
/// Ảnh lấy từ class — không gắn base64.
/// </summary>
internal static class DesignToolbarImageMap
{
    /// <summary>Class CSS = tên command (Insert, Download, ImportData…).</summary>
    public static string ToolbarDivClass(string command) =>
        string.IsNullOrWhiteSpace(command) ? string.Empty : command.Trim();

    public static bool ToolbarShowsLabel(string command) =>
        string.Equals(command, "Remove", StringComparison.OrdinalIgnoreCase);
}
