using System.Text;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Sinh HTML tự chứa cho Design tab từ <see cref="FboControllerDocument"/>: shell UTF-8 + CSS IDE nhúng +
/// CSS controller + link asset tĩnh (virtual host Program) + thân Form/Grid. KHÔNG nhúng script controller,
/// KHÔNG .axd — chỉ render tĩnh. (Thân Form/Grid được điền ở Task 3–6; hiện shell + asset đã đủ.)
/// </summary>
public sealed class DesignHtmlGenerator : IDesignHtmlGenerator
{
    /// <summary>Virtual host WebView2 map tới Program root (UI DesignWebViewHost map tương ứng).</summary>
    public const string ProgramVirtualHost = "devworkflow.program";

    /// <summary>Virtual host WebView2 map tới Config root (ảnh CSS pack: image/fbo-*.png, Toolbar.gif…).</summary>
    public const string ConfigVirtualHost = "devworkflow.config";

    private static readonly string IdeCss = LoadEmbeddedCss();

    public DesignDocument Generate(DesignRenderRequest request)
    {
        var body = BuildBody(request);
        var html = BuildShell(request, body);
        return new DesignDocument(
            html,
            request.Document.ControllerName,
            request.Assets,
            []);
    }

    private static readonly DesignFormHtmlBuilder FormBuilder = new();
    private static readonly DesignGridHtmlBuilder GridBuilder = new();

    /// <summary>Chọn builder theo loại controller và render thân (Form: nhúng detail đã render sẵn).</summary>
    private static string BuildBody(DesignRenderRequest request)
    {
        var document = request.Document;

        var css_toolbar_classes = DesignControllerCssRewriter.ClassesWithBackgroundImage(
            request.Document.CssText);

        // Detail Grid nhúng Form: CSS toolbar có thể nằm trên file Grid Detail.
        foreach (var detail in request.DetailDocuments.Values)
            css_toolbar_classes.UnionWith(
                DesignControllerCssRewriter.ClassesWithBackgroundImage(detail.CssText));

        if (document.DisplayKind == ControllerDisplayKind.Grid && document.Grid is not null)
            return GridBuilder.Build(
                document.Grid,
                request.Vietnamese,
                request.GridPlaceholderRows,
                detail_mode: document.Grid.IsDetail,
                images: request.ImageBundle,
                css_toolbar_classes: css_toolbar_classes);

        if (document.Form is not null)
        {
            var options = new FboOptionsCatalog();
            return FormBuilder.Build(
                document.Form,
                request.Vietnamese,
                options,
                request.FieldIdentities,
                request.DetailDocuments,
                request.GridPlaceholderRows,
                request.ImageBundle,
                css_toolbar_classes);
        }

        return string.Empty;
    }

    private static string BuildShell(DesignRenderRequest request, string body)
    {
        var controller = DesignHtmlEncoder.Attribute(request.Document.ControllerName);
        var sb = new StringBuilder(4096);
        sb.Append("<!doctype html>\n<html lang=\"");
        sb.Append(request.Vietnamese ? "vi" : "en");
        sb.Append("\">\n<head>\n<meta charset=\"utf-8\">\n");
        sb.Append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");

        foreach (var css in request.Assets.Stylesheets)
            sb.Append("<link rel=\"stylesheet\" href=\"").Append(AssetUrl(css)).Append("\">\n");
        foreach (var script in request.Assets.Scripts)
            sb.Append("<script src=\"").Append(AssetUrl(script)).Append("\"></script>\n");

        sb.Append("<style data-dwf-source=\"ide\">\n").Append(IdeCss).Append("\n</style>\n");

        foreach (var pack in SelectConfigPacks(request))
        {
            if (string.IsNullOrWhiteSpace(pack.CssText)) continue;
            sb.Append("<style data-dwf-source=\"config\" data-dwf-pack=\"")
              .Append(DesignHtmlEncoder.Attribute(pack.Id))
              .Append("\">\n")
              .Append(pack.CssText)
              .Append("\n</style>\n");
        }

        if (!string.IsNullOrWhiteSpace(request.Document.CssText))
        {
            sb.Append("<style data-dwf-source=\"controller\">\n")
              .Append(DesignControllerCssRewriter.Rewrite(request.Document.CssText))
              .Append("\n</style>\n");
        }

        // CSS của Grid Detail nhúng Form (vd. div.Download → Program/Images).
        foreach (var (name, detail) in request.DetailDocuments)
        {
            if (string.IsNullOrWhiteSpace(detail.CssText)) continue;
            sb.Append("<style data-dwf-source=\"controller-detail\" data-dwf-controller=\"")
              .Append(DesignHtmlEncoder.Attribute(name))
              .Append("\">\n")
              .Append(DesignControllerCssRewriter.Rewrite(detail.CssText))
              .Append("\n</style>\n");
        }

        sb.Append("</head>\n<body>\n<div class=\"DwfDesignRoot\" data-dwf-controller=\"")
          .Append(controller).Append("\">\n");
        sb.Append(body);
        sb.Append("\n</div>\n").Append(TabScript).Append("\n</body>\n</html>");
        return sb.ToString();
    }

