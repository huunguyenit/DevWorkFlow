using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// Resolve corpus SP226 in-place (ADR-002). Override: FBO_PROGRAM_PATH.
/// </summary>
public static class Sp226Paths
{
    public static string? ProgramRoot { get; } = ResolveProgramRoot();

    public static bool IsAvailable =>
        !string.IsNullOrWhiteSpace(ProgramRoot)
        && Directory.Exists(ProgramRoot);

    public static string Controllers =>
        Path.Combine(RequireRoot(), "App_Data", "Controllers");

    public static string Require(params string[] relative_parts)
    {
        var path = Path.Combine(new[] { Controllers }.Concat(relative_parts).ToArray());
        if (!File.Exists(path) && !Directory.Exists(path))
            throw new FileNotFoundException($"Thiếu corpus SP226: {path}");
        return path;
    }

    public static string RequireRoot()
    {
        if (!IsAvailable)
            throw new InvalidOperationException(
                "SP226 không có. Checkout thư mục SP226 hoặc set FBO_PROGRAM_PATH.");
        return ProgramRoot!;
    }

    private static string? ResolveProgramRoot()
    {
        var env = Environment.GetEnvironmentVariable("FBO_PROGRAM_PATH");
        if (!string.IsNullOrWhiteSpace(env))
        {
            var full = Path.GetFullPath(env.Trim());
            if (Directory.Exists(full))
                return full;
        }

        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            var candidate = Path.Combine(dir.FullName, "SP226");
            if (Directory.Exists(candidate)
                && Directory.Exists(Path.Combine(candidate, "App_Data", "Controllers")))
                return candidate;
            dir = dir.Parent;
        }

        return null;
    }
}

/// <summary>Fact tự Skip khi thiếu SP226.</summary>
public sealed class Sp226FactAttribute : FactAttribute
{
    public Sp226FactAttribute()
    {
        if (!Sp226Paths.IsAvailable)
            Skip = "SP226 không có (checkout SP226 hoặc set FBO_PROGRAM_PATH).";
    }
}
