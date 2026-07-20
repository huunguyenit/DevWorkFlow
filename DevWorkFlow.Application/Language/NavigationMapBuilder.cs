using System.Text.RegularExpressions;
using DevWorkFlow.Application.Language.Schema;
using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Xây DocumentModel + NavigationMap generic từ cây XML (Syntax AST) theo XSD schema.
///
/// Nguyên tắc (cấu trúc XML FBO cố định):
/// - Outline = ánh xạ 1-1 cây element; tên node = attribute định danh theo <see cref="XsdSchemaCatalog"/>.
/// - Symbol gắn theo StartOffset (khớp Semantic Model) → GoToDefinition / References / Designer.
/// - Ngoại lệ duy nhất: &lt;script&gt; chứa JS → tách function thành node con.
/// - Editor chỉ nhận NodeId/Symbol → NavigationTarget; không parse XML từ UI.
/// </summary>
public static class NavigationMapBuilder
{
    private static readonly Regex EntityRefRegex = new(
        @"&(?<name>[A-Za-z_][\w.\-]*)\s*;",
        RegexOptions.Compiled | RegexOptions.CultureInvariant);

    private static readonly Regex FunctionRegex = new(
        @"function\s+(?<name>[A-Za-z_$][\w$]*)",
        RegexOptions.Compiled | RegexOptions.CultureInvariant);

    // Element định danh, lặp lại — hiển thị nhưng không đệ quy sâu (nội dung là cosmetic/body).
    private static readonly HashSet<string> LeafElements = new(StringComparer.OrdinalIgnoreCase)
    {
        "field", "view", "command", "action", "item", "category", "title"
    };

    // Element chỉ chứa body text (SQL/JS/CSS/caption) — không hiện thành node riêng.
    private static readonly HashSet<string> HiddenElements = new(StringComparer.OrdinalIgnoreCase)
    {
        "text", "header", "footer", "label"
    };

    private const int MaxDepth = 5;

    public static NavigationMap Build(IErpDocument document)
    {
        var semantic = document.SemanticModel;
        var uri = document.Path;
        var doc_key = document.Id.Value;
        var source = document.Snapshot.RawText ?? string.Empty;

        var ctx = new BuildContext
        {
            DocKey = doc_key,
            Source = source,
            SymbolByOffset = IndexSymbolsByOffset(semantic),
            EntitiesByName = semantic.GetEntities()
                .GroupBy(e => e.Name, StringComparer.OrdinalIgnoreCase)
                .ToDictionary(g => g.Key, g => g.First(), StringComparer.OrdinalIgnoreCase)
        };

        var controller = semantic.Controller
                         ?? semantic.Symbols.OfType<ControllerSymbol>().FirstOrDefault();

        var root_id = NodeId.FromStableKey($"{doc_key}|root");
        var root_element = FindRootElement(document.SyntaxTree);

        var root_children = new List<DocumentNode>();
        if (root_element is not null)
        {
            var index = 0;
            foreach (var child in root_element.Children.Where(c => c.Kind == SyntaxKind.Element))
            {
                var node = BuildNode(child, root_id, $"{child.Name}#{index++}", depth: 1, ctx);
                if (node is not null)
                    root_children.Add(node);
            }
        }

        // Entity (DTD) — không nằm trong cây element; thêm section tổng hợp từ Semantic.
        var entities_section = BuildEntitiesSection(semantic, doc_key, root_id, ctx);
        if (entities_section is not null)
            root_children.Add(entities_section);

        var controller_name = controller?.DisplayName
                              ?? controller?.Name
                              ?? root_element?.Name
                              ?? Path.GetFileName(uri)
                              ?? "Document";

        var root_span = root_element?.Span
                        ?? controller?.Definition.Span
                        ?? default;

        var root = new DocumentNode
        {
            Id = root_id,
            ParentId = NodeId.Empty,
            NodeType = root_element?.Name ?? "controller",
            StartOffset = root_span.StartOffset,
            EndOffset = root_span.IsEmpty ? root_span.StartOffset : root_span.EndOffset,
            StartLine = root_element?.StartLine ?? controller?.Definition.Line ?? 1,
            EndLine = root_element?.EndLine ?? 1,
            SymbolId = controller?.Id,
            DisplayName = controller_name,
            Children = root_children
        };
        ctx.ById[root_id] = root;
        ctx.ParentOf[root_id] = NodeId.Empty;
        if (controller is not null)
            ctx.SymbolToNode.TryAdd(controller.Id, root_id);

        var model = new DocumentModel
        {
            DocumentId = document.Id,
            DocumentUri = uri,
            Root = root
        };

        return new NavigationMap(model, ctx.ById, ctx.SymbolToNode, ctx.ParentOf, semantic);
    }

