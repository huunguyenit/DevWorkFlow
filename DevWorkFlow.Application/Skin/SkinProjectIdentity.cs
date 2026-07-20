using System.Security.Cryptography;
using System.Text;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Sinh project_id ổn định + folder-safe cho skin cache, dựa trên Program đang mở trong Workspace.
/// Danh tính bền là <see cref="ProgramContext.ProgramPath"/>; id = phần đọc được (DisplayTitle) + hash
/// ngắn của full path → không đụng convention id nào khác, không đổi giữa các phiên với cùng Program.
/// </summary>
public static class SkinProjectIdentity
{
    /// <summary>project_id cho Program hiện tại (vd "AEQN-SP2261-3f9a1c07").</summary>
    public static string From(ProgramContext program)
    {
        ArgumentNullException.ThrowIfNull(program);
        return From(program.ProgramPath, string.IsNullOrWhiteSpace(program.DisplayTitle)
            ? program.ProgramName
            : program.DisplayTitle);
    }

    /// <summary>Overload thuần cho test (không cần dựng ProgramContext đầy đủ).</summary>
    public static string From(string program_path, string? display_label = null)
    {
        var normalized = NormalizePath(program_path);
        var label = Sanitize(string.IsNullOrWhiteSpace(display_label)
            ? GetLastSegment(normalized)
            : display_label);
        var hash = ShortHash(normalized);
        return string.IsNullOrEmpty(label) ? hash : $"{label}-{hash}";
    }

    private static string NormalizePath(string path)
    {
        if (string.IsNullOrWhiteSpace(path)) return string.Empty;
        // So khớp bền: bỏ dấu phân cách cuối, chuẩn về '\' , lower-case (Windows path không phân biệt hoa thường).
        return path.Trim()
            .Replace('/', '\\')
            .TrimEnd('\\')
            .ToLowerInvariant();
    }

    private static string GetLastSegment(string normalized_path)
    {
        if (string.IsNullOrEmpty(normalized_path)) return string.Empty;
        var idx = normalized_path.LastIndexOf('\\');
        return idx >= 0 ? normalized_path[(idx + 1)..] : normalized_path;
    }

    private static string Sanitize(string raw)
    {
        var sb = new StringBuilder(raw.Length);
        var prev_dash = false;
        foreach (var ch in raw.Trim())
        {
            if (char.IsLetterOrDigit(ch))
            {
                sb.Append(ch);
                prev_dash = false;
            }
            else if (!prev_dash)
            {
                sb.Append('-');
                prev_dash = true;
            }
        }

        return sb.ToString().Trim('-');
    }

    private static string ShortHash(string value)
    {
        var bytes = SHA256.HashData(Encoding.UTF8.GetBytes(value));
        var sb = new StringBuilder(8);
        for (var i = 0; i < 4; i++)
            sb.Append(bytes[i].ToString("x2"));
        return sb.ToString();
    }
}
