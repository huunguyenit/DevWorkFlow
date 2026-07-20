using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>Implementation <see cref="INavigationMap"/> gắn một document.</summary>
public sealed class NavigationMap : INavigationMap
{
    private readonly Dictionary<NodeId, DocumentNode> _by_id;
    private readonly Dictionary<string, NodeId> _symbol_to_node;
    private readonly Dictionary<NodeId, NodeId> _parent_of;
    private readonly IErpSemanticModel _semantic;

    public NavigationMap(
        DocumentModel document,
        IReadOnlyDictionary<NodeId, DocumentNode> by_id,
        IReadOnlyDictionary<string, NodeId> symbol_to_node,
        IReadOnlyDictionary<NodeId, NodeId> parent_of,
        IErpSemanticModel semantic)
    {
        Document = document;
        _by_id = new Dictionary<NodeId, DocumentNode>(by_id);
        _symbol_to_node = new Dictionary<string, NodeId>(symbol_to_node, StringComparer.OrdinalIgnoreCase);
        _parent_of = new Dictionary<NodeId, NodeId>(parent_of);
        _semantic = semantic;
    }

    public DocumentModel Document { get; }

    public DocumentNode? GetNode(NodeId node_id) =>
        node_id.IsEmpty ? null : _by_id.GetValueOrDefault(node_id);

    public DocumentNode? GetNodeBySymbolId(string symbol_id)
    {
        if (string.IsNullOrWhiteSpace(symbol_id)) return null;
        return _symbol_to_node.TryGetValue(symbol_id, out var id) ? GetNode(id) : null;
    }

    public NavigationTarget? ToTarget(NodeId node_id)
    {
        var node = GetNode(node_id);
        if (node is null) return null;

        ErpSymbol? symbol = null;
        if (!string.IsNullOrWhiteSpace(node.SymbolId))
            symbol = _semantic.Symbols.FirstOrDefault(s =>
                s.Id.Equals(node.SymbolId, StringComparison.OrdinalIgnoreCase));

        return new NavigationTarget
        {
            NodeId = node.Id,
            DocumentUri = string.IsNullOrWhiteSpace(node.DocumentUri)
                ? Document.DocumentUri
                : node.DocumentUri!,
            TextRange = node.TextRange,
            NodeType = node.NodeType,
            SymbolId = node.SymbolId,
            Symbol = symbol,
            StartLine = node.StartLine,
            EndLine = node.EndLine,
            PreferCaretOnly = node.PreferCaretOnly,
            UsesClearTextOffsets = node.UsesClearTextOffsets
        };
    }

    public NavigationTarget? ToTargetBySymbolId(string symbol_id)
    {
        var node = GetNodeBySymbolId(symbol_id);
        return node is null ? null : ToTarget(node.Id);
    }

    public IReadOnlyList<DocumentNode> GetChildren(NodeId node_id)
    {
        var node = GetNode(node_id);
        return node?.Children ?? [];
    }

    public DocumentNode? GetParent(NodeId node_id) =>
        _parent_of.TryGetValue(node_id, out var parent_id) ? GetNode(parent_id) : null;

    public IReadOnlyList<DocumentNode> GetOutlineRoots() => Document.Roots;
}
