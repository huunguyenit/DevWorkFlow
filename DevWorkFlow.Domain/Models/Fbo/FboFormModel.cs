namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Form danh mục / lọc – XML thư mục Dir hoặc Filter.
/// Root: &lt;dir&gt; hoặc &lt;filter&gt;. Render theo &lt;fields&gt; + &lt;views&gt;.
/// </summary>
public class FboFormModel
{
    public ControllerFolderKind FolderKind { get; set; } = ControllerFolderKind.Dir;

    /// <summary>Tên file / controller (PaymentTerm).</summary>
    public string ControllerName { get; set; } = string.Empty;

    public string Table { get; set; } = string.Empty;
    public string CodeField { get; set; } = string.Empty;
    public string? OrderBy { get; set; }

    /// <summary>Dir.xsd dir/@type (Dir, Report, Voucher, Detail).</summary>
    public string? AppType { get; set; }

    /// <summary>Dir.xsd dir/@database (App, Sys, Ext).</summary>
    public string? Database { get; set; }

    public bool UniKey { get; set; }
    public bool Navigation { get; set; }

    public LocalizedText Title { get; set; } = new();

    public List<FboField> Fields { get; set; } = [];

    /// <summary>View layout (thường id="Dir").</summary>
    public FormViewLayout? Layout { get; set; }

    public Dictionary<string, FboField> FieldsByName { get; set; } =
        new(StringComparer.OrdinalIgnoreCase);

    public FboField? FindField(string name) =>
        FieldsByName.TryGetValue(name, out var f) ? f : null;

    public string DisplayTitle => Title.Get(true);
}
