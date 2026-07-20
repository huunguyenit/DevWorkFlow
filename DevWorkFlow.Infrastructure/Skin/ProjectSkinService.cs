using DevWorkFlow.Application.Skin;

namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>
/// Điều phối Project Web Skin: chuẩn hoá (FboHostNormalizer) + lưu (LocalSkinStore) + mirror assets
/// (ProgramAssetResolver) + ghi manifest. Hiện thực <see cref="IProjectSkinService"/>.
/// </summary>
public sealed class ProjectSkinService : IProjectSkinService
{
    private readonly LocalSkinStore _store;
    private readonly FboHostNormalizer _normalizer;
    private readonly ProgramAssetResolver _resolver;

    public ProjectSkinService(
        LocalSkinStore store,
        FboHostNormalizer normalizer,
        ProgramAssetResolver resolver)
    {
        _store = store;
        _normalizer = normalizer;
        _resolver = resolver;
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
        _store.ClearAssets(request.ProjectId);

        // 1) Chuẩn hoá shell: chèn host trống + rewrite URL asset → assets/…
        var normalized = _normalizer.Normalize(request.RawHtml, request.CapturedFromUrl);

        // 2) Ghi shell.html
        await _store.WriteShellAsync(request.ProjectId, normalized.Html, ct).ConfigureAwait(false);

        // 3) Mirror assets từ Program (không mạng)
        var assets_dir = _store.GetAssetsDirectory(request.ProjectId);
        var sync = _resolver.ResolveAndMirror(normalized.Assets, request.ProgramRoot, assets_dir, ct);

        // 4) Ghi manifest
        var now = DateTimeOffset.Now;
        var manifest = new SkinManifest
        {
            ProjectId = request.ProjectId,
            BaseUrl = request.BaseUrl,
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
            AssetSync = sync
        };
    }

    public async Task<AssetSyncResult> RefreshAssetsAsync(
        string project_id,
        string program_root,
        CancellationToken ct = default)
    {
        var manifest = _store.ReadManifest(project_id)
            ?? throw new InvalidOperationException(
                "Chưa có skin để refresh. Hãy 'Lấy skin' trước.");

        // Refresh KHÔNG login: chỉ mirror lại assets theo danh sách trong manifest, giữ nguyên shell.html/host.
        var root = string.IsNullOrWhiteSpace(program_root) ? manifest.ProgramRoot : program_root;
        _store.ClearAssets(project_id);
        var assets_dir = _store.GetAssetsDirectory(project_id);

        // Reset trạng thái entry trước khi resolve lại (giữ mapping đã rewrite trong shell.html).
        foreach (var entry in manifest.Assets)
        {
            if (!string.IsNullOrEmpty(entry.RelativePath))
            {
                entry.Status = AssetResolveStatus.Pending;
                entry.Note = null;
            }
        }

        var sync = _resolver.ResolveAndMirror(manifest.Assets, root, assets_dir, ct);

        manifest.ProgramRoot = root;
        manifest.AssetsSyncedAt = DateTimeOffset.Now;
        await _store.WriteManifestAsync(manifest, ct).ConfigureAwait(false);
        return sync;
    }
}