    /// <summary>
    /// Navigation Map cho Insight mode: dựng từ projection ClearText (entity đã expand) thay vì
    /// source XML. Nội dung tham chiếu &amp;Entity; trong body &lt;command&gt;/&lt;query&gt;/
    /// &lt;response&gt;/&lt;action&gt; nay là cây con thật nên hiện thành node Outline; offset lấy
    /// trực tiếp từ syntax tree của ClearText → khớp buffer Insight đang hiển thị (không cần
    /// ClearTextOffsetMap). Không map symbol theo offset (offset ClearText ≠ offset semantic
    /// vốn tính trên source) — Outline Insight ưu tiên cấu trúc + điều hướng đúng vị trí.
    /// </summary>
    public static NavigationMap BuildInsight(IErpDocument document)
    {
        var semantic = document.SemanticModel;
        var uri = document.Path;
        var doc_key = document.Id.Value;
        var text = document.GetProjection(ErpProjectionKind.ClearText).Text ?? string.Empty;

        ISyntaxTree? tree;
        try
        {
            tree = FboSyntaxParser.Parse(text, uri);
        }
        catch
        {
            tree = document.SyntaxTree;
        }

        var ctx = new InsightContext { DocKey = doc_key, Text = text };

        var controller = semantic.Controller
                         ?? semantic.Symbols.OfType<ControllerSymbol>().FirstOrDefault();

        var root_id = NodeId.FromStableKey($"{doc_key}|insight|root");
        var root_element = FindRootElement(tree);

        var root_children = new List<DocumentNode>();
        if (root_element is not null)
        {
            var index = 0;
            foreach (var child in root_element.Children.Where(IsStructuralElement))
                root_children.Add(BuildInsightNode(child, root_id, $"{child.Name}#{index++}", depth: 1, ctx));
        }

        var root_span = root_element?.Span ?? default;
        var controller_name = controller?.DisplayName
                              ?? controller?.Name
                              ?? root_element?.Name
                              ?? Path.GetFileName(uri)
                              ?? "Document";

        var root = new DocumentNode
        {
            Id = root_id,
            ParentId = NodeId.Empty,
            NodeType = root_element?.Name ?? "controller",
            StartOffset = root_span.StartOffset,
            EndOffset = root_span.IsEmpty ? root_span.StartOffset : root_span.EndOffset,
            StartLine = root_element?.StartLine ?? 1,
            EndLine = root_element?.EndLine ?? 1,
            DisplayName = controller_name,
            UsesClearTextOffsets = true,
            Children = root_children
        };
        ctx.ById[root_id] = root;
        ctx.ParentOf[root_id] = NodeId.Empty;

        var model = new DocumentModel
        {
            DocumentId = document.Id,
            DocumentUri = uri,
            Root = root
        };

        return new NavigationMap(model, ctx.ById, ctx.SymbolToNode, ctx.ParentOf, semantic);
    }

