namespace DevWorkFlow.Domain.Design;

/// <summary>
/// Một control trong palette Toolbox (config <c>toolbox-controls.xml</c>). Dữ liệu thuần —
/// Application map <c>Id</c> → <c>ToolboxControlKind</c>, UI chỉ hiển thị + kéo.
/// </summary>
public sealed class ToolboxControlInfo
{
    public required string Id { get; init; }
    public required string Name { get; init; }
    public string Icon { get; init; } = string.Empty;
    public bool Enabled { get; init; } = true;

    public string GroupId { get; init; } = string.Empty;
    public string GroupTitle { get; init; } = string.Empty;

    // ── TextBox-family (tạo field mới) ───────────────────────────────
    public string? Prefix { get; init; }
    public string? DataType { get; init; }
    public string? DataFormatString { get; init; }
    public string? ItemsStyle { get; init; }
    public bool CreateReference { get; init; }

    /// <summary>Thứ tự ưu tiên Place khi thả (vd. Input, Label, Description).</summary>
    public IReadOnlyList<string> PlaceKinds { get; init; } = [];

    // ── Tab (Normal / Grid / Post / List) ────────────────────────────
    public string? TabKind { get; init; }

    public bool IsTab => !string.IsNullOrWhiteSpace(TabKind);
}

/// <summary>Nhóm control (Basic / Tabs…) — chỉ để gom nhóm hiển thị.</summary>
public sealed class ToolboxControlGroup
{
    public required string Id { get; init; }
    public string Title { get; init; } = string.Empty;
    public IReadOnlyList<ToolboxControlInfo> Controls { get; init; } = [];
}

/// <summary>
/// Nội dung <c>toolbox-controls.xml</c> đã parse — SoT palette Toolbox. UI KHÔNG hard-code danh sách này
/// (cùng nguyên tắc catalog SQL/JS). Thiếu file → <see cref="Empty"/> (fail-closed).
/// </summary>
public sealed class ToolboxControlCatalogData
{
    public static ToolboxControlCatalogData Empty { get; } = new();

    public int Version { get; init; }
    public IReadOnlyList<ToolboxControlGroup> Groups { get; init; } = [];

    public IEnumerable<ToolboxControlInfo> AllControls => Groups.SelectMany(g => g.Controls);
}
