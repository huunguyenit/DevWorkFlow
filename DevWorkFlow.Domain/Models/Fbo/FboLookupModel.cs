namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Lookup chọn nhanh – XML thư mục Lookup.
/// Root: &lt;lookup table="..." code="..." name="..." order="..."&gt;.
/// </summary>
public class FboLookupModel
{
    public string ControllerName { get; set; } = string.Empty;

    public string Table { get; set; } = string.Empty;

    /// <summary>Cột mã (code="ma_tt").</summary>
    public string CodeField { get; set; } = string.Empty;

    /// <summary>Cột tên hiển thị (name="ten_tt%l").</summary>
    public string NameField { get; set; } = string.Empty;

    public string? OrderBy { get; set; }

    public LocalizedText Header { get; set; } = new();

    public List<FboField> Fields { get; set; } = [];

    public Dictionary<string, FboField> FieldsByName { get; set; } =
        new(StringComparer.OrdinalIgnoreCase);

    /// <summary>Field đang chọn để tìm nhanh (mặc định = CodeField).</summary>
    public string SearchField { get; set; } = string.Empty;

    public string DisplayTitle => Header.Get(true);
}
