using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// Corpus Program THẬT cho test Phase 3 (nav JS runtime) — khác <see cref="Sp226Paths"/> ở chỗ
/// KHÔNG bám một bản cụ thể: tên thư mục đổi theo bản được checkout (SP226 → FBISP24 → …), và
/// test ở đây chỉ cần "một Program FBO bất kỳ" để kiểm chứng resolver trên dữ liệu thật.
///
/// Golden test vẫn dùng <see cref="Sp226Paths"/> vì chúng assert nội dung của đúng bản SP226.
/// </summary>
public static class FboProgramCorpus
{
    public static string? Root { get; } = Resolve();

    public static bool IsAvailable => !string.IsNullOrWhiteSpace(Root);

    public static string Controllers =>
        Path.Combine(RequireRoot(), "App_Data", "Controllers");

    public static string RequireRoot() =>
        Root ?? throw new InvalidOperationException(
            "Không tìm thấy Program FBO nào (SP226/FBISP24/... hoặc FBO_PROGRAM_PATH).");

    /// <summary>Đường dẫn controller; null nếu bản corpus hiện tại không có file đó.</summary>
    public static string? TryFind(params string[] relative_parts)
    {
        if (!IsAvailable) return null;
        var path = Path.Combine(new[] { Controllers }.Concat(relative_parts).ToArray());
        return File.Exists(path) ? path : null;
    }

    private static string? Resolve()
    {
        var env = Environment.GetEnvironmentVariable("FBO_PROGRAM_PATH");
        if (!string.IsNullOrWhiteSpace(env))
        {
            var full = Path.GetFullPath(env.Trim());
            if (HasControllers(full)) return full;
        }

        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            try
            {
                foreach (var child in dir.EnumerateDirectories())
                    if (HasControllers(child.FullName))
                        return child.FullName;
            }
            catch
            {
                // Thiếu quyền đọc một cấp → đi tiếp lên trên.
            }
            dir = dir.Parent;
        }

        return null;
    }

    private static bool HasControllers(string root) =>
        Directory.Exists(root)
        && Directory.Exists(Path.Combine(root, "App_Data", "Controllers"));
}

/// <summary>
/// Fact tự Skip khi không có Program FBO nào, hoặc khi bản corpus hiện tại thiếu file mà test
/// cần (<paramref name="required_controller"/> — đường dẫn tương đối trong Controllers).
/// </summary>
public sealed class FboCorpusFactAttribute : FactAttribute
{
    public FboCorpusFactAttribute(params string[] required_controller)
    {
        if (!FboProgramCorpus.IsAvailable)
        {
            Skip = "Không có Program FBO (set FBO_PROGRAM_PATH hoặc checkout corpus).";
            return;
        }

        if (required_controller.Length > 0 && FboProgramCorpus.TryFind(required_controller) is null)
            Skip = $"Corpus hiện tại không có {string.Join("/", required_controller)}.";
    }
}
