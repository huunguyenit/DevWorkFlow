using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;
using Microsoft.Data.SqlClient;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>Đọc menu từ bảng wcommand trên database sys.</summary>
public class WcommandRepository : IWcommandRepository
{
    private const string Sql = """
        SELECT
            wmenu_id, wmenu_id0, menu_id, bar, bar2,
            link, parameter, icon_url, status, icon,
            sysid, type, syscode, msys, target, xtype, edition, expl_icon
        FROM wcommand
        WHERE ISNULL(status, '1') = '1'
        ORDER BY wmenu_id
        """;

    public async Task<IReadOnlyList<WCommandItem>> GetAllAsync(string sys_connection_string)
    {
        if (string.IsNullOrWhiteSpace(sys_connection_string))
            throw new ArgumentException("sys_connection_string trống.", nameof(sys_connection_string));

        var items = new List<WCommandItem>();

        await using var conn = new SqlConnection(sys_connection_string);
        await conn.OpenAsync();

        await using var cmd = new SqlCommand(Sql, conn);
        await using var reader = await cmd.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            items.Add(new WCommandItem
            {
                WmenuId = GetString(reader, "wmenu_id") ?? string.Empty,
                WmenuId0 = NullIfEmpty(GetString(reader, "wmenu_id0")),
                MenuId = GetString(reader, "menu_id"),
                Bar = GetString(reader, "bar"),
                Bar2 = GetString(reader, "bar2"),
                Link = GetString(reader, "link"),
                Parameter = GetString(reader, "parameter"),
                IconUrl = GetString(reader, "icon_url"),
                Status = GetString(reader, "status"),
                Icon = GetString(reader, "icon"),
                SysId = NullIfEmpty(GetString(reader, "sysid")),
                Type = NullIfEmpty(GetString(reader, "type")),
                SysCode = GetString(reader, "syscode"),
                MSys = GetString(reader, "msys"),
                Target = GetString(reader, "target"),
                XType = GetString(reader, "xtype"),
                Edition = GetString(reader, "edition"),
                ExplIcon = GetString(reader, "expl_icon")
            });
        }

        return items;
    }

    private static string? GetString(SqlDataReader reader, string column)
    {
        var ordinal = reader.GetOrdinal(column);
        return reader.IsDBNull(ordinal) ? null : reader.GetValue(ordinal)?.ToString()?.Trim();
    }

    private static string? NullIfEmpty(string? value) =>
        string.IsNullOrWhiteSpace(value) ? null : value;
}
