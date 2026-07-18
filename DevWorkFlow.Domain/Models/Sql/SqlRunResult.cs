using System.Data;

namespace DevWorkFlow.Domain.Models.Sql;

/// <summary>Target database khi Execute trong SQL Studio.</summary>
public enum SqlTargetDb
{
    App = 0,
    Sys = 1
}

/// <summary>Một result set trả về từ batch.</summary>
public sealed class SqlResultSet
{
    public required string Title { get; init; }
    public required DataTable Table { get; init; }
}

/// <summary>Kết quả chạy script (nhiều batch GO).</summary>
public sealed class SqlRunResult
{
    public bool Succeeded { get; init; }
    public IReadOnlyList<string> Messages { get; init; } = [];
    public IReadOnlyList<SqlResultSet> ResultSets { get; init; } = [];
    public int TotalRowsAffected { get; init; }
    public string? ErrorMessage { get; init; }
    public TimeSpan Elapsed { get; init; }
}
