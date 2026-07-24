using System.Text.Json;

namespace DevWorkFlow.Application.Design.Toolbox;

/// <summary>
/// Load <c>blueprint-theme.json</c> → <see cref="BlueprintTheme"/>. Fail-closed: thiếu file / JSON hỏng →
/// <see cref="BlueprintTheme.Default"/>. Key vắng mặt giữ mặc định (patch từng field).
/// </summary>
public sealed class BlueprintThemeCatalog
{
    private static readonly JsonSerializerOptions JsonOpts = new()
    {
        PropertyNameCaseInsensitive = true,
        ReadCommentHandling = JsonCommentHandling.Skip,
        AllowTrailingCommas = true
    };

    private readonly string _json_path;
    private readonly object _gate = new();
    private BlueprintTheme? _cached;

    public BlueprintThemeCatalog(string json_path) => _json_path = json_path ?? string.Empty;

    public BlueprintTheme GetTheme()
    {
        lock (_gate)
            return _cached ??= Load();
    }

    public void Invalidate()
    {
        lock (_gate)
            _cached = null;
    }

    private BlueprintTheme Load()
    {
        if (string.IsNullOrWhiteSpace(_json_path) || !File.Exists(_json_path))
            return BlueprintTheme.Default;

        try
        {
            var dto = JsonSerializer.Deserialize<ThemeDto>(File.ReadAllText(_json_path), JsonOpts);
            if (dto is null) return BlueprintTheme.Default;

            var d = BlueprintTheme.Default;
            return new BlueprintTheme
            {
                ColumnGuide = dto.ColumnGuide ?? d.ColumnGuide,
                ColumnLabel = dto.ColumnLabel ?? d.ColumnLabel,
                Splitter = dto.Splitter ?? d.Splitter,
                RegionMain = dto.RegionMain ?? d.RegionMain,
                RegionFooter = dto.RegionFooter ?? d.RegionFooter,
                RegionTab = dto.RegionTab ?? d.RegionTab,
                SelectedControl = dto.SelectedControl ?? d.SelectedControl,
                SelectedSlot = dto.SelectedSlot ?? d.SelectedSlot,
                SelectedRegion = dto.SelectedRegion ?? d.SelectedRegion,
                DropTarget = dto.DropTarget ?? d.DropTarget,
                TopResizeHitPx = dto.TopResizeHitPx ?? d.TopResizeHitPx,
                SplitDivider = dto.SplitDivider ?? d.SplitDivider,
                AnchorIcon = dto.AnchorIcon ?? d.AnchorIcon,
                SpareRowHighlight = dto.SpareRowHighlight ?? d.SpareRowHighlight,
                GhostLabelInput = dto.GhostLabelInput ?? d.GhostLabelInput,
                MergePreview = dto.MergePreview ?? d.MergePreview,
                SplitKeepPreview = dto.SplitKeepPreview ?? d.SplitKeepPreview,
                SplitReleasePreview = dto.SplitReleasePreview ?? d.SplitReleasePreview
            };
        }
        catch (Exception ex) when (ex is JsonException or IOException or UnauthorizedAccessException)
        {
            return BlueprintTheme.Default;
        }
    }

    private sealed class ThemeDto
    {
        public string? ColumnGuide { get; set; }
        public string? ColumnLabel { get; set; }
        public string? Splitter { get; set; }
        public string? RegionMain { get; set; }
        public string? RegionFooter { get; set; }
        public string? RegionTab { get; set; }
        public string? SelectedControl { get; set; }
        public string? SelectedSlot { get; set; }
        public string? SelectedRegion { get; set; }
        public string? DropTarget { get; set; }
        public int? TopResizeHitPx { get; set; }
        public string? SplitDivider { get; set; }
        public string? AnchorIcon { get; set; }
        public string? SpareRowHighlight { get; set; }
        public string? GhostLabelInput { get; set; }
        public string? MergePreview { get; set; }
        public string? SplitKeepPreview { get; set; }
        public string? SplitReleasePreview { get; set; }
    }
}
