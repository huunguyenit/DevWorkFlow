using System.Text.RegularExpressions;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Quét XML/.f controller để tìm file liên quan:
/// - Dir: fields/field/items[@style=Grid]/controller → Grid
/// - script: showForm('Name') / showForm("Name") → Filter
/// </summary>
public static class ControllerRelatedFileResolver
{
    private static readonly Regex ItemsGridControllerRegex = new(
        @"<items\b[^>]*\bstyle\s*=\s*[""']Grid[""'][^>]*\bcontroller\s*=\s*[""'](?<ctrl>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex ItemsGridControllerRegexAlt = new(
        @"<items\b[^>]*\bcontroller\s*=\s*[""'](?<ctrl>[^""']+)[""'][^>]*\bstyle\s*=\s*[""']Grid[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>showForm('FilterName') / showForm("FilterName") — arg đầu là Filter.</summary>
    private static readonly Regex ShowFormRegex = new(
        @"showForm(?:\$\w+)?\s*\(\s*[""'](?<name>[A-Za-z_][\w.-]*)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public sealed record RelatedRef(string ControllerName, RelatedKind Kind);

    public enum RelatedKind
    {
        Grid,
        Filter
    }

    public static IReadOnlyList<RelatedRef> FindRelated(IErpDocument document) =>
        FindRelated(document.GetProjection(ErpProjectionKind.ClearText).Text);

    /// <summary>
    /// Nhận ClearText projection từ Language Service; không tự resolve entity.
    /// </summary>
    public static IReadOnlyList<RelatedRef> FindRelated(string clear_text)
    {
        if (string.IsNullOrWhiteSpace(clear_text))
            return [];

        var results = new List<RelatedRef>();
        var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        void add(string? raw, RelatedKind kind)
        {
            var name = raw?.Trim() ?? string.Empty;
            if (string.IsNullOrWhiteSpace(name)) return;
            var key = $"{kind}:{name}";
            if (!seen.Add(key)) return;
            results.Add(new RelatedRef(name, kind));
        }

        foreach (Match m in ItemsGridControllerRegex.Matches(clear_text))
            add(m.Groups["ctrl"].Value, RelatedKind.Grid);
        foreach (Match m in ItemsGridControllerRegexAlt.Matches(clear_text))
            add(m.Groups["ctrl"].Value, RelatedKind.Grid);

        foreach (Match m in ShowFormRegex.Matches(clear_text))
            add(m.Groups["name"].Value, RelatedKind.Filter);

        return results;
    }
}
