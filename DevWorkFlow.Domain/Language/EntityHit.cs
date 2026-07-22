namespace DevWorkFlow.Domain.Language;

/// <summary>Loại vùng entity mà một offset (source XML) trúng vào.</summary>
public enum EntityHitKind
{
    /// <summary>Tham chiếu <c>&amp;Name;</c> trong body.</summary>
    Reference = 0,

    /// <summary>Thân khai báo <c>&lt;!ENTITY Name …&gt;</c>.</summary>
    Declaration = 1,

    /// <summary>Chuỗi path trong <c>SYSTEM "…"</c> của khai báo external.</summary>
    SystemLiteral = 2
}

/// <summary>
/// Kết quả hit-test entity tại một offset source (SoT cho Ctrl+Click / hover ở Source mode).
/// DTO thuần — không giữ tham chiếu graph; map thẳng sang <c>EntityNavigationRequest</c>.
/// </summary>
public sealed class EntityHit
{
    public required string EntityName { get; init; }

    public required string SymbolId { get; init; }

    public EntityHitKind HitKind { get; init; }

    /// <summary>File chứa khai báo <c>&lt;!ENTITY&gt;</c>.</summary>
    public string DefinitionPath { get; init; } = string.Empty;

    /// <summary>Offset khai báo trong <see cref="DefinitionPath"/>; -1 nếu không xác định.</summary>
    public int DefinitionOffset { get; init; } = -1;

    /// <summary>Entity SYSTEM: file nội dung cần mở. Rỗng với entity inline.</summary>
    public string OpenPath { get; init; } = string.Empty;

    /// <summary>Giá trị cho hover: ưu tiên <c>DisplayText</c>, fallback <c>RawValue</c>.</summary>
    public string DisplayText { get; init; } = string.Empty;

    /// <summary>Entity external không resolve được (thiếu file / lỗi đọc).</summary>
    public bool IsError { get; init; }
}
