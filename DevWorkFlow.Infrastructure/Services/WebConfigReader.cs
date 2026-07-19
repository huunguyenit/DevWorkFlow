using System.Xml.Linq;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>
/// Đọc appConnectionString / sysConnectionString / commandTimeout từ web.config Program FBO.
/// </summary>
public class WebConfigReader : IWebConfigReader
{
    public const int DefaultCommandTimeoutSeconds = 30;

    /// <summary>
    /// Timeout ngắn khi mở Program lần đầu (Connect + probe query) —
    /// để NSD biết nhanh nếu kết nối sai, không chờ commandTimeout dài.
    /// </summary>
    public const int ConnectionProbeTimeoutSeconds = 15;

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

        var command_timeout = ReadCommandTimeoutSeconds(doc);
        var full_path = Path.GetFullPath(program_path);
        return new ProgramContext
        {
            ProgramPath = full_path,
            ProgramName = new DirectoryInfo(program_path).Name,
            DisplayTitle = ProgramPathHelper.BuildDisplayTitle(full_path),
            CommandTimeoutSeconds = command_timeout,
            // Lần đầu: Connect Timeout ngắn (probe) — chưa áp dụng commandTimeout dài
            SysConnectionString = EnsureConnectionSettings(sys_cs, ConnectionProbeTimeoutSeconds),
            AppConnectionString = string.IsNullOrWhiteSpace(app_cs)
                ? string.Empty
                : EnsureConnectionSettings(app_cs, ConnectionProbeTimeoutSeconds)
        };
    }

    /// <summary>
    /// Sau khi kết nối Sys thành công: gắn Connect Timeout = commandTimeout từ Web.config.
    /// </summary>
    public static void ApplyFullCommandTimeout(ProgramContext program)
    {
        if (program is null) return;

        var timeout = Math.Max(1, program.CommandTimeoutSeconds);
        if (!string.IsNullOrWhiteSpace(program.SysConnectionString))
            program.SysConnectionString = EnsureConnectionSettings(program.SysConnectionString, timeout);

        if (!string.IsNullOrWhiteSpace(program.AppConnectionString))
            program.AppConnectionString = EnsureConnectionSettings(program.AppConnectionString, timeout);

        if (!string.IsNullOrWhiteSpace(program.AppConnectionStringTemplate))
            program.AppConnectionStringTemplate = EnsureConnectionSettings(
                program.AppConnectionStringTemplate, timeout);
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

    /// <summary>Đọc appSettings/commandTimeout (giây). Mặc định 30.</summary>
    private static int ReadCommandTimeoutSeconds(XDocument doc)
    {
        var app_settings = doc.Descendants("appSettings").FirstOrDefault();
        if (app_settings is null)
            return DefaultCommandTimeoutSeconds;

        var add = app_settings.Elements("add")
            .FirstOrDefault(e => string.Equals(
                (string?)e.Attribute("key"),
                "commandTimeout",
                StringComparison.OrdinalIgnoreCase));

        var raw = (string?)add?.Attribute("value");
        if (int.TryParse(raw, out var seconds) && seconds > 0)
            return seconds;

        return DefaultCommandTimeoutSeconds;
    }

    /// <summary>
    /// Bổ sung TrustServerCertificate / Encrypt và gán Connect Timeout (ghi đè nếu đã có).
    /// </summary>
    internal static string EnsureConnectionSettings(string connection_string, int connect_timeout_seconds)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
            return connection_string;

        var result = connection_string.Trim().TrimEnd(';');
        var timeout = Math.Max(1, connect_timeout_seconds);

        if (!HasKey(result, "TrustServerCertificate"))
            result += ";TrustServerCertificate=True";

        if (!HasKey(result, "Encrypt"))
            result += ";Encrypt=True";

        result = RemoveConnectTimeoutKeys(result).TrimEnd(';');
        result += $";Connect Timeout={timeout}";

        return result;
    }

    /// <summary>Giữ API cũ — gọi với timeout mặc định.</summary>
    internal static string EnsureSslSettings(string connection_string) =>
        EnsureConnectionSettings(connection_string, DefaultCommandTimeoutSeconds);

    /// <summary>Lấy Connect Timeout từ CS; không có thì fallback.</summary>
    public static int GetTimeoutSeconds(string? connection_string, int fallback = DefaultCommandTimeoutSeconds)
    {
        if (string.IsNullOrWhiteSpace(connection_string))
            return Math.Max(1, fallback);

        foreach (var part in connection_string.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries))
        {
            var eq = part.IndexOf('=');
            if (eq <= 0) continue;
            var key = part[..eq].Trim();
            if (!IsConnectTimeoutKey(key)) continue;
            if (int.TryParse(part[(eq + 1)..].Trim(), out var seconds) && seconds > 0)
                return seconds;
        }

        return Math.Max(1, fallback);
    }

    private static string RemoveConnectTimeoutKeys(string connection_string)
    {
        var parts = connection_string.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
        var kept = parts.Where(p =>
        {
            var eq = p.IndexOf('=');
            if (eq <= 0) return true;
            return !IsConnectTimeoutKey(p[..eq].Trim());
        });
        return string.Join(';', kept);
    }

    private static bool IsConnectTimeoutKey(string key) =>
        key.Equals("Connect Timeout", StringComparison.OrdinalIgnoreCase)
        || key.Equals("Connection Timeout", StringComparison.OrdinalIgnoreCase)
        || key.Equals("ConnectionTimeout", StringComparison.OrdinalIgnoreCase);

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
