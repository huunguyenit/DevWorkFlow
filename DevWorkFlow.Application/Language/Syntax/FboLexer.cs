using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language.Syntax;

/// <summary>
/// Lexer FBO XML lossless — mọi ký tự nguồn thuộc đúng một token (trừ EOF).
/// </summary>
public static class FboLexer
{
    public static IReadOnlyList<SyntaxToken> Tokenize(string text, LineMap? line_map = null)
    {
        text ??= string.Empty;
        line_map ??= new LineMap(text);
        var tokens = new List<SyntaxToken>();
        var i = 0;
        var len = text.Length;

        while (i < len)
        {
            if (text[i] == '<')
            {
                if (StartsWith(text, i, "<!--"))
                {
                    var end = text.IndexOf("-->", i + 4, StringComparison.Ordinal);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    Add(tokens, line_map, text, SyntaxKind.Comment, i, end + 3 - i);
                    i = end + 3;
                    continue;
                }

                if (StartsWith(text, i, "<![CDATA["))
                {
                    var end = text.IndexOf("]]>", i + 9, StringComparison.Ordinal);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    Add(tokens, line_map, text, SyntaxKind.CData, i, end + 3 - i);
                    i = end + 3;
                    continue;
                }

                if (StartsWith(text, i, "<!DOCTYPE"))
                {
                    var end = FindDoctypeEnd(text, i);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    Add(tokens, line_map, text, SyntaxKind.DocType, i, end + 1 - i);
                    i = end + 1;
                    continue;
                }

                if (StartsWith(text, i, "<!ENTITY"))
                {
                    var end = FindTagClose(text, i);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    Add(tokens, line_map, text, SyntaxKind.EntityDeclaration, i, end + 1 - i);
                    i = end + 1;
                    continue;
                }

                if (StartsWith(text, i, "<?"))
                {
                    var end = text.IndexOf("?>", i + 2, StringComparison.Ordinal);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    var kind = StartsWith(text, i, "<?xml")
                        ? SyntaxKind.XmlDeclaration
                        : SyntaxKind.ProcessingInstruction;
                    Add(tokens, line_map, text, kind, i, end + 2 - i);
                    i = end + 2;
                    continue;
                }

                if (i + 1 < len && text[i + 1] == '/')
                {
                    var end = FindTagClose(text, i);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    Add(tokens, line_map, text, SyntaxKind.EndTag, i, end + 1 - i);
                    i = end + 1;
                    continue;
                }

                {
                    var end = FindTagClose(text, i);
                    if (end < 0)
                    {
                        Add(tokens, line_map, text, SyntaxKind.BadToken, i, len - i);
                        i = len;
                        break;
                    }
                    var is_empty = end > i && text[end - 1] == '/';
                    var kind = is_empty ? SyntaxKind.EmptyElementTag : SyntaxKind.StartTag;
                    Add(tokens, line_map, text, kind, i, end + 1 - i);
                    i = end + 1;
                    continue;
                }
            }

            // Text / whitespace run until '<'
            var start = i;
            while (i < len && text[i] != '<')
                i++;
            var run = text.AsSpan(start, i - start);
            var kind_text = run.IsEmpty
                ? SyntaxKind.Text
                : run.Trim().Length == 0
                    ? SyntaxKind.Whitespace
                    : SyntaxKind.Text;
            Add(tokens, line_map, text, kind_text, start, i - start);
        }

        var (eof_line, eof_col) = line_map.GetLineColumn(len);
        tokens.Add(new SyntaxToken(SyntaxKind.EndOfFile, string.Empty, new SourceSpan(len, 0), eof_line, eof_col));
        return tokens;
    }

    private static void Add(
        List<SyntaxToken> tokens,
        LineMap line_map,
        string text,
        SyntaxKind kind,
        int start,
        int length)
    {
        if (length <= 0 && kind != SyntaxKind.EndOfFile) return;
        var (line, col) = line_map.GetLineColumn(start);
        tokens.Add(new SyntaxToken(kind, text.Substring(start, length), new SourceSpan(start, length), line, col));
    }

    private static int FindDoctypeEnd(string text, int from)
    {
        var bracket = text.IndexOf('[', from);
        var first_gt = FindTagClose(text, from);
        if (bracket >= 0 && (first_gt < 0 || bracket < first_gt))
        {
            var close = text.IndexOf("]>", bracket, StringComparison.Ordinal);
            return close >= 0 ? close + 1 : first_gt;
        }
        return first_gt;
    }

    private static int FindTagClose(string text, int from)
    {
        var in_quote = '\0';
        for (var i = from; i < text.Length; i++)
        {
            var c = text[i];
            if (in_quote != '\0')
            {
                if (c == in_quote) in_quote = '\0';
                continue;
            }
            if (c is '"' or '\'')
            {
                in_quote = c;
                continue;
            }
            if (c == '>') return i;
        }
        return -1;
    }

    private static bool StartsWith(string text, int i, string prefix)
    {
        if (i + prefix.Length > text.Length) return false;
        return string.Compare(text, i, prefix, 0, prefix.Length, StringComparison.OrdinalIgnoreCase) == 0;
    }
}
