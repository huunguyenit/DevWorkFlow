namespace DevWorkFlow.Domain.Models.Sql;

/// <summary>Một đoạn SQL lấy từ XML controller (command/query) — nền cho auto-declare sau này.</summary>
public sealed class FboSqlFragment
{
    /// <summary>"command" hoặc "query".</summary>
    public required string Kind { get; init; }

    /// <summary>Giá trị attribute event (Declare, Loading, Finding, …).</summary>
    public required string Event { get; init; }

    /// <summary>Nội dung SQL thô (có thể còn &amp;Entity; — SQL Studio expand khi mở từ form).</summary>
    public required string Text { get; init; }

    /// <summary>Gợi ý số dòng trong XML nguồn (1-based), 0 nếu không rõ.</summary>
    public int LineHint { get; init; }
}
