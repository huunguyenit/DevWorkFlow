namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Một ô trong dòng layout view Form (Dir/Filter).
/// Control: [field].Label | [field] | [field].Description | [field].Footer | [field].
/// </summary>
public enum FormViewCellKind
{
    Label,
    Input,
    /// <summary>Footer field – khai báo .Description / .Footer / .</summary>
    Description,
    Empty
}

public class FormViewCell
{
    public FormViewCellKind Kind { get; set; } = FormViewCellKind.Empty;
    public string? FieldName { get; set; }

    /// <summary>
    /// Hậu tố gốc sau [field] để ghi lại đúng khi Save: ".Label", ".Footer", ".Description", "." hoặc "".
    /// </summary>
    public string Suffix { get; set; } = string.Empty;

    /// <summary>Chỉ số cột bắt đầu (0-based) trong ColumnWidths.</summary>
    public int ColumnIndex { get; set; }

    /// <summary>Số cột pattern (1 + các 0 nối tiếp).</summary>
    public int ColumnSpan { get; set; } = 1;

    /// <summary>Tổng px = sum(ColumnWidths[start..start+span)).</summary>
    public int WidthPx { get; set; }
}

/// <summary>Một dòng: pattern "111000: [status].Label, [status], [status].Description".</summary>
public class FormViewRow
{
    public string Pattern { get; set; } = string.Empty;
    public List<FormViewCell> Cells { get; set; } = [];

    /// <summary>
    /// 0 = vùng trên, &gt;0 = tab category, -1 = vùng dưới form.
    /// </summary>
    public int CategoryIndex { get; set; }
}

/// <summary>
/// Layout từ &lt;views&gt;/&lt;view id="Dir" height|heigth="..."&gt; (Dir.xsd view).
/// Item đầu: "120, 30, 20, 50, 50, 280" (px).
/// Pattern: 1=bắt đầu control, 0=nối tiếp, -=không dùng.
/// </summary>
public class FormViewLayout
{
    public string ViewId { get; set; } = "Dir";

    /// <summary>Biểu thức gốc height/heigth (số hoặc 200+50).</summary>
    public string? HeightExpression { get; set; }

    /// <summary>Chiều cao đã evaluate (px). Null → Design dùng rows × 24.</summary>
    public int? HeightPx { get; set; }

    /// <summary>
    /// Số cột neo cố định khi phóng to form (cột 0..anchor-1 giữ width).
    /// Cột còn lại nhận phần rộng thêm.
    /// </summary>
    public int? Anchor { get; set; }

    /// <summary>
    /// Chia form thành 2 table: cột 0..split-1 = table trái, cột split.. = table phải.
    /// </summary>
    public int? Split { get; set; }

    public List<int> ColumnWidths { get; set; } = [];

    /// <summary>Toàn bộ dòng (giữ tương thích). Khi có Categories sẽ tách Top/Tab/Bottom.</summary>
    public List<FormViewRow> Rows { get; set; } = [];

    /// <summary>Vùng trên: field categoryIndex = null hoặc 0.</summary>
    public List<FormViewRow> TopRows { get; set; } = [];

    /// <summary>Vùng dưới: field categoryIndex = -1.</summary>
    public List<FormViewRow> BottomRows { get; set; } = [];

    /// <summary>Các tab (categoryIndex = n &gt; 0).</summary>
    public List<FormCategory> Categories { get; set; } = [];

    public bool HasCategories => Categories.Count > 0;

    public int ColumnCount => ColumnWidths.Count;
    public int TotalWidthPx => ColumnWidths.Sum();
}
