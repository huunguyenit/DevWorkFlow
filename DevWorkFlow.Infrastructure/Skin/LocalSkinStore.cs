using System.IO;
using System.Text.Json;
using System.Text.Json.Serialization;
using DevWorkFlow.Application.Skin;

namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>
/// Đọc/ghi skin cache dưới %AppData%/DevWorkFlow/skins/&lt;project_id&gt;/ (shell.html + manifest.json +
/// assets/). Local máy, KHÔNG commit vào repo Program (quyết định "Nơi lưu C").
/// </summary>
public sealed class LocalSkinStore
{
    private static readonly JsonSerializerOptions JsonOpts = new()
    {
        WriteIndented = true,
        Converters = { new JsonStringEnumConverter() }
    };

    public const string ShellFileName = "shell.html";
    public const string ManifestFileName = "manifest.json";
    public const string AssetsFolderName = "assets";

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

    public string GetAssetsDirectory(string project_id) =>
        Path.Combine(GetSkinDirectory(project_id), AssetsFolderName);

    public string GetShellPath(string project_id) =>
        Path.Combine(GetSkinDirectory(project_id), ShellFileName);

    public string GetManifestPath(string project_id) =>
        Path.Combine(GetSkinDirectory(project_id), ManifestFileName);

    public bool HasSkin(string project_id) =>
        File.Exists(GetShellPath(project_id)) && File.Exists(GetManifestPath(project_id));

    /// <summary>Tạo thư mục skin (+ assets/) nếu chưa có, trả về đường dẫn thư mục skin.</summary>
    public string EnsureSkinDirectory(string project_id)
    {
        var dir = GetSkinDirectory(project_id);
        Directory.CreateDirectory(dir);
        Directory.CreateDirectory(Path.Combine(dir, AssetsFolderName));
        return dir;
    }

    public async Task WriteShellAsync(string project_id, string html, CancellationToken ct = default)
    {
        EnsureSkinDirectory(project_id);
        await File.WriteAllTextAsync(GetShellPath(project_id), html, ct).ConfigureAwait(false);
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

    /// <summary>Xoá sạch nội dung assets/ trước khi mirror lại (Refresh) — tránh rác từ lần trước.</summary>
    public void ClearAssets(string project_id)
    {
        var dir = GetAssetsDirectory(project_id);
        if (Directory.Exists(dir))
            Directory.Delete(dir, recursive: true);
        Directory.CreateDirectory(dir);
    }

    private static string SanitizeSegment(string segment)
    {
        if (string.IsNullOrWhiteSpace(segment)) return "unknown";
        var invalid = Path.GetInvalidFileNameChars();
        var chars = segment.Select(c => invalid.Contains(c) ? '_' : c).ToArray();
        return new string(chars);
    }
}
