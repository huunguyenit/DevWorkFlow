using DevWorkFlow.Domain.Models;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>Định danh DOM ổn định của một element sinh ra (SymbolId + optional NodeId), không dùng offset.</summary>
public sealed record DesignElementIdentity(string SymbolId, string? NodeId);

/// <summary>
/// Tập asset tĩnh (lấy từ Program) mà HTML Design cần tham chiếu. Đường dẫn là relative dưới Program root;
/// generator sẽ rewrite thành URL virtual host. KHÔNG chứa .axd/động.
/// </summary>
public sealed record DesignAssetSet(
    string? MainRelativePath,
    string? MasterRelativePath,
    IReadOnlyList<string> Stylesheets,
    IReadOnlyList<string> Scripts,
    IReadOnlyList<string> Images)
{
    public static DesignAssetSet Empty { get; } = new(null, null, [], [], []);
}

/// <summary>Một pack CSS từ Config/css (đã materialize nội dung — Application không đọc filesystem).</summary>
public sealed record DesignCssPack(
    string Id,
    string CssText,
    int Order,
    IReadOnlyList<string> DisplayKinds,
    bool RequireCategories = false,
    bool RequireDetailGrid = false,
    bool RequireToolbar = false,
    IReadOnlyList<string>? Controllers = null,
    IReadOnlyList<string>? ExcludeControllers = null);

/// <summary>Tập pack CSS config đã load; null/Empty = chỉ baseline IDE + Program + controller.</summary>
public sealed record DesignCssBundle(IReadOnlyList<DesignCssPack> Packs)
{
    public static DesignCssBundle Empty { get; } = new([]);
}

/// <summary>Yêu cầu render HTML thuần (đã có sẵn asset + detail docs đã resolve).</summary>
public sealed record DesignRenderRequest(
    FboControllerDocument Document,
    bool Vietnamese,
    DesignAssetSet Assets,
    IReadOnlyDictionary<string, DesignElementIdentity> FieldIdentities,
    IReadOnlyDictionary<string, FboControllerDocument> DetailDocuments,
    int GridPlaceholderRows = 5,
    DesignCssBundle? CssBundle = null);

/// <summary>Yêu cầu build đầy đủ (service tự resolve asset + detail qua Language Service).</summary>
public sealed record DesignBuildRequest(
    FboControllerDocument Document,
    bool Vietnamese,
    ProgramContext? Program,
    IReadOnlyDictionary<string, DesignElementIdentity> FieldIdentities);

/// <summary>Kết quả: HTML tự chứa + tên controller + asset đã dùng + cảnh báo (missing detail/asset…).</summary>
public sealed record DesignDocument(
    string Html,
    string ControllerName,
    DesignAssetSet Assets,
    IReadOnlyList<string> Warnings);

public interface IDesignHtmlGenerator
{
    DesignDocument Generate(DesignRenderRequest request);
}

public interface IDesignAssetResolver
{
    Task<DesignAssetSet> ResolveAsync(
        ProgramContext program,
        string controller_name,
        CancellationToken ct = default);
}

public interface IDesignDocumentService
{
    Task<DesignDocument> BuildAsync(
        DesignBuildRequest request,
        CancellationToken ct = default);
}

/// <summary>Application-side abstraction để tìm file Grid Detail liên quan; hiện thực ở Infrastructure
/// (UI/Infra không parse XML — chỉ tìm path rồi giao Language Service parse).</summary>
public interface IDesignRelatedDocumentLocator
{
    string? FindGridPath(ProgramContext program, string controller_name);
}

/// <summary>Catalog CSS pack từ Config/css (implement đọc FS ở Infra/UI composition; trả DTO thuần).</summary>
public interface IDesignCssCatalog
{
    DesignCssBundle GetBundle();
}
