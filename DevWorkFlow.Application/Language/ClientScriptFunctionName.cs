using DevWorkFlow.Application.Engine;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Ghép tên hàm được gọi trong <c>&lt;clientScript&gt;</c> khi tên bị <c>&amp;Entity;</c> cắt.
/// Trong source FBO, entity ref nằm NGOÀI CDATA (để runtime expand); phần chữ literal nằm trong
/// CDATA. Vì vậy <c>onChangeCurrency</c> + <c>&amp;Account;</c> + <c>(this)</c> serialize thành
/// <c>&lt;![CDATA[onChangeCurrency]]&gt;&amp;Account;&lt;![CDATA[(this)]]&gt;</c> — nối lại (bỏ
/// CDATA marker, expand entity 1 lớp) mới ra tên logical <c>onChangeCurrencyAccount</c>.
/// </summary>
public static class ClientScriptFunctionName
{
    public static string? TryExtract(
        string source_xml,
        int offset,
        IReadOnlyDictionary<string, string> entity_values)
    {
        if (string.IsNullOrEmpty(source_xml) || offset < 0 || offset > source_xml.Length)
            return null;

        if (!TryGetClientScriptInnerRange(source_xml, offset, out var inner_start, out var inner_end))
            return null;

        var inner_len = inner_end - inner_start;
        var logical = new System.Text.StringBuilder(inner_len);
        // map[k] = vị trí logical ứng với source index (inner_start + k). Kích thước inner_len+1.
        var map = new int[inner_len + 1];
        var in_cdata = false;
        var i = inner_start;

        while (i < inner_end)
        {
            if (!in_cdata && Matches(source_xml, i, "<![CDATA["))
            {
                in_cdata = true;
                for (var j = 0; j < 9 && i < inner_end; j++, i++) map[i - inner_start] = logical.Length;
                continue;
            }
            if (in_cdata && Matches(source_xml, i, "]]>"))
            {
                in_cdata = false;
                for (var j = 0; j < 3 && i < inner_end; j++, i++) map[i - inner_start] = logical.Length;
                continue;
            }

            var c = source_xml[i];
            if (!in_cdata && c == '&')
            {
                var semi = source_xml.IndexOf(';', i + 1);
                if (semi > i && semi < inner_end)
                {
                    var name = source_xml.Substring(i + 1, semi - (i + 1));
                    if (IsEntityName(name) && entity_values.TryGetValue(name, out var value))
                    {
                        var logical_start = logical.Length;
                        for (; i <= semi; i++) map[i - inner_start] = logical_start;
                        logical.Append(value);
                        continue;
                    }
                }
            }

            map[i - inner_start] = logical.Length;
            logical.Append(c);
            i++;
        }
        map[inner_len] = logical.Length;

        var logical_offset = map[Math.Clamp(offset, inner_start, inner_end) - inner_start];
        return XmlStructureParser.ExtractIdentifierAt(logical.ToString(), logical_offset);
    }

    private static bool TryGetClientScriptInnerRange(
        string source, int offset, out int inner_start, out int inner_end)
    {
        inner_start = 0;
        inner_end = 0;

        var search_from = Math.Min(offset, source.Length - 1);
        if (search_from < 0) return false;

        var open = source.LastIndexOf("<clientScript", search_from, StringComparison.OrdinalIgnoreCase);
        if (open < 0) return false;
        var tag_end = source.IndexOf('>', open);
        if (tag_end < 0) return false;

        var start = tag_end + 1;
        var close = source.IndexOf("</clientScript", start, StringComparison.OrdinalIgnoreCase);
        if (close < 0) return false;

        if (offset < start || offset > close) return false;

        inner_start = start;
        inner_end = close;
        return true;
    }

    private static bool Matches(string text, int index, string token)
        => index + token.Length <= text.Length
           && string.CompareOrdinal(text, index, token, 0, token.Length) == 0;

    private static bool IsEntityName(string name)
    {
        if (name.Length == 0) return false;
        if (!char.IsLetter(name[0]) && name[0] != '_') return false;
        foreach (var c in name)
            if (!char.IsLetterOrDigit(c) && c is not ('_' or '.')) return false;
        return true;
    }
}
