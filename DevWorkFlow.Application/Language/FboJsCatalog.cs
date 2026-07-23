using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Catalog đã index để tra nhanh: alias → type, (type, member) → member.
///
/// Alias phân biệt HOA/thường (JS FBO phân biệt: <c>f</c> ≠ <c>F</c>); tên member cũng tra
/// exact — Phase 4 không fuzzy-match typo.
/// </summary>
public sealed class FboJsCatalog
{
    private readonly Dictionary<string, FboJsTypeInfo> _type_by_alias = new(StringComparer.Ordinal);
    private readonly Dictionary<string, FboJsTypeInfo> _type_by_id = new(StringComparer.Ordinal);

    private FboJsCatalog(FboJsCatalogData data)
    {
        Data = data;

        foreach (var type in data.Types)
        {
            if (string.IsNullOrWhiteSpace(type.Id)) continue;
            _type_by_id[type.Id] = type;
            foreach (var alias in type.Aliases)
                if (!string.IsNullOrWhiteSpace(alias))
                    _type_by_alias[alias] = type;
        }
    }

    public static FboJsCatalog Empty { get; } = new(new FboJsCatalogData());

    public static FboJsCatalog FromData(FboJsCatalogData data) => new(data ?? new FboJsCatalogData());

    public FboJsCatalogData Data { get; }

    public IReadOnlyList<FboJsMemberInfo> Globals => Data.Globals;

    /// <summary>Mọi alias có thể gõ (dùng cho completion khi chưa có receiver).</summary>
    public IReadOnlyList<string> AllAliases => [.. _type_by_alias.Keys];

    public FboJsTypeInfo? ResolveTypeByAlias(string alias) =>
        string.IsNullOrEmpty(alias) ? null : _type_by_alias.GetValueOrDefault(alias);

    public FboJsTypeInfo? FindTypeById(string type_id) =>
        string.IsNullOrEmpty(type_id) ? null : _type_by_id.GetValueOrDefault(type_id);

    public IReadOnlyList<FboJsMemberInfo> GetMembers(string type_id) =>
        FindTypeById(type_id)?.Members ?? [];

    public FboJsMemberInfo? FindMember(string type_id, string member_name)
    {
        if (string.IsNullOrEmpty(member_name)) return null;
        foreach (var member in GetMembers(type_id))
            if (string.Equals(member.Name, member_name, StringComparison.Ordinal))
                return member;
        return null;
    }

    public FboJsMemberInfo? FindGlobal(string name)
    {
        if (string.IsNullOrEmpty(name)) return null;
        foreach (var member in Globals)
            if (string.Equals(member.Name, name, StringComparison.Ordinal))
                return member;
        return null;
    }
}
