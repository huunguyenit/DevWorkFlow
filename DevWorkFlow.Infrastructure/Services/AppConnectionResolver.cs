using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Thay %Database / %UserID trong appConnectionString bằng entity.cdata và user tool.
/// </summary>
public static class AppConnectionResolver
{
    public static void ApplyAppDatabase(
        ProgramContext program,
        IReadOnlyList<AppDatabaseInfo> databases,
        int? connect_timeout_seconds = null)
    {
        program.AppDatabases = databases;
        if (databases.Count == 0)
            return;

        // Giữ template có %Database để SQL Studio đổi app
        if (program.AppConnectionString.Contains("%Database", StringComparison.OrdinalIgnoreCase))
            program.AppConnectionStringTemplate = program.AppConnectionString;
        else if (string.IsNullOrWhiteSpace(program.AppConnectionStringTemplate))
            program.AppConnectionStringTemplate = program.AppConnectionString;

        // Mặc định: app DB đầu tiên (1 sys — nhiều app; UI chọn sau)
        var selected = databases[0];
        program.AppDatabaseName = selected.DatabaseName;
        var timeout = connect_timeout_seconds ?? program.CommandTimeoutSeconds;
        program.AppConnectionString = ResolveAppConnection(
            program,
            selected.DatabaseName,
            timeout);
    }

    /// <summary>Resolve CS app cho một database cụ thể (từ template %Database).</summary>
    public static string ResolveAppConnection(ProgramContext program, string database_name) =>
        ResolveAppConnection(program, database_name, program.CommandTimeoutSeconds);

    public static string ResolveAppConnection(
        ProgramContext program,
        string database_name,
        int connect_timeout_seconds)
    {
        var template = !string.IsNullOrWhiteSpace(program.AppConnectionStringTemplate)
            ? program.AppConnectionStringTemplate
            : program.AppConnectionString;
        return ReplacePlaceholders(template, database_name, connect_timeout_seconds);
    }

    public static string ReplacePlaceholders(string connection_string, string database_name) =>
        ReplacePlaceholders(connection_string, database_name, WebConfigReader.DefaultCommandTimeoutSeconds);

    public static string ReplacePlaceholders(
        string connection_string,
        string database_name,
        int command_timeout_seconds)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
            return connection_string;

        var user_id = Environment.UserName;
        if (string.IsNullOrWhiteSpace(user_id))
            user_id = "DevWorkFlow";

        var result = connection_string
            .Replace("%Database", database_name, StringComparison.OrdinalIgnoreCase)
            .Replace("%UserID", user_id, StringComparison.OrdinalIgnoreCase);

        return WebConfigReader.EnsureConnectionSettings(result, command_timeout_seconds);
    }

    /// <summary>Lấy tên DB từ connection string (Initial Catalog / Database).</summary>
    public static string? TryGetDatabaseName(string? connection_string)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
            return null;

        foreach (var part in connection_string.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
        {
            var eq = part.IndexOf('=');
            if (eq <= 0) continue;

            var key = part[..eq].Trim();
            var value = part[(eq + 1)..].Trim();
            if (value.Length == 0) continue;

            if (key.Equals("Initial Catalog", StringComparison.OrdinalIgnoreCase)
                || key.Equals("Database", StringComparison.OrdinalIgnoreCase))
            {
                return value;
            }
        }

        return null;
    }
}
