namespace DevWorkFlow.Domain.Models;

/// <summary>
/// Parse đường dẫn Program FBO → tên hiển thị.
/// Ví dụ: \\...\CustomerPro\FBO\AEQN\SP2261 → "AEQN - SP2261"
/// </summary>
public static class ProgramPathHelper
{
    public static string BuildDisplayTitle(string program_path)
    {
        if (string.IsNullOrWhiteSpace(program_path))
            return string.Empty;

        var parts = program_path
            .TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar)
            .Split(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar)
            .Where(p => !string.IsNullOrWhiteSpace(p))
            .ToList();

        if (parts.Count == 0) return string.Empty;

        var version = parts[^1];
        var project = parts.Count >= 2 ? parts[^2] : version;

        // \\...\FBO\AEQN\SP2261 → project=AEQN, version=SP2261
        if (parts.Count >= 2
            && string.Equals(parts[^3], "FBO", StringComparison.OrdinalIgnoreCase))
        {
            return $"{project} - {version}";
        }

        // Fallback: 2 segment cuối
        if (parts.Count >= 2 && !string.Equals(project, version, StringComparison.OrdinalIgnoreCase))
            return $"{project} - {version}";

        return version;
    }
}
