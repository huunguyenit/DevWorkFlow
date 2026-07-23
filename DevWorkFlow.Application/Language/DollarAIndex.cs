using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>Một property trong object literal <c>g.$a = { … }</c>.</summary>
public sealed class DollarAProperty
{
    public required string Name { get; init; }

    /// <summary>Giá trị thô (RHS) như trong source, chưa unescape.</summary>
    public required string ValueText { get; init; }

    /// <summary>Offset (trong script text) của tên property.</summary>
    public int NameOffset { get; init; }

    /// <summary>Offset (trong script text) của value.</summary>
    public int ValueOffset { get; init; }
}

/// <summary>
/// Index các property trong object literal <c>g.$a = { name: '…', … }</c> — dùng cho
/// GoTo/hover <c>g.$a.name</c> (Phase 3 #13–14). Regex/scanner có kiểm soát trên script
/// island — không parse full JS AST.
/// </summary>
public sealed class DollarAIndex
{
    private static readonly Regex DollarAAssignmentRegex = new(
        @"g\s*\.\s*\$a\s*=\s*\{", RegexOptions.Compiled);

    public IReadOnlyList<DollarAProperty> Properties { get; init; } = [];

    public static DollarAIndex Build(string script_text)
    {
        if (string.IsNullOrEmpty(script_text))
            return new DollarAIndex();

        var match = DollarAAssignmentRegex.Match(script_text);
        if (!match.Success)
            return new DollarAIndex();

        var brace_start = match.Index + match.Length - 1; // index của '{'
        var brace_end = FindMatchingBrace(script_text, brace_start);
        if (brace_end < 0)
            return new DollarAIndex();

        var properties = ParseProperties(script_text, brace_start + 1, brace_end);
        return new DollarAIndex { Properties = properties };
    }

    /// <summary>Offset (script text) trên tên property → property đó (hit-test trong chính object literal).</summary>
    public DollarAProperty? FindPropertyAtOffset(int offset_in_script)
    {
        foreach (var property in Properties)
        {
            if (offset_in_script >= property.NameOffset
                && offset_in_script < property.NameOffset + property.Name.Length)
                return property;
        }
        return null;
    }

    public DollarAProperty? FindByName(string name)
    {
        foreach (var property in Properties)
            if (string.Equals(property.Name, name, StringComparison.Ordinal))
                return property;
        return null;
    }

    /// <summary>
    /// FBO object literal thật xen kẽ token lạ giữa các property (entity ref <c>&amp;Name;</c>
    /// dùng làm placeholder cho nhiều <c>key: value,</c>, marker CDATA <c>&lt;![CDATA[</c>/<c>]]&gt;</c>
    /// khi runtime tách/nối lại theo entity — không phải JS hợp lệ). Trước đây gặp token không
    /// nhận diện được là dừng hẳn, làm mất mọi property phía sau. Giờ resync: bỏ 1 ký tự rồi thử
    /// lại, thay vì bỏ cuộc — luôn tiến (i tăng chặt) nên không vòng lặp vô hạn.
    /// </summary>
    private static List<DollarAProperty> ParseProperties(string text, int start, int end)
    {
        var properties = new List<DollarAProperty>();
        var i = start;

        while (i < end)
        {
            while (i < end && (char.IsWhiteSpace(text[i]) || text[i] == ',')) i++;
            if (i >= end) break;

            var candidate_start = i;
            int name_offset;
            string name;

            if (text[i] is '\'' or '"')
            {
                var quote = text[i];
                var content_start = i + 1;
                var content_end = FindStringEnd(text, content_start, end, quote);
                name = text[content_start..content_end];
                name_offset = content_start;
                i = Math.Min(content_end + 1, end);
            }
            else if (char.IsLetter(text[i]) || text[i] is '_' or '$')
            {
                name_offset = i;
                var j = i;
                while (j < end && (char.IsLetterOrDigit(text[j]) || text[j] is '_' or '$')) j++;
                name = text[i..j];
                i = j;
            }
            else
            {
                // Token lạ (entity ref, CDATA marker, …) — resync 1 ký tự, không hủy phần còn lại.
                i = candidate_start + 1;
                continue;
            }

            while (i < end && char.IsWhiteSpace(text[i])) i++;
            if (i >= end || text[i] != ':')
            {
                // "Tên" vừa đọc không phải property thật (vd bị token lạ cắt ngang) — resync từ
                // ngay sau ký tự bắt đầu candidate, không phải sau toàn bộ chuỗi vừa đọc lỡ.
                i = candidate_start + 1;
                continue;
            }
            i++; // qua ':'
            while (i < end && char.IsWhiteSpace(text[i])) i++;

            var value_start = i;
            var value_end = FindValueEnd(text, value_start, end);
            var value_text = text[value_start..value_end].TrimEnd();

            properties.Add(new DollarAProperty
            {
                Name = name,
                ValueText = value_text,
                NameOffset = name_offset,
                ValueOffset = value_start
            });

            i = value_end;
        }

        return properties;
    }

    /// <summary>Từ sau dấu <c>{</c> mở, tìm dấu <c>}</c> đóng khớp (bỏ qua chuỗi quoted).</summary>
    private static int FindMatchingBrace(string text, int open_index)
    {
        var depth = 0;
        for (var i = open_index; i < text.Length; i++)
        {
            var c = text[i];
            if (c is '\'' or '"')
            {
                i = FindStringEnd(text, i + 1, text.Length, c);
                continue;
            }
            if (c == '{') depth++;
            else if (c == '}')
            {
                depth--;
                if (depth == 0) return i;
            }
        }
        return -1;
    }

    /// <summary>Tìm offset kết thúc value: dừng ở dấu phẩy top-level hoặc hết vùng object.</summary>
    private static int FindValueEnd(string text, int start, int end)
    {
        var depth = 0;
        var i = start;
        while (i < end)
        {
            var c = text[i];
            if (c is '\'' or '"')
            {
                i = Math.Min(FindStringEnd(text, i + 1, end, c) + 1, end);
                continue;
            }
            if (c is '{' or '[' or '(') { depth++; i++; continue; }
            if (c is '}' or ']' or ')')
            {
                if (depth == 0) return i;
                depth--; i++; continue;
            }
            if (c == ',' && depth == 0) return i;
            i++;
        }
        return end;
    }

    /// <summary>Từ vị trí sau quote mở, tìm offset của quote đóng (hỗ trợ backslash-escape).</summary>
    private static int FindStringEnd(string text, int content_start, int end, char quote)
    {
        var i = content_start;
        while (i < end)
        {
            if (text[i] == '\\') { i += 2; continue; }
            if (text[i] == quote) return i;
            i++;
        }
        return end;
    }
}
