using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Semantic model Phase 3 — symbols + diagnostics + legacy Fbo* (chuyển tiếp Designer).
/// </summary>
public sealed class ErpSemanticModel : IErpSemanticModel
{
    private readonly List<ErpSymbol> _symbols;
    private readonly List<ErpDiagnostic> _diagnostics;

    public ErpSemanticModel(
        ErpDocumentId document_id,
        IEnumerable<ErpSymbol> symbols,
        IEnumerable<ErpDiagnostic>? diagnostics = null,
        ErpMetadataProfile? profile = null,
        FboControllerDocument? legacy_document = null,
        string? clear_text = null,
        IReadOnlyList<EntityProjectionSegment>? entity_segments = null)
    {
        DocumentId = document_id;
        Profile = profile ?? ErpMetadataProfile.Default;
        _symbols = symbols.ToList();
        _diagnostics = diagnostics?.ToList() ?? [];
        LegacyDocument = legacy_document;
        ClearText = clear_text ?? string.Empty;
        EntitySegments = entity_segments ?? [];
        Controller = _symbols.OfType<ControllerSymbol>().FirstOrDefault();
    }

    public ErpDocumentId DocumentId { get; }

    public ErpMetadataProfile Profile { get; }

    public ControllerSymbol? Controller { get; }

    /// <summary>
    /// Model Fbo* chuyển tiếp cho Design mapper — cùng lần bind, không parse lại trong UI.
    /// </summary>
    public FboControllerDocument? LegacyDocument { get; }

    /// <summary>ClearText projection đã resolve entity; source không đổi.</summary>
    public string ClearText { get; }

    /// <summary>Entity inline segments cho Semantic projection.</summary>
    public IReadOnlyList<EntityProjectionSegment> EntitySegments { get; }

    public IReadOnlyList<ErpSymbol> Symbols => _symbols;

    public IReadOnlyList<ErpDiagnostic> Diagnostics => _diagnostics;

    public ErpSymbol? FindByName(string name, ErpSymbolKind? kind = null)
    {
        if (string.IsNullOrWhiteSpace(name)) return null;
        return _symbols.FirstOrDefault(s =>
            s.Name.Equals(name, StringComparison.OrdinalIgnoreCase)
            && (kind is null || s.Kind == kind));
    }

    public IReadOnlyList<ErpSymbol> GetChildren(string parent_symbol_id)
    {
        if (string.IsNullOrWhiteSpace(parent_symbol_id)) return [];
        return _symbols
            .Where(s => string.Equals(s.ParentSymbolId, parent_symbol_id, StringComparison.OrdinalIgnoreCase))
            .ToList();
    }

    public IReadOnlyList<FieldSymbol> GetFields() =>
        _symbols.OfType<FieldSymbol>().ToList();

    public IReadOnlyList<EntitySymbol> GetEntities() =>
        _symbols.OfType<EntitySymbol>().ToList();

    public EntitySymbol? FindEntity(string name)
    {
        if (string.IsNullOrWhiteSpace(name)) return null;
        return _symbols.OfType<EntitySymbol>().FirstOrDefault(
            entity => entity.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
    }

    public IReadOnlyList<T> GetSymbolsOfKind<T>(ErpSymbolKind kind) where T : ErpSymbol =>
        _symbols.OfType<T>().Where(s => s.Kind == kind).ToList();
}
