namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Navigation Map — nguồn duy nhất cho điều hướng trên một document.
/// Xây từ Semantic Model (+ vị trí từ Syntax/Definition).
/// </summary>
public interface INavigationMap
{
    DocumentModel Document { get; }

    DocumentNode? GetNode(NodeId node_id);

    DocumentNode? GetNodeBySymbolId(string symbol_id);

    NavigationTarget? ToTarget(NodeId node_id);

    NavigationTarget? ToTargetBySymbolId(string symbol_id);

    IReadOnlyList<DocumentNode> GetChildren(NodeId node_id);

    DocumentNode? GetParent(NodeId node_id);

    IReadOnlyList<DocumentNode> GetOutlineRoots();
}
