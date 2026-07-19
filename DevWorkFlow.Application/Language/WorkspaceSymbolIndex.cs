using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Thread-safe workspace symbol index.
/// Được cập nhật incremental khi document mở / reload / close.
/// </summary>
public sealed class WorkspaceSymbolIndex : IWorkspaceSymbolIndex
{
    private readonly Dictionary<ErpDocumentId, List<WorkspaceSymbolEntry>> _byDocument = new();
    private readonly object _gate = new();

    // ── Mutation (internal — chỉ ErpLanguageService gọi) ──────────────────

    /// <summary>Index / cập nhật toàn bộ symbol của một document.</summary>
    internal void IndexDocument(
        ErpDocumentId document_id,
        string document_path,
        IErpSemanticModel semantic)
    {
        var entries = semantic.Symbols
            .Select(symbol => new WorkspaceSymbolEntry(symbol, document_id, document_path))
            .ToList();

        lock (_gate)
            _byDocument[document_id] = entries;
    }

    /// <summary>Xóa symbol của document khỏi index khi close.</summary>
    internal void RemoveDocument(ErpDocumentId document_id)
    {
        lock (_gate)
            _byDocument.Remove(document_id);
    }

    // ── IWorkspaceSymbolIndex ──────────────────────────────────────────────

    /// <inheritdoc/>
    public IReadOnlyList<WorkspaceSymbolEntry> Search(
        string query,
        ErpSymbolKind? kind = null,
        int max_results = 50)
    {
        if (string.IsNullOrWhiteSpace(query)) return [];
        // "&ClientDefault;", "ClientDefault" và "Default" (giá trị resolve) đều phải tìm
        // ra cùng một Symbol — chuẩn hoá cú pháp reference trước khi so khớp.
        var query_text = query.Trim().TrimStart('&', '%').TrimEnd(';');
        if (query_text.Length == 0) return [];

        lock (_gate)
        {
            return _byDocument.Values
                .SelectMany(e => e)
                .Where(entry =>
                    (kind is null || entry.Symbol.Kind == kind)
                    && MatchesQuery(entry.Symbol, query_text))
                .Take(max_results)
                .ToList();
        }
    }

    /// <inheritdoc/>
    public SourceLocation? GetDefinition(string symbol_id)
    {
        if (string.IsNullOrWhiteSpace(symbol_id)) return null;

        lock (_gate)
        {
            foreach (var entries in _byDocument.Values)
            {
                var entry = entries.FirstOrDefault(e =>
                    e.Symbol.Id.Equals(symbol_id, StringComparison.OrdinalIgnoreCase));

                if (entry is not null)
                {
                    var loc = entry.Symbol.Definition;
                    return (loc is null || ReferenceEquals(loc, SourceLocation.None)) ? null : loc;
                }
            }
        }

        return null;
    }

    /// <inheritdoc/>
    public IReadOnlyList<SymbolReference> FindReferences(string symbol_id)
    {
        if (string.IsNullOrWhiteSpace(symbol_id)) return [];

        lock (_gate)
        {
            foreach (var entries in _byDocument.Values)
            {
                var entry = entries.FirstOrDefault(e =>
                    e.Symbol.Id.Equals(symbol_id, StringComparison.OrdinalIgnoreCase));

                if (entry?.Symbol is EntitySymbol entity)
                    return entity.References;
            }
        }

        return [];
    }

    /// <inheritdoc/>
    public IReadOnlyList<WorkspaceSymbolEntry> GetDocumentSymbols(ErpDocumentId document_id)
    {
        lock (_gate)
            return _byDocument.TryGetValue(document_id, out var entries)
                ? entries.AsReadOnly()
                : [];
    }

    // ── Helpers ───────────────────────────────────────────────────────────

    private static bool MatchesQuery(ErpSymbol symbol, string query) =>
        symbol.Name.Contains(query, StringComparison.OrdinalIgnoreCase) ||
        symbol.DisplayName.Contains(query, StringComparison.OrdinalIgnoreCase) ||
        (symbol is EntitySymbol entity
         && entity.DisplayText.Contains(query, StringComparison.OrdinalIgnoreCase));
}
