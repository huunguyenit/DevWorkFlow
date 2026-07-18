using System.Xml.Linq;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Đọc appConnectionString / sysConnectionString từ web.config Program FBO.
/// </summary>
public class WebConfigReader : IWebConfigReader
{
    public ProgramContext Read(string program_path)
    {
        if (string.IsNullOrWhiteSpace(program_path) || !Directory.Exists(program_path))
            throw new DirectoryNotFoundException($"Không tìm thấy thư mục Program: {program_path}");

        var web_config_path = FindWebConfig(program_path)
            ?? throw new FileNotFoundException($"Không tìm thấy web.config trong: {program_path}");

        var doc = XDocument.Load(web_config_path);
        var connection_strings = doc.Descendants("connectionStrings").FirstOrDefault()
            ?? throw new InvalidOperationException("web.config thiếu section <connectionStrings>.");

        var sys_cs = GetConnectionString(connection_strings, "sysConnectionString");
        var app_cs = GetConnectionString(connection_strings, "appConnectionString");

        if (string.IsNullOrWhiteSpace(sys_cs))
            throw new InvalidOperationException("Thiếu connectionString name=\"sysConnectionString\".");

        var full_path = Path.GetFullPath(program_path);
        return new ProgramContext
        {
            ProgramPath = full_path,
            ProgramName = new DirectoryInfo(program_path).Name,
            DisplayTitle = ProgramPathHelper.BuildDisplayTitle(full_path),
            // web.config (.NET Framework) thường thiếu SSL → Microsoft.Data.SqlClient báo lỗi chứng chỉ
            SysConnectionString = EnsureSslSettings(sys_cs),
            AppConnectionString = string.IsNullOrWhiteSpace(app_cs) ? string.Empty : EnsureSslSettings(app_cs)
        };
    }

    private static string? FindWebConfig(string program_path)
    {
        var candidates = new[]
        {
            Path.Combine(program_path, "Web.config"),
            Path.Combine(program_path, "web.config"),
            Path.Combine(program_path, "WEB.CONFIG")
        };
        return candidates.FirstOrDefault(File.Exists);
    }

    private static string? GetConnectionString(XElement connection_strings, string name)
    {
        var add = connection_strings.Elements("add")
            .FirstOrDefault(e => string.Equals(
                (string?)e.Attribute("name"),
                name,
                StringComparison.OrdinalIgnoreCase));

        return (string?)add?.Attribute("connectionString");
    }

    /// <summary>
    /// Bổ sung TrustServerCertificate / Encrypt cho connection string từ web.config Framework
    /// (Microsoft.Data.SqlClient mặc định Encrypt=True → lỗi SSL nếu thiếu).
    /// </summary>
    internal static string EnsureSslSettings(string connection_string)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
            return connection_string;

        var result = connection_string.Trim().TrimEnd(';');

        if (!HasKey(result, "TrustServerCertificate"))
            result += ";TrustServerCertificate=True";

        if (!HasKey(result, "Encrypt"))
            result += ";Encrypt=True";

        return result;
    }

    private static bool HasKey(string connection_string, string key)
    {
        var parts = connection_string.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
        return parts.Any(p =>
        {
            var eq = p.IndexOf('=');
            if (eq <= 0) return false;
            var name = p[..eq].Trim();
            return string.Equals(name, key, StringComparison.OrdinalIgnoreCase);
        });
    }
}
