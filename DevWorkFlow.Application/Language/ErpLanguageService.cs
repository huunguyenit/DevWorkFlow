using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Language Service: lifecycle, lossless syntax, semantic và entity graph.
/// </summary>
public sealed class ErpLanguageService : IErpLanguageService
{
    private readonly InMemoryErpWorkspace _workspace = new();
    private readonly ErpSemanticBinder _binder = new();
    private readonly IInsightProviderPipeline _insight_pipeline = new InsightProviderPipeline();
    private readonly ErpNavigationService _navigation;

    public ErpLanguageService()
    {
        _navigation = new ErpNavigationService(id => _workspace.GetDocument(id));
    }

    public IErpWorkspace Workspace => _workspace;

    public IErpNavigationService Navigation => _navigation;

    public void SetProgramPath(string? program_path) =>
        _workspace.SetProgramPath(program_path);

    public IErpDocument OpenDocument(string path)
    {
        if (string.IsNullOrWhiteSpace(path))
            throw new ArgumentException("Path document trống.", nameof(path));

        if (File.Exists(path))
        {
            return OpenCore(path, File.ReadAllText(path), expand_error: null);
        }

        return OpenCore(path, string.Empty, null);
    }

    public IErpDocument OpenDocumentFromText(string path, string raw_text)
    {
        if (string.IsNullOrWhiteSpace(path))
            path = $"buffer:{Guid.NewGuid():N}";

        return OpenCore(path, raw_text ?? string.Empty, expand_error: null);
    }

    public IErpDocument ReloadDocument(ErpDocumentId document_id)
    {
        if (!_workspace.TryGetMutable(document_id, out var existing) || existing is null)
            throw new InvalidOperationException($"Document không mở: {document_id}");

        var path = existing.Path;
        if (File.Exists(path))
        {
            return ReplaceCore(
                existing,
                path,
                File.ReadAllText(path),
                expand_error: null,
                existing.Version + 1);
        }

        return ReplaceCore(existing, path, existing.Snapshot.RawText, null, existing.Version + 1);
    }

    public bool CloseDocument(ErpDocumentId document_id)
    {
        _workspace._symbolIndex.RemoveDocument(document_id);
        _navigation.Remove(document_id);
        return _workspace.Remove(document_id);
    }

    public IErpDocument? GetDocument(ErpDocumentId document_id) =>
        _workspace.GetDocument(document_id);

    public StorageSnapshot? GetSnapshot(ErpDocumentId document_id) =>
        _workspace.GetDocument(document_id)?.Snapshot;

    public IReadOnlyList<InsightItem> GetInsights(ErpDocumentId document_id) =>
        GetRequiredDocument(document_id).Insights;

    public ErpDocumentProjection GetProjection(
        ErpDocumentId document_id,
        ErpProjectionKind kind)
    {
        var document = GetRequiredDocument(document_id);
        return document.GetProjection(kind);
    }

    public SourceLocation? GetEntityDefinition(
        ErpDocumentId document_id,
        string entity_name) =>
        GetRequiredDocument(document_id).SemanticModel.FindEntity(entity_name)?.Definition;

    public IReadOnlyList<SymbolReference> FindEntityReferences(
        ErpDocumentId document_id,
        string entity_name) =>
        GetRequiredDocument(document_id).SemanticModel.FindEntity(entity_name)?.References ?? [];

    public IReadOnlyList<WorkspaceSymbolEntry> SearchSymbols(
        string query,
        ErpSymbolKind? kind = null,
        int max_results = 50) =>
        _workspace._symbolIndex.Search(query, kind, max_results);

    public SourceLocation? GetSymbolDefinition(string symbol_id) =>
        _workspace._symbolIndex.GetDefinition(symbol_id);

    public IReadOnlyList<SymbolReference> FindSymbolReferences(string symbol_id) =>
        _workspace._symbolIndex.FindReferences(symbol_id);

    public EntityEditResult UpdateEntityValue(
        ErpDocumentId document_id,
        string entity_name,
        string new_value)
    {
        var document = GetRequiredDocument(document_id);
        var entity = document.SemanticModel.FindEntity(entity_name);
        if (entity is null)
            return Failed($"Không tìm thấy entity: {entity_name}");
        if (entity.DeclarationKind == EntityDeclarationKind.Parameter)
            return Failed("Parameter entity không hỗ trợ inline value edit.");
        if (!entity.IsResolved)
            return Failed($"Entity chưa resolve: {entity_name}");

        try
        {
            if (entity.DeclarationKind == EntityDeclarationKind.ExternalSystem)
            {
                if (string.IsNullOrWhiteSpace(entity.ResolvedPath))
                    return Failed($"Entity thiếu resolved path: {entity_name}");

                File.WriteAllText(entity.ResolvedPath, new_value ?? string.Empty);
                return Succeeded(ReloadDocument(document_id));
            }

            var value_path = entity.ValueLocation.Path;
            var target_is_document = PathsEqual(value_path, document.Path)
                                     || string.IsNullOrWhiteSpace(value_path);
            var target_text = target_is_document
                ? document.Snapshot.RawText
                : File.ReadAllText(value_path);
            var span = entity.ValueLocation.Span;
            if (span.StartOffset < 0 || span.EndOffset > target_text.Length)
                return Failed($"Value span không hợp lệ cho entity: {entity_name}");

            var escaped_value = EscapeEntityLiteral(
                target_text,
                span.StartOffset,
                new_value ?? string.Empty);
            var updated_text = target_text[..span.StartOffset]
                               + escaped_value
                               + target_text[span.EndOffset..];

            if (target_is_document)
                return Succeeded(OpenDocumentFromText(document.Path, updated_text));

            File.WriteAllText(value_path, updated_text);
            return Succeeded(ReloadDocument(document_id));
        }
        catch (Exception ex)
        {
            return Failed(ex.Message);
        }
    }

