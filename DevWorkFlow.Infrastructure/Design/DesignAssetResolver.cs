using System.IO;
using System.Net;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Services;

namespace DevWorkFlow.Infrastructure.Design;

/// <summary>
/// Resolve asset tĩnh cho Design: controller → file main .aspx (ưu tiên menu theo SysId, fallback quét
/// Main/*.aspx) → MasterPageFile → gom Css/ClientScript/Images từ master + page. Bỏ .axd, URL ngoại vi,
/// chống path traversal. Soft-fail: mọi lỗi (thiếu menu/DB/file) → trả rỗng, chỉ cancellation ném.
/// </summary>
public sealed class DesignAssetResolver : IDesignAssetResolver
{
    private static readonly string[] StaticRoots = ["Css", "ClientScript", "Images"];

    private readonly IMenuService _menu_service;

    public DesignAssetResolver(IMenuService menu_service) => _menu_service = menu_service;

    public async Task<DesignAssetSet> ResolveAsync(
        ProgramContext program,
        string controller_name,
        CancellationToken ct = default)
    {
        try
        {
            var main_path = await FindMainAspxAsync(program, controller_name, ct).ConfigureAwait(false);
            if (main_path is null) return DesignAssetSet.Empty;

            var page_content = File.ReadAllText(main_path);
            var main_rel = ToRelative(program.ProgramPath, main_path);

            string? master_rel = null;
            var master_content = string.Empty;
            var master_raw = AspxMasterPageParser.ParseMasterPageFile(page_content);
            if (master_raw is not null)
            {
                var master_path = ResolveUnderProgram(program.ProgramPath, master_raw);
                if (master_path is not null && File.Exists(master_path))
                {
                    master_rel = ToRelative(program.ProgramPath, master_path);
                    master_content = File.ReadAllText(master_path);
                }
            }

            // Master trước, page sau; dedupe theo path chuẩn hoá, giữ thứ tự.
            var raw_assets = new List<string>();
            if (master_content.Length > 0)
                raw_assets.AddRange(AspxMasterPageParser.CollectStaticAssetPaths(master_content));
            raw_assets.AddRange(AspxMasterPageParser.CollectStaticAssetPaths(page_content));

            var stylesheets = new List<string>();
            var scripts = new List<string>();
            var images = new List<string>();
            var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

            foreach (var raw in raw_assets)
            {
                var normalized = NormalizeAsset(raw);
                if (normalized is null || !seen.Add(normalized)) continue;
                Categorize(normalized, stylesheets, scripts, images);
            }

            return new DesignAssetSet(main_rel, master_rel, stylesheets, scripts, images);
        }
        catch (OperationCanceledException)
        {
            throw;
        }
        catch
        {
            return DesignAssetSet.Empty;
        }
    }

    private async Task<string?> FindMainAspxAsync(
        ProgramContext program,
        string controller_name,
        CancellationToken ct)
    {
        // 1) Menu: ưu tiên SysId == controller.
        var menu_link = await TryFindMenuLinkAsync(program, controller_name).ConfigureAwait(false);
        if (menu_link is not null)
        {
            var candidate = ResolveMainAspx(program.ProgramPath, menu_link);
            if (candidate is not null && DeclaresController(candidate, controller_name))
                return candidate;
        }

        // 2) Fallback: quét Main/*.aspx theo tên file, chọn file đầu khai báo controller.
        var main_dir = Path.Combine(program.ProgramPath, "Main");
        if (!Directory.Exists(main_dir)) return null;

        foreach (var aspx in Directory.EnumerateFiles(main_dir, "*.aspx", SearchOption.TopDirectoryOnly)
                     .OrderBy(f => Path.GetFileName(f), StringComparer.OrdinalIgnoreCase))
        {
            ct.ThrowIfCancellationRequested();
            if (DeclaresController(aspx, controller_name))
                return aspx;
        }

        return null;
    }

    private async Task<string?> TryFindMenuLinkAsync(ProgramContext program, string controller_name)
    {
        try
        {
            var tree = await _menu_service.LoadMenuTreeAsync(program).ConfigureAwait(false);
            return Flatten(tree)
                .FirstOrDefault(n =>
                    string.Equals(n.SysId, controller_name, StringComparison.OrdinalIgnoreCase)
                    && n.HasLink)
                ?.Link;
        }
        catch
        {
            return null; // Không có DB/menu → dùng fallback quét file.
        }
    }