    private static DocumentNode BuildInsightNode(
        SyntaxNode element,
        NodeId parent_id,
        string key,
        int depth,
        InsightContext ctx)
    {
        var name = element.Name;
        var node_id = NodeId.FromStableKey($"{ctx.DocKey}|insight|nav:{key}");
        var is_script = name.Equals("script", StringComparison.OrdinalIgnoreCase);
        var display = BuildDisplayName(element, name);

        // Body của command/query/response/action/script là ISLAND (SQL/JS), không phải element con
        // — nội dung entity đã expand nằm TRONG island. Để lên Outline phải parse text island như
        // fragment (offset con = start island + offset trong fragment → khớp ClearText tuyệt đối).
        var script_island = element.Children.FirstOrDefault(c => c.Kind == SyntaxKind.ScriptIsland);
        var sql_island = element.Children.FirstOrDefault(c => c.Kind == SyntaxKind.SqlIsland);

        List<DocumentNode> children = [];
        if (script_island is not null)
        {
            children = BuildInsightScriptFunctions(element, node_id, key, ctx);
        }
        else if (depth < MaxDepth)
        {
            // KHÔNG chặn LeafElements như source builder: giá trị của Insight Outline là thấy
            // cấu trúc đã expand bên trong command/action/... (HiddenElements vẫn bị lọc).
            var ci = 0;
            foreach (var child in element.Children.Where(IsStructuralElement))
                children.Add(BuildInsightNode(child, node_id, $"{key}/{child.Name}#{ci++}", depth + 1, ctx));

            // SQL island có nội dung XML (entity expand thành <field>/<action>/...) → parse fragment.
            if (sql_island is not null)
                children.AddRange(BuildInsightIslandChildren(
                    sql_island.Span.StartOffset, sql_island.Span.Length, node_id, key, depth, ctx));
        }

        var prefer_caret = is_script;
        var end_offset = prefer_caret || element.Span.IsEmpty
            ? element.Span.StartOffset
            : element.Span.EndOffset;

        var node = new DocumentNode
        {
            Id = node_id,
            ParentId = parent_id,
            NodeType = name,
            StartOffset = element.Span.StartOffset,
            EndOffset = end_offset,
            StartLine = element.StartLine,
            EndLine = prefer_caret ? element.StartLine : element.EndLine,
            DisplayName = display,
            PreferCaretOnly = prefer_caret,
            UsesClearTextOffsets = true,
            Children = children
        };
        ctx.ById[node_id] = node;
        ctx.ParentOf[node_id] = parent_id;
        return node;
    }

    private static List<DocumentNode> BuildInsightScriptFunctions(
        SyntaxNode script_element,
        NodeId parent_id,
        string key,
        InsightContext ctx)
    {
        var island = script_element.Children
            .FirstOrDefault(c => c.Kind == SyntaxKind.ScriptIsland);
        var result = new List<DocumentNode>();
        if (island is null) return result;

        var index = 0;
        foreach (var fn in island.Children.Where(c =>
                     c.Kind == SyntaxKind.ScriptIsland && c.Qualifier == "function"))
        {
            var node_id = NodeId.FromStableKey($"{ctx.DocKey}|insight|nav:{key}/fn#{index++}");
            var node = new DocumentNode
            {
                Id = node_id,
                ParentId = parent_id,
                NodeType = "function",
                StartOffset = fn.Span.StartOffset,
                EndOffset = fn.Span.StartOffset,
                StartLine = fn.StartLine,
                EndLine = fn.StartLine,
                DisplayName = fn.Name,
                PreferCaretOnly = true,
                UsesClearTextOffsets = true,
                Children = []
            };
            ctx.ById[node_id] = node;
            ctx.ParentOf[node_id] = parent_id;
            result.Add(node);
        }

        return result;
    }

