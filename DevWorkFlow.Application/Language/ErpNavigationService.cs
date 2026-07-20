using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// ERP Navigation Service — điều hướng qua NodeId / Symbol trên Navigation Map.
/// </summary>
public sealed class ErpNavigationService : IErpNavigationService
{
    private readonly Func<ErpDocumentId, IErpDocument?> _get_document;
    private readonly Dictionary<ErpDocumentId, INavigationMap> _maps = new();
    private readonly Dictionary<ErpDocumentId, INavigationMap> _insight_maps = new();

    public ErpNavigationService(Func<ErpDocumentId, IErpDocument?> get_document)
    {
        _get_document = get_document;
    }

    public void Rebuild(IErpDocument document)
    {
        var map = NavigationMapBuilder.Build(document);
        _maps[document.Id] = map;
        // ClearText đổi cùng lúc reparse → bỏ cache Insight, dựng lại lazy khi Outline cần.
        _insight_maps.Remove(document.Id);
        if (document is ErpDocument mutable)
            mutable.SetNavigationMap(map);
    }

    public void Remove(ErpDocumentId document_id)
    {
        _maps.Remove(document_id);
        _insight_maps.Remove(document_id);
    }

    public INavigationMap? GetMap(ErpDocumentId document_id)
    {
        if (_maps.TryGetValue(document_id, out var map))
            return map;

        var doc = _get_document(document_id);
        if (doc is null) return null;
        Rebuild(doc);
        return _maps.GetValueOrDefault(document_id);
    }

    public INavigationMap? GetInsightMap(ErpDocumentId document_id)
    {
        if (_insight_maps.TryGetValue(document_id, out var map))
            return map;

        var doc = _get_document(document_id);
        if (doc is null) return null;

        var built = NavigationMapBuilder.BuildInsight(doc);
        _insight_maps[document_id] = built;
        return built;
    }

    // Node của Outline có thể thuộc source map hoặc insight map (NodeId prefix khác nhau, không
    // trùng). Thử source trước; miss → thử insight (Outline Insight mode).
    public NavigationTarget? GoToNode(ErpDocumentId document_id, NodeId node_id) =>
        GetMap(document_id)?.ToTarget(node_id)
        ?? GetInsightMap(document_id)?.ToTarget(node_id);

    public NavigationTarget? GoToDefinition(ErpDocumentId document_id, string symbol_id) =>
        GetMap(document_id)?.ToTargetBySymbolId(symbol_id);

    public IReadOnlyList<NavigationTarget> FindReferences(ErpDocumentId document_id, string symbol_id)
    {
        var doc = _get_document(document_id);
        if (doc is null || string.IsNullOrWhiteSpace(symbol_id))
            return [];

        var map = GetMap(document_id);
        if (map is null) return [];

        var symbol = FindSymbol(document_id, symbol_id);
        if (symbol is EntitySymbol entity)
        {
            var list = new List<NavigationTarget>();
            // Definition
            var def = map.ToTargetBySymbolId(symbol_id);
            if (def is not null)
                list.Add(def);

            foreach (var reference in entity.References)
            {
                list.Add(new NavigationTarget
                {
                    NodeId = NodeId.FromStableKey($"{document_id.Value}|ref:{symbol_id}:{reference.Location.Span.StartOffset}"),
                    DocumentUri = string.IsNullOrWhiteSpace(reference.Location.Path)
                        ? map.Document.DocumentUri
                        : reference.Location.Path,
                    TextRange = TextRange.FromSpan(reference.Location.Span),
                    NodeType = "Reference",
                    SymbolId = symbol_id,
                    Symbol = entity,
                    StartLine = reference.Location.Line,
                    EndLine = reference.Location.Line
                });
            }

            return list;
        }

        // Non-entity: definition only (Phase 5 index mở rộng sau)
        var target = map.ToTargetBySymbolId(symbol_id);
        return target is null ? [] : [target];
    }

    public NavigationTarget? PeekDefinition(ErpDocumentId document_id, string symbol_id) =>
        GoToDefinition(document_id, symbol_id);

    public IReadOnlyList<DocumentNode> FindChildren(ErpDocumentId document_id, NodeId node_id) =>
        GetMap(document_id)?.GetChildren(node_id) ?? [];

    public DocumentNode? FindParent(ErpDocumentId document_id, NodeId node_id) =>
        GetMap(document_id)?.GetParent(node_id);

    public ErpSymbol? FindSymbol(ErpDocumentId document_id, string symbol_id)
    {
        var doc = _get_document(document_id);
        if (doc is null || string.IsNullOrWhiteSpace(symbol_id)) return null;
        return doc.SemanticModel.Symbols.FirstOrDefault(s =>
            s.Id.Equals(symbol_id, StringComparison.OrdinalIgnoreCase));
    }

    public IReadOnlyList<DocumentNode> GetOutlineRoots(ErpDocumentId document_id) =>
        GetMap(document_id)?.GetOutlineRoots() ?? [];
}
