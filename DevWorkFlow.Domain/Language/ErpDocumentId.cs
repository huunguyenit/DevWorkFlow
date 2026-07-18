namespace DevWorkFlow.Domain.Language;

/// <summary>Định danh document trong workspace.</summary>
public readonly record struct ErpDocumentId(string Value)
{
    public static ErpDocumentId FromPath(string path) =>
        new(string.IsNullOrWhiteSpace(path)
            ? $"buffer:{Guid.NewGuid():N}"
            : path.Trim());

    public override string ToString() => Value;

    public bool Equals(ErpDocumentId other) =>
        string.Equals(Value, other.Value, StringComparison.OrdinalIgnoreCase);

    public override int GetHashCode() =>
        StringComparer.OrdinalIgnoreCase.GetHashCode(Value);
}
