namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Một gợi ý completion — DTO editor-agnostic; UI map sang Monaco. Domain KHÔNG phụ thuộc
/// kiểu của Monaco.
/// </summary>
public sealed class FboJsCompletionItem
{
    public required string Label { get; init; }

    public required string InsertText { get; init; }

    /// <summary>"method" | "property" | "function" | "variable".</summary>
    public required string Kind { get; init; }

    /// <summary>Dòng phụ bên cạnh label (thường là signature).</summary>
    public string Detail { get; init; } = string.Empty;

    public string Documentation { get; init; } = string.Empty;
}

public sealed class FboJsCompletionList
{
    public static FboJsCompletionList Empty { get; } = new();

    public IReadOnlyList<FboJsCompletionItem> Items { get; init; } = [];
}

/// <summary>Nội dung hover lấy từ catalog (khác hover giá trị <c>g.$a</c> của Phase 3).</summary>
public sealed class FboJsHoverInfo
{
    public required string Title { get; init; }

    public required string Body { get; init; }
}

public sealed class FboJsSignatureParameter
{
    public required string Label { get; init; }

    public string Documentation { get; init; } = string.Empty;
}

public sealed class FboJsSignatureHelp
{
    public required string Label { get; init; }

    public string Documentation { get; init; } = string.Empty;

    public IReadOnlyList<FboJsSignatureParameter> Parameters { get; init; } = [];

    /// <summary>Chỉ số tham số đang gõ (đếm dấu phẩy ở depth 0 từ dấu <c>(</c> tới caret).</summary>
    public int ActiveParameter { get; init; }
}
