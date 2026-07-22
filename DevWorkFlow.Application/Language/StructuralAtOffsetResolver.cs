using System.Text.RegularExpressions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Hit-test cấu trúc XML tại offset source (Phase 2) — chạy SAU khi entity miss. Dùng lossless
/// syntax tree để xác định element sâu nhất chứa offset rồi phân nhánh:
/// clientScript → function; items@controller → Lookup; field (định nghĩa) → view chứa field.
/// KHÔNG parse XML thủ công ở UI — đây là Language Service.
/// </summary>
public static class StructuralAtOffsetResolver
{
    public static StructuralNavHit? TryResolve(
        IErpSemanticModel model,
        ISyntaxTree? syntax,
        string source_xml,
        int offset,
        string? controllers_path)
    {
        if (syntax is null || string.IsNullOrEmpty(source_xml)) return null;
        if (offset < 0 || offset >= source_xml.Length) return null;

        var ancestors = new List<SyntaxNode>();
        var element = FindDeepestElement(syntax.Root, offset, ancestors);
        if (element is null) return null;

        if (element.Name.Equals("clientScript", StringComparison.OrdinalIgnoreCase))
            return ResolveClientScript(model, source_xml, offset);

        if (element.Name.Equals("items", StringComparison.OrdinalIgnoreCase))
            return ResolveItemsController(element, source_xml, offset, controllers_path);

        if (element.Name.Equals("field", StringComparison.OrdinalIgnoreCase))
            return ResolveFieldToView(syntax.Root, element, ancestors, offset);

        return null;
    }

    // ── clientScript → function ─────────────────────────────────────────────
    private static StructuralNavHit? ResolveClientScript(
        IErpSemanticModel model, string source_xml, int offset)
    {
        var entity_values = model.GetEntities()
            .GroupBy(e => e.Name, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(
                g => g.Key,
                g => !string.IsNullOrEmpty(g.First().DisplayText)
                    ? g.First().DisplayText
                    : g.First().RawValue ?? string.Empty,
                StringComparer.OrdinalIgnoreCase);

        var name = ClientScriptFunctionName.TryExtract(source_xml, offset, entity_values);
        if (string.IsNullOrWhiteSpace(name)) return null;

        var def = XmlStructureParser.FindFunctionDefinition(source_xml, name);
        if (def is null) return null; // không có function → để chuỗi nav báo generic

        return new StructuralNavHit
        {
            Kind = StructuralNavKind.ClientScriptFunction,
            TargetOffset = def.Value.Offset,
            DisplayLabel = $"function {name}"
        };
    }

    // ── items@controller → Lookup ───────────────────────────────────────────
    private static StructuralNavHit? ResolveItemsController(
        SyntaxNode items, string source_xml, int offset, string? controllers_path)
    {
        var tag = StartTagToken(items);
        if (tag is null) return null;

        var match = Regex.Match(
            tag.Text, "controller\\s*=\\s*[\"'](?<v>[^\"']*)[\"']", RegexOptions.IgnoreCase);
        if (!match.Success) return null;

        var value_group = match.Groups["v"];
        var value_abs_start = tag.Span.StartOffset + value_group.Index;
        // Chỉ hit khi con trỏ nằm TRONG giá trị controller.
        if (offset < value_abs_start || offset >= value_abs_start + value_group.Length) return null;

        var controller_name = value_group.Value;
        if (string.IsNullOrWhiteSpace(controller_name)) return null;

        var path = LookupPathResolver.FindLookupFile(controllers_path, controller_name);
        return new StructuralNavHit
        {
            Kind = StructuralNavKind.ItemsController,
            TargetPath = path ?? string.Empty,
            DisplayLabel = path is null
                ? $"Không tìm thấy Lookup/{controller_name}"
                : $"Lookup: {controller_name}"
        };
    }

    // ── field (định nghĩa) → view chứa field ────────────────────────────────
    private static StructuralNavHit? ResolveFieldToView(
        SyntaxNode root, SyntaxNode field, IReadOnlyList<SyntaxNode> ancestors, int offset)
    {
        // Chỉ định nghĩa field (dưới <fields> hoặc trực tiếp) — KHÔNG phải field dùng trong view.
        if (ancestors.Any(a => a.Name.Equals("view", StringComparison.OrdinalIgnoreCase)))
            return null;

        var field_name = GetAttribute(field, "name");
        if (string.IsNullOrWhiteSpace(field_name)) return null;

        var view = FindFirstViewContainingField(root, field_name);
        if (view is null)
        {
            return new StructuralNavHit
            {
                Kind = StructuralNavKind.FieldToView,
                TargetOffset = -1,
                DisplayLabel = $"Field {field_name} chưa gắn vào view nào."
            };
        }

        var view_id = GetAttribute(view, "id") ?? GetAttribute(view, "name");
        return new StructuralNavHit
        {
            Kind = StructuralNavKind.FieldToView,
            TargetOffset = view.Span.StartOffset,
            DisplayLabel = string.IsNullOrWhiteSpace(view_id)
                ? $"View chứa field {field_name}"
                : $"View {view_id} · {field_name}"
        };
    }

    // ── Syntax tree helpers ─────────────────────────────────────────────────
    private static SyntaxNode? FindDeepestElement(
        SyntaxNode node, int offset, List<SyntaxNode> ancestors)
    {
        foreach (var child in node.Children)
        {
            if (child.Kind != SyntaxKind.Element) continue;
            if (offset < child.Span.StartOffset || offset >= child.Span.EndOffset) continue;
            ancestors.Add(node);
            return FindDeepestElement(child, offset, ancestors) ?? child;
        }
        return null;
    }

    private static SyntaxNode? FindFirstViewContainingField(SyntaxNode root, string field_name)
    {
        foreach (var view in EnumerateElements(root, "view"))
            if (HasDescendantField(view, field_name))
                return view;
        return null;
    }

    private static bool HasDescendantField(SyntaxNode node, string field_name)
    {
        foreach (var child in node.Children)
        {
            if (child.Kind != SyntaxKind.Element) continue;
            if (child.Name.Equals("field", StringComparison.OrdinalIgnoreCase)
                && string.Equals(GetAttribute(child, "name"), field_name, StringComparison.OrdinalIgnoreCase))
                return true;
            if (HasDescendantField(child, field_name))
                return true;
        }
        return false;
    }

    /// <summary>Pre-order (document order) mọi element tên <paramref name="name"/>.</summary>
    private static IEnumerable<SyntaxNode> EnumerateElements(SyntaxNode node, string name)
    {
        foreach (var child in node.Children)
        {
            if (child.Kind != SyntaxKind.Element) continue;
            if (child.Name.Equals(name, StringComparison.OrdinalIgnoreCase))
                yield return child;
            foreach (var descendant in EnumerateElements(child, name))
                yield return descendant;
        }
    }

    private static SyntaxToken? StartTagToken(SyntaxNode element) =>
        element.DirectTokens.FirstOrDefault(t =>
            t.Kind is SyntaxKind.StartTag or SyntaxKind.EmptyElementTag);

    private static string? GetAttribute(SyntaxNode element, string attribute)
    {
        var tag = StartTagToken(element)?.Text;
        if (string.IsNullOrEmpty(tag)) return null;
        var match = Regex.Match(
            tag, $"\\b{Regex.Escape(attribute)}\\s*=\\s*[\"'](?<v>[^\"']*)[\"']",
            RegexOptions.IgnoreCase);
        return match.Success ? match.Groups["v"].Value : null;
    }
}
