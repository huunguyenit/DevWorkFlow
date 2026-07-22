using System.Text.Json;
using System.Text.RegularExpressions;
using DevWorkFlow.Application.Design;

namespace DevWorkFlow.Infrastructure.Design;

/// <summary>
/// Đọc <c>Config/css/manifest.json</c> + file pack CSS → <see cref="DesignCssBundle"/>.
/// Soft-fail: thiếu thư mục/manifest/file → Empty (không ném).
/// <c>url(relative)</c> cạnh pack được rewrite thành data-URI để WebView <c>NavigateToString</c> vẫn hiện ảnh.
/// </summary>
public sealed class DesignCssCatalog : IDesignCssCatalog
{
    private static readonly JsonSerializerOptions JsonOpts = new()
    {
        PropertyNameCaseInsensitive = true,
        ReadCommentHandling = JsonCommentHandling.Skip,
        AllowTrailingCommas = true
    };

    private static readonly Regex CssUrlRegex = new(
        @"url\(\s*(['""]?)(?!data:|https?:|file:|//)([^)'""]+)\1\s*\)",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private readonly string _css_root;
    private readonly object _gate = new();
    private DesignCssBundle? _cached;

    public DesignCssCatalog(string css_root) =>
        _css_root = css_root ?? string.Empty;

    public DesignCssBundle GetBundle()
    {
        lock (_gate)
            return _cached ??= Load();
    }

    /// <summary>Cho test / hot-reload thủ công — xóa cache.</summary>
    public void Invalidate()
    {
        lock (_gate)
            _cached = null;
    }

    private DesignCssBundle Load()
    {
        if (string.IsNullOrWhiteSpace(_css_root) || !Directory.Exists(_css_root))
            return DesignCssBundle.Empty;

        var manifest_path = Path.Combine(_css_root, "manifest.json");
        if (!File.Exists(manifest_path))
            return DesignCssBundle.Empty;

        try
        {
            var json = File.ReadAllText(manifest_path);
            var manifest = JsonSerializer.Deserialize<ManifestDto>(json, JsonOpts);
            if (manifest?.Packs is null || manifest.Packs.Count == 0)
                return DesignCssBundle.Empty;

            var packs = new List<DesignCssPack>();
            var css_root_full = Path.GetFullPath(_css_root);
            foreach (var entry in manifest.Packs)
            {
                if (entry is null || entry.Enabled == false) continue;
                if (string.IsNullOrWhiteSpace(entry.Id) || string.IsNullOrWhiteSpace(entry.Path))
                    continue;

                var css_path = Path.GetFullPath(Path.Combine(_css_root, entry.Path));
                if (!css_path.StartsWith(css_root_full, StringComparison.OrdinalIgnoreCase))
                    continue; // path traversal
                if (!File.Exists(css_path))
                    continue;

                var css_dir = Path.GetDirectoryName(css_path) ?? css_root_full;
                var css_text = RewriteRelativeUrls(File.ReadAllText(css_path), css_dir, css_root_full);
                packs.Add(new DesignCssPack(
                    entry.Id.Trim(),
                    css_text,
                    entry.Order,
                    entry.DisplayKinds ?? [],
                    entry.RequireCategories,
                    entry.RequireDetailGrid,
                    entry.RequireToolbar,
                    entry.Controllers,
                    entry.ExcludeControllers));
            }

            return packs.Count == 0 ? DesignCssBundle.Empty : new DesignCssBundle(packs);
        }
        catch (Exception ex) when (ex is JsonException or IOException or UnauthorizedAccessException)
        {
            return DesignCssBundle.Empty;
        }
    }

    /// <summary>Đổi <c>url(file.gif)</c> thành data-URI nếu file nằm dưới css root.</summary>
    internal static string RewriteRelativeUrls(string css_text, string css_dir, string css_root_full)
    {
        return CssUrlRegex.Replace(css_text, match =>
        {
            var relative = match.Groups[2].Value.Trim();
            if (string.IsNullOrEmpty(relative) || relative.StartsWith('#'))
                return match.Value;

            var asset_path = Path.GetFullPath(Path.Combine(css_dir, relative));
            if (!asset_path.StartsWith(css_root_full, StringComparison.OrdinalIgnoreCase)
                || !File.Exists(asset_path))
                return match.Value;

            var mime = MimeFromExtension(Path.GetExtension(asset_path));
            var b64 = Convert.ToBase64String(File.ReadAllBytes(asset_path));
            return $"url(\"data:{mime};base64,{b64}\")";
        });
    }

    private static string MimeFromExtension(string ext) =>
        ext.ToLowerInvariant() switch
        {
            ".gif" => "image/gif",
            ".png" => "image/png",
            ".jpg" or ".jpeg" => "image/jpeg",
            ".svg" => "image/svg+xml",
            ".webp" => "image/webp",
            _ => "application/octet-stream"
        };

    private sealed class ManifestDto
    {
        public List<PackDto?>? Packs { get; set; }
    }

    private sealed class PackDto
    {
        public string? Id { get; set; }
        public string? Path { get; set; }
        public bool? Enabled { get; set; } = true;
        public int Order { get; set; }
        public List<string>? DisplayKinds { get; set; }
        public bool RequireCategories { get; set; }
        public bool RequireDetailGrid { get; set; }
        public bool RequireToolbar { get; set; }
        public List<string>? Controllers { get; set; }
        public List<string>? ExcludeControllers { get; set; }
    }
}
