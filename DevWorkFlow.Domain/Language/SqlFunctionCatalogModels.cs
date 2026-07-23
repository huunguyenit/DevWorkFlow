namespace DevWorkFlow.Domain.Language;

/// <summary>Một tham số của hàm SQL trong catalog.</summary>
public sealed class SqlFunctionParamInfo
{
    public required string Name { get; init; }

    public string Summary { get; init; } = string.Empty;
}

/// <summary>
/// Một hàm SQL mô tả trong <c>sql-functions.xml</c> — dùng cho Hover trong island SQL và trong
/// tab SQL. Tên hàm tra KHÔNG phân biệt hoa/thường (T-SQL không phân biệt), khác JS catalog.
/// </summary>
public sealed class SqlFunctionInfo
{
    /// <summary>Tên hàm không kèm schema, ví dụ <c>ff_InList</c>.</summary>
    public required string Name { get; init; }

    /// <summary>Schema khai báo (thường <c>dbo</c>); rỗng với hàm dựng sẵn của T-SQL.</summary>
    public string Schema { get; init; } = string.Empty;

    /// <summary>Nhóm chứa hàm (id của <c>group</c>) — hiển thị ở dòng cuối hover.</summary>
    public string Group { get; init; } = string.Empty;

    /// <summary>Chuỗi hiển thị làm tiêu đề hover, ví dụ <c>dbo.ff_InList(value, list)</c>.</summary>
    public string Signature { get; init; } = string.Empty;

    /// <summary>Mô tả ngắn.</summary>
    public string Summary { get; init; } = string.Empty;

    /// <summary>Giá trị trả về (kiểu + ý nghĩa); có thể trống.</summary>
    public string Returns { get; init; } = string.Empty;

    /// <summary>Lưu ý khi dùng (hiệu năng, NULL, sargability…); có thể trống.</summary>
    public string Remarks { get; init; } = string.Empty;

    /// <summary>Ví dụ dùng thật; có thể trống.</summary>
    public string Example { get; init; } = string.Empty;

    public IReadOnlyList<SqlFunctionParamInfo> Params { get; init; } = [];

    /// <summary>Tên đầy đủ để hiển thị: <c>schema.name</c> nếu có schema.</summary>
    public string QualifiedName =>
        string.IsNullOrWhiteSpace(Schema) ? Name : $"{Schema}.{Name}";
}

/// <summary>Từ khoá T-SQL khai báo trong catalog — nguồn cho Completion (không hard-code ở UI).</summary>
public sealed class SqlKeywordInfo
{
    public required string Name { get; init; }

    /// <summary>Chuỗi chèn khi chọn; rỗng thì chèn <see cref="Name"/>.</summary>
    public string InsertText { get; init; } = string.Empty;

    public string Summary { get; init; } = string.Empty;
}

/// <summary>Nhóm hàm (FBO / T-SQL / dự án…) — chỉ để gom nhóm và ghi nguồn.</summary>
public sealed class SqlFunctionGroupInfo
{
    public required string Id { get; init; }

    public string Summary { get; init; } = string.Empty;

    public IReadOnlyList<SqlFunctionInfo> Functions { get; init; } = [];
}

/// <summary>
/// Nội dung <c>sql-functions.xml</c> đã parse — SoT mô tả hàm SQL cho Hover.
/// UI KHÔNG được hard-code danh sách này (cùng nguyên tắc với catalog JS).
/// </summary>
public sealed class SqlFunctionCatalogData
{
    public int Version { get; init; }

    public IReadOnlyList<SqlFunctionGroupInfo> Groups { get; init; } = [];

    public IReadOnlyList<SqlKeywordInfo> Keywords { get; init; } = [];
}

/// <summary>Loại mục gợi ý SQL — map sang CompletionItemKind của Monaco ở lớp UI.</summary>
public enum SqlCompletionKind
{
    Function = 0,
    Procedure = 1,
    Keyword = 2
}

/// <summary>Một mục Completion SQL.</summary>
public sealed class SqlCompletionItem
{
    public required string Label { get; init; }

    public required string InsertText { get; init; }

    public SqlCompletionKind Kind { get; init; }

    public string Detail { get; init; } = string.Empty;

    public string Documentation { get; init; } = string.Empty;
}

public sealed class SqlCompletionList
{
    public static SqlCompletionList Empty { get; } = new();

    public IReadOnlyList<SqlCompletionItem> Items { get; init; } = [];
}

/// <summary>Nội dung hover cho một hàm SQL (tiêu đề + thân), đã dựng sẵn cho editor.</summary>
public sealed class SqlHoverInfo
{
    public required string Title { get; init; }

    public string Body { get; init; } = string.Empty;
}
