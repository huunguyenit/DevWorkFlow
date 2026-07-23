using System.Text;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Hover mô tả hàm SQL, dữ liệu lấy từ <see cref="SqlFunctionCatalog"/> (SoT = catalog XML,
/// KHÔNG hard-code trong UI) — bản SQL của <see cref="FboJsAssistResolver"/>.
///
/// Nguyên tắc:
/// - Trong Form Source/Insight: chỉ chạy khi offset nằm trong island SQL (fail closed như JS).
/// - Trong tab SQL: cả buffer là SQL nên không cần gate island.
/// - Tra tên EXACT (không phân biệt hoa/thường) — không fuzzy-match typo.
/// - Chỉ hover khi tên đứng ở vị trí LỜI GỌI (có <c>(</c> theo sau) hoặc hàm khai báo không tham
///   số; nếu không thì một cột tên trùng hàm sẽ hover nhầm.
/// </summary>
public static class SqlHoverResolver
{
    /// <summary>Hover trên buffer SQL thuần (tab SQL).</summary>
    public static SqlHoverInfo? Hover(string sql_text, int offset, SqlFunctionCatalog catalog)
    {
        if (catalog is null || catalog.HasNoFunctions) return null;
        if (string.IsNullOrEmpty(sql_text)) return null;
        if (offset < 0 || offset > sql_text.Length) return null;

        var name = ReadIdentifierAt(sql_text, offset, out var name_start);
        if (string.IsNullOrEmpty(name)) return null;

        var schema = ReadSchemaBefore(sql_text, name_start, out var schema_start);
        var function = catalog.Find(schema is null ? name : $"{schema}.{name}")
                       ?? catalog.Find(name);
        if (function is null) return null;

        // Lời gọi = có "(" theo sau (hàm) HOẶC có exec/execute đứng trước (stored procedure của
        // FBO gọi không ngoặc: exec FastBusiness$Current$Stock 0, @ma_vt, …).
        var is_call = IsFollowedByOpenParen(sql_text, name_start + name.Length)
                      || IsExecBefore(sql_text, schema is null ? name_start : schema_start);
        if (!is_call && function.Params.Count > 0) return null;

        return Build(function);
    }

    /// <summary>
    /// Hover trên buffer XML (Form Source / Insight) — chỉ trả kết quả khi offset nằm trong thân
    /// <c>&lt;command&gt;</c>/<c>&lt;query&gt;</c>.
    /// </summary>
    public static SqlHoverInfo? HoverInSqlIsland(string buffer_text, int offset, SqlFunctionCatalog catalog)
    {
        if (string.IsNullOrEmpty(buffer_text)) return null;
        if (!SqlIslandLocator.IsInside(buffer_text, offset)) return null;
        return Hover(buffer_text, offset, catalog);
    }

    private static SqlHoverInfo Build(SqlFunctionInfo function)
    {
        var body = new StringBuilder();

        if (!string.IsNullOrWhiteSpace(function.Summary))
            body.Append(function.Summary.Trim());

        foreach (var parameter in function.Params)
        {
            if (string.IsNullOrWhiteSpace(parameter.Name)) continue;
            AppendLine(body);
            body.Append("• ").Append(parameter.Name);
            if (!string.IsNullOrWhiteSpace(parameter.Summary))
                body.Append(" — ").Append(parameter.Summary.Trim());
        }

        AppendSection(body, "Trả về", function.Returns);
        AppendSection(body, "Lưu ý", function.Remarks);
        AppendSection(body, "Ví dụ", function.Example);

        return new SqlHoverInfo
        {
            Title = string.IsNullOrWhiteSpace(function.Signature)
                ? function.QualifiedName
                : function.Signature,
            Body = body.ToString()
        };
    }

    private static void AppendSection(StringBuilder body, string label, string value)
    {
        if (string.IsNullOrWhiteSpace(value)) return;
        if (body.Length > 0) body.Append("\n\n");
        body.Append(label).Append(": ").Append(value.Trim());
    }

    private static void AppendLine(StringBuilder body)
    {
        if (body.Length > 0) body.Append('\n');
    }

    // ── Text scanning ───────────────────────────────────────────────────────

    /// <summary>Identifier SQL đang nằm dưới caret; "" nếu caret không trên identifier.</summary>
    private static string ReadIdentifierAt(string text, int offset, out int start)
    {
        var index = Math.Min(offset, text.Length - 1);
        if (index < 0) { start = 0; return string.Empty; }

        // Caret ngay SAU tên (vd cuối từ) vẫn tính là đang trên tên đó.
        if (!IsIdentChar(text[index]) && index > 0 && IsIdentChar(text[index - 1])) index--;
        if (!IsIdentChar(text[index])) { start = index; return string.Empty; }

        start = index;
        while (start > 0 && IsIdentChar(text[start - 1])) start--;
        var end = index;
        while (end < text.Length && IsIdentChar(text[end])) end++;

        // @bien / @@version không phải hàm trong catalog.
        if (start > 0 && text[start - 1] == '@') { start = index; return string.Empty; }

        return text[start..end];
    }

    /// <summary>
    /// Trả schema nếu ngay trước tên là <c>schema.</c>; null nếu không có.
    /// <paramref name="schema_start"/> = offset đầu schema (dùng để soi từ khoá exec phía trước).
    /// </summary>
    private static string? ReadSchemaBefore(string text, int position, out int schema_start)
    {
        schema_start = position;

        var i = position - 1;
        while (i >= 0 && char.IsWhiteSpace(text[i])) i--;
        if (i < 0 || text[i] != '.') return null;

        var end = i;
        while (end > 0 && char.IsWhiteSpace(text[end - 1])) end--;
        var start = end;
        while (start > 0 && (IsIdentChar(text[start - 1]) || text[start - 1] is '[' or ']')) start--;
        if (start >= end) return null;

        schema_start = start;
        return text[start..end].Replace("[", string.Empty).Replace("]", string.Empty).Trim();
    }

    private static bool IsFollowedByOpenParen(string text, int position)
    {
        var i = position;
        while (i < text.Length && char.IsWhiteSpace(text[i])) i++;
        return i < text.Length && text[i] == '(';
    }

    /// <summary>Từ đứng ngay trước tên là <c>exec</c>/<c>execute</c>?</summary>
    private static bool IsExecBefore(string text, int position)
    {
        var end = position;
        while (end > 0 && char.IsWhiteSpace(text[end - 1])) end--;
        if (end == position) return false; // dính liền tên trước đó → không phải từ khoá riêng

        var start = end;
        while (start > 0 && char.IsLetter(text[start - 1])) start--;
        if (start >= end) return false;

        var word = text[start..end];
        return word.Equals("exec", StringComparison.OrdinalIgnoreCase)
               || word.Equals("execute", StringComparison.OrdinalIgnoreCase);
    }

    /// <summary>
    /// Ký tự tên SQL. Có <c>$</c> vì stored procedure FBO đặt tên kiểu
    /// <c>FastBusiness$Current$Stock</c> — thiếu nó thì chỉ đọc được mảnh cuối "Stock".
    /// </summary>
    private static bool IsIdentChar(char c) => char.IsLetterOrDigit(c) || c is '_' or '#' or '$';
}
