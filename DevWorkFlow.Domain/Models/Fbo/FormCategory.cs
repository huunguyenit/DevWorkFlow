namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Tab category từ views/view/categories/category (Dir.xsd categoriesType).
/// </summary>
public class FormCategory
{
    public int Index { get; set; }
    public string HeaderV { get; set; } = string.Empty;
    public string HeaderE { get; set; } = string.Empty;
    public List<int> ColumnWidths { get; set; } = [];
    public int? Anchor { get; set; }
    public int? Split { get; set; }
    public List<FormViewRow> Rows { get; set; } = [];

    public string GetHeader(bool vietnamese) =>
        vietnamese
            ? (!string.IsNullOrWhiteSpace(HeaderV) ? HeaderV : HeaderE)
            : (!string.IsNullOrWhiteSpace(HeaderE) ? HeaderE : HeaderV);
}
