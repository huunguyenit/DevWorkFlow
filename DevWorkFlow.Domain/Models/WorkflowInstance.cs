namespace DevWorkFlow.Domain.Models;

/// <summary>Trạng thái thực thi của một workflow instance.</summary>
public enum WorkflowStatus
{
    Draft,
    Running,
    Paused,
    Completed,
    Cancelled,
    Error
}

/// <summary>Instance chạy thực tế của một workflow.</summary>
public class WorkflowInstance
{
    public string InstanceId { get; set; } = Guid.NewGuid().ToString();
    public string WorkflowId { get; set; } = string.Empty;
    public WorkflowStatus Status { get; set; } = WorkflowStatus.Draft;
    public string CurrentNodeId { get; set; } = string.Empty;
    public string StartedBy { get; set; } = string.Empty;
    public DateTime StartedAt { get; set; } = DateTime.Now;
    public DateTime? CompletedAt { get; set; }
    public Dictionary<string, object> Variables { get; set; } = [];
    public List<string> ExecutionLog { get; set; } = [];
}

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
