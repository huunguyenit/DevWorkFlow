using System.Data;
using System.Diagnostics;
using System.Text;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models.Sql;
using Microsoft.Data.SqlClient;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>Execute T-SQL qua Microsoft.Data.SqlClient; tách batch theo dòng GO.</summary>
public sealed class SqlScriptRunner : ISqlScriptRunner
{
    public async Task<SqlRunResult> ExecuteAsync(
        string connection_string,
        string script,
        int command_timeout_seconds = 60,
        CancellationToken cancellation_token = default)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
        {
            return new SqlRunResult
            {
                Succeeded = false,
                ErrorMessage = "Connection string trống.",
                Messages = ["Connection string trống."]
            };
        }

        var messages = new List<string>();
        var result_sets = new List<SqlResultSet>();
        var rows_affected = 0;
        var sw = Stopwatch.StartNew();

        try
        {
            await using var conn = new SqlConnection(connection_string);
            conn.InfoMessage += (_, e) =>
            {
                if (!string.IsNullOrWhiteSpace(e.Message))
                    messages.Add(e.Message);
            };

            await conn.OpenAsync(cancellation_token);

            var batches = SplitGoBatches(script);
            var set_index = 0;

            foreach (var batch in batches)
            {
                cancellation_token.ThrowIfCancellationRequested();
                if (string.IsNullOrWhiteSpace(batch))
                    continue;

                await using var cmd = new SqlCommand(batch, conn)
                {
                    CommandType = CommandType.Text,
                    CommandTimeout = Math.Max(1, command_timeout_seconds)
                };

                await using var reader = await cmd.ExecuteReaderAsync(cancellation_token);
                while (true)
                {
                    if (reader.FieldCount > 0)
                    {
                        var table = await LoadTableAsync(reader, $"Result{++set_index}", cancellation_token);
                        result_sets.Add(new SqlResultSet
                        {
                            Title = table.TableName,
                            Table = table
                        });
                        messages.Add($"({table.Rows.Count} row(s) returned)");
                    }
                    else
                    {
                        var affected = reader.RecordsAffected;
                        if (affected >= 0)
                        {
                            rows_affected += affected;
                            messages.Add($"({affected} row(s) affected)");
                        }
                    }

                    if (!await reader.NextResultAsync(cancellation_token))
                        break;
                }
            }

            sw.Stop();
            messages.Add($"Completed in {sw.Elapsed.TotalSeconds:0.###}s");

            return new SqlRunResult
            {
                Succeeded = true,
                Messages = messages,
                ResultSets = result_sets,
                TotalRowsAffected = rows_affected,
                Elapsed = sw.Elapsed
            };
        }
        catch (OperationCanceledException)
        {
            sw.Stop();
            messages.Add("Cancelled.");
            return new SqlRunResult
            {
                Succeeded = false,
                ErrorMessage = "Cancelled.",
                Messages = messages,
                ResultSets = result_sets,
                TotalRowsAffected = rows_affected,
                Elapsed = sw.Elapsed
            };
        }
        catch (Exception ex)
        {
            sw.Stop();
            messages.Add(ex.Message);
            return new SqlRunResult
            {
                Succeeded = false,
                ErrorMessage = ex.Message,
                Messages = messages,
                ResultSets = result_sets,
                TotalRowsAffected = rows_affected,
                Elapsed = sw.Elapsed
            };
        }
    }

    private static async Task<DataTable> LoadTableAsync(
        SqlDataReader reader, string table_name, CancellationToken cancellation_token)
    {
        var table = new DataTable(table_name);
        var used_names = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        for (var i = 0; i < reader.FieldCount; i++)
        {
            var name = reader.GetName(i);
            if (string.IsNullOrWhiteSpace(name))
                name = $"Column{i}";
            var unique = name;
            var n = 1;
            while (!used_names.Add(unique))
                unique = $"{name}_{++n}";
            table.Columns.Add(unique, typeof(object));
        }

        while (await reader.ReadAsync(cancellation_token))
        {
            var row = table.NewRow();
            for (var i = 0; i < reader.FieldCount; i++)
                row[i] = reader.IsDBNull(i) ? DBNull.Value : reader.GetValue(i);
            table.Rows.Add(row);
        }

        return table;
    }

    /// <summary>Tách script theo dòng chỉ chứa GO (không phân biệt hoa thường).</summary>
    public static IReadOnlyList<string> SplitGoBatches(string script)
    {
        if (string.IsNullOrEmpty(script))
            return [];

        var batches = new List<string>();
        var current = new StringBuilder();
        using var reader = new StringReader(script);
        string? line;
        while ((line = reader.ReadLine()) is not null)
        {
            var trimmed = line.Trim();
            if (trimmed.Equals("GO", StringComparison.OrdinalIgnoreCase)
                || trimmed.StartsWith("GO ", StringComparison.OrdinalIgnoreCase)
                || trimmed.StartsWith("GO\t", StringComparison.OrdinalIgnoreCase))
            {
                var batch = current.ToString().Trim();
                if (batch.Length > 0)
                    batches.Add(batch);
                current.Clear();
            }
            else
            {
                current.AppendLine(line);
            }
        }

        var last = current.ToString().Trim();
        if (last.Length > 0)
            batches.Add(last);

        return batches;
    }
}