    /// <summary>
    /// Cascade sau IDE baseline: lọc pack theo DisplayKind / categories / detail / toolbar / controller.
    /// </summary>
    internal static IEnumerable<DesignCssPack> SelectConfigPacks(DesignRenderRequest request)
    {
        var bundle = request.CssBundle ?? DesignCssBundle.Empty;
        if (bundle.Packs.Count == 0) yield break;

        var kind = request.Document.DisplayKind == ControllerDisplayKind.Grid ? "Grid" : "Form";
        var controller = request.Document.ControllerName ?? string.Empty;
        var has_categories = request.Document.Form?.Layout?.HasTabCategories == true;
        var has_detail = request.DetailDocuments.Count > 0;
        var has_toolbar = request.Document.Grid?.Toolbar.Count > 0;
        var has_detail_toolbar = request.DetailDocuments.Values
            .Any(d => d.Grid?.Toolbar.Count > 0);

        foreach (var pack in bundle.Packs.OrderBy(p => p.Order).ThenBy(p => p.Id, StringComparer.OrdinalIgnoreCase))
        {
            if (!MatchesDisplayKind(pack, kind)) continue;
            if (pack.RequireCategories && !has_categories) continue;
            if (pack.RequireDetailGrid && !has_detail) continue;
            if (pack.RequireToolbar && !has_toolbar && !has_detail_toolbar) continue;
            if (!MatchesController(pack, controller)) continue;
            yield return pack;
        }
    }

    private static bool MatchesDisplayKind(DesignCssPack pack, string kind)
    {
        if (pack.DisplayKinds is null || pack.DisplayKinds.Count == 0) return true;
        return pack.DisplayKinds.Any(k =>
            string.Equals(k, kind, StringComparison.OrdinalIgnoreCase)
            || k == "*");
    }

    private static bool MatchesController(DesignCssPack pack, string controller)
    {
        var excludes = pack.ExcludeControllers;
        if (excludes is { Count: > 0 }
            && excludes.Any(x => string.Equals(x, controller, StringComparison.OrdinalIgnoreCase)))
            return false;

        var includes = pack.Controllers;
        if (includes is null || includes.Count == 0) return true;
        if (includes.Any(x => x == "*")) return true;
        return includes.Any(x => string.Equals(x, controller, StringComparison.OrdinalIgnoreCase));
    }

    /// <summary>Rewrite path tĩnh relative → URL virtual host Program. Escape để không vỡ attribute.</summary>
    private static string AssetUrl(string relative_path) =>
        $"https://{ProgramVirtualHost}/{DesignHtmlEncoder.Attribute(relative_path.TrimStart('/'))}";

    // Script duy nhất được nhúng: chuyển tab do IDE sở hữu (không phụ thuộc runtime FBO).
    private const string TabScript = """
        <script>
        document.addEventListener('click', function (event) {
          const button = event.target.closest('.DwfTabButton');
          if (!button) return;
          const root = button.closest('.DwfTabs');
          root.querySelectorAll('.DwfTabButton').forEach(x => x.setAttribute('aria-selected', 'false'));
          root.querySelectorAll('.DwfTabPanel').forEach(x => x.classList.remove('DwfActive'));
          button.setAttribute('aria-selected', 'true');
          document.getElementById(button.dataset.target)?.classList.add('DwfActive');
        });
        </script>
        """;

    private static string LoadEmbeddedCss()
    {
        var assembly = typeof(DesignHtmlGenerator).Assembly;
        var name = Array.Find(
            assembly.GetManifestResourceNames(),
            n => n.EndsWith("fbo-design-minimal.css", StringComparison.OrdinalIgnoreCase));
        if (name is null) return string.Empty;

        using var stream = assembly.GetManifestResourceStream(name);
        if (stream is null) return string.Empty;
        using var reader = new StreamReader(stream, Encoding.UTF8);
        return reader.ReadToEnd();
    }
}
