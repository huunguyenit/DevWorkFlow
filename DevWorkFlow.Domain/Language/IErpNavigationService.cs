namespace DevWorkFlow.Domain.Language;

/// <summary>
/// ERP Navigation Service — mọi điều hướng (Outline, Designer, Validation, AI, GTD/Refs)
/// đi qua đây. Không search XML / line / offset từ phía consumer.
/// </summary>
/// <remarks>
/// Không nhầm với UI page routing <c>INavigationService</c> (Infrastructure).
/// </remarks>
public interface IErpNavigationService
{
    /// <summary>Lấy Navigation Map của document đang mở.</summary>
    INavigationMap? GetMap(ErpDocumentId document_id);

    NavigationTarget? GoToNode(ErpDocumentId document_id, NodeId node_id);

    NavigationTarget? GoToDefinition(ErpDocumentId document_id, string symbol_id);

    IReadOnlyList<NavigationTarget> FindReferences(ErpDocumentId document_id, string symbol_id);

    /// <summary>Peek definition — cùng target với GoToDefinition (không mở document mới).</summary>
    NavigationTarget? PeekDefinition(ErpDocumentId document_id, string symbol_id);

    IReadOnlyList<DocumentNode> FindChildren(ErpDocumentId document_id, NodeId node_id);

    DocumentNode? FindParent(ErpDocumentId document_id, NodeId node_id);

    ErpSymbol? FindSymbol(ErpDocumentId document_id, string symbol_id);

    /// <summary>Outline roots từ Document Model (không parse XML).</summary>
    IReadOnlyList<DocumentNode> GetOutlineRoots(ErpDocumentId document_id);
}
