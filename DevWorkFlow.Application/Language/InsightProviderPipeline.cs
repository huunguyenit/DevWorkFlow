using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>Compose providers thành collection duy nhất theo layer/priority.</summary>
public sealed class InsightProviderPipeline : IInsightProviderPipeline
{
    private readonly IReadOnlyList<IInsightProvider> _providers;

    public InsightProviderPipeline(IEnumerable<IInsightProvider>? providers = null)
    {
        _providers = providers?.ToList()
                     ?? [new EntityInsightProvider(), new ValidationInsightProvider()];
    }

    public IReadOnlyList<InsightItem> Build(
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic> diagnostics) =>
        _providers
            .SelectMany(provider => provider.Provide(semantic_model, diagnostics))
            .OrderBy(item => item.Range.Span.StartOffset)
            .ThenBy(item => item.Layer)
            .ThenByDescending(item => item.Priority)
            .ToList();
}

/// <summary>Entity provider: semantic symbol → nested Entity insight tree.</summary>
public sealed class EntityInsightProvider : IInsightProvider
{
    public string ProviderId => "erp.entity";

    public IReadOnlyList<InsightItem> Provide(
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic> diagnostics)
    {
        var entities = semantic_model.GetEntities();
        if (entities.Count == 0)
            return [];

        var by_id = entities.ToDictionary(
            entity => entity.Id,
            StringComparer.OrdinalIgnoreCase);
        // Ưu tiên Controller.Definition.Path; fallback DocumentId.Value (path của file active).
        var document_path = semantic_model.Controller?.Definition.Path
                            ?? semantic_model.DocumentId.Value;
        var result = new List<InsightItem>();

        foreach (var entity in entities)
        {
            // Parameter (%Name;) không render insight trong body editor.
            if (entity.DeclarationKind == EntityDeclarationKind.Parameter)
                continue;

            foreach (var reference in entity.References)
            {
                // Chỉ general entity ref (&Name;) trong body document đang mở.
                // Bỏ %ref trong DOCTYPE và ref từ file include khác.
                if (!string.Equals(reference.Kind, "entity", StringComparison.OrdinalIgnoreCase))
                    continue;
                if (!PathsEqual(reference.Location.Path, document_path))
                    continue;

                result.Add(BuildEntityItem(
                    entity,
                    reference.Location,
                    by_id,
                    new HashSet<string>(StringComparer.OrdinalIgnoreCase)));
            }
        }

        _ = diagnostics;
        return result;
    }

    private static InsightItem BuildEntityItem(
        EntitySymbol entity,
        SourceLocation range,
        IReadOnlyDictionary<string, EntitySymbol> by_id,
        HashSet<string> path)
    {
        if (!path.Add(entity.Id))
        {
            return new InsightItem
            {
                Id = $"entity-cycle:{entity.Id}:{range.Span.StartOffset}",
                Type = InsightType.Entity,
                Range = range,
                Priority = 100,
                Layer = InsightLayer.Error,
                SymbolId = entity.Id,
                ReferenceText = $"&{entity.Name};",
                DisplayContent = $"Chu kỳ entity: {entity.Name}",
                ResolvedValue = $"&{entity.Name};"
            };
        }

        var children = entity.ChildEntityIds
            .Where(by_id.ContainsKey)
            .Select(child_id => BuildEntityItem(
                by_id[child_id],
                by_id[child_id].Definition,
                by_id,
                new HashSet<string>(path, StringComparer.OrdinalIgnoreCase)))
            .ToList();

        return new InsightItem
        {
            Id = $"entity:{entity.Id}:{range.Path}:{range.Span.StartOffset}",
            Type = InsightType.Entity,
            Range = range,
            Priority = 700,
            Layer = InsightLayer.Entity,
            SymbolId = entity.Id,
            ReferenceText = $"&{entity.Name};",
            DisplayContent = entity.DisplayText,
            ResolvedValue = entity.RawValue ?? entity.DisplayText,
            CanEditResolvedValue = entity.IsResolved
                                   && entity.DeclarationKind != EntityDeclarationKind.Parameter,
            Actions =
            [
                Action("entity.edit", "Sửa giá trị", entity),
                Action("symbol.definition", "Go To Definition", entity),
                Action("symbol.references", "Find References", entity),
                Action("symbol.rename", "Rename Symbol", entity)
            ],
            Metadata = entity.Metadata,
            Children = children
        };
    }

    private static InsightAction Action(
        string id,
        string display_name,
        EntitySymbol entity) =>
        new()
        {
            Id = id,
            DisplayName = display_name,
            Metadata = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                ["symbol_id"] = entity.Id,
                ["entity_name"] = entity.Name
            }
        };

    private static bool PathsEqual(string left, string right)
    {
        try
        {
            return Path.GetFullPath(left).Equals(
                Path.GetFullPath(right),
                StringComparison.OrdinalIgnoreCase);
        }
        catch
        {
            return left.Equals(right, StringComparison.OrdinalIgnoreCase);
        }
    }
}

/// <summary>Diagnostics provider; không render và không thao tác UI.</summary>
public sealed class ValidationInsightProvider : IInsightProvider
{
    public string ProviderId => "erp.validation";

    public IReadOnlyList<InsightItem> Provide(
        IErpSemanticModel semantic_model,
        IReadOnlyList<ErpDiagnostic> diagnostics)
    {
        _ = semantic_model;
        return diagnostics.Select(diagnostic => new InsightItem
        {
            Id = $"diagnostic:{diagnostic.Id}:{diagnostic.Location.Span.StartOffset}",
            Type = InsightType.Validation,
            Range = diagnostic.Location,
            Priority = diagnostic.Severity == ErpDiagnosticSeverity.Error ? 1000 : 900,
            Layer = diagnostic.Severity == ErpDiagnosticSeverity.Error
                ? InsightLayer.Error
                : InsightLayer.Warning,
            DisplayContent = diagnostic.Message,
            Metadata = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
            {
                ["diagnostic_id"] = diagnostic.Id,
                ["severity"] = diagnostic.Severity.ToString()
            }
        }).ToList();
    }
}
