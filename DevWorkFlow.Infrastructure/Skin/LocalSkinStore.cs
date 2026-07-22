using System.IO;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using DevWorkFlow.Application.Skin;

namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>
/// Đọc/ghi skin cache dưới %AppData%/DevWorkFlow/skins/&lt;project_id&gt;/ (shell.html + manifest.json).
/// Local máy, KHÔNG commit vào repo Program (quyết định "Nơi lưu C"). CSS/JS/image KHÔNG mirror vào đây —
/// preview nạp trực tiếp từ Program qua virtual host (xem <see cref="ProgramVirtualHost"/>).
/// </summary>
public sealed class LocalSkinStore
{
    private static readonly JsonSerializerOptions JsonOpts = new()
    {
        WriteIndented = true,
        Converters = { new JsonStringEnumConverter() }
    };

    /// <summary>UTF-8 CÓ BOM: WebView2 phục vụ shell.html qua virtual host không kèm charset trong
    /// Content-Type → Chromium phải tự đoán mã hoá; BOM là tín hiệu ưu tiên cao nhất, ép UTF-8 (đè cả
    /// &lt;meta charset&gt; lẫn charset HTTP) nên chữ có dấu không bị vỡ ("lỗi font").</summary>
    private static readonly UTF8Encoding Utf8WithBom = new(encoderShouldEmitUTF8Identifier: true);

    public const string ShellFileName = "shell.html";
    public const string ManifestFileName = "manifest.json";

    /// <summary>Virtual host WebView2 trỏ tới thư mục skin (shell.html).</summary>
    public const string SkinVirtualHost = "devworkflow.skin";

    /// <summary>Virtual host WebView2 trỏ tới Program root — CSS/JS/image nạp trực tiếp từ đây (không mirror).
    /// URL asset trong shell.html được rewrite thành https://{ProgramVirtualHost}/{relative}.</summary>
    public const string ProgramVirtualHost = "devworkflow.program";

    /// <summary>Gốc chứa mọi skin (…/DevWorkFlow/skins).</summary>
    public string RootDirectory { get; }

    public LocalSkinStore(string? root_directory = null)
    {
        RootDirectory = root_directory ?? Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
            "DevWorkFlow", "skins");
    }

    public string GetSkinDirectory(string project_id) =>
        Path.Combine(RootDirectory, SanitizeSegment(project_id));

    public string GetShellPath(string project_id) =>
        Path.Combine(GetSkinDirectory(project_id), ShellFileName);

    public string GetManifestPath(string project_id) =>
        Path.Combine(GetSkinDirectory(project_id), ManifestFileName);

    public bool HasSkin(string project_id) =>
        File.Exists(GetShellPath(project_id)) && File.Exists(GetManifestPath(project_id));

    /// <summary>Tạo thư mục skin nếu chưa có, trả về đường dẫn thư mục skin.</summary>
    public string EnsureSkinDirectory(string project_id)
    {
        var dir = GetSkinDirectory(project_id);
        Directory.CreateDirectory(dir);
        return dir;
    }

    public async Task WriteShellAsync(string project_id, string html, CancellationToken ct = default)
    {
        EnsureSkinDirectory(project_id);
        // Utf8WithBom: ép WebView2 đọc lại đúng UTF-8 (tránh mojibake chữ có dấu).
        await File.WriteAllTextAsync(GetShellPath(project_id), html, Utf8WithBom, ct).ConfigureAwait(false);
    }

    public async Task<string?> ReadShellAsync(string project_id, CancellationToken ct = default)
    {
        var path = GetShellPath(project_id);
        return File.Exists(path)
            ? await File.ReadAllTextAsync(path, ct).ConfigureAwait(false)
            : null;
    }

    public async Task WriteManifestAsync(SkinManifest manifest, CancellationToken ct = default)
    {
        EnsureSkinDirectory(manifest.ProjectId);
        var json = JsonSerializer.Serialize(manifest, JsonOpts);
        await File.WriteAllTextAsync(GetManifestPath(manifest.ProjectId), json, ct).ConfigureAwait(false);
    }

    public SkinManifest? ReadManifest(string project_id)
    {
        var path = GetManifestPath(project_id);
        if (!File.Exists(path)) return null;
        try
        {
            var json = File.ReadAllText(path);
            return JsonSerializer.Deserialize<SkinManifest>(json, JsonOpts);
        }
        catch (Exception ex) when (ex is JsonException or IOException)
        {
            return null;
        }
    }

    private static string SanitizeSegment(string segment)
    {
        if (string.IsNullOrWhiteSpace(segment)) return "unknown";
        var invalid = Path.GetInvalidFileNameChars();
        var chars = segment.Select(c => invalid.Contains(c) ? '_' : c).ToArray();
        return new string(chars);
    }
}
