namespace DevWorkFlow.Domain.Models;

/// <summary>Kiểu dữ liệu của một field trên form.</summary>
public enum FieldType
{
    Text,
    Number,
    Date,
    DateTime,
    Boolean,
    Dropdown,
    Lookup,
    TextArea,
    Hidden
}

/// <summary>Định nghĩa một trường trên form, đọc từ XML.</summary>
public class FieldDefinition
{
    public string Name { get; set; } = string.Empty;
    public string Label { get; set; } = string.Empty;
    public FieldType FieldType { get; set; } = FieldType.Text;
    public bool IsRequired { get; set; }
    public bool IsReadOnly { get; set; }
    public string? DefaultValue { get; set; }
    public string? PlaceholderText { get; set; }
    public int Row { get; set; }
    public int Column { get; set; }
    public int ColumnSpan { get; set; } = 1;
    /// <summary>Danh sách lựa chọn khi FieldType = Dropdown.</summary>
    public List<string> Options { get; set; } = [];
    public string? ValidationRegex { get; set; }
    public string? ValidationMessage { get; set; }
}
