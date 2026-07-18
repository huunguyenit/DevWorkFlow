namespace DevWorkFlow.Domain.Models;

/// <summary>Node cây menu (tối đa 3 cấp) dựng từ wcommand.</summary>
public class MenuTreeNode
{
    public string WmenuId { get; set; } = string.Empty;
    public string? WmenuId0 { get; set; }
    public string Title { get; set; } = string.Empty;
    public string? TitleEn { get; set; }
    public string? SysId { get; set; }
    public string? SysCode { get; set; }
    /// <summary>D = List, V = Voucher.</summary>
    public string? Type { get; set; }
    public string? Link { get; set; }
    public string? Parameter { get; set; }
    public int Level { get; set; }
    public WCommandItem? Source { get; set; }
    public List<MenuTreeNode> Children { get; set; } = [];

    /// <summary>wcommand.bar = "-" → vẽ 1 line separator.</summary>
    public bool IsSeparator { get; set; }

    public bool HasLink => !IsSeparator && !string.IsNullOrWhiteSpace(Link);
    public bool IsLeaf => Children.Count == 0;

    /// <summary>Khớp LIKE filter ưu tiên: bar, sysid, wmenu_id (kèm syscode/link).</summary>
    public bool MatchesFilter(string keyword)
    {
        if (string.IsNullOrWhiteSpace(keyword)) return true;
        // Ưu tiên các cột user yêu cầu
        if (Contains(Title, keyword) // bar
            || Contains(SysId, keyword)
            || Contains(WmenuId, keyword))
            return true;
        return Contains(TitleEn, keyword)
            || Contains(Link, keyword)
            || Contains(SysCode, keyword);
    }

    private static bool Contains(string? source, string keyword) =>
        !string.IsNullOrEmpty(source)
        && source.Contains(keyword, StringComparison.OrdinalIgnoreCase);
}
