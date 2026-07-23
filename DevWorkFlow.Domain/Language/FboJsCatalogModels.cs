namespace DevWorkFlow.Domain.Language;

/// <summary>Loại thành viên trong catalog JS FBO.</summary>
public enum FboJsMemberKind
{
    Method = 0,
    Property = 1,

    /// <summary>Hàm global — gọi không cần receiver.</summary>
    Function = 2
}

/// <summary>Một tham số của method/function trong catalog.</summary>
public sealed class FboJsParamInfo
{
    public required string Name { get; init; }

    public string Summary { get; init; } = string.Empty;
}

/// <summary>Một member (method/property) hoặc global function.</summary>
public sealed class FboJsMemberInfo
{
    public required string Name { get; init; }

    public required FboJsMemberKind Kind { get; init; }

    /// <summary>Chuỗi hiển thị cho Signature Help, ví dụ <c>getItemValue(field)</c>.</summary>
    public string Signature { get; init; } = string.Empty;

    /// <summary>Mô tả ngắn (hover + completion detail).</summary>
    public string Summary { get; init; } = string.Empty;

    /// <summary>Tác dụng / side-effect (hover); có thể trống.</summary>
    public string Effect { get; init; } = string.Empty;

    public IReadOnlyList<FboJsParamInfo> Params { get; init; } = [];
}

/// <summary>Một "type" trong catalog — tập member dùng chung, truy cập qua alias.</summary>
public sealed class FboJsTypeInfo
{
    public required string Id { get; init; }

    /// <summary>Identifier người dùng gõ để trỏ tới type này (vd <c>f</c>, <c>parentForm</c>).</summary>
    public IReadOnlyList<string> Aliases { get; init; } = [];

    public string Summary { get; init; } = string.Empty;

    public IReadOnlyList<FboJsMemberInfo> Members { get; init; } = [];
}

/// <summary>
/// Nội dung catalog đã parse từ <c>fbo-js.catalog.xml</c> — SoT mô tả API FBO cho
/// Completion/Hover/Signature. UI KHÔNG được hard-code danh sách này.
/// </summary>
public sealed class FboJsCatalogData
{
    public int Version { get; init; }

    public IReadOnlyList<FboJsTypeInfo> Types { get; init; } = [];

    /// <summary>Hàm/biến global — gọi không cần receiver.</summary>
    public IReadOnlyList<FboJsMemberInfo> Globals { get; init; } = [];
}
