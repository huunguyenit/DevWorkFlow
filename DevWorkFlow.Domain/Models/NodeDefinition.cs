namespace DevWorkFlow.Domain.Models;

/// <summary>Loại node trong workflow designer.</summary>
public enum NodeType
{
    Start,
    End,
    Task,
    Decision,
    Subprocess,
    Timer,
    Notification
}

/// <summary>Một node trên canvas workflow.</summary>
public class NodeDefinition
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string Label { get; set; } = string.Empty;
    public NodeType NodeType { get; set; } = NodeType.Task;
    public double X { get; set; }
    public double Y { get; set; }
    public double Width { get; set; } = 120;
    public double Height { get; set; } = 50;
    public string? AssignedFormId { get; set; }
    public string? AssignedRole { get; set; }
    public Dictionary<string, string> Properties { get; set; } = [];
}

/// <summary>Kết nối giữa hai node.</summary>
public class ConnectionDefinition
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string SourceNodeId { get; set; } = string.Empty;
    public string TargetNodeId { get; set; } = string.Empty;
    public string? Label { get; set; }
    public string? Condition { get; set; }
}
