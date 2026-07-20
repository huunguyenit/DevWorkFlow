namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Node trong Document Model — identity + vị trí (parser cập nhật position khi document đổi).
/// </summary>
public sealed class DocumentNode
{
    public required NodeId Id { get; init; }

    public NodeId ParentId { get; init; } = NodeId.Empty;

    /// <summary>Controller / Field / View / Command / ScriptFunction / Section / …</summary>
    public required string NodeType { get; init; }

    public int StartOffset { get; init; }

    public int EndOffset { get; init; }

    public int StartLine { get; init; }

    public int EndLine { get; init; }

    /// <summary>Liên kết ErpSymbol.Id nếu node gắn symbol.</summary>
    public string? SymbolId { get; init; }

    public string DisplayName { get; init; } = string.Empty;

    /// <summary>
    /// URI document chứa TextRange (entity external). Null = dùng DocumentModel.DocumentUri.
    /// </summary>
    public string? DocumentUri { get; init; }

    /// <summary>
    /// true = Editor chỉ đặt caret, không Select (tránh treo trên dòng CDATA/script dài).
    /// </summary>
    public bool PreferCaretOnly { get; init; }

    /// <summary>
    /// true = <see cref="StartOffset"/>/<see cref="EndOffset"/> tính trên buffer ClearText
    /// (Insight map), KHÔNG phải source XML. Editor không map lại qua ClearTextOffsetMap khi
    /// điều hướng — offset đã khớp buffer Insight đang hiển thị. false (mặc định) = offset source.
    /// </summary>
    public bool UsesClearTextOffsets { get; init; }

    public IReadOnlyList<DocumentNode> Children { get; init; } = [];

    public TextRange TextRange => new(StartOffset, EndOffset);
}