    /// <summary>
    /// Parse nội dung một SQL island (đã expand entity) như fragment XML. <paramref name="base_offset"/>
    /// là offset TUYỆT ĐỐI của island trong ClearText → offset con = base + offset-trong-fragment.
    /// Island không phải XML (SQL thuần) → không có node con.
    /// </summary>
    private static List<DocumentNode> BuildInsightIslandChildren(
        int base_offset,
        int length,
        NodeId parent_id,
        string key,
        int depth,
        InsightContext ctx)
    {
        if (base_offset < 0 || length <= 0 || base_offset + length > ctx.Text.Length)
            return [];

        var content = ctx.Text.Substring(base_offset, length);
        if (content.TrimStart().FirstOrDefault() != '<') return [];

        ISyntaxTree tree;
        try
        {
            tree = FboSyntaxParser.Parse(content, "insight-island");
        }
        catch
        {
            return [];
        }

        var list = new List<DocumentNode>();
        var index = 0;
        foreach (var el in tree.Root.Children.Where(IsStructuralElement))
            list.Add(BuildInsightFragmentNode(el, parent_id, $"{key}/isl#{index++}", base_offset, depth + 1, ctx));

        return list;
    }

    private static DocumentNode BuildInsightFragmentNode(
        SyntaxNode el,
        NodeId parent_id,
        string key,
        int base_offset,
        int depth,
        InsightContext ctx)
    {
        var node_id = NodeId.FromStableKey($"{ctx.DocKey}|insight|nav:frag:{key}");
        var display = BuildDisplayName(el, el.Name);
        var abs_start = base_offset + el.Span.StartOffset;
        var abs_end = el.Span.IsEmpty ? abs_start : base_offset + el.Span.EndOffset;

        var children = new List<DocumentNode>();
        if (depth < MaxDepth)
        {
            var ci = 0;
            foreach (var child in el.Children.Where(IsStructuralElement))
                children.Add(BuildInsightFragmentNode(child, node_id, $"{key}/{ci++}", base_offset, depth + 1, ctx));

            // Fragment con cũng có thể là island (vd <action> chứa <text>… hay entity lồng) —
            // island.Span tính TƯƠNG ĐỐI trong fragment nên offset tuyệt đối = base + island.Start.
            var island = el.Children.FirstOrDefault(c => c.Kind == SyntaxKind.SqlIsland);
            if (island is not null)
                children.AddRange(BuildInsightIslandChildren(
                    base_offset + island.Span.StartOffset, island.Span.Length, node_id, key, depth, ctx));
        }

        var node = new DocumentNode
        {
            Id = node_id,
            ParentId = parent_id,
            NodeType = el.Name,
            StartOffset = abs_start,
            EndOffset = abs_end,
            StartLine = 0,
            EndLine = 0,
            DisplayName = display,
            PreferCaretOnly = true,
            UsesClearTextOffsets = true,
            Children = children
        };
        ctx.ById[node_id] = node;
        ctx.ParentOf[node_id] = parent_id;
        return node;
    }

    private static DocumentNode? BuildNode(
        SyntaxNode element,
        NodeId parent_id,
        string key,
        int depth,
        BuildContext ctx)
    {
        var name = element.Name;
        if (string.IsNullOrWhiteSpace(name)) return null;

        var node_id = NodeId.FromStableKey($"{ctx.DocKey}|nav:{key}");
        var is_script = name.Equals("script", StringComparison.OrdinalIgnoreCase);

        var (symbol, symbol_id) = ResolveSymbol(element, ctx);
        var display = BuildDisplayName(element, name);

        var prefer_caret = is_script;
        List<DocumentNode> children;

        if (is_script)
        {
            children = BuildScriptFunctions(element, node_id, key, ctx);
        }
        else if (depth < MaxDepth && !LeafElements.Contains(name))
        {
            children = [];
            var ci = 0;
            foreach (var child in element.Children.Where(IsStructuralElement))
            {
                var child_node = BuildNode(child, node_id, $"{key}/{child.Name}#{ci++}", depth + 1, ctx);
                if (child_node is not null)
                    children.Add(child_node);
            }

            // Element chỉ chứa entity ref (vd. <response>&XMLSuggestion;</response>) → mở rộng.
            if (children.Count == 0)
                children = BuildEntityRefChildren(element, node_id, key, ctx);
        }
        else
        {
            children = [];
        }

        var end_offset = prefer_caret || element.Span.IsEmpty
            ? element.Span.StartOffset
            : element.Span.EndOffset;

        var node = new DocumentNode
        {
            Id = node_id,
            ParentId = parent_id,
            NodeType = name,
            StartOffset = element.Span.StartOffset,
            EndOffset = end_offset,
            StartLine = element.StartLine,
            EndLine = prefer_caret ? element.StartLine : element.EndLine,
            SymbolId = symbol_id,
            DisplayName = display,
            PreferCaretOnly = prefer_caret,
            Children = children
        };

        ctx.ById[node_id] = node;
        ctx.ParentOf[node_id] = parent_id;
        if (symbol_id is not null)
            ctx.SymbolToNode.TryAdd(symbol_id, node_id);

        _ = symbol;
        return node;
    }

