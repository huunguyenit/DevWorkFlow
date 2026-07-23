using System.Text.Json;

namespace DevWorkFlow.Application.Design.Toolbox;

/// <summary>
/// Bảng màu + hằng số hình học của lớp Blueprint (config <c>blueprint-theme.json</c>). Mọi field có mặc định
/// cứng → thiếu file / key vẫn chạy. <see cref="ToJsonObject"/> phát ra literal để inject vào script Blueprint.
/// </summary>
public sealed record BlueprintTheme
{
    public string ColumnGuide { get; init; } = "rgba(255, 111, 0, 0.85)";
    public string ColumnLabel { get; init; } = "#E65100";
    public string Splitter { get; init; } = "rgba(255, 111, 0, 0.35)";
    public string RegionMain { get; init; } = "rgba(33, 150, 243, 0.75)";
    public string RegionFooter { get; init; } = "rgba(255, 152, 0, 0.75)";
    public string RegionTab { get; init; } = "rgba(156, 39, 176, 0.75)";
    public string SelectedControl { get; init; } = "#0D47A1";
    public string SelectedSlot { get; init; } = "#1565C0";
    public string SelectedRegion { get; init; } = "#6A1B9A";
    public string DropTarget { get; init; } = "#2E7D32";
    public int TopResizeHitPx { get; init; } = 12;
    public string SplitDivider { get; init; } = "#C62828";
    public string AnchorIcon { get; init; } = "#1565C0";
    public string SpareRowHighlight { get; init; } = "rgba(46, 125, 50, 0.12)";
    public string GhostLabelInput { get; init; } = "rgba(21, 101, 192, 0.25)";

    public static BlueprintTheme Default { get; } = new();

    /// <summary>JSON object literal cho script Blueprint (`var THEME = {...}`).</summary>
    public string ToJsonObject() => JsonSerializer.Serialize(new
    {
        columnGuide = ColumnGuide,
        columnLabel = ColumnLabel,
        splitter = Splitter,
        regionMain = RegionMain,
        regionFooter = RegionFooter,
        regionTab = RegionTab,
        selectedControl = SelectedControl,
        selectedSlot = SelectedSlot,
        selectedRegion = SelectedRegion,
        dropTarget = DropTarget,
        topResizeHitPx = TopResizeHitPx,
        splitDivider = SplitDivider,
        anchorIcon = AnchorIcon,
        spareRowHighlight = SpareRowHighlight,
        ghostLabelInput = GhostLabelInput
    });
}
