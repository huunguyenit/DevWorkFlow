namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Identity ổn định của node trong Document Model (vòng đời document).
/// Tạo deterministic từ khóa ổn định (symbol id / section key) — không random mỗi lần parse.
/// </summary>
public readonly record struct NodeId(Guid Value) : IEquatable<NodeId>
{
    public static NodeId Empty { get; } = new(Guid.Empty);

    public bool IsEmpty => Value == Guid.Empty;

    public static NodeId New() => new(Guid.NewGuid());

    /// <summary>UUID v3-style từ khóa ổn định (document + symbol/section).</summary>
    public static NodeId FromStableKey(string key)
    {
        if (string.IsNullOrWhiteSpace(key))
            return Empty;

        var bytes = System.Security.Cryptography.MD5.HashData(
            System.Text.Encoding.UTF8.GetBytes(key));
        // RFC 4122 version/variant bits
        bytes[6] = (byte)((bytes[6] & 0x0F) | 0x30);
        bytes[8] = (byte)((bytes[8] & 0x3F) | 0x80);
        return new NodeId(new Guid(bytes));
    }

    public override string ToString() => Value.ToString("N");
}