    private IErpDocument OpenCore(string path, string raw_text, string? expand_error)
    {
        var id = ErpDocumentId.FromPath(path);
        var version = 1;
        if (_workspace.TryGetMutable(id, out var existing) && existing is not null)
            version = existing.Version + 1;

        var (syntax, semantic, diagnostics, insights) =
            BuildModels(id, path, raw_text, expand_error);
        var snapshot = new StorageSnapshot
        {
            Path = path,
            RawText = raw_text,
            EncodingName = "UTF-8",
            Version = version
        };

        if (existing is not null)
        {
            existing.ReplaceContent(snapshot, syntax, semantic, diagnostics, insights);
            _workspace._symbolIndex.IndexDocument(existing.Id, existing.Path, existing.SemanticModel);
            _navigation.Rebuild(existing);
            _workspace.SetActive(existing);
            return existing;
        }

        var doc = new ErpDocument(
            id,
            path,
            snapshot,
            syntax,
            semantic,
            diagnostics,
            insights);
        var upserted = _workspace.Upsert(doc);
        _workspace._symbolIndex.IndexDocument(upserted.Id, upserted.Path, upserted.SemanticModel);
        _navigation.Rebuild(upserted);
        return upserted;
    }

    private IErpDocument ReplaceCore(
        ErpDocument existing,
        string path,
        string raw_text,
        string? expand_error,
        int version)
    {
        var (syntax, semantic, diagnostics, insights) =
            BuildModels(existing.Id, path, raw_text, expand_error);
        var snapshot = new StorageSnapshot
        {
            Path = path,
            RawText = raw_text,
            EncodingName = "UTF-8",
            Version = version
        };
        existing.ReplaceContent(snapshot, syntax, semantic, diagnostics, insights);
        _workspace._symbolIndex.IndexDocument(existing.Id, existing.Path, existing.SemanticModel);
        _navigation.Rebuild(existing);
        _workspace.SetActive(existing);
        return existing;
    }

    private (
        ISyntaxTree Syntax,
        IErpSemanticModel Semantic,
        IReadOnlyList<ErpDiagnostic> Diagnostics,
        IReadOnlyList<InsightItem> Insights) BuildModels(
        ErpDocumentId document_id,
        string path,
        string raw_text,
        string? expand_error)
    {
        var syntax = FboSyntaxParser.Parse(raw_text, path);
        var profile = new ErpMetadataProfile
        {
            ProfileId = "fbo-default",
            DisplayName = "FBO Default",
            ErpVersion = _workspace.ProgramPath is { } pp ? Path.GetFileName(pp) : null
        };

        var semantic = _binder.Bind(document_id, path, raw_text, syntax, profile);
        var diagnostics = new List<ErpDiagnostic>(syntax.Diagnostics);
        diagnostics.AddRange(semantic.Diagnostics);

        if (!string.IsNullOrWhiteSpace(expand_error))
        {
            diagnostics.Add(new ErpDiagnostic
            {
                Id = "ERP0001",
                Severity = ErpDiagnosticSeverity.Warning,
                Message = expand_error,
                Location = new SourceLocation { Path = path }
            });
        }

        var insights = _insight_pipeline.Build(semantic, diagnostics);
        return (syntax, semantic, diagnostics, insights);
    }

    private IErpDocument GetRequiredDocument(ErpDocumentId document_id) =>
        GetDocument(document_id)
        ?? throw new InvalidOperationException($"Document không mở: {document_id}");

    private static EntityEditResult Succeeded(IErpDocument document) => new()
    {
        Success = true,
        Document = document
    };

    private static EntityEditResult Failed(string error) => new()
    {
        Success = false,
        Error = error
    };

    private static bool PathsEqual(string? left, string? right)
    {
        if (string.IsNullOrWhiteSpace(left) || string.IsNullOrWhiteSpace(right))
            return false;
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

    private static string EscapeEntityLiteral(
        string source,
        int value_start,
        string value)
    {
        if (value_start <= 0 || value_start > source.Length)
            return value;
        return source[value_start - 1] switch
        {
            '"' => value.Replace("\"", "&quot;", StringComparison.Ordinal),
            '\'' => value.Replace("'", "&apos;", StringComparison.Ordinal),
            _ => value
        };
    }
}
