using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Orchestration Design: resolve asset tĩnh + tài liệu Grid Detail (qua Language Service — chỉ LS parse XML),
/// rồi gọi <see cref="IDesignHtmlGenerator"/>. Soft-fail: thiếu Program/asset/detail → vẫn trả HTML kèm cảnh
/// báo, không ném (trừ hủy bỏ).
/// </summary>
public sealed class DesignDocumentService : IDesignDocumentService
{
    private readonly IErpLanguageService _language_service;
    private readonly IDesignAssetResolver _asset_resolver;
    private readonly IDesignRelatedDocumentLocator _related_document_locator;
    private readonly IDesignHtmlGenerator _html_generator;
    private readonly IDesignCssCatalog? _css_catalog;
    private readonly IDesignToolbarCatalog? _toolbar_catalog;

    public DesignDocumentService(
        IErpLanguageService language_service,
        IDesignAssetResolver asset_resolver,
        IDesignRelatedDocumentLocator related_document_locator,
        IDesignHtmlGenerator html_generator,
        IDesignCssCatalog? css_catalog = null,
        IDesignToolbarCatalog? toolbar_catalog = null)
    {
        _language_service = language_service;
        _asset_resolver = asset_resolver;
        _related_document_locator = related_document_locator;
        _html_generator = html_generator;
        _css_catalog = css_catalog;
        _toolbar_catalog = toolbar_catalog;
    }

    public async Task<DesignDocument> BuildAsync(DesignBuildRequest request, CancellationToken ct = default)
    {
        var warnings = new List<string>();

        var assets = DesignAssetSet.Empty;
        if (request.Program is null)
        {
            warnings.Add("Chưa chọn Program");
        }
        else
        {
            try
            {
                assets = await _asset_resolver
                    .ResolveAsync(request.Program, request.Document.ControllerName, ct)
                    .ConfigureAwait(false);
            }
            catch (OperationCanceledException)
            {
                throw;
            }
            catch (Exception ex)
            {
                warnings.Add($"Không lấy được asset tĩnh: {ex.Message}");
            }
        }

        var detail_documents = ResolveDetailDocuments(request.Document, request.Program, warnings);
        var css_bundle = DesignCssBundle.Empty;
        try
        {
            css_bundle = _css_catalog?.GetBundle() ?? DesignCssBundle.Empty;
        }
        catch (Exception ex)
        {
            warnings.Add($"Không load được Config/css: {ex.Message}");
        }

        var toolbar_bundle = DesignToolbarBundle.Empty;
        try
        {
            toolbar_bundle = _toolbar_catalog?.GetBundle() ?? DesignToolbarBundle.Empty;
        }
        catch (Exception ex)
        {
            warnings.Add($"Không load được Config/json/toolbar.json: {ex.Message}");
        }

        var rendered = _html_generator.Generate(new DesignRenderRequest(
            request.Document,
            request.Vietnamese,
            assets,
            request.FieldIdentities,
            detail_documents,
            GridPlaceholderRows: 5,
            CssBundle: css_bundle,
            ToolbarBundle: toolbar_bundle,
            EnableBlueprint: request.EnableBlueprint));

        return rendered with { Warnings = warnings };
    }

    /// <summary>Với Dir Form: tìm field ItemsStyle="Grid" → resolve path Grid/{controller}.xml → mở qua LS →
    /// lấy LegacyDocument (Grid). Không parse XML ở đây (đi qua Language Service).</summary>
    private IReadOnlyDictionary<string, FboControllerDocument> ResolveDetailDocuments(
        FboControllerDocument document,
        ProgramContext? program,
        List<string> warnings)
    {
        var map = new Dictionary<string, FboControllerDocument>(StringComparer.OrdinalIgnoreCase);
        if (document.DisplayKind != ControllerDisplayKind.Form || document.Form is null || program is null)
            return map;

        foreach (var field in document.Form.Fields)
        {
            if (!string.Equals(field.ItemsStyle, "Grid", StringComparison.OrdinalIgnoreCase))
                continue;

            var controller = field.ItemsController;
            if (string.IsNullOrWhiteSpace(controller) || map.ContainsKey(controller))
                continue;

            var path = _related_document_locator.FindGridPath(program, controller);
            if (path is null)
            {
                warnings.Add($"Không tìm thấy Grid Detail: {controller}");
                continue;
            }

            try
            {
                var doc = _language_service.Workspace.FindByPath(path)
                          ?? _language_service.OpenDocument(path);
                var legacy = (doc.SemanticModel as ErpSemanticModel)?.LegacyDocument;
                if (legacy?.Grid is not null)
                    map[controller] = legacy;
                else
                    warnings.Add($"Grid Detail không hợp lệ: {controller}");
            }
            catch (Exception ex)
            {
                warnings.Add($"Lỗi mở Grid Detail {controller}: {ex.Message}");
            }
        }

        return map;
    }
}
