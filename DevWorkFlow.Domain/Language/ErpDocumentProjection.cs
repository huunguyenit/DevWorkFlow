namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Storage projections chuyển tiếp cho Language Service adapters.
/// Editor mode chuẩn dùng <see cref="ErpEditorMode"/>.
/// </summary>
public enum ErpProjectionKind
{
    Source = 0,
    ClearText = 1,
    Semantic = 2
}

/// <summary>Entity segment chuyển tiếp; UI mới dùng <see cref="InsightItem"/>.</summary>
public sealed class EntityProjectionSegment
{
    public string SymbolId { get; init; } = string.Empty;

    public string Name { get; init; } = string.Empty;

    public string DisplayText { get; init; } = string.Empty;

    /// <summary>Span của reference trong Source projection.</summary>
    public SourceSpan SourceSpan { get; init; }

    public bool CanEdit { get; init; }
}

/// <summary>Nguồn khai báo của đoạn text đã expand trong ClearText projection.</summary>
public enum ClearTextSegmentKind
{
    /// <summary>&lt;!ENTITY X "..."&gt; — khai báo inline trong DOCTYPE.</summary>
    Inline = 0,

    /// <summary>&lt;!ENTITY X SYSTEM "file"&gt; — nội dung đến từ file ngoài.</summary>
    System = 1
}

/// <summary>
/// Một đoạn text trong ClearText projection có nguồn gốc từ entity — Insight mode tô màu
/// theo <see cref="Kind"/> (inline vs system) và <see cref="Depth"/> (entity chính vs lồng).
/// Span luôn tính trên ClearText, KHÔNG phải trên source XML.
/// Segment lồng nhau: span con luôn nằm trọn trong span cha, depth cha + 1.
/// </summary>
public sealed class ClearTextSegment
{
    public string SymbolId { get; init; } = string.Empty;

    public string EntityName { get; init; } = string.Empty;

    /// <summary>Span trong ClearText projection.</summary>
    public SourceSpan Span { get; init; }

    /// <summary>0 = entity được tham chiếu trực tiếp trong body; &gt; 0 = entity lồng bên trong.</summary>
    public int Depth { get; init; }

    public ClearTextSegmentKind Kind { get; init; }

    /// <summary>File chứa khai báo &lt;!ENTITY&gt; — dùng cho Ctrl+Click.</summary>
    public string DefinitionPath { get; init; } = string.Empty;

    /// <summary>Offset của khai báo trong <see cref="DefinitionPath"/>.</summary>
    public int DefinitionOffset { get; init; }

    /// <summary>Entity SYSTEM: file cần mở ra tab mới. Rỗng với entity inline.</summary>
    public string OpenPath { get; init; } = string.Empty;

    /// <summary>Entity không resolve được (thiếu file / chu kỳ) — text giữ nguyên "&amp;X;".</summary>
    public bool IsError { get; init; }
}

/// <summary>
/// Một vùng liên tục của source và vùng tương ứng của nó trong ClearText.
/// Vùng literal (<see cref="IsExpansion"/> = false) được copy 1:1 nên offset ánh xạ tuyến
/// tính; vùng expansion ("&amp;X;" → nội dung entity) có độ dài hai bên khác nhau nên offset
/// bên trong nó không có ảnh xạ 1-1 — được snap về đầu vùng.
/// </summary>
public readonly record struct ClearTextOffsetRegion(
    int SourceOffset,
    int SourceLength,
    int ClearTextOffset,
    int ClearTextLength,
    bool IsExpansion);

/// <summary>
/// Bảng ánh xạ offset Source ↔ ClearText cho Insight mode.
/// Navigation toàn hệ thống tính offset trên source XML (NodeId/SymbolId → TextRange), nhưng
/// buffer hiển thị ở Insight mode là ClearText — mọi offset sau tham chiếu entity đầu tiên đã
/// bị dịch. Không có bảng này thì Outline nhảy sai chỗ.
/// Regions phải nối tiếp nhau, phủ kín source, sắp theo <see cref="ClearTextOffsetRegion.SourceOffset"/>.
/// Map rỗng = ánh xạ đồng nhất (document không có entity nào được expand).
/// </summary>
public sealed class ClearTextOffsetMap
{
    public static readonly ClearTextOffsetMap Identity = new([]);

