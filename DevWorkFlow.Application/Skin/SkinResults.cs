namespace DevWorkFlow.Application.Skin;

/// <summary>Kết quả lưu skin (sau normalize + ghi shell + mirror assets + ghi manifest).</summary>
public sealed class SkinCaptureResult
{
    public string ProjectId { get; set; } = string.Empty;
    public string SkinDirectory { get; set; } = string.Empty;
    public string ShellPath { get; set; } = string.Empty;
    public HostStatus HostStatus { get; set; } = HostStatus.NotFound;
    public SkinManifest Manifest { get; set; } = new();
    public AssetSyncResult AssetSync { get; set; } = new();
}

/// <summary>Kết quả mirror assets từ Program (dùng cho cả capture lẫn "Refresh assets").</summary>
public sealed class AssetSyncResult
{
    public int ResolvedCount { get; set; }
    public int UnresolvedCount { get; set; }
    public IReadOnlyList<SkinAssetEntry> Assets { get; set; } = [];
}
