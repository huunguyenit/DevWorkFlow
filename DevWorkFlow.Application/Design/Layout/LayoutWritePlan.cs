namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Một entity cần ghi lại nội dung mới sau layout mutation (hướng 2 — write-back entity file,
/// KHÔNG inline ClearText vào Dir). Persist qua <c>ErpLanguageService.UpdateEntityValue</c>:
/// SYSTEM → ghi file <see cref="ResolvedPath"/>; inline trong Include → splice ValueLocation.
/// </summary>
public sealed class ViewLayoutEntityWrite
{
    public required string EntityName { get; init; }

    /// <summary>Nội dung entity mới (toàn bộ value/file content, chỉ đổi item/attr đã mutate).</summary>
    public required string NewContent { get; init; }

    /// <summary>Path file entity SYSTEM (hiển thị StatusMessage); null với entity inline Include.</summary>
    public string? ResolvedPath { get; init; }
}

/// <summary>
/// Kế hoạch ghi một layout mutation trên Dir có view lắp từ entity:
/// phần literal patch thẳng vào Dir XML, phần entity ghi về đúng file entity.
/// </summary>
public sealed class LayoutWritePlan
{
    /// <summary>Dir XML sau khi patch item/category literal; null nếu Dir không đổi.</summary>
    public string? DirXml { get; init; }

    public IReadOnlyList<ViewLayoutEntityWrite> EntityWrites { get; init; } = [];

    public bool HasChanges => DirXml is not null || EntityWrites.Count > 0;
}

/// <summary>Kết quả build plan — Fail kèm reason rõ để StatusMessage + rollback model.</summary>
public sealed class LayoutWritePlanResult
{
    public bool Ok { get; private init; }

    public string? Reason { get; private init; }

    public LayoutWritePlan? Plan { get; private init; }

    public static LayoutWritePlanResult Success(LayoutWritePlan plan) => new() { Ok = true, Plan = plan };

    public static LayoutWritePlanResult Fail(string reason) => new() { Ok = false, Reason = reason };
}
