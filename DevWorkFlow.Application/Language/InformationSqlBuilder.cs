using System.Text;

namespace DevWorkFlow.Application.Language;

/// <summary>Dữ liệu lấy từ start-tag để dựng SELECT (Phase 5 #9).</summary>
public sealed class InformationSqlRequest
{
    public required string Information { get; init; }

    /// <summary>Điều kiện lọc — đưa thẳng vào <c>WHERE</c>.</summary>
    public string? Key { get; init; }

    /// <summary>Điều kiện kiểm tra — CHỈ ghi comment, không vào WHERE (spec §4).</summary>
    public string? Check { get; init; }
}

/// <summary>
/// Dựng <c>SELECT</c> từ attribute <c>information</c> của FBO.
///
/// Cú pháp thực tế trong corpus: <c>code$table.display[%l][$điều_kiện_thêm]</c>
/// — ví dụ <c>ma_kh$dmkh.ten_kh%l</c> và <c>ma_dvcs$dmdvcs.ten_dvcs%l$client_code=@@unit</c>.
/// Đoạn <c>$…</c> sau cùng là điều kiện phụ của runtime; theo cùng nguyên tắc với
/// <see cref="InformationSqlRequest.Check"/>, nó chỉ được ghi thành comment chứ không tự đẩy vào
/// <c>WHERE</c> (giá trị có thể chứa biến runtime như <c>@@unit</c> mà SQL Studio không hiểu).
///
/// <c>%l</c>: luôn sinh ĐỦ cột locale (<c>ten_kh</c> + <c>ten_kh2</c>) — không cắt theo ngôn ngữ
/// UI (quyết định B trong spec §2).
/// </summary>
public static class InformationSqlBuilder
{
    public static string? Build(InformationSqlRequest request)
    {
        if (request is null) return null;

        var parsed = Parse(request.Information);
        if (parsed is null) return null;

        var (code, table, display, has_locale, extra_condition) = parsed.Value;

        var columns = new List<string> { code, display };
        // ten_kh%l → ten_kh + ten_kh2; nhưng ten_kh2%l KHÔNG thành ten_kh22.
        if (has_locale && !display.EndsWith('2'))
            columns.Add(display + "2");

        var builder = new StringBuilder();
        builder.Append("-- information=").Append(request.Information).AppendLine();
        if (!string.IsNullOrWhiteSpace(request.Check))
            builder.Append("-- check: ").Append(request.Check!.Trim()).AppendLine();
        if (!string.IsNullOrWhiteSpace(extra_condition))
            builder.Append("-- điều kiện thêm: ").Append(extra_condition).AppendLine();

        builder.Append("SELECT ").Append(string.Join(", ", columns)).AppendLine();
        builder.Append("FROM ").Append(table);

        if (!string.IsNullOrWhiteSpace(request.Key))
            builder.AppendLine().Append("WHERE ").Append(request.Key!.Trim());

        return builder.ToString();
    }

    private static (string Code, string Table, string Display, bool HasLocale, string Extra)? Parse(
        string? information)
    {
        if (string.IsNullOrWhiteSpace(information)) return null;

        var text = information.Trim();

        var dollar = text.IndexOf('$');
        if (dollar <= 0) return null;
        var code = text[..dollar];
        var rest = text[(dollar + 1)..];

        var dot = rest.IndexOf('.');
        if (dot <= 0) return null;
        var table = rest[..dot];
        var tail = rest[(dot + 1)..];

        // Đuôi "$…" (vd %l$client_code=@@unit) là điều kiện phụ, tách ra trước khi xét %l.
        var extra = string.Empty;
        var extra_dollar = tail.IndexOf('$');
        if (extra_dollar >= 0)
        {
            extra = tail[(extra_dollar + 1)..].Trim();
            tail = tail[..extra_dollar];
        }

        var has_locale = tail.EndsWith("%l", StringComparison.Ordinal);
        var display = has_locale ? tail[..^2] : tail;

        // Entity ref (&X;) hoặc giá trị lạ → không dựng SQL đoán mò.
        if (!IsIdentifier(code) || !IsIdentifier(table) || !IsIdentifier(display)) return null;

        return (code, table, display, has_locale, extra);
    }

    private static bool IsIdentifier(string value)
    {
        if (string.IsNullOrEmpty(value)) return false;
        if (!char.IsLetter(value[0]) && value[0] != '_') return false;
        foreach (var c in value)
            if (!char.IsLetterOrDigit(c) && c != '_') return false;
        return true;
    }
}
