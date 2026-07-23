using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Language;

/// <summary>Một member xuất hiện trong code nhưng chưa được mô tả trong catalog.</summary>
public sealed record FboJsCatalogGap(string Receiver, string Member, int Occurrences)
{
    public string Display => $"{Receiver}.{Member} ({Occurrences})";
}

/// <summary>
/// Dò các <c>alias.member</c> có trong code nhưng THIẾU trong catalog — công cụ DEV để biết nên
/// bổ sung gì vào <c>fbo-js.catalog.xml</c>.
///
/// Cố ý **không** tự ghi vào XML (spec §4): catalog là tài liệu người viết, mô tả/tác dụng phải
/// do người soát. Scanner chỉ báo cáo.
/// </summary>
public static class FboJsCatalogGapScanner
{
    private static readonly Regex MemberAccessRegex = new(
        @"(?<receiver>[A-Za-z_$][\w$]*)\s*\.\s*(?<member>[A-Za-z_$][\w$]*)",
        RegexOptions.Compiled);

    /// <summary>
    /// Chỉ xét receiver là alias đã biết trong catalog — tránh nhiễu từ mọi biểu thức
    /// <c>a.b</c> của JS thường.
    /// </summary>
    public static IReadOnlyList<FboJsCatalogGap> FindMissingMembers(
        string buffer_text, FboJsCatalog catalog)
    {
        if (string.IsNullOrEmpty(buffer_text) || catalog is null) return [];

        var counts = new Dictionary<(string Receiver, string Member), int>();

        foreach (Match match in MemberAccessRegex.Matches(buffer_text))
        {
            var receiver = match.Groups["receiver"].Value;
            var member = match.Groups["member"].Value;

            var type = catalog.ResolveTypeByAlias(receiver);
            if (type is null) continue;                       // không phải alias FBO → bỏ qua
            if (catalog.FindMember(type.Id, member) is not null) continue; // đã có mô tả

            var key = (receiver, member);
            counts[key] = counts.GetValueOrDefault(key) + 1;
        }

        return [.. counts
            .Select(kv => new FboJsCatalogGap(kv.Key.Receiver, kv.Key.Member, kv.Value))
            .OrderByDescending(g => g.Occurrences)
            .ThenBy(g => g.Display, StringComparer.Ordinal)];
    }
}
