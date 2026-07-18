namespace DevWorkFlow.Domain.Language;

/// <summary>
/// ERP Semantic Model gắn với một document.
/// </summary>
public interface IErpSemanticModel
{
    ErpDocumentId DocumentId { get; }

    ErpMetadataProfile Profile { get; }

    /// <summary>Controller gốc (null nếu chưa bind được).</summary>
    ControllerSymbol? Controller { get; }

    /// <summary>Toàn bộ symbol đã bind (có thể rỗng).</summary>
    IReadOnlyList<ErpSymbol> Symbols { get; }

    /// <summary>Diagnostics phát sinh khi bind.</summary>
    IReadOnlyList<ErpDiagnostic> Diagnostics { get; }

    /// <summary>Tìm theo tên (OrdinalIgnoreCase).</summary>
    ErpSymbol? FindByName(string name, ErpSymbolKind? kind = null);

    /// <summary>Symbol con của parent (field thuộc controller, …).</summary>
    IReadOnlyList<ErpSymbol> GetChildren(string parent_symbol_id);

    /// <summary>Fields của controller.</summary>
    IReadOnlyList<FieldSymbol> GetFields();

    /// <summary>Entity symbols gồm definitions, references và resolution state.</summary>
    IReadOnlyList<EntitySymbol> GetEntities();

    EntitySymbol? FindEntity(string name);

    IReadOnlyList<T> GetSymbolsOfKind<T>(ErpSymbolKind kind) where T : ErpSymbol;
}
