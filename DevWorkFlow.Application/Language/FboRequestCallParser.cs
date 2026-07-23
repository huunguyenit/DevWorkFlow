using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Kết quả parse một lời gọi <c>xxx.request('Action', 'Context', …)</c> /
/// <c>xxx.grid.request(sender, 'Action', 'Context', …)</c>.
/// </summary>
public sealed record RequestCallHit(
    string ActionName,
    string ContextName,
    int ActionLiteralOffset,
    int ContextLiteralOffset,
    int ActionLiteralLength,
    int ContextLiteralLength);

/// <summary>
/// Parse lời gọi <c>.request(…)</c> (form hoặc grid — arity khác nhau) trong script island.
/// Không phân biệt form/grid bằng vị trí cố định: hai chuỗi literal ĐẦU TIÊN trong danh sách
/// tham số (theo thứ tự xuất hiện, bỏ qua tham số không phải chuỗi như <c>sender</c>/<c>o</c>)
/// luôn là action/context — đúng cho cả hai signature theo bảng đã chốt trong spec.
/// </summary>
public static class FboRequestCallParser
{
    // FBO cho phép hậu tố "$Something" ngay sau tên method (vd showForm$Voucher(...)) — request
    // cũng theo quy ước này; không có \b\s*\( đơn thuần sẽ bỏ lỡ request$Xxx(...).
    private static readonly Regex RequestCallRegex = new(
        @"\.request\b(?:\$\w+)?\s*\(", RegexOptions.Compiled);

    public static RequestCallHit? TryFindEnclosing(string script, int offset)
    {
        if (string.IsNullOrEmpty(script) || offset < 0 || offset > script.Length)
            return null;

        foreach (Match call in RequestCallRegex.Matches(script))
        {
            var hit = TryParse(script, call, out var open_paren, out var close_paren);
            if (hit is null) continue;
            if (offset < open_paren || offset > close_paren) continue;
            return hit;
        }

        return null;
    }

    /// <summary>
    /// Mọi lời gọi request trong script — phục vụ điều hướng CHIỀU NGƯỢC (từ
    /// <c>&lt;action id="X"&gt;</c> hoặc <c>case 'X':</c> tìm ngược ra các chỗ gọi).
    /// </summary>
    public static IReadOnlyList<RequestCallHit> EnumerateAll(string script)
    {
        var result = new List<RequestCallHit>();
        if (string.IsNullOrEmpty(script)) return result;

        foreach (Match call in RequestCallRegex.Matches(script))
        {
            var hit = TryParse(script, call, out _, out _);
            if (hit is not null) result.Add(hit);
        }
        return result;
    }

    private static RequestCallHit? TryParse(
        string script, Match call, out int open_paren, out int close_paren)
    {
        open_paren = call.Index + call.Length - 1;
        close_paren = FindMatchingParen(script, open_paren);
        if (close_paren < 0) return null;

        var string_args = new List<(string Text, int Offset, int Length)>();
        foreach (var (arg_start, arg_end) in SplitTopLevelArgs(script, open_paren + 1, close_paren))
        {
            var literal = TryGetStringLiteral(script, arg_start, arg_end);
            if (literal is not null)
                string_args.Add(literal.Value);
            if (string_args.Count == 2) break;
        }

        if (string_args.Count < 2) return null;

        var action = string_args[0];
        var context = string_args[1];
        return new RequestCallHit(
            action.Text, context.Text,
            action.Offset, context.Offset,
            action.Length, context.Length);
    }

    private static List<(int Start, int End)> SplitTopLevelArgs(string text, int start, int end)
    {
        var result = new List<(int, int)>();
        var depth = 0;
        var arg_start = start;
        var i = start;

        while (i < end)
        {
            var c = text[i];
            if (c is '\'' or '"')
            {
                i = FindStringEndExclusive(text, i, end);
                continue;
            }
            if (c is '(' or '[' or '{') { depth++; i++; continue; }
            if (c is ')' or ']' or '}') { depth--; i++; continue; }
            if (c == ',' && depth == 0)
            {
                result.Add((arg_start, i));
                arg_start = i + 1;
                i++;
                continue;
            }
            i++;
        }

        if (arg_start < end) result.Add((arg_start, end));
        return result;
    }

