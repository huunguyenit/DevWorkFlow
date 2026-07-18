using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Xử lý vòng đời workflow: khởi tạo, chuyển node, hoàn thành, huỷ.
/// Đây là in-memory engine – sẵn sàng swap sang persistence layer sau.
/// </summary>
public class WorkflowEngine
{
    private readonly Dictionary<string, WorkflowDefinition> _definitions = [];
    private readonly Dictionary<string, WorkflowInstance>   _instances   = [];

    public event EventHandler<WorkflowInstance>? InstanceStatusChanged;

    // ── Definition management ──────────────────────────────────────────────

    public void Register(WorkflowDefinition definition)
    {
        _definitions[definition.Id] = definition;
    }

    public WorkflowDefinition? GetDefinition(string id) =>
        _definitions.TryGetValue(id, out var def) ? def : null;

    public IReadOnlyCollection<WorkflowDefinition> GetAllDefinitions() =>
        _definitions.Values;

    // ── Instance lifecycle ─────────────────────────────────────────────────

    public WorkflowInstance Start(string workflowId, string startedBy = "system")
    {
        if (!_definitions.TryGetValue(workflowId, out var def))
            throw new InvalidOperationException($"Workflow '{workflowId}' chưa được đăng ký.");

        var startNode = def.Nodes.FirstOrDefault(n => n.NodeType == NodeType.Start)
            ?? throw new InvalidOperationException("Workflow thiếu node Start.");

        var instance = new WorkflowInstance
        {
            WorkflowId    = workflowId,
            CurrentNodeId = startNode.Id,
            StartedBy     = startedBy,
            Status        = WorkflowStatus.Running
        };

        instance.ExecutionLog.Add($"[{DateTime.Now:HH:mm:ss}] Workflow started by {startedBy} at node '{startNode.Label}'.");
        _instances[instance.InstanceId] = instance;
        InstanceStatusChanged?.Invoke(this, instance);
        return instance;
    }

    public bool MoveNext(string instanceId, string? conditionValue = null)
    {
        if (!_instances.TryGetValue(instanceId, out var instance))
            return false;
        if (instance.Status != WorkflowStatus.Running)
            return false;

        if (!_definitions.TryGetValue(instance.WorkflowId, out var def))
            return false;

        var outgoing = def.Connections
            .Where(c => c.SourceNodeId == instance.CurrentNodeId)
            .ToList();

        ConnectionDefinition? connection;
        if (conditionValue is not null)
            connection = outgoing.FirstOrDefault(c => c.Condition == conditionValue)
                         ?? outgoing.FirstOrDefault();
        else
            connection = outgoing.FirstOrDefault();

        if (connection is null)
            return false;

        var nextNode = def.Nodes.FirstOrDefault(n => n.Id == connection.TargetNodeId);
        if (nextNode is null) return false;

        instance.CurrentNodeId = nextNode.Id;
        instance.ExecutionLog.Add($"[{DateTime.Now:HH:mm:ss}] Moved to node '{nextNode.Label}'.");

        if (nextNode.NodeType == NodeType.End)
        {
            instance.Status      = WorkflowStatus.Completed;
            instance.CompletedAt = DateTime.Now;
            instance.ExecutionLog.Add($"[{DateTime.Now:HH:mm:ss}] Workflow completed.");
        }

        InstanceStatusChanged?.Invoke(this, instance);
        return true;
    }

    public void Cancel(string instanceId, string reason = "")
    {
        if (!_instances.TryGetValue(instanceId, out var instance)) return;
        instance.Status = WorkflowStatus.Cancelled;
        instance.CompletedAt = DateTime.Now;
        instance.ExecutionLog.Add($"[{DateTime.Now:HH:mm:ss}] Cancelled. {reason}");
        InstanceStatusChanged?.Invoke(this, instance);
    }

    public WorkflowInstance? GetInstance(string instanceId) =>
        _instances.TryGetValue(instanceId, out var inst) ? inst : null;

    public IReadOnlyCollection<WorkflowInstance> GetAllInstances() =>
        _instances.Values;

    // ── Seed helper ────────────────────────────────────────────────────────

    /// <summary>Tạo một workflow mẫu để demo.</summary>
    public static WorkflowDefinition CreateSampleWorkflow(string name, TemplateType type)
    {
        var start  = new NodeDefinition { Label = "Bắt đầu",    NodeType = NodeType.Start,    X = 50,  Y = 150 };
        var task1  = new NodeDefinition { Label = "Nhập liệu",  NodeType = NodeType.Task,     X = 220, Y = 150 };
        var decide = new NodeDefinition { Label = "Duyệt?",     NodeType = NodeType.Decision, X = 390, Y = 150 };
        var task2  = new NodeDefinition { Label = "Phê duyệt",  NodeType = NodeType.Task,     X = 560, Y = 80  };
        var task3  = new NodeDefinition { Label = "Từ chối",    NodeType = NodeType.Task,     X = 560, Y = 220 };
        var end    = new NodeDefinition { Label = "Kết thúc",   NodeType = NodeType.End,      X = 730, Y = 150 };

        return new WorkflowDefinition
        {
            Name         = name,
            TemplateType = type,
            Nodes        = [start, task1, decide, task2, task3, end],
            Connections  =
            [
                new() { SourceNodeId = start.Id,  TargetNodeId = task1.Id  },
                new() { SourceNodeId = task1.Id,  TargetNodeId = decide.Id },
                new() { SourceNodeId = decide.Id, TargetNodeId = task2.Id, Condition = "yes", Label = "Đồng ý"  },
                new() { SourceNodeId = decide.Id, TargetNodeId = task3.Id, Condition = "no",  Label = "Từ chối" },
                new() { SourceNodeId = task2.Id,  TargetNodeId = end.Id   },
                new() { SourceNodeId = task3.Id,  TargetNodeId = end.Id   }
            ]
        };
    }
}
