namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>Mục dropdown trên nút toolbar có &lt;menuItems&gt;.</summary>
public class GridToolbarMenuItem
{
    public string CommandArgument { get; set; } = string.Empty;
    public LocalizedText Header { get; set; } = new();

    public bool IsSeparator =>
        CommandArgument is "-" or "Separate"
        || Header.V == "-" || Header.E == "-";
}

/// <summary>Nút trên toolbar Grid (New, Edit, Delete, View, ...).</summary>
public class GridToolbarButton
{
    public string Command { get; set; } = string.Empty;
    public LocalizedText Title { get; set; } = new();

    /// <summary>Dropdown &lt;menuItems&gt;/&lt;menuItem&gt; — nếu có → class Group{Command} / TextGroup{Command}.</summary>
    public List<GridToolbarMenuItem> MenuItems { get; set; } = [];

    public bool HasMenuItems => MenuItems.Count > 0;

    public bool IsSeparator =>
        Command is "-" or "Separate" || Title.V == "-" || Title.E == "-";
}

/// <summary>
/// Lưới danh sách – XML thư mục Grid.
/// Root: &lt;grid&gt;. Cột hiển thị theo &lt;views&gt;/&lt;view id="Grid"&gt;.
/// </summary>
public class FboGridModel
{
    public string ControllerName { get; set; } = string.Empty;

    public string Table { get; set; } = string.Empty;
    public string CodeField { get; set; } = string.Empty;
    public string? OrderBy { get; set; }

    /// <summary>Grid.xsd grid/@type, ví dụ Detail.</summary>
    public string? AppType { get; set; }

    public bool IsDetail =>
        string.Equals(AppType, "Detail", StringComparison.OrdinalIgnoreCase);

    public LocalizedText Title { get; set; } = new();
    public LocalizedText SubTitle { get; set; } = new();

    /// <summary>Toàn bộ field khai báo trong &lt;fields&gt;.</summary>
    public List<FboField> Fields { get; set; } = [];

    /// <summary>
    /// Thứ tự cột trên lưới – từ &lt;view id="Grid"&gt;/&lt;field name="..."/&gt;.
    /// Nếu view trống, dùng toàn bộ Fields.
    /// </summary>
    public List<string> VisibleFieldNames { get; set; } = [];

    public List<GridToolbarButton> Toolbar { get; set; } = [];

    public Dictionary<string, FboField> FieldsByName { get; set; } =
        new(StringComparer.OrdinalIgnoreCase);

    /// <summary>Các cột thực sự hiển thị (theo VisibleFieldNames, bỏ field@hidden).</summary>
    public IReadOnlyList<FboField> VisibleColumns
    {
        get
        {
            IEnumerable<FboField> source;
            if (VisibleFieldNames.Count == 0)
                source = Fields;
            else
            {
                var columns = new List<FboField>();
                foreach (var name in VisibleFieldNames)
                {
                    if (FieldsByName.TryGetValue(name, out var fbo_field))
                        columns.Add(fbo_field);
                }
                source = columns;
            }

            return source.Where(f => !f.Hidden).ToList();
        }
    }

    public string DisplayTitle => Title.Get(true);
    public string DisplaySubTitle => SubTitle.Get(true);
}
