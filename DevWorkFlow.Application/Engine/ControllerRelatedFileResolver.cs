using System.Text.RegularExpressions;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Quét XML/.f controller để tìm file liên quan theo quy tắc FBO:
/// - Dir field filterSource=Tidy + items style=Grid → Grid/{controller}
/// - Dir/Grid script: x.showForm('XXX') → Filter/XXX
/// - Filter command event=Checking + uploadForm → Templates/Upload/{Controller}
/// - Report form reportFile / templateFile → Templates/Rpt|Excel
/// </summary>
public static class ControllerRelatedFileResolver
{
    /// <summary>
    /// field có filterSource="Tidy" và trong body có items style=Grid controller="…".
    /// </summary>
    private static readonly Regex FieldWithFilterSourceTidyRegex = new(
        @"<field\b(?<attrs>[^>]*)>(?<body>[\s\S]*?)</field\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex FilterSourceTidyAttrRegex = new(
        @"\bfilterSource\s*=\s*[""']Tidy[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex ItemsGridControllerRegex = new(
        @"<items\b[^>]*\bstyle\s*=\s*[""']Grid[""'][^>]*\bcontroller\s*=\s*[""'](?<ctrl>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex ItemsGridControllerRegexAlt = new(
        @"<items\b[^>]*\bcontroller\s*=\s*[""'](?<ctrl>[^""']+)[""'][^>]*\bstyle\s*=\s*[""']Grid[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>f.showForm('Name') / g.showForm("Name") — arg đầu là Filter.</summary>
    private static readonly Regex ShowFormRegex = new(
        @"\b\w+\s*\.\s*showForm(?:\$\w+)?\s*\(\s*[""'](?<name>[A-Za-z_][\w.-]*)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>command event="Checking" … </command> (kể cả CDATA).</summary>
    private static readonly Regex CheckingCommandRegex = new(
        @"<command\b(?=[^>]*\bevent\s*=\s*[""']Checking[""'])[^>]*>(?<body>[\s\S]*?)</command\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex UploadFormMarkerRegex = new(
        @"\$get\s*\(\s*[""']uploadForm[""']\s*\)|uploadForm",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex UploadControllerLiteralRegex = new(
        @"\bController\s*:\s*[""'](?<name>[A-Za-z_][\w.-]*)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex UploadControllerDynamicRegex = new(
        @"\bController\s*:\s*g\s*\.\s*_controller\b",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex ReportFileAttrRegex = new(
        @"\breportFile\s*=\s*[""'](?<name>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex TemplateFileAttrRegex = new(
        @"\btemplateFile\s*=\s*[""'](?<name>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public sealed record RelatedRef(string ControllerName, RelatedKind Kind);

    public enum RelatedKind
    {
        Grid,
        Filter,
        /// <summary>Templates/Upload/{name}.xml</summary>
        Upload,
        /// <summary>Templates/Upload theo g._controller (tên controller file đang quét).</summary>
        UploadFromParent,
        /// <summary>Templates/Excel/{name}.xlsx</summary>
        Excel,
        /// <summary>Templates/Rpt/{name}.rpt</summary>
        Rpt
    }

    public static IReadOnlyList<RelatedRef> FindRelated(IErpDocument document) =>
        FindRelated(document.GetProjection(ErpProjectionKind.ClearText).Text);

    /// <summary>
    /// Nhận ClearText projection từ Language Service; không tự resolve entity.
    /// </summary>
    public static IReadOnlyList<RelatedRef> FindRelated(string clear_text) =>
        FindRelated(clear_text, parent_controller: null);

    /// <param name="parent_controller">
    /// Tên controller của file đang quét — dùng khi Controller: g._controller.
    /// </param>
    public static IReadOnlyList<RelatedRef> FindRelated(string clear_text, string? parent_controller)
    {
        if (string.IsNullOrWhiteSpace(clear_text))
            return [];

        var results = new List<RelatedRef>();
        var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        void add(string? raw, RelatedKind kind)
        {
            var name = raw?.Trim() ?? string.Empty;
            if (string.IsNullOrWhiteSpace(name)) return;
            // Bỏ extension nếu vô tình kèm
            name = Path.GetFileNameWithoutExtension(name);
            if (string.IsNullOrWhiteSpace(name)) return;
            var key = $"{kind}:{name}";
            if (!seen.Add(key)) return;
            results.Add(new RelatedRef(name, kind));
        }

        CollectGridFromTidyFields(clear_text, add);
        CollectShowFormFilters(clear_text, add);
        CollectUploadFromChecking(clear_text, parent_controller, add);
        CollectReportForms(clear_text, add);

        return results;
    }

    private static void CollectGridFromTidyFields(string text, Action<string?, RelatedKind> add)
    {
        foreach (Match field in FieldWithFilterSourceTidyRegex.Matches(text))
        {
            var attrs = field.Groups["attrs"].Value;
            if (!FilterSourceTidyAttrRegex.IsMatch(attrs))
                continue;

            var body = field.Groups["body"].Value;
            foreach (Match m in ItemsGridControllerRegex.Matches(body))
                add(m.Groups["ctrl"].Value, RelatedKind.Grid);
            foreach (Match m in ItemsGridControllerRegexAlt.Matches(body))
                add(m.Groups["ctrl"].Value, RelatedKind.Grid);
        }
    }

    private static void CollectShowFormFilters(string text, Action<string?, RelatedKind> add)
    {
        foreach (Match m in ShowFormRegex.Matches(text))
            add(m.Groups["name"].Value, RelatedKind.Filter);
    }

    private static void CollectUploadFromChecking(
        string text,
        string? parent_controller,
        Action<string?, RelatedKind> add)
    {
        foreach (Match cmd in CheckingCommandRegex.Matches(text))
        {
            var body = cmd.Groups["body"].Value;
            if (!UploadFormMarkerRegex.IsMatch(body))
                continue;

            if (UploadControllerDynamicRegex.IsMatch(body))
            {
                if (!string.IsNullOrWhiteSpace(parent_controller))
                    add(parent_controller, RelatedKind.Upload);
                else
                    add("$Controller", RelatedKind.UploadFromParent);
            }

            foreach (Match m in UploadControllerLiteralRegex.Matches(body))
                add(m.Groups["name"].Value, RelatedKind.Upload);
        }
    }

    private static void CollectReportForms(string text, Action<string?, RelatedKind> add)
    {
        foreach (Match m in ReportFileAttrRegex.Matches(text))
            add(m.Groups["name"].Value, RelatedKind.Rpt);
        foreach (Match m in TemplateFileAttrRegex.Matches(text))
            add(m.Groups["name"].Value, RelatedKind.Excel);
    }
}
