namespace DevWorkFlow.Domain.Models;

/// <summary>Template item hiển thị trong danh sách sidebar.</summary>
public class TemplateItem
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string Name { get; set; } = string.Empty;
    public TemplateType TemplateType { get; set; }
    public string? IconKind { get; set; }
    public string? WorkflowId { get; set; }
    public string? FormId { get; set; }
    public bool IsFavorite { get; set; }
}