    private static List<DocumentNode> BuildScriptFunctions(
        SyntaxNode script_element,
        NodeId parent_id,
        string key,
        BuildContext ctx)
    {
        var island = script_element.Children
            .FirstOrDefault(c => c.Kind == SyntaxKind.ScriptIsland);
        var result = new List<DocumentNode>();
        if (island is null) return result;

        var index = 0;
        foreach (var fn in island.Children.Where(c =>
                     c.Kind == SyntaxKind.ScriptIsland && c.Qualifier == "function"))
        {
            var node_id = NodeId.FromStableKey($"{ctx.DocKey}|nav:{key}/fn#{index++}");
            var (_, symbol_id) = ResolveSymbolByOffset(fn.Span.StartOffset, ctx);

            var node = new DocumentNode
            {
                Id = node_id,
                ParentId = parent_id,
                NodeType = "function",
                StartOffset = fn.Span.StartOffset,
                EndOffset = fn.Span.StartOffset,
                StartLine = fn.StartLine,
                EndLine = fn.StartLine,
                SymbolId = symbol_id,
                DisplayName = fn.Name,
                PreferCaretOnly = true,
                Children = []
            };
            ctx.ById[node_id] = node;
            ctx.ParentOf[node_id] = parent_id;
            if (symbol_id is not null)
                ctx.SymbolToNode.TryAdd(symbol_id, node_id);
            result.Add(node);
        }

        return result;
    }

    private static List<DocumentNode> BuildEntityRefChildren(
        SyntaxNode element,
        NodeId parent_id,
        string key,
        BuildContext ctx)
    {
        var span = element.Span;
        if (span.IsEmpty || span.StartOffset < 0 || span.EndOffset > ctx.Source.Length)
            return [];

        var body = ctx.Source.Substring(span.StartOffset, span.Length);
        var children = new List<DocumentNode>();
        var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        foreach (Match match in EntityRefRegex.Matches(body))
        {
            var name = match.Groups["name"].Value;
            if (!seen.Add(name)) continue;
            if (!ctx.EntitiesByName.TryGetValue(name, out var entity)) continue;

            var nested = BuildFragmentChildren(
                entity.RawValue,
                parent_id,
                $"{key}/ent:{name}",
                span.StartOffset,
                ctx,
                depth: 0);

            if (nested.Count > 0)
            {
                children.AddRange(nested);
                continue;
            }

            // Entity không phải XML — vẫn hiện tên để Outline/filter thấy.
            var ref_id = NodeId.FromStableKey($"{ctx.DocKey}|nav:{key}/entref:{name}");
            var ref_node = new DocumentNode
            {
                Id = ref_id,
                ParentId = parent_id,
                NodeType = "entityRef",
                StartOffset = span.StartOffset,
                EndOffset = span.StartOffset,
                StartLine = element.StartLine,
                EndLine = element.StartLine,
                SymbolId = entity.Id,
                DisplayName = $"&{name};",
                PreferCaretOnly = true,
                Children = []
            };
            ctx.ById[ref_id] = ref_node;
            ctx.ParentOf[ref_id] = parent_id;
            children.Add(ref_node);
        }

        return children;
    }

