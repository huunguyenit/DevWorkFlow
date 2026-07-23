using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Catalog hàm SQL đã index để tra nhanh theo tên.
///
/// Khác catalog JS: T-SQL KHÔNG phân biệt hoa/thường nên tra bằng
/// <see cref="StringComparer.OrdinalIgnoreCase"/>, và tra được cả tên đủ schema
/// (<c>dbo.ff_InList</c>) lẫn tên trần (<c>ff_InList</c>) — trong XML người ta viết cả hai kiểu.
/// </summary>
public sealed class SqlFunctionCatalog
{
    private readonly Dictionary<string, SqlFunctionInfo> _by_name =
        new(StringComparer.OrdinalIgnoreCase);

    private SqlFunctionCatalog(SqlFunctionCatalogData data)
    {
        Data = data;

        foreach (var group in data.Groups)
        {
            foreach (var function in group.Functions)
            {
                if (string.IsNullOrWhiteSpace(function.Name)) continue;

                // Tên trần: khai báo TRƯỚC thắng — file config đọc từ trên xuống.
                _by_name.TryAdd(function.Name, function);
                if (!string.IsNullOrWhiteSpace(function.Schema))
                    _by_name.TryAdd(function.QualifiedName, function);
            }
        }
    }

    public static SqlFunctionCatalog Empty { get; } = new(new SqlFunctionCatalogData());

    public static SqlFunctionCatalog FromData(SqlFunctionCatalogData data) =>
        new(data ?? new SqlFunctionCatalogData());

    public SqlFunctionCatalogData Data { get; }

    public IReadOnlyList<SqlFunctionInfo> Functions =>
        [.. Data.Groups.SelectMany(g => g.Functions)];

    public IReadOnlyList<SqlKeywordInfo> Keywords => Data.Keywords;

    public bool IsEmpty => _by_name.Count == 0 && Data.Keywords.Count == 0;

    /// <summary>Không có hàm nào để tra hover (khác <see cref="IsEmpty"/> vì catalog có thể chỉ có keyword).</summary>
    public bool HasNoFunctions => _by_name.Count == 0;

    /// <summary>
    /// Tra hàm theo tên; nhận <c>name</c>, <c>schema.name</c> và cả <c>[schema].[name]</c>.
    /// Không khớp → null (không fuzzy-match, cùng luật với catalog JS).
    /// </summary>
    public SqlFunctionInfo? Find(string? name)
    {
        if (string.IsNullOrWhiteSpace(name)) return null;

        var cleaned = name.Replace("[", string.Empty).Replace("]", string.Empty).Trim();
        if (cleaned.Length == 0) return null;

        if (_by_name.TryGetValue(cleaned, out var hit)) return hit;

        // "sys.dbo.ff_x" hoặc schema lạ → thử phần tên cuối cùng.
        var last_dot = cleaned.LastIndexOf('.');
        return last_dot >= 0 && last_dot < cleaned.Length - 1
            ? _by_name.GetValueOrDefault(cleaned[(last_dot + 1)..])
            : null;
    }
}
