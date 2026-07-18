namespace DevWorkFlow.Domain.Models;

/// <summary>Định nghĩa toàn bộ một form, được parse từ XML.</summary>
public class FormDefinition
{
    public string Id { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public TemplateType TemplateType { get; set; }
    public string Description { get; set; } = string.Empty;
    /// <summary>Số cột layout của form (dùng UniformGrid).</summary>
    public int ColumnCount { get; set; } = 2;
    public List<FieldDefinition> Fields { get; set; } = [];
    /// <summary>Toolbar actions (Save, Cancel, Print…).</summary>
    public List<string> Actions { get; set; } = [];
    public string XmlSource { get; set; } = string.Empty;
}