    private static List<DocumentNode> BuildFragmentChildren(
        string? fragment,
        NodeId parent_id,
        string key,
        int navigate_offset,
        BuildContext ctx,
        int depth)
    {
        if (string.IsNullOrWhiteSpace(fragment)) return [];
        var trimmed = fragment.TrimStart();
        if (trimmed.Length == 0 || trimmed[0] != '<') return [];

        ISyntaxTree tree;
        try
        {
            tree = FboSyntaxParser.Parse(fragment, "entity-fragment");
        }
        catch
        {
            return [];
        }

        var roots = tree.Root.Children.Where(IsStructuralElement).ToList();
        var list = new List<DocumentNode>();
        var index = 0;
        foreach (var el in roots)
            list.Add(BuildFragmentNode(el, parent_id, $"{key}#{index++}", navigate_offset, ctx, depth));

        return list;
    }

    private static DocumentNode BuildFragmentNode(
        SyntaxNode el,
        NodeId parent_id,
        string key,
        int navigate_offset,
        BuildContext ctx,
        int depth)
    {
        var node_id = NodeId.FromStableKey($"{ctx.DocKey}|nav:frag:{key}");
        var display = BuildDisplayName(el, el.Name);

        var children = new List<DocumentNode>();
        if (depth < 2)
        {
            var ci = 0;
            foreach (var child in el.Children.Where(IsStructuralElement))
                children.Add(BuildFragmentNode(child, node_id, $"{key}/{ci++}", navigate_offset, ctx, depth + 1));
        }

        var node = new DocumentNode
        {
            Id = node_id,
            ParentId = parent_id,
            NodeType = el.Name,
            StartOffset = navigate_offset,
            EndOffset = navigate_offset,
            StartLine = 0,
            EndLine = 0,
            DisplayName = display,
            PreferCaretOnly = true,
            Children = children
        };
        ctx.ById[node_id] = node;
        ctx.ParentOf[node_id] = parent_id;
        return node;
    }

    private static DocumentNode? BuildEntitiesSection(
        IErpSemanticModel semantic,
        string doc_key,
        NodeId root_id,
        BuildContext ctx)
    {
        var entities = semantic.GetEntities();
        if (entities.Count == 0) return null;

        var section_id = NodeId.FromStableKey($"{doc_key}|nav:entities");
        var children = new List<DocumentNode>();

        foreach (var entity in entities)
        {
            var node_id = NodeId.FromStableKey($"{doc_key}|nav:entity:{entity.Id}");
            var def = entity.Definition.Span;
            var node = new DocumentNode
            {
                Id = node_id,
                ParentId = section_id,
                NodeType = "entity",
                StartOffset = def.StartOffset,
                EndOffset = def.IsEmpty ? def.StartOffset : def.EndOffset,
                StartLine = entity.Definition.Line,
                EndLine = entity.Definition.Line,
                SymbolId = entity.Id,
                DisplayName = entity.Name,
                Children = []
            };
            ctx.ById[node_id] = node;
            ctx.ParentOf[node_id] = section_id;
            ctx.SymbolToNode.TryAdd(entity.Id, node_id);
            children.Add(node);
        }

        var start = children.Count == 0 ? 0 : children.Min(c => c.StartOffset);
        var section = new DocumentNode
        {
            Id = section_id,
            ParentId = root_id,
            NodeType = "entities",
            StartOffset = start,
            EndOffset = start,
            StartLine = children.Count == 0 ? 0 : children.Min(c => c.StartLine),
            EndLine = 0,
            DisplayName = "entities",
            PreferCaretOnly = true,
            Children = children
        };
        ctx.ById[section_id] = section;
        ctx.ParentOf[section_id] = root_id;
        return section;
    }

    private static (ErpSymbol? Symbol, string? SymbolId) ResolveSymbol(
        SyntaxNode element,
        BuildContext ctx) =>
        ResolveSymbolByOffset(element.Span.StartOffset, ctx);

