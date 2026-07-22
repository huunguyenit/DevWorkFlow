namespace DevWorkFlow.Application.Shell;

public static class DocumentTabPathHelper
{
    public static bool IsVirtualDocumentPath(string? file_path)
        => !string.IsNullOrWhiteSpace(file_path)
           && file_path.StartsWith("sql://", StringComparison.OrdinalIgnoreCase);

    public static bool CanCopyFullPath(string? file_path)
        => !string.IsNullOrWhiteSpace(file_path) && !IsVirtualDocumentPath(file_path);

    public static bool CanRevealInExplorer(string? file_path)
    {
        if (!CanCopyFullPath(file_path)) return false;
        return File.Exists(file_path) || Directory.Exists(file_path);
    }

    public static string BuildExplorerSelectArguments(string full_path)
    {
        ArgumentException.ThrowIfNullOrWhiteSpace(full_path);
        return "/select,\"" + full_path + "\"";
    }
}
