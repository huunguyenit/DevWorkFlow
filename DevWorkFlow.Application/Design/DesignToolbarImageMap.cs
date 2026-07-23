namespace DevWorkFlow.Application.Design;

/// <summary>Map command toolbar (giữ tương thích cũ; render dùng <see cref="DesignToolbarTitleResolver"/>).</summary>
internal static class DesignToolbarImageMap
{
    public static string ToolbarDivClass(string command) =>
        string.IsNullOrWhiteSpace(command) ? string.Empty : command.Trim();
}
