namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Workspace Program: tập document đang mở + ngữ cảnh Program path.
/// </summary>
public interface IErpWorkspace
{
    /// <summary>Thư mục Program FBO (SP226, …); null nếu chưa chọn.</summary>
    string? ProgramPath { get; }

    IReadOnlyCollection<IErpDocument> Documents { get; }

    IErpDocument? ActiveDocument { get; }

    /// <summary>Workspace symbol index — tìm kiếm và navigation toàn workspace.</summary>
    IWorkspaceSymbolIndex SymbolIndex { get; }

    IErpDocument? GetDocument(ErpDocumentId id);

    bool TryGetDocument(ErpDocumentId id, out IErpDocument? document);

    IErpDocument? FindByPath(string path);
}
