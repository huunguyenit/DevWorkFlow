using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;
using Microsoft.Data.SqlClient;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>Đọc sys.entity → danh sách app database (cdata).</summary>
public sealed class EntityRepository : IEntityRepository
{
    private const string Sql = """
        SELECT
            RTRIM(code) AS code,
            RTRIM(cname) AS cname,
            RTRIM(cdata) AS cdata
        FROM entity
        WHERE NULLIF(RTRIM(cdata), '') IS NOT NULL
        ORDER BY code
        """;

    public async Task<IReadOnlyList<AppDatabaseInfo>> GetAppDatabasesAsync(string sys_connection_string)
    {
        if (string.IsNullOrWhiteSpace(sys_connection_string))
            return [];

        var items = new List<AppDatabaseInfo>();
        await using var conn = new SqlConnection(sys_connection_string);
        await conn.OpenAsync();
        await using var cmd = new SqlCommand(Sql, conn);
        await using var reader = await cmd.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            var cdata = reader["cdata"]?.ToString()?.Trim() ?? string.Empty;
            if (string.IsNullOrWhiteSpace(cdata)) continue;
            items.Add(new AppDatabaseInfo
            {
                Code = reader["code"]?.ToString()?.Trim() ?? string.Empty,
                Name = reader["cname"]?.ToString()?.Trim() ?? string.Empty,
                DatabaseName = cdata
            });
        }

        return items;
    }
}