    private static IEnumerable<MenuTreeNode> Flatten(IEnumerable<MenuTreeNode> nodes)
    {
        foreach (var node in nodes)
        {
            yield return node;
            foreach (var child in Flatten(node.Children))
                yield return child;
        }
    }

    private static bool DeclaresController(string aspx_path, string controller_name) =>
        AspxControllerParser.ParseControllersFromFile(aspx_path)
            .Any(c => string.Equals(c, controller_name, StringComparison.OrdinalIgnoreCase));

    private static string? ResolveMainAspx(string program_root, string link)
    {
        var name = Path.GetFileName(link.Replace('\\', '/'));
        if (string.IsNullOrWhiteSpace(name)) return null;
        var candidate = Path.Combine(program_root, "Main", name);
        var full = Path.GetFullPath(candidate);
        if (!full.StartsWith(Path.GetFullPath(program_root), StringComparison.OrdinalIgnoreCase))
            return null;
        return File.Exists(full) ? full : null;
    }

    private static string? ResolveUnderProgram(string program_root, string raw)
    {
        var s = WebUtility.HtmlDecode(raw.Trim()).Replace('\\', '/');
        var q = s.IndexOfAny(['?', '#']);
        if (q >= 0) s = s[..q];

        var stack = new List<string>();
        foreach (var seg in s.Split('/', StringSplitOptions.RemoveEmptyEntries))
        {
            if (seg is "~" or ".") continue;
            if (seg == "..") { if (stack.Count > 0) stack.RemoveAt(stack.Count - 1); continue; }
            stack.Add(seg);
        }
        if (stack.Count == 0) return null;

        var full = Path.GetFullPath(Path.Combine(program_root, Path.Combine([.. stack])));
        return full.StartsWith(Path.GetFullPath(program_root), StringComparison.OrdinalIgnoreCase)
            ? full
            : null;
    }

    /// <summary>Raw href/src/Path → path tĩnh Program-relative (Css/ClientScript/Images/favicon.ico), hoặc
    /// null nếu ngoại vi/động/không hợp lệ.</summary>
    private static string? NormalizeAsset(string raw)
    {
        if (string.IsNullOrWhiteSpace(raw)) return null;
        var s = WebUtility.HtmlDecode(raw.Trim());

        if (s.StartsWith("http:", StringComparison.OrdinalIgnoreCase)
            || s.StartsWith("https:", StringComparison.OrdinalIgnoreCase)
            || s.StartsWith("data:", StringComparison.OrdinalIgnoreCase)
            || s.StartsWith("javascript:", StringComparison.OrdinalIgnoreCase)
            || s.StartsWith("//", StringComparison.Ordinal))
            return null;

        var q = s.IndexOfAny(['?', '#']);
        if (q >= 0) s = s[..q];
        s = s.Replace('\\', '/');

        if (s.EndsWith(".axd", StringComparison.OrdinalIgnoreCase)) return null;

        var segments = s.Split('/', StringSplitOptions.RemoveEmptyEntries)
            .Where(seg => seg is not ("~" or "." or ".."))
            .ToList();
        if (segments.Count == 0) return null;

        if (segments.Count == 1 && string.Equals(segments[0], "favicon.ico", StringComparison.OrdinalIgnoreCase))
            return "favicon.ico";

        return StaticRoots.Any(r => string.Equals(segments[0], r, StringComparison.OrdinalIgnoreCase))
            ? string.Join('/', segments)
            : null;
    }

    private static void Categorize(
        string path, List<string> stylesheets, List<string> scripts, List<string> images)
    {
        var ext = Path.GetExtension(path).ToLowerInvariant();
        switch (ext)
        {
            case ".css": stylesheets.Add(path); break;
            case ".js": scripts.Add(path); break;
            case ".png" or ".jpg" or ".jpeg" or ".gif" or ".svg" or ".webp" or ".bmp" or ".ico":
                images.Add(path); break;
        }
    }

    private static string ToRelative(string program_root, string full_path)
    {
        var root = Path.GetFullPath(program_root).TrimEnd(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar);
        var full = Path.GetFullPath(full_path);
        var rel = full.Length > root.Length && full.StartsWith(root, StringComparison.OrdinalIgnoreCase)
            ? full[(root.Length + 1)..]
            : full;
        return rel.Replace('\\', '/');
    }
}
