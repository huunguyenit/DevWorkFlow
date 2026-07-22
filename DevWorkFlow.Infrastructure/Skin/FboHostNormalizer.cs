using System.Linq;
using HtmlAgilityPack;
using DevWorkFlow.Application.Skin;

namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>Kết quả chuẩn hoá shell: HTML đã rewrite + trạng thái host + danh sách asset cần mirror.</summary>
public sealed record HostNormalizeResult(
    string Html,
    HostStatus HostStatus,
    string? HostSelector,
    IReadOnlyList<SkinAssetEntry> Assets);

/// <summary>
/// Chuẩn hoá HTML shell đã capture của site FBO ERP:
///   1. Tìm vùng container chứa nội dung form (heuristic FBO) → clear inner → chèn placeholder host trống.
///   2. Rewrite URL CSS/JS/image sang "assets/&lt;relative&gt;" để preview cục bộ (virtual host) dùng được;
///      URL ngoại vi (host khác) / tài nguyên động (*.axd) được giữ nguyên và đánh dấu Unresolved.
///
/// Heuristic host — CĂN CỨ: SP226/Main/Server.master &amp; MasterPage.master (Program FBO mẫu). Vùng render
/// nội dung nằm trong &lt;div id="mpMainBody"&gt; (bọc bởi &lt;div id="bodyWrapper"&gt;), nơi
/// ContentPlaceHolder ID="FastBusiness" đổ nội dung; chrome là #mpHeader (menu) + #mpTableFooter.
/// Danh sách candidate có thể mở rộng (constructor) để override qua manifest sau này.
/// </summary>
public sealed class FboHostNormalizer
{
    public const string HostPlaceholderId = "dwf-designer-host";

    // Ưu tiên giảm dần. Hai id đầu là THẬT (verify trong Server.master). Ứng viên "kết thúc bằng
    // FastBusiness" là heuristic cho client-id ASP.NET của ContentPlaceHolder — TODO: xác thực lại
    // trên DOM capture thực tế trước khi tin cậy làm host chính.
    private static readonly string[] DefaultCandidateXPaths =
    [
        "//*[@id='mpMainBody']",
        "//*[@id='bodyWrapper']",
        "//*[substring(@id, string-length(@id) - string-length('FastBusiness') + 1) = 'FastBusiness']"
    ];

    private readonly string[] _candidate_xpaths;

    public FboHostNormalizer(IEnumerable<string>? extra_candidate_xpaths = null)
    {
        _candidate_xpaths = extra_candidate_xpaths is null
            ? DefaultCandidateXPaths
            : [.. DefaultCandidateXPaths, .. extra_candidate_xpaths];
    }

    public HostNormalizeResult Normalize(string raw_html, string? captured_from_url = null)
    {
        var doc = new HtmlDocument();
        doc.LoadHtml(raw_html ?? string.Empty);

        EnsureUtf8Charset(doc);
        var (host_status, host_selector) = InsertHostPlaceholder(doc);
        var assets = RewriteAssets(doc, captured_from_url);

        return new HostNormalizeResult(doc.DocumentNode.OuterHtml, host_status, host_selector, assets);
    }

    /// <summary>
    /// Ép khai báo charset của shell về UTF-8: xoá mọi &lt;meta charset&gt; / &lt;meta http-equiv="Content-Type"&gt;
    /// cũ (trang gốc có thể khai báo charset khác, hoặc không khai báo gì — dựa vào HTTP header của response
    /// gốc mà bản capture DOM không giữ lại), rồi chèn &lt;meta charset="utf-8"&gt; làm con đầu tiên của
    /// &lt;head&gt;. <see cref="LocalSkinStore.WriteShellAsync"/> luôn ghi shell.html bằng UTF-8 — khai báo
    /// charset sai/thiếu khiến WebView2 đọc lại file cục bộ diễn giải sai byte → chữ có dấu vỡ ("lỗi font").
    /// </summary>
    private static void EnsureUtf8Charset(HtmlDocument doc)
    {
        var head = doc.DocumentNode.SelectSingleNode("//head");
        if (head is null) return;

        var stale_meta = head.SelectNodes(".//meta")?
            .Where(node => node.Attributes.Contains("charset")
                || string.Equals(node.GetAttributeValue("http-equiv", string.Empty), "Content-Type",
                    StringComparison.OrdinalIgnoreCase))
            .ToList();
        if (stale_meta is not null)
            foreach (var node in stale_meta)
                node.Remove();

        var charset_meta = HtmlNode.CreateNode("<meta charset=\"utf-8\">");
        if (head.FirstChild is not null)
            head.InsertBefore(charset_meta, head.FirstChild);
        else
            head.AppendChild(charset_meta);
    }

