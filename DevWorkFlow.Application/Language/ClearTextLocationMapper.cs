using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Vị trí thật của một offset ClearText: file nào, offset nào trong file đó.
/// <see cref="IsCurrentDocument"/> = false nghĩa là nội dung đến từ entity khai báo ở file khác
/// (include/SYSTEM) — host phải mở file đó rồi mới đặt caret.
/// </summary>
public readonly record struct ResolvedTextLocation(
    string Path,
    int Offset,
    bool IsCurrentDocument,
    string EntityName)
{
    public static ResolvedTextLocation None { get; } = new(string.Empty, -1, true, string.Empty);

    public bool IsFound => Offset >= 0;
}

/// <summary>
/// Ánh xạ offset trên ClearText (entity đã expand) về vị trí NGUỒN THẬT.
///
/// Nội dung script FBO phần lớn đến từ entity include dùng chung, nên một hit tìm được trên
/// ClearText có thể nằm ở file khác. Navigation phải tới đúng file + đúng vị trí, dù nội dung
/// nằm ở đâu — đó là lý do lớp này tồn tại (xem Phase 3 §5.7).
///
/// Quy tắc:
/// - Offset nằm ngoài mọi expansion → vùng literal của chính document → dùng
///   <see cref="ClearTextOffsetMap.ToSource"/>.
/// - Offset nằm trong expansion của entity E → lấy segment SÂU NHẤT chứa offset (entity lồng
///   thắng entity cha, khớp với cái người dùng nhìn thấy), rồi:
///   - E là SYSTEM: nội dung chính là file → offset trong file = delta trong segment.
///   - E inline: nội dung là literal value trong khai báo → offset = ValueLocation.Start + delta.
/// </summary>
public static class ClearTextLocationMapper
{
    public static ResolvedTextLocation Resolve(
        int clear_text_offset,
        ErpDocumentProjection clear_text_projection,
        IErpSemanticModel model,
        string document_path)
    {
        if (clear_text_offset < 0) return ResolvedTextLocation.None;

        var segment = FindDeepestSegment(clear_text_projection.ClearTextSegments, clear_text_offset);
        if (segment is null)
        {
            var source_offset = clear_text_projection.OffsetMap.ToSource(clear_text_offset);
            return new ResolvedTextLocation(document_path, source_offset, true, string.Empty);
        }

        var entity = FindEntity(model, segment);
        var delta = clear_text_offset - segment.Span.StartOffset;
        if (delta < 0) delta = 0;

        // Entity SYSTEM đã resolve: nội dung expand CHÍNH LÀ nội dung file → offset ánh xạ 1-1.
        if (entity is { DeclarationKind: EntityDeclarationKind.ExternalSystem, IsResolved: true }
            && !string.IsNullOrWhiteSpace(entity.ResolvedPath))
        {
            return new ResolvedTextLocation(
                entity.ResolvedPath!,
                delta,
                IsCurrentDocument: PathsEqual(entity.ResolvedPath, document_path),
                segment.EntityName);
        }

        // Entity inline: nội dung nằm trong literal value của <!ENTITY X "…"> tại file khai báo
        // (có thể là file include khác chính document đang mở).
        if (entity is not null && !entity.ValueLocation.Span.IsEmpty)
        {
            var declaring_path = string.IsNullOrWhiteSpace(entity.ValueLocation.Path)
                ? document_path
                : entity.ValueLocation.Path;
            return new ResolvedTextLocation(
                declaring_path,
                entity.ValueLocation.Span.StartOffset + delta,
                PathsEqual(declaring_path, document_path),
                segment.EntityName);
        }

        // Không map được vào value → ít nhất đưa tới chỗ khai báo entity.
        if (!string.IsNullOrWhiteSpace(segment.DefinitionPath))
        {
            return new ResolvedTextLocation(
                segment.DefinitionPath,
                segment.DefinitionOffset,
                PathsEqual(segment.DefinitionPath, document_path),
                segment.EntityName);
        }

        return ResolvedTextLocation.None;
    }

    /// <summary>Segment sâu nhất chứa offset; null nếu offset thuộc vùng literal.</summary>
    private static ClearTextSegment? FindDeepestSegment(
        IReadOnlyList<ClearTextSegment> segments, int offset)
    {
        ClearTextSegment? found = null;
        foreach (var segment in segments)
        {
            var span = segment.Span;
            if (span.Length <= 0) continue;
            if (offset < span.StartOffset || offset >= span.StartOffset + span.Length) continue;
            if (found is null || segment.Depth > found.Depth)
                found = segment;
        }
        return found;
    }

    private static EntitySymbol? FindEntity(IErpSemanticModel model, ClearTextSegment segment)
    {
        if (!string.IsNullOrWhiteSpace(segment.SymbolId))
        {
            var by_id = model.Symbols.OfType<EntitySymbol>().FirstOrDefault(
                e => e.Id.Equals(segment.SymbolId, StringComparison.OrdinalIgnoreCase));
            if (by_id is not null) return by_id;
        }
        return model.FindEntity(segment.EntityName);
    }

    private static bool PathsEqual(string? left, string? right)
    {
        if (string.IsNullOrWhiteSpace(left) || string.IsNullOrWhiteSpace(right)) return false;
        try
        {
            return Path.GetFullPath(left).Equals(Path.GetFullPath(right), StringComparison.OrdinalIgnoreCase);
        }
        catch
        {
            return left.Equals(right, StringComparison.OrdinalIgnoreCase);
        }
    }
}