    private readonly IReadOnlyList<ClearTextOffsetRegion> _regions;

    public ClearTextOffsetMap(IReadOnlyList<ClearTextOffsetRegion> regions) => _regions = regions;

    public IReadOnlyList<ClearTextOffsetRegion> Regions => _regions;

    /// <summary>Offset trên source XML → offset tương ứng trên ClearText.</summary>
    public int ToClearText(int source_offset)
    {
        if (source_offset < 0 || _regions.Count == 0) return source_offset;

        var index = FindRegion(source_offset, static r => r.SourceOffset);
        if (index < 0) return source_offset;

        var region = _regions[index];
        return region.IsExpansion
            ? region.ClearTextOffset
            : region.ClearTextOffset + (source_offset - region.SourceOffset);
    }

    /// <summary>Offset trên ClearText → offset tương ứng trên source XML.</summary>
    public int ToSource(int clear_text_offset)
    {
        if (clear_text_offset < 0 || _regions.Count == 0) return clear_text_offset;

        var index = FindRegion(clear_text_offset, static r => r.ClearTextOffset);
        if (index < 0) return clear_text_offset;

        var region = _regions[index];
        return region.IsExpansion
            ? region.SourceOffset
            : region.SourceOffset + (clear_text_offset - region.ClearTextOffset);
    }

    /// <summary>
    /// Region cuối cùng có start &lt;= offset; -1 nếu offset nằm trước region đầu.
    /// Offset ngay sau region cuối (vị trí cuối document) trả về chính region cuối — ánh xạ
    /// tuyến tính từ đó vẫn đúng vì region cuối luôn là literal (phần đuôi sau entity cuối).
    /// </summary>
    private int FindRegion(int offset, Func<ClearTextOffsetRegion, int> start_of)
    {
        var low = 0;
        var high = _regions.Count - 1;
        var found = -1;
        while (low <= high)
        {
            var mid = low + ((high - low) / 2);
            if (start_of(_regions[mid]) <= offset)
            {
                found = mid;
                low = mid + 1;
            }
            else
            {
                high = mid - 1;
            }
        }

        return found;
    }
}

/// <summary>
/// Projection hiển thị; SourceText luôn là storage gốc, Text tùy theo mode.
/// </summary>
public sealed class ErpDocumentProjection
{
    public ErpProjectionKind Kind { get; init; }

    public string Text { get; init; } = string.Empty;

    public IReadOnlyList<EntityProjectionSegment> EntitySegments { get; init; } = [];

    /// <summary>Chỉ có với <see cref="ErpProjectionKind.ClearText"/>; span tính trên <see cref="Text"/>.</summary>
    public IReadOnlyList<ClearTextSegment> ClearTextSegments { get; init; } = [];

    /// <summary>
    /// Ánh xạ offset Source ↔ <see cref="Text"/>. Chỉ có nghĩa với
    /// <see cref="ErpProjectionKind.ClearText"/>; các kind khác giữ
    /// <see cref="ClearTextOffsetMap.Identity"/> vì Text chính là source.
    /// </summary>
    public ClearTextOffsetMap OffsetMap { get; init; } = ClearTextOffsetMap.Identity;
}

/// <summary>Kết quả semantic edit entity.</summary>
public sealed class EntityEditResult
{
    public bool Success { get; init; }

    public string? Error { get; init; }

    public IErpDocument? Document { get; init; }
}

/// <summary>Yêu cầu inline edit gửi từ semantic entity control.</summary>
public sealed class EntityValueEdit
{
    public string EntityName { get; init; } = string.Empty;

    public string NewValue { get; init; } = string.Empty;
}