    private (HostStatus, string?) InsertHostPlaceholder(HtmlDocument doc)
    {
        for (var i = 0; i < _candidate_xpaths.Length; i++)
        {
            var node = doc.DocumentNode.SelectSingleNode(_candidate_xpaths[i]);
            if (node is null) continue;

            node.RemoveAllChildren();
            var placeholder = HtmlNode.CreateNode(
                $"<div id=\"{HostPlaceholderId}\" data-dwf-host=\"true\"></div>");
            node.AppendChild(placeholder);
            return (HostStatus.Found, _candidate_xpaths[i]);
        }

        // Không container nào khớp — giữ shell thô, báo NotFound (UI nhắc cập nhật heuristic/override sau).
        return (HostStatus.NotFound, null);
    }

    private static IReadOnlyList<SkinAssetEntry> RewriteAssets(HtmlDocument doc, string? captured_from_url)
    {
        Uri? base_uri = null;
        if (!string.IsNullOrWhiteSpace(captured_from_url))
            Uri.TryCreate(captured_from_url, UriKind.Absolute, out base_uri);

        // Dedupe entry theo OriginalUrl nhưng vẫn rewrite mọi attribute xuất hiện.
        var entries = new Dictionary<string, SkinAssetEntry>(StringComparer.OrdinalIgnoreCase);

        RewriteNodes(doc, "//link[@href]", "href", base_uri, entries);
        RewriteNodes(doc, "//script[@src]", "src", base_uri, entries);
        RewriteNodes(doc, "//img[@src]", "src", base_uri, entries);

        return entries.Values.ToList();
    }

    private static void RewriteNodes(
        HtmlDocument doc,
        string xpath,
        string attr,
        Uri? base_uri,
        Dictionary<string, SkinAssetEntry> entries)
    {
        var nodes = doc.DocumentNode.SelectNodes(xpath);
        if (nodes is null) return;

        foreach (var node in nodes)
        {
            var original = node.GetAttributeValue(attr, string.Empty);
            if (string.IsNullOrWhiteSpace(original)) continue;
            if (IsSkippable(original)) continue;

            var kind = DetectKind(node, original);
            var (mappable, rel_path, note) = SkinUrlMapper.MapToRelative(original, base_uri);

            if (!entries.TryGetValue(original, out var entry))
            {
                entry = new SkinAssetEntry
                {
                    OriginalUrl = original,
                    Kind = kind,
                    RelativePath = mappable ? rel_path : string.Empty,
                    // Nạp thẳng từ Program qua virtual host (KHÔNG mirror vào skin). URL ngoại vi/động
                    // (external host, *.axd) giữ nguyên và đánh Unresolved — preview sẽ không nạp được.
                    RewrittenUrl = mappable ? $"https://{LocalSkinStore.ProgramVirtualHost}/{rel_path}" : original,
                    Status = mappable ? AssetResolveStatus.Resolved : AssetResolveStatus.Unresolved,
                    Note = mappable ? null : note
                };
                entries[original] = entry;
            }

            if (mappable)
                node.SetAttributeValue(attr, entry.RewrittenUrl);
        }
    }

    private static bool IsSkippable(string url)
    {
        var u = url.TrimStart();
        return u.StartsWith("data:", StringComparison.OrdinalIgnoreCase)
            || u.StartsWith("javascript:", StringComparison.OrdinalIgnoreCase)
            || u.StartsWith("about:", StringComparison.OrdinalIgnoreCase)
            || u.StartsWith('#');
    }

    private static SkinAssetKind DetectKind(HtmlNode node, string url)
    {
        var name = node.Name.ToLowerInvariant();
        if (name == "img") return SkinAssetKind.Image;
        if (name == "script") return SkinAssetKind.Script;
        if (name == "link")
        {
            var rel = node.GetAttributeValue("rel", string.Empty).ToLowerInvariant();
            if (rel.Contains("icon")) return SkinAssetKind.Icon;
            if (rel.Contains("stylesheet")) return SkinAssetKind.Css;
        }

        return DetectKindByExtension(url);
    }

    private static SkinAssetKind DetectKindByExtension(string url)
    {
        var path = url;
        var q = path.IndexOfAny(['?', '#']);
        if (q >= 0) path = path[..q];
        var ext = path.Contains('.') ? path[(path.LastIndexOf('.') + 1)..].ToLowerInvariant() : string.Empty;
        return ext switch
        {
            "css" => SkinAssetKind.Css,
            "js" => SkinAssetKind.Script,
            "ico" => SkinAssetKind.Icon,
            "png" or "jpg" or "jpeg" or "gif" or "svg" or "webp" or "bmp" => SkinAssetKind.Image,
            _ => SkinAssetKind.Other
        };
    }
}
