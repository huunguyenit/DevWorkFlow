using DevWorkFlow.Domain.Models.Sql;

namespace DevWorkFlow.Application.Abstractions;

/// <summary>Chạy T-SQL script (tách batch GO) trên connection string cho trước.</summary>
public interface ISqlScriptRunner
{
    Task<SqlRunResult> ExecuteAsync(
        string connection_string,
        string script,
        int command_timeout_seconds = 60,
        CancellationToken cancellation_token = default);
}