    private static (string Text, int Offset, int Length)? TryGetStringLiteral(
        string text, int start, int end)
    {
        var s = start;
        var e = end;
        while (s < e && char.IsWhiteSpace(text[s])) s++;
        while (e > s && char.IsWhiteSpace(text[e - 1])) e--;
        if (e - s < 2) return null;

        var quote = text[s];
        if (quote is not ('\'' or '"')) return null;
        if (text[e - 1] != quote) return null;

        var content_start = s + 1;
        var content_length = e - 1 - content_start;
        if (content_length < 0) return null;

        return (text.Substring(content_start, content_length), content_start, content_length);
    }

    /// <summary>Trả offset ngay sau dấu paren đóng khớp; -1 nếu không tìm thấy.</summary>
    private static int FindMatchingParen(string text, int open_index)
    {
        var depth = 0;
        var i = open_index;
        while (i < text.Length)
        {
            var c = text[i];
            if (c is '\'' or '"')
            {
                i = FindStringEndExclusive(text, i, text.Length);
                continue;
            }
            if (c == '(') { depth++; i++; continue; }
            if (c == ')')
            {
                depth--;
                if (depth == 0) return i;
                i++;
                continue;
            }
            i++;
        }
        return -1;
    }

    /// <summary>Từ vị trí quote mở, trả offset ngay SAU quote đóng (bỏ qua backslash-escape).</summary>
    private static int FindStringEndExclusive(string text, int quote_index, int end)
    {
        var quote = text[quote_index];
        var i = quote_index + 1;
        while (i < end)
        {
            if (text[i] == '\\') { i += 2; continue; }
            if (text[i] == quote) return i + 1;
            i++;
        }
        return end;
    }
}

/// <summary>
/// Tìm offset <c>case 'context':</c> (exact string, không fuzzy-fix typo) trong hàm
/// <c>function on$…$ResponseComplete(…) { … }</c>.
/// </summary>
public static class ResponseCompleteCaseFinder
{
    private static readonly Regex ResponseCompleteFunctionRegex = new(
        @"function\s+on\$[A-Za-z0-9_]*\$ResponseComplete\s*\([^)]*\)\s*\{",
        RegexOptions.Compiled);

    /// <summary>Offset (trong script) của chuỗi context ngay sau <c>case</c>; null nếu không có match exact.</summary>
    public static int? FindCaseOffset(string script, string context_name)
    {
        if (string.IsNullOrEmpty(script) || string.IsNullOrEmpty(context_name))
            return null;

        foreach (Match fn in ResponseCompleteFunctionRegex.Matches(script))
        {
            var body_start = fn.Index + fn.Length - 1; // '{'
            var body_end = FindMatchingBrace(script, body_start);
            if (body_end < 0) continue;

            var case_offset = FindCaseInBody(script, body_start + 1, body_end, context_name);
            if (case_offset is not null) return case_offset;
        }
        return null;
    }

    private static int? FindCaseInBody(string text, int start, int end, string context_name)
    {
        var pattern = new Regex(
            $@"\bcase\s+(['""]){Regex.Escape(context_name)}\1\s*:");
        var slice = text.Substring(start, end - start);
        var m = pattern.Match(slice);
        if (!m.Success) return null;

        // Group 1 là quote — offset chuỗi context bắt đầu sau quote mở.
        var quote_index = m.Groups[1].Index;
        return start + quote_index + 1;
    }

    private static int FindMatchingBrace(string text, int open_index)
    {
        var depth = 0;
        var i = open_index;
        while (i < text.Length)
        {
            var c = text[i];
            if (c is '\'' or '"')
            {
                i = FindStringEndExclusive(text, i, text.Length);
                continue;
            }
            if (c == '{') { depth++; i++; continue; }
            if (c == '}')
            {
                depth--;
                if (depth == 0) return i;
                i++;
                continue;
            }
            i++;
        }
        return -1;
    }

    private static int FindStringEndExclusive(string text, int quote_index, int end)
    {
        var quote = text[quote_index];
        var i = quote_index + 1;
        while (i < end)
        {
            if (text[i] == '\\') { i += 2; continue; }
            if (text[i] == quote) return i + 1;
            i++;
        }
        return end;
    }
}
