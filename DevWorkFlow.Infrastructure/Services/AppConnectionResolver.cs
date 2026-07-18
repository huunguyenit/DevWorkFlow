using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Thay %Database / %UserID trong appConnectionString bằng entity.cdata và user tool.
/// </summary>
public static class AppConnectionResolver
{
    public static void ApplyAppDatabase(ProgramContext program, IReadOnlyList<AppDatabaseInfo> databases)
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
        program.AppConnectionString = ResolveAppConnection(program, selected.DatabaseName);
    }

    /// <summary>Resolve CS app cho một database cụ thể (từ template %Database).</summary>
    public static string ResolveAppConnection(ProgramContext program, string database_name)
    {
        var template = !string.IsNullOrWhiteSpace(program.AppConnectionStringTemplate)
            ? program.AppConnectionStringTemplate
            : program.AppConnectionString;
        return ReplacePlaceholders(template, database_name);
    }

    public static string ReplacePlaceholders(string connection_string, string database_name)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
            return connection_string;

        var user_id = Environment.UserName;
        if (string.IsNullOrWhiteSpace(user_id))
            user_id = "FboStudio";

        var result = connection_string
            .Replace("%Database", database_name, StringComparison.OrdinalIgnoreCase)
            .Replace("%UserID", user_id, StringComparison.OrdinalIgnoreCase);

        return WebConfigReader.EnsureSslSettings(result);
    }
}
