using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Completion / Hover / Signature Help cho API FBO trong island JS, dữ liệu lấy từ
/// <see cref="FboJsCatalog"/> (SoT = catalog XML, KHÔNG hard-code trong UI).
///
/// Nguyên tắc:
/// - Insight là buffer read-only → Complete/Signature luôn rỗng, chỉ Hover chạy.
/// - Ngoài island JS → rỗng/null (fail closed).
/// - Tra tên member EXACT — không fuzzy-match typo (spec §6.3).
/// </summary>
public static class FboJsAssistResolver
{
    public static FboJsCompletionList Complete(
        string buffer_text, int offset, EditorAssistMode mode, FboJsCatalog catalog)
    {
        if (mode == EditorAssistMode.Insight) return FboJsCompletionList.Empty;
        if (!IsAssistable(buffer_text, offset, catalog)) return FboJsCompletionList.Empty;

        var prefix = ReadIdentifierBefore(buffer_text, offset, out var prefix_start);
        var receiver = ReadReceiverBefore(buffer_text, prefix_start);

        // `receiver.` + prefix → member của type tương ứng.
        if (receiver is not null)
        {
            var type = catalog.ResolveTypeByAlias(receiver);
            if (type is null) return FboJsCompletionList.Empty;

            var members = catalog.GetMembers(type.Id)
                .Where(m => m.Name.StartsWith(prefix, StringComparison.Ordinal))
                .Select(ToItem)
                .ToList();
            return new FboJsCompletionList { Items = members };
        }

        // Không có receiver → alias + global.
        var items = new List<FboJsCompletionItem>();
        foreach (var alias in catalog.AllAliases.Where(a => a.StartsWith(prefix, StringComparison.Ordinal)))
        {
            var type = catalog.ResolveTypeByAlias(alias);
            items.Add(new FboJsCompletionItem
            {
                Label = alias,
                InsertText = alias,
                Kind = "variable",
                Detail = type?.Id ?? string.Empty,
                Documentation = type?.Summary ?? string.Empty
            });
        }
        items.AddRange(catalog.Globals
            .Where(g => g.Name.StartsWith(prefix, StringComparison.Ordinal))
            .Select(ToItem));

        return new FboJsCompletionList { Items = items };
    }

    public static FboJsHoverInfo? Hover(
        string buffer_text, int offset, EditorAssistMode mode, FboJsCatalog catalog)
    {
        // Hover chạy ở CẢ Source lẫn Insight (spec §1) — chỉ cần trong island.
        if (!IsAssistable(buffer_text, offset, catalog)) return null;

        var name = ReadIdentifierAt(buffer_text, offset, out var name_start);
        if (string.IsNullOrEmpty(name)) return null;

        var receiver = ReadReceiverBefore(buffer_text, name_start);
        if (receiver is not null)
        {
            var type = catalog.ResolveTypeByAlias(receiver);
            if (type is null) return null;

            var member = catalog.FindMember(type.Id, name);
            return member is null ? null : ToHover($"{receiver}.{member.Name}", member);
        }

        // Không có receiver: có thể đang hover chính alias, hoặc một global.
        var alias_type = catalog.ResolveTypeByAlias(name);
        if (alias_type is not null && !string.IsNullOrWhiteSpace(alias_type.Summary))
            return new FboJsHoverInfo { Title = name, Body = alias_type.Summary };

        var global = catalog.FindGlobal(name);
        return global is null ? null : ToHover(global.Name, global);
    }

    public static FboJsSignatureHelp? Signature(
        string buffer_text, int offset, EditorAssistMode mode, FboJsCatalog catalog)
    {
        if (mode == EditorAssistMode.Insight) return null;
        if (!IsAssistable(buffer_text, offset, catalog)) return null;

        var call = FindEnclosingCall(buffer_text, offset);
        if (call is null) return null;

        var (open_paren, name, name_start) = call.Value;
        var receiver = ReadReceiverBefore(buffer_text, name_start);

        FboJsMemberInfo? member;
        if (receiver is not null)
        {
            var type = catalog.ResolveTypeByAlias(receiver);
            member = type is null ? null : catalog.FindMember(type.Id, name);
        }
        else
        {
            member = catalog.FindGlobal(name);
        }

        if (member is null) return null;

        return new FboJsSignatureHelp
        {
            Label = string.IsNullOrWhiteSpace(member.Signature)
                ? $"{member.Name}()"
                : member.Signature,
            Documentation = member.Summary,
            Parameters = [.. member.Params.Select(p => new FboJsSignatureParameter
            {
                Label = p.Name,
                Documentation = p.Summary
            })],
            ActiveParameter = CountTopLevelCommas(buffer_text, open_paren + 1, offset)
        };
    }

    private static bool IsAssistable(string buffer_text, int offset, FboJsCatalog catalog)
    {
        if (catalog is null || string.IsNullOrEmpty(buffer_text)) return false;
        if (offset < 0 || offset > buffer_text.Length) return false;
        return ScriptIslandLocator.IsInsideJsIsland(buffer_text, offset);
    }

