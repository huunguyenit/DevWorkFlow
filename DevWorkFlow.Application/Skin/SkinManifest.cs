namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Metadata của một skin đã lưu (đi kèm shell.html + assets/) trong
/// %AppData%/DevWorkFlow/skins/&lt;project_id&gt;/manifest.json.
/// </summary>
public sealed class SkinManifest
{
    public string SchemaVersion { get; set; } = "1.0";

    public string ProjectId { get; set; } = string.Empty;

    /// <summary>Base URL site ERP mà user nhập ở lần capture.</summary>
    public string BaseUrl { get; set; } = string.Empty;

    /// <summary>URL thực tế của trang lúc user bấm "Dùng trang này" (sau khi login/điều hướng).</summary>
    public string CapturedFromUrl { get; set; } = string.Empty;

    /// <summary>Program root (ProgramContext.ProgramPath) dùng để mirror assets — hint cho lần Refresh sau.</summary>
    public string ProgramRoot { get; set; } = string.Empty;

    public DateTimeOffset CapturedAt { get; set; }

    public DateTimeOffset? AssetsSyncedAt { get; set; }

    public HostStatus HostStatus { get; set; } = HostStatus.NotFound;

    /// <summary>Selector đã khớp khi tìm host (null nếu NotFound). Cho phép override thủ công sau này.</summary>
    public string? HostSelector { get; set; }

    /// <summary>Id của phần tử placeholder host được chèn vào shell (HTML Generator sẽ nhúng form vào đây sau).</summary>
    public string HostPlaceholderId { get; set; } = "dwf-designer-host";

    public List<SkinAssetEntry> Assets { get; set; } = [];
}
