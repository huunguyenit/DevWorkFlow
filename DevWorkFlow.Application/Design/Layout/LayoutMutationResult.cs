namespace DevWorkFlow.Application.Design.Layout;

/// <summary>Kết quả một thao tác Layout Engine — thất bại KHÔNG mutate model.</summary>
public sealed class LayoutMutationResult
{
    public bool Ok { get; init; }
    public string? Error { get; init; }

    public static LayoutMutationResult Success() => new() { Ok = true };
    public static LayoutMutationResult Fail(string error) => new() { Ok = false, Error = error };
}
