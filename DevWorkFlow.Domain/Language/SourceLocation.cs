namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Khoảng vị trí trong source (0-based offset; line 1-based khi biết).
/// </summary>
public readonly record struct SourceSpan(int StartOffset, int Length)
{
    /// <summary>Offset kết thúc (exclusive).</summary>
    public int EndOffset => StartOffset + Length;

    public static SourceSpan Empty { get; } = new(0, 0);

    public bool IsEmpty => Length <= 0;
}

/// <summary>
/// Vị trí nguồn gắn với file trong workspace.
/// </summary>
public sealed class SourceLocation
{
    /// <summary>Đường dẫn file (có thể rỗng với buffer ảo).</summary>
    public string Path { get; init; } = string.Empty;

    /// <summary>Span trong raw storage text.</summary>
    public SourceSpan Span { get; init; }

    /// <summary>Số dòng 1-based; 0 nếu chưa biết.</summary>
    public int Line { get; init; }

    /// <summary>Cột 1-based; 0 nếu chưa biết.</summary>
    public int Column { get; init; }

    public static SourceLocation None { get; } = new();

    public override string ToString() =>
        string.IsNullOrWhiteSpace(Path)
            ? $"({Line},{Column})"
            : $"{Path}({Line},{Column})";
}
