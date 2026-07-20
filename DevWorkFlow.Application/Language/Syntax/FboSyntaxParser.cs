using System.Text.RegularExpressions;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language.Syntax;

/// <summary>
/// Parser lossless FBO XML từ token stream — error recovery (không throw).
/// </summary>
public static class FboSyntaxParser
{
    private static readonly Regex AttrNameRegex = new(
        @"\bname\s*=\s*[""'](?<v>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex AttrEventRegex = new(
        @"\bevent\s*=\s*[""'](?<v>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex AttrIdRegex = new(
        @"\bid\s*=\s*[""'](?<v>[^""']+)[""']",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex FunctionRegex = new(
        @"function\s+(?<name>[A-Za-z_$][\w$]*)",
        RegexOptions.Compiled);

    private static readonly Regex EntityNameRegex = new(
        @"<!ENTITY\s+(?:%\s+)?(?<name>[A-Za-z_][\w.-]*)",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>Parse source → <see cref="ISyntaxTree"/> (luôn trả về, kể cả XML lỗi).</summary>
    public static ISyntaxTree Parse(string? text, string? path = null)
    {
        text ??= string.Empty;
        var line_map = new LineMap(text);
        var tokens = FboLexer.Tokenize(text, line_map);
        var diagnostics = new List<ErpDiagnostic>();

        foreach (var t in tokens)
        {
            if (t.Kind != SyntaxKind.BadToken) continue;
            diagnostics.Add(new ErpDiagnostic
            {
                Id = "ERP1001",
                Severity = ErpDiagnosticSeverity.Warning,
                Message = "Cú pháp XML/FBO chưa hoàn chỉnh — đã recover.",
                Location = new SourceLocation
                {
                    Path = path ?? string.Empty,
                    Span = t.Span,
                    Line = t.Line,
                    Column = t.Column
                }
            });
        }

        var root = new SyntaxNode(SyntaxKind.Document, "(document)");
        var stack = new Stack<SyntaxNode>();
        stack.Push(root);

        var i = 0;
        while (i < tokens.Count)
        {
            var token = tokens[i];
            if (token.Kind == SyntaxKind.EndOfFile)
                break;

            switch (token.Kind)
            {
                case SyntaxKind.XmlDeclaration:
                case SyntaxKind.ProcessingInstruction:
                case SyntaxKind.Comment:
                case SyntaxKind.Whitespace:
                case SyntaxKind.Text:
                case SyntaxKind.CData:
                case SyntaxKind.BadToken:
                    AttachToken(stack.Peek(), token);
                    i++;
                    break;

                case SyntaxKind.DocType:
                    AttachDoctype(stack.Peek(), token, text);
                    i++;
                    break;

                case SyntaxKind.EntityDeclaration:
                    AttachEntityDecl(stack.Peek(), token);
                    i++;
                    break;

                case SyntaxKind.EmptyElementTag:
                {
                    var name = ExtractTagName(token.Text, is_end: false);
                    var el = new SyntaxNode(SyntaxKind.Element, name)
                    {
                        Qualifier = PickQualifier(token.Text)
                    };
                    el.AddToken(token);
                    el.Seal(token.Span, token.Line, token.Line);
                    stack.Peek().AddChild(el);
                    i++;
                    break;
                }

                    case SyntaxKind.StartTag:
                {
                    var name = ExtractTagName(token.Text, is_end: false);
                    var el = new SyntaxNode(SyntaxKind.Element, name)
                    {
                        Qualifier = PickQualifier(token.Text)
                    };
                    el.AddToken(token);

                    stack.Peek().AddChild(el);
                    stack.Push(el);
                    i++;

                    // Script / command / query islands
                    if (name.Equals("script", StringComparison.OrdinalIgnoreCase))
                        i = ParseIsland(tokens, i, stack, el, SyntaxKind.ScriptIsland, "script", scan_functions: true);
                    else if (name.Equals("command", StringComparison.OrdinalIgnoreCase)
                             || name.Equals("query", StringComparison.OrdinalIgnoreCase))
                        i = ParseIsland(tokens, i, stack, el, SyntaxKind.SqlIsland, name, scan_functions: false);
                    break;
                }

                case SyntaxKind.EndTag:
                {
                    var name = ExtractTagName(token.Text, is_end: true);
                    AttachToken(stack.Peek(), token);

                    // Có tag mở nào cùng tên đang chờ đóng không? (root là Document, không tính)
                    var has_open_match = stack.Any(n =>
                        n.Kind == SyntaxKind.Element
                        && string.Equals(n.Name, name, StringComparison.OrdinalIgnoreCase));

                    if (!has_open_match)
                    {
                        // </name> lạc — không có tag mở tương ứng. Không pop (tránh phá cây), bỏ qua.
                        diagnostics.Add(TagStructureDiagnostic(
                            path,
                            $"Tag đóng </{name}> không có tag mở tương ứng.",
                            token.Span, token.Line, token.Column));
                        i++;
                        break;
                    }

                    // Tag mở trong cùng (innermost) khác tên → các tag lồng bên trong chưa đóng.
                    var innermost = stack.Count > 1 ? stack.Peek() : null;
                    if (innermost is { Kind: SyntaxKind.Element } inner
                        && !string.Equals(inner.Name, name, StringComparison.OrdinalIgnoreCase))
                    {
                        diagnostics.Add(TagStructureDiagnostic(
                            path,
                            $"Tag đóng </{name}> không khớp <{inner.Name}> đang mở.",
                            token.Span, token.Line, token.Column));
                    }

                    // Pop đến khi khớp (error recovery)
                    while (stack.Count > 1)
                    {
                        var top = stack.Pop();
                        SealNode(top, token);
                        if (string.Equals(top.Name, name, StringComparison.OrdinalIgnoreCase))
                            break;
                    }
                    i++;
                    break;
                }

                default:
                    AttachToken(stack.Peek(), token);
                    i++;
                    break;
            }
        }

        while (stack.Count > 0)
        {
            var top = stack.Pop();

            // Element còn trên stack tại EOF = tag mở chưa được đóng. Báo tại StartTag của nó.
            if (top.Kind == SyntaxKind.Element)
            {
                var start_tag = top.DirectTokens.Count > 0 ? top.DirectTokens[0] : null;
                diagnostics.Add(TagStructureDiagnostic(
                    path,
                    $"Tag <{top.Name}> chưa được đóng.",
                    start_tag?.Span ?? top.Span,
                    start_tag?.Line ?? top.StartLine,
                    start_tag?.Column ?? 1));
            }

            if (tokens.Count > 0)
            {
                var last = tokens[^1];
                SealNode(top, last);
            }
        }

        if (root.Span.Length == 0 && text.Length > 0)
            root.Seal(new SourceSpan(0, text.Length), 1, line_map.LineCount);

        return new SyntaxTree(text, root, line_map, tokens, diagnostics);
    }

    private static int ParseIsland(
        IReadOnlyList<SyntaxToken> tokens,
        int i,
        Stack<SyntaxNode> stack,
        SyntaxNode element,
        SyntaxKind island_kind,
        string close_name,
        bool scan_functions)
    {
        var island = new SyntaxNode(island_kind, close_name);
        var start_offset = i < tokens.Count ? tokens[i].Span.StartOffset : element.Span.StartOffset;
        var start_line = i < tokens.Count ? tokens[i].Line : element.StartLine;

        while (i < tokens.Count)
        {
            var token = tokens[i];
            if (token.Kind == SyntaxKind.EndOfFile)
                break;

            if (token.Kind == SyntaxKind.EndTag
                && ExtractTagName(token.Text, is_end: true)
                    .Equals(close_name, StringComparison.OrdinalIgnoreCase))
            {
                break;
            }

            island.AddToken(token);
            i++;
        }

        var end_offset = island.DirectTokens.Count > 0
            ? island.DirectTokens[^1].Span.EndOffset
            : start_offset;
        var end_line = island.DirectTokens.Count > 0
            ? island.DirectTokens[^1].Line
            : start_line;
        island.Seal(new SourceSpan(start_offset, Math.Max(0, end_offset - start_offset)), start_line, end_line);

        if (scan_functions)
            AddScriptFunctions(island);

        element.AddChild(island);
        // EndTag sẽ được xử lý ở vòng ngoài (pop element)
        return i;
    }

    private static void AddScriptFunctions(SyntaxNode island)
    {
        var body = string.Concat(island.DirectTokens.Select(t => t.Text));
        if (string.IsNullOrEmpty(body)) return;

        var base_offset = island.Span.StartOffset;
        var base_line = island.StartLine;
        foreach (Match m in FunctionRegex.Matches(body))
        {
            var name = m.Groups["name"].Value;
            if (string.IsNullOrWhiteSpace(name)) continue;
            if (island.Children.Any(c =>
                    c.Qualifier == "function"
                    && c.Name.Equals(name, StringComparison.Ordinal)))
                continue;

            var abs = base_offset + m.Index;
            var line = base_line;
            for (var p = 0; p < m.Index && p < body.Length; p++)
            {
                if (body[p] == '\n') line++;
            }

            // Marker node (không có token) — chỉ phục vụ projection Structure/F12.
            var fn = new SyntaxNode(SyntaxKind.ScriptIsland, name);
            fn.Seal(new SourceSpan(abs, m.Length), line, line);
            fn.Qualifier = "function";
            island.AddChild(fn);
        }
    }

    private static void AttachDoctype(SyntaxNode parent, SyntaxToken token, string source)
    {
        var node = new SyntaxNode(SyntaxKind.DocType, "DOCTYPE");
        node.AddToken(token);

        // ENTITY decls trong subset — node con (text vẫn nằm trong DocType token → serialize giữ nguyên).
        var text = token.Text;
        var open = text.IndexOf('[');
        var close = text.LastIndexOf(']');
        if (open >= 0 && close > open)
        {
            var subset = text[(open + 1)..close];
            var subset_abs = token.Span.StartOffset + open + 1;
            foreach (Match m in EntityNameRegex.Matches(subset))
            {
                var name = m.Groups["name"].Value;
                var ent = new SyntaxNode(SyntaxKind.EntityDeclaration, name);
                ent.Seal(new SourceSpan(subset_abs + m.Index, m.Length), token.Line, token.Line);
                node.AddChild(ent);
            }
        }

        node.Seal(token.Span, token.Line, token.Line);
        parent.AddChild(node);
        _ = source;
    }

    private static void AttachEntityDecl(SyntaxNode parent, SyntaxToken token)
    {
        var name = EntityNameRegex.Match(token.Text).Groups["name"].Value;
        var node = new SyntaxNode(SyntaxKind.EntityDeclaration, name);
        node.AddToken(token);
        node.Seal(token.Span, token.Line, token.Line);
        parent.AddChild(node);
    }

    private static void AttachToken(SyntaxNode parent, SyntaxToken token) =>
        parent.AddToken(token);

    private static void SealNode(SyntaxNode node, SyntaxToken last_token)
    {
        var start = node.DirectTokens.Count > 0
            ? node.DirectTokens[0].Span.StartOffset
            : (node.Children.Count > 0 ? node.Children[0].Span.StartOffset : last_token.Span.StartOffset);
        var end = last_token.Span.EndOffset;
        if (node.Children.Count > 0)
            end = Math.Max(end, node.Children.Max(c => c.Span.EndOffset));
        if (node.DirectTokens.Count > 0)
            end = Math.Max(end, node.DirectTokens.Max(t => t.Span.EndOffset));

        var start_line = node.DirectTokens.Count > 0
            ? node.DirectTokens[0].Line
            : (node.Children.Count > 0 ? node.Children[0].StartLine : last_token.Line);

        node.Seal(new SourceSpan(start, Math.Max(0, end - start)), start_line, last_token.Line);
    }

    private static string ExtractTagName(string tag_text, bool is_end)
    {
        if (string.IsNullOrEmpty(tag_text) || tag_text[0] != '<') return string.Empty;
        var i = 1;
        if (is_end && i < tag_text.Length && tag_text[i] == '/') i++;
        while (i < tag_text.Length && char.IsWhiteSpace(tag_text[i])) i++;
        var start = i;
        while (i < tag_text.Length && (char.IsLetterOrDigit(tag_text[i]) || tag_text[i] is '_' or ':' or '.' or '-'))
            i++;
        return start < i ? tag_text[start..i] : string.Empty;
    }

    /// <summary>
    /// ERP1002 — lỗi cấu trúc tag (đóng không khớp / thiếu đóng / đóng thừa). Severity Error để
    /// Source mode ưu tiên sửa trước khi tin cấu trúc semantic/Design (khác ERP1001 recover nhẹ).
    /// </summary>
    private static ErpDiagnostic TagStructureDiagnostic(
        string? path, string message, SourceSpan span, int line, int column) =>
        new()
        {
            Id = "ERP1002",
            Severity = ErpDiagnosticSeverity.Error,
            Message = message,
            Location = new SourceLocation
            {
                Path = path ?? string.Empty,
                Span = span,
                Line = line,
                Column = column
            }
        };

    private static string? PickQualifier(string tag_text)
    {
        var name = AttrNameRegex.Match(tag_text);
        if (name.Success) return name.Groups["v"].Value;
        var ev = AttrEventRegex.Match(tag_text);
        if (ev.Success) return ev.Groups["v"].Value;
        var id = AttrIdRegex.Match(tag_text);
        if (id.Success) return id.Groups["v"].Value;
        return null;
    }
}
