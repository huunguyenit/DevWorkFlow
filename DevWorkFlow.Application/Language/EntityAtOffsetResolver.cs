using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Hit-test offset (source XML) → <see cref="EntityHit"/>. SoT cho Ctrl+Click / hover entity ở
/// Source mode: KHÔNG parse XML — chỉ tra span đã bind sẵn trên <see cref="EntitySymbol"/> graph
/// (Definition span phủ trọn thẻ <c>&lt;!ENTITY …&gt;</c>; mỗi Reference span phủ một <c>&amp;X;</c>).
/// Trúng nhiều span thì lấy span hẹp nhất (reference thắng declaration khi chồng lấn bất thường).
///
/// QUAN TRỌNG — lọc theo <paramref name="document_path"/>: reference/khai báo nằm trong file
/// include mang offset THEO FILE ĐÓ (base_offset=0, Path=include). Nếu không lọc, offset của
/// document đang xem trùng số với span include sẽ match nhầm (bug: hover dòng trắng ra entity lạ).
/// Chỉ hit-test span có Path trùng document đang xem.
/// </summary>
public static class EntityAtOffsetResolver
{
    public static EntityHit? TryResolve(IErpSemanticModel model, int offset, string document_path)
    {
        if (model is null || offset < 0) return null;

        EntityHit? best = null;
        var best_len = int.MaxValue;

        foreach (var entity in model.GetEntities())
        {
            foreach (var reference in entity.References)
            {
                if (!PathsEqual(reference.Location.Path, document_path)) continue;
                var span = reference.Location.Span;
                if (Contains(span, offset) && span.Length < best_len)
                {
                    best = ToHit(entity, EntityHitKind.Reference);
                    best_len = span.Length;
                }
            }

            if (!PathsEqual(entity.Definition.Path, document_path)) continue;
            var def = entity.Definition.Span;
            if (Contains(def, offset) && def.Length < best_len)
            {
                var kind = entity.DeclarationKind == EntityDeclarationKind.ExternalSystem
                           && Contains(entity.ValueLocation.Span, offset)
                    ? EntityHitKind.SystemLiteral
                    : EntityHitKind.Declaration;
                best = ToHit(entity, kind);
                best_len = def.Length;
            }
        }

        return best;
    }

    private static bool Contains(SourceSpan span, int offset)
        => span.Length > 0 && offset >= span.StartOffset && offset < span.EndOffset;

    /// <summary>So khớp path (full-path, case-insensitive). Rỗng ↔ rỗng = true (buffer ảo).</summary>
    private static bool PathsEqual(string? left, string? right)
    {
        var l = left ?? string.Empty;
        var r = right ?? string.Empty;
        if (l.Length == 0 && r.Length == 0) return true;
        if (l.Length == 0 || r.Length == 0) return false;
        try
        {
            return Path.GetFullPath(l).Equals(Path.GetFullPath(r), StringComparison.OrdinalIgnoreCase);
        }
        catch
        {
            return l.Equals(r, StringComparison.OrdinalIgnoreCase);
        }
    }

    private static EntityHit ToHit(EntitySymbol entity, EntityHitKind kind) => new()
    {
        EntityName = entity.Name,
        SymbolId = entity.Id,
        HitKind = kind,
        DefinitionPath = entity.Definition.Path,
        DefinitionOffset = entity.Definition.Span.StartOffset,
        OpenPath = entity.DeclarationKind == EntityDeclarationKind.ExternalSystem
            ? entity.ResolvedPath ?? string.Empty
            : string.Empty,
        DisplayText = !string.IsNullOrEmpty(entity.DisplayText)
            ? entity.DisplayText
            : entity.RawValue ?? string.Empty,
        IsError = !entity.IsResolved
                  && entity.DeclarationKind == EntityDeclarationKind.ExternalSystem
    };
}
