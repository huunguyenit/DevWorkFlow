using System.Linq;
using DevWorkFlow.Application.Skin;

namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>
/// Điều phối Project Web Skin: chuẩn hoá (FboHostNormalizer) + lưu shell.html (LocalSkinStore) + ghi
/// manifest. Hiện thực <see cref="IProjectSkinService"/>. CSS/JS/image KHÔNG mirror — chúng nằm sẵn trong
/// Program và được preview nạp trực tiếp qua virtual host (URL đã rewrite trong shell.html).
/// </summary>
public sealed class ProjectSkinService : IProjectSkinService
{
    private readonly LocalSkinStore _store;
    private readonly FboHostNormalizer _normalizer;

    public ProjectSkinService(LocalSkinStore store, FboHostNormalizer normalizer)
    {
        _store = store;
        _normalizer = normalizer;
    }

    public bool HasSkin(string project_id) => _store.HasSkin(project_id);

    public SkinManifest? GetManifest(string project_id) => _store.ReadManifest(project_id);

    public string GetSkinDirectory(string project_id) => _store.GetSkinDirectory(project_id);

    public string GetSkinEntryPath(string project_id) => _store.GetShellPath(project_id);

    public async Task<SkinCaptureResult> SaveCapturedShellAsync(
        SkinCaptureRequest request,
        CancellationToken ct = default)
    {
        ArgumentNullException.ThrowIfNull(request);
        if (string.IsNullOrWhiteSpace(request.ProjectId))
            throw new ArgumentException("ProjectId rỗng.", nameof(request));

        _store.EnsureSkinDirectory(request.ProjectId);

        // 1) Chuẩn hoá shell: ép UTF-8 charset + chèn host trống + rewrite URL asset → program virtual host.
        var normalized = _normalizer.Normalize(request.RawHtml, request.CapturedFromUrl);

        // 2) Ghi shell.html (UTF-8 BOM). KHÔNG mirror asset — CSS/JS/image nạp thẳng từ Program khi preview.
        await _store.WriteShellAsync(request.ProjectId, normalized.Html, ct).ConfigureAwait(false);

        // 3) Ghi manifest
        var now = DateTimeOffset.Now;
        var manifest = new SkinManifest
        {
            ProjectId = request.ProjectId,
            BaseUrl = request.BaseUrl,
            DocKind = request.DocKind,
            CapturedFromUrl = request.CapturedFromUrl,
            ProgramRoot = request.ProgramRoot,
            CapturedAt = now,
            AssetsSyncedAt = now,
            HostStatus = normalized.HostStatus,
            HostSelector = normalized.HostSelector,
            HostPlaceholderId = FboHostNormalizer.HostPlaceholderId,
            Assets = [.. normalized.Assets]
        };
        await _store.WriteManifestAsync(manifest, ct).ConfigureAwait(false);

        return new SkinCaptureResult
        {
            ProjectId = request.ProjectId,
            SkinDirectory = _store.GetSkinDirectory(request.ProjectId),
            ShellPath = _store.GetShellPath(request.ProjectId),
            HostStatus = normalized.HostStatus,
            Manifest = manifest,
            AssetSync = SummarizeAssets(normalized.Assets)
        };
    }

    public Task<AssetSyncResult> RefreshAssetsAsync(
        string project_id,
        string program_root,
        CancellationToken ct = default)
    {
        // Không còn mirror: asset nạp trực tiếp từ Program mỗi lần preview. "Refresh" chỉ đọc lại manifest
        // để báo số asset tham chiếu (local vs ngoại vi) — giữ chữ ký để UI hiện có không phải đổi.
        var manifest = _store.ReadManifest(project_id)
            ?? throw new InvalidOperationException("Chưa có skin để refresh. Hãy 'Lấy skin' trước.");

        return Task.FromResult(SummarizeAssets(manifest.Assets));
    }

    /// <summary>Đếm asset local (nạp được từ Program qua virtual host) vs ngoại vi/động (không nạp được).</summary>
    private static AssetSyncResult SummarizeAssets(IReadOnlyList<SkinAssetEntry> assets)
    {
        var served = assets.Count(a => a.Status == AssetResolveStatus.Resolved);
        return new AssetSyncResult
        {
            ResolvedCount = served,
            UnresolvedCount = assets.Count - served,
            Assets = assets
        };
    }
}
