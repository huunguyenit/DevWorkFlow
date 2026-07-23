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

    /// <summary>Catalog API JS FBO (Phase 4); rỗng cho tới khi <see cref="LoadFboJsCatalog"/> chạy.</summary>
    private FboJsCatalog _fbo_js_catalog = FboJsCatalog.Empty;

    /// <summary>Catalog snippet SQL (Phase 5 #17) đọc từ config.</summary>
    private SqlSnippetCatalog _sql_snippets = SqlSnippetCatalog.Empty;

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

    public EntityHit? ResolveEntityAtOffset(ErpDocumentId document_id, int offset)
    {
        var document = GetDocument(document_id);
        return document is null
            ? null
            : EntityAtOffsetResolver.TryResolve(document.SemanticModel, offset, document.Path);
    }

    public StructuralNavHit? ResolveStructuralAtOffset(
        ErpDocumentId document_id,
        int offset,
        string? controllers_path)
    {
        var document = GetDocument(document_id);
        if (document is null) return null;

        return StructuralAtOffsetResolver.TryResolve(
            document.SemanticModel,
            document.SyntaxTree,
            document.Snapshot.RawText ?? string.Empty,
            offset,
            controllers_path);
    }

    public JsRuntimeNavHit? ResolveJsRuntimeAtOffset(
        ErpDocumentId document_id,
        int offset,
        string? controllers_path,
        bool offset_is_clear_text = false)
    {
        var document = GetDocument(document_id);
        if (document is null) return null;

        var clear_text = document.GetProjection(ErpProjectionKind.ClearText);
        // Resolver chạy trên ClearText — offset source phải đổi hệ trước, nếu không mọi vị trí
        // sau tham chiếu entity đầu tiên đều lệch.
        var clear_offset = offset_is_clear_text
            ? offset
            : clear_text.OffsetMap.ToClearText(offset);

        var hit = JsRuntimeAtOffsetResolver.TryResolve(
            document.SemanticModel, clear_text, document.Path, clear_offset, controllers_path);
        if (hit is null) return null;

        // Function: references do Navigation dựng (definition + call sites, đã map file/offset).
        var references = hit.Kind == JsRuntimeNavKind.ScriptFunctionRefs
                         && !string.IsNullOrEmpty(hit.SymbolId)
            ? _navigation.FindReferences(document_id, hit.SymbolId)
            : hit.References;

        var enricher = new ReferencePreviewEnricher(
            path => GetDocument(ErpDocumentId.FromPath(path))?.Snapshot.RawText);

        return new JsRuntimeNavHit
        {
            Kind = hit.Kind,
            SymbolId = hit.SymbolId,
            SymbolName = hit.SymbolName,
            SymbolKindText = hit.SymbolKindText,
            DisplayLabel = hit.DisplayLabel,
            TargetPath = hit.TargetPath,
            TargetOffset = hit.TargetOffset,
            HoverValue = hit.HoverValue,
            RelatedPaths = hit.RelatedPaths,
            References = [.. references.Select(enricher.Enrich)],
            Relations = [.. hit.Relations.Select(enricher.Enrich)]
        };
    }

    // ── Phase 4: FBO JS catalog assist ──────────────────────────────────────

    public void LoadFboJsCatalog(string absolute_path) =>
        _fbo_js_catalog = FboJsCatalog.FromData(FboJsCatalogParser.ParseFile(absolute_path));

    public FboJsCompletionList CompleteFboJs(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text)
    {
        var buffer = GetAssistBuffer(document_id, offset_is_clear_text);
        return buffer is null
            ? FboJsCompletionList.Empty
            : FboJsAssistResolver.Complete(buffer, offset, mode, _fbo_js_catalog);
    }

    public FboJsHoverInfo? HoverFboJs(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text)
    {
        var buffer = GetAssistBuffer(document_id, offset_is_clear_text);
        return buffer is null
            ? null
            : FboJsAssistResolver.Hover(buffer, offset, mode, _fbo_js_catalog);
    }

    public FboJsSignatureHelp? SignatureFboJs(
        ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text)
    {
        var buffer = GetAssistBuffer(document_id, offset_is_clear_text);
        return buffer is null
            ? null
            : FboJsAssistResolver.Signature(buffer, offset, mode, _fbo_js_catalog);
    }

    // ── Phase 5: SQL tooling ────────────────────────────────────────────────

    public string? BuildInformationSqlAtOffset(
        ErpDocumentId document_id, int offset, bool offset_is_clear_text = false)
    {
        if (!TryGetClearText(document_id, offset, offset_is_clear_text, out var text, out var clear_offset))
            return null;

        var request = InformationAttributeAtOffset.TryResolve(text, clear_offset);
        return request is null ? null : InformationSqlBuilder.Build(request);
    }

    public SqlObjectName? ResolveSqlObjectAtOffset(
        ErpDocumentId document_id, int offset, bool offset_is_clear_text = false)
    {
        return TryGetClearText(document_id, offset, offset_is_clear_text, out var text, out var clear_offset)
            ? SqlObjectNameAtOffset.TryResolve(text, clear_offset)
            : null;
    }

    /// <summary>
    /// SQL/attribute của FBO thường nằm TRONG khai báo <c>&lt;!ENTITY&gt;</c> chứ không nằm trực
    /// tiếp trong <c>&lt;command&gt;</c> của source (đo trên Dir/AITran.xml: mọi lời gọi proc đều
    /// ở entity). Vì vậy hit-test phải chạy trên ClearText đã expand, còn offset người dùng click
    /// thì đổi hệ toạ độ về đó.
    /// </summary>
    private bool TryGetClearText(
        ErpDocumentId document_id, int offset, bool offset_is_clear_text,
        out string text, out int clear_offset)
    {
        text = string.Empty;
        clear_offset = -1;

        var document = GetDocument(document_id);
        if (document is null) return false;

        var projection = document.GetProjection(ErpProjectionKind.ClearText);
        if (string.IsNullOrEmpty(projection.Text)) return false;

        text = projection.Text;
        clear_offset = offset_is_clear_text ? offset : projection.OffsetMap.ToClearText(offset);
        return true;
    }

    public void LoadSqlSnippets(string absolute_path) =>
        _sql_snippets = SqlSnippetCatalog.FromFile(absolute_path);

    public string? TryExpandSqlSnippet(string? text) =>
        OptionsSnippetExpander.TryExpand(text, _sql_snippets);

    public ControllerDatabaseKind ResolveDatabaseKind(ErpDocumentId document_id)
    {
        var source = GetDocument(document_id)?.Snapshot.RawText;
        return string.IsNullOrEmpty(source)
            ? ControllerDatabaseKind.App
            : ControllerDatabaseKindResolver.ResolveFromXml(source);
    }

    /// <summary>Buffer mà offset đang tính trên đó — Insight là ClearText, còn lại là source.</summary>
    private string? GetAssistBuffer(ErpDocumentId document_id, bool offset_is_clear_text)
    {
        var document = GetDocument(document_id);
        if (document is null) return null;

        return offset_is_clear_text
            ? document.GetProjection(ErpProjectionKind.ClearText).Text
            : document.Snapshot.RawText ?? string.Empty;
    }

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
