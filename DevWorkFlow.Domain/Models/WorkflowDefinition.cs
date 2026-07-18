namespace DevWorkFlow.Domain.Models;

/// <summary>Định nghĩa toàn bộ một workflow (bao gồm các node và kết nối).</summary>
public class WorkflowDefinition
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Version { get; set; } = "1.0";
    public TemplateType TemplateType { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime? ModifiedAt { get; set; }
    public List<NodeDefinition> Nodes { get; set; } = [];
    public List<ConnectionDefinition> Connections { get; set; } = [];
    /// <summary>Id FormDefinition gắn với workflow này.</summary>
    public string? BoundFormId { get; set; }
}
