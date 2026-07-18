using System.Collections.ObjectModel;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>Workspace in-memory: documents đang mở trong session IDE.</summary>
public sealed class InMemoryErpWorkspace : IErpWorkspace
{
    private readonly Dictionary<ErpDocumentId, ErpDocument> _documents = new();
    private readonly object _gate = new();

    internal readonly WorkspaceSymbolIndex _symbolIndex = new();

    public string? ProgramPath { get; private set; }

    public IReadOnlyCollection<IErpDocument> Documents
    {
        get
        {
            lock (_gate)
                return new ReadOnlyCollection<IErpDocument>(_documents.Values.Cast<IErpDocument>().ToList());
        }
    }

    public IErpDocument? ActiveDocument { get; private set; }

    public IWorkspaceSymbolIndex SymbolIndex => _symbolIndex;

    public void SetProgramPath(string? program_path) =>
        ProgramPath = string.IsNullOrWhiteSpace(program_path) ? null : program_path.Trim();

    public void SetActive(IErpDocument? document) => ActiveDocument = document;

    public IErpDocument? GetDocument(ErpDocumentId id)
    {
        lock (_gate)
            return _documents.TryGetValue(id, out var doc) ? doc : null;
    }

    public bool TryGetDocument(ErpDocumentId id, out IErpDocument? document)
    {
        lock (_gate)
        {
            if (_documents.TryGetValue(id, out var doc))
            {
                document = doc;
                return true;
            }
            document = null;
            return false;
        }
    }

    public IErpDocument? FindByPath(string path)
    {
        if (string.IsNullOrWhiteSpace(path)) return null;
        var id = ErpDocumentId.FromPath(path);
        return GetDocument(id);
    }

    internal ErpDocument Upsert(ErpDocument document)
    {
        lock (_gate)
        {
            _documents[document.Id] = document;
            ActiveDocument = document;
            return document;
        }
    }

    internal bool Remove(ErpDocumentId id)
    {
        lock (_gate)
        {
            var removed = _documents.Remove(id);
            if (removed && ActiveDocument is ErpDocument active && active.Id.Equals(id))
                ActiveDocument = _documents.Values.FirstOrDefault();
            return removed;
        }
    }

    internal bool TryGetMutable(ErpDocumentId id, out ErpDocument? document)
    {
        lock (_gate)
        {
            if (_documents.TryGetValue(id, out var doc))
            {
                document = doc;
                return true;
            }
            document = null;
            return false;
        }
    }
}