    private static FboJsCompletionItem ToItem(FboJsMemberInfo member) => new()
    {
        Label = member.Name,
        InsertText = member.Name,
        Kind = member.Kind switch
        {
            FboJsMemberKind.Property => "property",
            FboJsMemberKind.Function => "function",
            _ => "method"
        },
        Detail = string.IsNullOrWhiteSpace(member.Signature) ? member.Name : member.Signature,
        Documentation = member.Summary
    };

    private static FboJsHoverInfo ToHover(string title, FboJsMemberInfo member)
    {
        var body = member.Summary;
        if (!string.IsNullOrWhiteSpace(member.Effect))
            body = string.IsNullOrWhiteSpace(body)
                ? member.Effect
                : $"{body}\n\n{member.Effect}";

        return new FboJsHoverInfo
        {
            Title = string.IsNullOrWhiteSpace(member.Signature) ? title : member.Signature,
            Body = body
        };
    }

    // ── Text scanning ───────────────────────────────────────────────────────

    /// <summary>Identifier kết thúc ngay TRƯỚC caret (phần đang gõ); "" nếu không có.</summary>
    private static string ReadIdentifierBefore(string text, int offset, out int start)
    {
        start = offset;
        while (start > 0 && IsIdentChar(text[start - 1])) start--;
        return start >= offset ? string.Empty : text[start..offset];
    }

    /// <summary>Identifier ĐANG nằm dưới caret (dùng cho hover).</summary>
    private static string ReadIdentifierAt(string text, int offset, out int start)
    {
        var index = Math.Min(offset, text.Length - 1);
        if (index < 0) { start = 0; return string.Empty; }
        if (!IsIdentChar(text[index]) && index > 0 && IsIdentChar(text[index - 1])) index--;
        if (!IsIdentChar(text[index])) { start = index; return string.Empty; }

        start = index;
        while (start > 0 && IsIdentChar(text[start - 1])) start--;
        var end = index;
        while (end < text.Length && IsIdentChar(text[end])) end++;
        return text[start..end];
    }

    /// <summary>
    /// Nếu ngay trước <paramref name="position"/> là <c>receiver.</c> thì trả receiver, ngược
    /// lại null. Chỉ nhận một cấp (đủ cho <c>f.x</c>, <c>g.x</c>, <c>$func.x</c>).
    /// </summary>
    private static string? ReadReceiverBefore(string text, int position)
    {
        var i = position - 1;
        while (i >= 0 && char.IsWhiteSpace(text[i])) i--;
        if (i < 0 || text[i] != '.') return null;

        var end = i;
        while (end > 0 && char.IsWhiteSpace(text[end - 1])) end--;
        var start = end;
        while (start > 0 && IsIdentChar(text[start - 1])) start--;
        return start >= end ? null : text[start..end];
    }

    /// <summary>
    /// Lùi từ caret tìm lời gọi đang MỞ: trả (vị trí '(', tên hàm, offset đầu tên).
    /// Bỏ qua các cặp ngoặc đã đóng để không nhận nhầm lời gọi lồng bên trong.
    /// </summary>
    private static (int OpenParen, string Name, int NameStart)? FindEnclosingCall(string text, int offset)
    {
        var depth = 0;
        for (var i = Math.Min(offset, text.Length) - 1; i >= 0; i--)
        {
            var c = text[i];
            if (c == ')') { depth++; continue; }
            if (c != '(') continue;
            if (depth > 0) { depth--; continue; }

            var end = i;
            while (end > 0 && char.IsWhiteSpace(text[end - 1])) end--;
            var start = end;
            while (start > 0 && IsIdentChar(text[start - 1])) start--;
            if (start >= end) return null;

            return (i, text[start..end], start);
        }
        return null;
    }

    private static int CountTopLevelCommas(string text, int from, int to)
    {
        var commas = 0;
        var depth = 0;
        for (var i = from; i < to && i < text.Length; i++)
        {
            var c = text[i];
            if (c is '\'' or '"') { i = SkipString(text, i, to); continue; }
            if (c is '(' or '[' or '{') depth++;
            else if (c is ')' or ']' or '}') depth--;
            else if (c == ',' && depth == 0) commas++;
        }
        return commas;
    }

    /// <summary>Trả về index của quote đóng (vòng for sẽ ++ qua nó).</summary>
    private static int SkipString(string text, int quote_index, int limit)
    {
        var quote = text[quote_index];
        var i = quote_index + 1;
        while (i < limit && i < text.Length)
        {
            if (text[i] == '\\') { i += 2; continue; }
            if (text[i] == quote) return i;
            i++;
        }
        return Math.Min(limit, text.Length) - 1;
    }

    private static bool IsIdentChar(char c) => char.IsLetterOrDigit(c) || c is '_' or '$';
}
