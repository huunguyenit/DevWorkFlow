namespace DevWorkFlow.Application.Language;

/// <summary>Tên object SQL đã tách schema (mặc định <c>dbo</c>).</summary>
public sealed record SqlObjectName(string Schema, string Name)
{
    public string Qualified => $"{Schema}.{Name}";
}

/// <summary>
/// Lấy tên procedure/function tại offset (Phase 5 #16).
/// Hỗ trợ <c>proc</c>, <c>dbo.proc</c>, <c>[dbo].[proc]</c> và tên FBO có <c>$</c>
/// (<c>FastBusiness$App$Voucher$UpdateInquiryTable</c>).
///
/// Nhận diện theo MỘT trong hai điều kiện — SQL của FBO phần lớn nằm trong khai báo
/// <c>&lt;!ENTITY&gt;</c> chứ không nằm trực tiếp trong <c>&lt;command&gt;</c>, nên chỉ gate theo
/// island sẽ bỏ sót gần hết (đo trên Dir/AITran.xml):
/// 1. Con trỏ trong island SQL (<c>command</c>/<c>query</c>, trừ <c>event="Checking"</c>), hoặc
/// 2. Identifier đứng ngay sau từ khoá <c>EXEC</c>/<c>EXECUTE</c> — tín hiệu mạnh, gần như không
///    dương tính giả, và đúng với thao tác người dùng thực sự làm.
/// </summary>
public static class SqlObjectNameAtOffset
{
    public static SqlObjectName? TryResolve(string source_xml, int offset)
    {
        if (string.IsNullOrEmpty(source_xml)) return null;
        if (offset < 0 || offset > source_xml.Length) return null;

        var name = ReadIdentifierAt(source_xml, offset, out var name_start);
        if (string.IsNullOrEmpty(name)) return null;

        var schema = ReadSchemaBefore(source_xml, name_start, out var qualified_start);
        var accepted = SqlIslandLocator.IsInside(source_xml, offset)
                       || IsPrecededByExec(source_xml, qualified_start);
        if (!accepted) return null;

        return new SqlObjectName(schema ?? "dbo", name);
    }

    /// <summary>Từ đứng ngay trước tên (bỏ khoảng trắng) là EXEC/EXECUTE?</summary>
    private static bool IsPrecededByExec(string text, int name_start)
    {
        var i = name_start - 1;
        while (i >= 0 && char.IsWhiteSpace(text[i])) i--;
        if (i < 0) return false;

        var end = i + 1;
        while (i >= 0 && char.IsLetter(text[i])) i--;
        var start = i + 1;
        if (start >= end) return false;

        var word = text[start..end];
        return word.Equals("exec", StringComparison.OrdinalIgnoreCase)
               || word.Equals("execute", StringComparison.OrdinalIgnoreCase);
    }

    /// <summary>Identifier dưới caret; hỗ trợ <c>[name]</c>.</summary>
    private static string ReadIdentifierAt(string text, int offset, out int start)
    {
        var index = Math.Min(offset, text.Length - 1);
        start = index;
        if (index < 0) return string.Empty;

        // Caret ngay sau identifier (vd cuối từ) → lùi một bước.
        if (!IsIdentChar(text[index]) && index > 0 && IsIdentChar(text[index - 1])) index--;
        if (!IsIdentChar(text[index])) return string.Empty;

        start = index;
        while (start > 0 && IsIdentChar(text[start - 1])) start--;
        var end = index;
        while (end < text.Length && IsIdentChar(text[end])) end++;

        // Nuốt dấu '[' mở nếu đang trong [name]
        if (start > 0 && text[start - 1] == '[') start--;

        var raw = text[start..end].TrimStart('[');
        return raw;
    }

    /// <summary>
    /// Schema đứng trước dấu chấm ngay trước tên; null nếu không có.
    /// <paramref name="qualified_start"/> = đầu của cả cụm <c>schema.name</c> (hoặc chính tên).
    /// </summary>
    private static string? ReadSchemaBefore(string text, int name_start, out int qualified_start)
    {
        qualified_start = name_start;

        var i = name_start - 1;
        // bỏ ']' của [dbo] và khoảng trắng
        while (i >= 0 && (char.IsWhiteSpace(text[i]) || text[i] == ']')) i--;
        if (i < 0 || text[i] != '.') return null;

        i--;
        while (i >= 0 && (char.IsWhiteSpace(text[i]) || text[i] == ']')) i--;
        var end = i + 1;
        while (i >= 0 && IsIdentChar(text[i])) i--;
        var start = i + 1;

        if (start >= end) return null;

        if (start > 0 && text[start - 1] == '[') start--;
        qualified_start = start;
        return text[start..end].Trim('[', ']');
    }

    /// <summary>SQL identifier: chữ, số, <c>_</c>, <c>@</c>, <c>#</c>, <c>$</c>.</summary>
    private static bool IsIdentChar(char c) =>
        char.IsLetterOrDigit(c) || c is '_' or '@' or '#' or '$';
}
