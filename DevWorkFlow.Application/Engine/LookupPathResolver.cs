namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Resolve file Lookup của một controller: <c>{ControllersPath}/Lookup/{Name}.xml|.f</c>.
/// Tách riêng để Ctrl+Click (Phase 2) và <see cref="LookupReferenceResolver"/> dùng chung.
/// </summary>
public static class LookupPathResolver
{
    public static string? FindLookupFile(string? controllers_path, string? controller_name)
    {
        if (string.IsNullOrWhiteSpace(controllers_path) || string.IsNullOrWhiteSpace(controller_name))
            return null;

        var dir = Path.Combine(controllers_path, "Lookup");
        if (!Directory.Exists(dir)) return null;

        foreach (var ext in new[] { ".xml", ".f" })
        {
            var direct = Path.Combine(dir, controller_name + ext);
            if (File.Exists(direct)) return direct;
        }

        return null;
    }
}
