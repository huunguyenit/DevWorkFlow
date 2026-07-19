using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Infrastructure.Services;
using UI.ViewModels.Explorer;

namespace UI.Services;

/// <summary>Sinh script SQL từ object DB theo Config/xml + Config/SQL.</summary>
public sealed class DatabaseObjectScripter
{
    private readonly ISqlScriptRunner _sql_runner;
    private readonly AppConfigStore _config;

    public DatabaseObjectScripter(ISqlScriptRunner sql_runner, AppConfigStore config)
    {
        _sql_runner = sql_runner;
        _config = config;
    }

    public async Task<(string title, string script)?> BuildAsync(
        string connection_string,
        string schema,
        string name,
        DatabaseObjectKind kind,
        int click,
        CancellationToken ct = default)
    {
        var action = _config.DatabaseObjectActions
            .FirstOrDefault(a =>
                a.Kind.Equals(kind.ToString(), StringComparison.OrdinalIgnoreCase)
                && a.Click == click);

        if (action is null)
            return null;

        var script_file = action.Script;
        if (string.IsNullOrWhiteSpace(script_file))
            return null;

        var sql = _config.LoadSqlFile(script_file);
        sql = ApplyPlaceholders(sql, schema, name);

        var result = await _sql_runner.ExecuteAsync(
            connection_string,
            sql,
            command_timeout_seconds: WebConfigReader.GetTimeoutSeconds(
                connection_string,
                _config.Database.CommandTimeoutSeconds),
            cancellation_token: ct);

        if (!result.Succeeded)
            throw new InvalidOperationException(result.ErrorMessage ?? "Không lấy được định nghĩa object.");

        var table = result.ResultSets.FirstOrDefault()?.Table;
        var body = kind == DatabaseObjectKind.Table
            ? BuildCreateTable(schema, name, table)
            : ReadDefinition(table);

        if (string.IsNullOrWhiteSpace(body))
            throw new InvalidOperationException($"Không có định nghĩa cho {schema}.{name}.");

        body = TransformBody(body, action.Mode, kind);

        if (action.Mode.Equals("dropCreate", StringComparison.OrdinalIgnoreCase)
            && !string.IsNullOrWhiteSpace(action.DropTemplate))
        {
            var drop = ApplyPlaceholders(action.DropTemplate, schema, name);
            body = drop + body;
        }

        var title = ApplyPlaceholders(
            string.IsNullOrWhiteSpace(action.Title) ? $"{schema}.{name}" : action.Title,
            schema,
            name);

        return (title, body.Trim() + Environment.NewLine);
    }

    private static string ReadDefinition(DataTable? table)
    {
        if (table is null || table.Rows.Count == 0) return string.Empty;
        var row = table.Rows[0];
        if (table.Columns.Contains("definition"))
            return Convert.ToString(row["definition"]) ?? string.Empty;
        return Convert.ToString(row[0]) ?? string.Empty;
    }

    private static string TransformBody(string body, string mode, DatabaseObjectKind kind)
    {
        if (!mode.Equals("alter", StringComparison.OrdinalIgnoreCase))
            return body;

        // CREATE xxx → ALTER xxx (chỉ token đầu)
        return Regex.Replace(
            body,
            @"\bCREATE\s+(OR\s+ALTER\s+)?(VIEW|PROCEDURE|PROC|FUNCTION)\b",
            "ALTER $2",
            RegexOptions.IgnoreCase);
    }

    private static string BuildCreateTable(string schema, string name, DataTable? table)
    {
        if (table is null || table.Rows.Count == 0)
            return string.Empty;

        var sb = new StringBuilder();
        var quoted = $"{Quote(schema)}.{Quote(name)}";
        sb.AppendLine($"CREATE TABLE {quoted}");
        sb.AppendLine("(");

        var pk_cols = new List<string>();
        var lines = new List<string>();

        foreach (DataRow row in table.Rows)
        {
            var col_name = Convert.ToString(row["column_name"]) ?? string.Empty;
            if (string.IsNullOrWhiteSpace(col_name)) continue;

            var type_name = Convert.ToString(row["type_name"]) ?? "nvarchar";
            var max_length = row["max_length"] is int ml ? ml : Convert.ToInt32(row["max_length"]);
            var precision = Convert.ToInt32(row["precision"]);
            var scale = Convert.ToInt32(row["scale"]);
            var is_nullable = row["is_nullable"] is bool b ? b : Convert.ToBoolean(row["is_nullable"]);
            var is_identity = row["is_identity"] is bool idn ? idn : Convert.ToBoolean(row["is_identity"]);
            var is_pk = table.Columns.Contains("is_primary_key")
                        && (row["is_primary_key"] is bool pk ? pk : Convert.ToBoolean(row["is_primary_key"]));

            if (is_pk)
                pk_cols.Add(Quote(col_name));

            var type_sql = FormatType(type_name, max_length, (byte)Math.Clamp(precision, 0, 38), (byte)Math.Clamp(scale, 0, 38));
            var null_sql = is_nullable ? "NULL" : "NOT NULL";
            var identity_sql = is_identity ? " IDENTITY(1,1)" : string.Empty;
            lines.Add($"    {Quote(col_name)} {type_sql}{identity_sql} {null_sql}");
        }

        if (pk_cols.Count > 0)
            lines.Add($"    CONSTRAINT {Quote($"PK_{name}")} PRIMARY KEY ({string.Join(", ", pk_cols.Distinct())})");

        sb.AppendLine(string.Join("," + Environment.NewLine, lines));
        sb.AppendLine(");");
        return sb.ToString();
    }

    private static string FormatType(string type_name, int max_length, byte precision, byte scale)
    {
        var t = type_name.ToLowerInvariant();
        return t switch
        {
            "nvarchar" or "nchar" => max_length < 0 || max_length == -1
                ? $"{t}(max)"
                : $"{t}({max_length / 2})",
            "varchar" or "char" or "varbinary" or "binary" => max_length < 0 || max_length == -1
                ? $"{t}(max)"
                : $"{t}({max_length})",
            "decimal" or "numeric" => $"{t}({precision},{scale})",
            "datetime2" or "time" or "datetimeoffset" => scale > 0 ? $"{t}({scale})" : t,
            _ => t
        };
    }

    private static string ApplyPlaceholders(string template, string schema, string name)
    {
        var full = $"{schema}.{name}";
        var quoted = $"{Quote(schema)}.{Quote(name)}";
        return template
            .Replace("{{schema}}", EscapeSqlLiteral(schema), StringComparison.Ordinal)
            .Replace("{{name}}", EscapeSqlLiteral(name), StringComparison.Ordinal)
            .Replace("{{full_name}}", EscapeSqlLiteral(full), StringComparison.Ordinal)
            .Replace("{schema}", schema, StringComparison.Ordinal)
            .Replace("{name}", name, StringComparison.Ordinal)
            .Replace("{full_name}", full, StringComparison.Ordinal)
            .Replace("{quoted_name}", quoted, StringComparison.Ordinal);
    }

    private static string Quote(string ident) =>
        "[" + ident.Replace("]", "]]", StringComparison.Ordinal) + "]";

    private static string EscapeSqlLiteral(string value) =>
        value.Replace("'", "''", StringComparison.Ordinal);
}