    private static (ErpSymbol? Symbol, string? SymbolId) ResolveSymbolByOffset(
        int offset,
        BuildContext ctx) =>
        ctx.SymbolByOffset.TryGetValue(offset, out var symbol)
            ? (symbol, symbol.Id)
            : (null, null);

    private static string BuildDisplayName(SyntaxNode element, string element_name)
    {
        var tag = element.DirectTokens.FirstOrDefault(t =>
            t.Kind is SyntaxKind.StartTag or SyntaxKind.EmptyElementTag)?.Text;

        if (string.IsNullOrEmpty(tag))
            return string.IsNullOrWhiteSpace(element.Qualifier) ? element_name : element.Qualifier!;

        var identity_attr = XsdSchemaCatalog.GetIdentityAttribute(element_name);
        if (!string.IsNullOrWhiteSpace(identity_attr))
        {
            var value = ReadAttribute(tag, identity_attr);
            if (!string.IsNullOrWhiteSpace(value))
                return value;
        }

        foreach (var fallback in XsdSchemaCatalog.FallbackIdentityAttributes)
        {
            var value = ReadAttribute(tag, fallback);
            if (!string.IsNullOrWhiteSpace(value))
                return value;
        }

        return string.IsNullOrWhiteSpace(element.Qualifier) ? element_name : element.Qualifier!;
    }

    private static string? ReadAttribute(string tag_text, string attribute)
    {
        var regex = new Regex(
            $@"\b{Regex.Escape(attribute)}\s*=\s*[""'](?<v>[^""']*)[""']",
            RegexOptions.IgnoreCase);
        var match = regex.Match(tag_text);
        return match.Success ? match.Groups["v"].Value : null;
    }

    private static Dictionary<int, ErpSymbol> IndexSymbolsByOffset(IErpSemanticModel semantic)
    {
        var map = new Dictionary<int, ErpSymbol>();
        foreach (var symbol in semantic.Symbols)
        {
            if (symbol.Kind == ErpSymbolKind.Controller) continue;
            var offset = symbol.Definition.Span.StartOffset;
            if (symbol.Definition.Span.IsEmpty && offset == 0) continue;
            map.TryAdd(offset, symbol);
        }
        return map;
    }

    private static bool IsStructuralElement(SyntaxNode node) =>
        node.Kind == SyntaxKind.Element
        && !string.IsNullOrWhiteSpace(node.Name)
        && !HiddenElements.Contains(node.Name);

    private static SyntaxNode? FindRootElement(ISyntaxTree? tree)
    {
        if (tree is null) return null;
        if (tree.Root.Kind == SyntaxKind.Element
            && !string.IsNullOrWhiteSpace(tree.Root.Name)
            && tree.Root.Name != "(document)")
            return tree.Root;

        return tree.Root.Children.FirstOrDefault(c => c.Kind == SyntaxKind.Element);
    }

    private sealed class BuildContext
    {
        public required string DocKey { get; init; }
        public required string Source { get; init; }
        public required Dictionary<int, ErpSymbol> SymbolByOffset { get; init; }
        public required Dictionary<string, EntitySymbol> EntitiesByName { get; init; }

        public Dictionary<NodeId, DocumentNode> ById { get; } = new();
        public Dictionary<string, NodeId> SymbolToNode { get; } =
            new(StringComparer.OrdinalIgnoreCase);
        public Dictionary<NodeId, NodeId> ParentOf { get; } = new();
    }

    /// <summary>Context nhẹ cho Insight map — không index symbol/entity (offset ClearText riêng).</summary>
    private sealed class InsightContext
    {
        public required string DocKey { get; init; }

        /// <summary>Text ClearText đang build — dùng để substring nội dung island.</summary>
        public required string Text { get; init; }

        public Dictionary<NodeId, DocumentNode> ById { get; } = new();
        public Dictionary<string, NodeId> SymbolToNode { get; } =
            new(StringComparer.OrdinalIgnoreCase);
        public Dictionary<NodeId, NodeId> ParentOf { get; } = new();
    }
}
