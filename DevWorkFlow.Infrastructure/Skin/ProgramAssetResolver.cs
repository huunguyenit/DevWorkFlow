using System.IO;
using DevWorkFlow.Application.Skin;

namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>
/// Mirror asset từ Program trên đĩa vào thư mục assets/ của skin. Với mỗi entry đã có RelativePath,
/// tìm file dưới program_root theo cùng relative path (Css/…, ClientScript/…, Images/…) rồi copy.
/// Không tìm thấy / external / động → đánh dấu Unresolved (ghi lý do). KHÔNG login, KHÔNG mạng.
/// </summary>
public sealed class ProgramAssetResolver
{
    /// <summary>
    /// Resolve + copy. Mutate trạng thái từng entry và trả tổng kết. <paramref name="assets_directory"/>
    /// là …/skins/&lt;project_id&gt;/assets (đã tồn tại).
    /// </summary>
    public AssetSyncResult ResolveAndMirror(
        IReadOnlyList<SkinAssetEntry> assets,
        string program_root,
        string assets_directory,
        CancellationToken ct = default)
    {
        Directory.CreateDirectory(assets_directory);

        var resolved = 0;
        var unresolved = 0;

        foreach (var entry in assets)
        {
            ct.ThrowIfCancellationRequested();

            if (string.IsNullOrEmpty(entry.RelativePath))
            {
                // Normalizer đã kết luận không map được (external/động).
                entry.Status = AssetResolveStatus.Unresolved;
                entry.Note ??= "not mappable";
                unresolved++;
                continue;
            }

            var source = ResolveSourceFile(program_root, entry.RelativePath);
            if (source is null)
            {
                entry.Status = AssetResolveStatus.Unresolved;
                entry.Note = "file not found under program_root";
                unresolved++;
                continue;
            }

            var target = Path.Combine(assets_directory, entry.RelativePath.Replace('/', Path.DirectorySeparatorChar));
            Directory.CreateDirectory(Path.GetDirectoryName(target)!);
            File.Copy(source, target, overwrite: true);

            entry.Status = AssetResolveStatus.Resolved;
            entry.Note = null;
            resolved++;
        }

        return new AssetSyncResult
        {
            ResolvedCount = resolved,
            UnresolvedCount = unresolved,
            Assets = assets
        };
    }

    /// <summary>Tìm file dưới program_root theo relative path; trả null nếu không tồn tại/không hợp lệ.</summary>
    private static string? ResolveSourceFile(string program_root, string relative_path)
    {
        if (string.IsNullOrWhiteSpace(program_root) || !Directory.Exists(program_root))
            return null;

        var candidate = Path.Combine(program_root, relative_path.Replace('/', Path.DirectorySeparatorChar));
        var full = Path.GetFullPath(candidate);

        // An toàn: không cho path thoát ra ngoài program_root (../ đã được chuẩn hoá nhưng vẫn kiểm tra).
        var root_full = Path.GetFullPath(program_root);
        if (!full.StartsWith(root_full, StringComparison.OrdinalIgnoreCase))
            return null;

        return File.Exists(full) ? full : null;
    }
}
