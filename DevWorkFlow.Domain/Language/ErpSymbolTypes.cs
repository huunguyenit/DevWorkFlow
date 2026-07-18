namespace DevWorkFlow.Domain.Language;

/// <summary>Controller (Dir / Filter / Grid / Lookup / Report / …).</summary>
public sealed class ControllerSymbol : ErpSymbol
{
    public ControllerSymbol() => Kind = ErpSymbolKind.Controller;

    /// <summary>Folder nguồn (Dir, Filter, Grid, …) — chuỗi ổn định.</summary>
    public string FolderKind { get; init; } = string.Empty;

    public string? Table { get; init; }

    public string? CodeField { get; init; }
}

/// <summary>Field trên form/grid/lookup.</summary>
public sealed class FieldSymbol : ErpSymbol
{
    public FieldSymbol() => Kind = ErpSymbolKind.Field;

    public string? DataType { get; init; }

    public string HeaderV { get; init; } = string.Empty;

    public string HeaderE { get; init; } = string.Empty;

    public int? CategoryIndex { get; init; }

    public bool IsPrimaryKey { get; init; }

    public bool IsRequired { get; init; }

    public bool AllowNulls { get; init; } = true;
}

/// <summary>View layout (views/view).</summary>
public sealed class ViewSymbol : ErpSymbol
{
    public ViewSymbol() => Kind = ErpSymbolKind.View;

    public string? ViewId { get; init; }
}

/// <summary>Command SQL trong controller.</summary>
public sealed class CommandSymbol : ErpSymbol
{
    public CommandSymbol() => Kind = ErpSymbolKind.Command;

    public string? EventName { get; init; }
}

/// <summary>Query SQL trong controller.</summary>
public sealed class QuerySymbol : ErpSymbol
{
    public QuerySymbol() => Kind = ErpSymbolKind.Query;

    public string? EventName { get; init; }
}

/// <summary>Hàm JavaScript trong &lt;script&gt;.</summary>
public sealed class ScriptFunctionSymbol : ErpSymbol
{
    public ScriptFunctionSymbol() => Kind = ErpSymbolKind.ScriptFunction;
}

/// <summary>Response / action trong controller.</summary>
public sealed class ResponseActionSymbol : ErpSymbol
{
    public ResponseActionSymbol() => Kind = ErpSymbolKind.ResponseAction;
}

/// <summary>
/// Entity DTD là Symbol — không phải string map.
/// Binder tạo definition/reference graph và resolved value.
/// </summary>
public sealed class EntitySymbol : ErpSymbol
{
    public EntitySymbol() => Kind = ErpSymbolKind.Entity;

    /// <summary>Giá trị hiển thị sau khi resolve nested entity.</summary>
    public string DisplayText { get; init; } = string.Empty;

    /// <summary>Giá trị khai báo chưa expand; external entity là nội dung file.</summary>
    public string? RawValue { get; init; }

    public EntityDeclarationKind DeclarationKind { get; init; }

    public string? SystemId { get; init; }

    /// <summary>Đường dẫn external entity đã resolve.</summary>
    public string? ResolvedPath { get; init; }

    public bool IsResolved { get; init; }

    /// <summary>Span chỉ chứa value, phục vụ semantic inline edit.</summary>
    public SourceLocation ValueLocation { get; init; } = SourceLocation.None;

    public ErpDocumentId? ResolvedDocumentId { get; init; }

    public IReadOnlyList<SymbolReference> References { get; init; } = [];

    /// <summary>Entity con được tham chiếu trực tiếp trong RawValue; không flatten.</summary>
    public IReadOnlyList<string> ChildEntityIds { get; init; } = [];

    public IReadOnlyList<ErpDiagnostic> Diagnostics { get; init; } = [];

    public IReadOnlyDictionary<string, string> Metadata { get; init; } =
        new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
}

/// <summary>Loại khai báo DTD entity.</summary>
public enum EntityDeclarationKind
{
    Inline = 0,
    ExternalSystem = 1,
    Parameter = 2
}
