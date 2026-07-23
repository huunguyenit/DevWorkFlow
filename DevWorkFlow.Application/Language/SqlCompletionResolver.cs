using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Completion SQL từ <see cref="SqlFunctionCatalog"/> (SoT = <c>sql-functions.xml</c>) — bản SQL
/// của <see cref="FboJsAssistResolver"/>.Complete.
///
/// Nguyên tắc (giữ nguyên luật đã áp cho JS):
/// - Insight là buffer read-only → luôn rỗng.
/// - Trong XML: chỉ gợi ý khi caret nằm trong island SQL (command/query/response action).
/// - Trong tab SQL: cả buffer là SQL nên không cần gate.
/// - Có <c>schema.</c> trước caret → chỉ hàm của schema đó; không có thì hàm + từ khoá.
/// - Lọc prefix KHÔNG phân biệt hoa/thường (T-SQL), Monaco lọc thêm lần nữa ở client.
/// </summary>
public static class SqlCompletionResolver
{
    public static SqlCompletionList Complete(
        string buffer_text, int offset, SqlFunctionCatalog catalog)
    {
        if (catalog is null || catalog.IsEmpty) return SqlCompletionList.Empty;
        if (buffer_text is null || offset < 0 || offset > buffer_text.Length)
            return SqlCompletionList.Empty;

        var prefix = ReadIdentifierBefore(buffer_text, offset, out var prefix_start);
        var schema = ReadSchemaBefore(buffer_text, prefix_start);

        var items = new List<SqlCompletionItem>();

        foreach (var function in catalog.Functions)
        {
            if (string.IsNullOrWhiteSpace(function.Name)) continue;
            if (schema is not null
                && !string.Equals(function.Schema, schema, StringComparison.OrdinalIgnoreCase))
                continue;
            if (!StartsWith(function.Name, prefix)) continue;

            items.Add(new SqlCompletionItem
            {
                Label = function.Name,
                InsertText = function.Name,
                // Proc FBO gọi bằng exec (signature bắt đầu bằng "exec") → phân loại riêng để
                // icon trong Monaco khác hàm scalar.
                Kind = function.Signature.TrimStart().StartsWith("exec", StringComparison.OrdinalIgnoreCase)
                    ? SqlCompletionKind.Procedure
                    : SqlCompletionKind.Function,
                Detail = string.IsNullOrWhiteSpace(function.Signature)
                    ? function.QualifiedName
                    : function.Signature,
                Documentation = function.Summary
            });
        }

        // Sau dấu chấm chỉ có hàm của schema — từ khoá không có nghĩa ở đó.
        if (schema is null)
        {
            foreach (var keyword in catalog.Keywords)
            {
                if (string.IsNullOrWhiteSpace(keyword.Name)) continue;
                if (!StartsWith(keyword.Name, prefix)) continue;

                items.Add(new SqlCompletionItem
                {
                    Label = keyword.Name,
                    InsertText = string.IsNullOrWhiteSpace(keyword.InsertText)
                        ? keyword.Name
                        : keyword.InsertText,
                    Kind = SqlCompletionKind.Keyword,
                    Documentation = keyword.Summary
                });
            }
        }

        return items.Count == 0
            ? SqlCompletionList.Empty
            : new SqlCompletionList { Items = items };
    }

    /// <summary>Completion trên buffer XML — rỗng nếu caret ngoài island SQL.</summary>
    public static SqlCompletionList CompleteInSqlIsland(
        string buffer_text, int offset, SqlFunctionCatalog catalog)
    {
        if (string.IsNullOrEmpty(buffer_text)) return SqlCompletionList.Empty;
        return SqlIslandLocator.IsInside(buffer_text, offset)
            ? Complete(buffer_text, offset, catalog)
            : SqlCompletionList.Empty;
    }

    private static bool StartsWith(string name, string prefix) =>
        prefix.Length == 0
        || name.StartsWith(prefix, StringComparison.OrdinalIgnoreCase);

    /// <summary>Phần định danh người dùng đang gõ, kết thúc ngay TRƯỚC caret.</summary>
    private static string ReadIdentifierBefore(string text, int offset, out int start)
    {
        start = offset;
        while (start > 0 && IsIdentChar(text[start - 1])) start--;
        return start >= offset ? string.Empty : text[start..offset];
    }

    /// <summary>Schema nếu ngay trước phần đang gõ là <c>schema.</c>; null nếu không.</summary>
    private static string? ReadSchemaBefore(string text, int position)
    {
        var i = position - 1;
        while (i >= 0 && char.IsWhiteSpace(text[i])) i--;
        if (i < 0 || text[i] != '.') return null;

        var end = i;
        while (end > 0 && char.IsWhiteSpace(text[end - 1])) end--;
        var start = end;
        while (start > 0 && (IsIdentChar(text[start - 1]) || text[start - 1] is '[' or ']')) start--;
        if (start >= end) return null;

        return text[start..end].Replace("[", string.Empty).Replace("]", string.Empty).Trim();
    }

    private static bool IsIdentChar(char c) => char.IsLetterOrDigit(c) || c is '_' or '#' or '$';
}
