using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Đọc Lookup controller để lấy nhãn field reference (items/@reference).
/// </summary>
public class LookupReferenceResolver
{
    private readonly Dictionary<string, FboLookupModel?> _cache = new(StringComparer.OrdinalIgnoreCase);

    public string ResolveReferenceLabel(
        string? controllers_path,
        FboField? field,
        bool vietnamese)
    {
        if (field is null || string.IsNullOrWhiteSpace(field.ItemsController))
            return string.Empty;

        var ref_field = field.ReferenceFieldName;
        if (string.IsNullOrWhiteSpace(ref_field))
            return string.Empty;

        var lookup = LoadLookup(controllers_path, field.ItemsController);
        if (lookup is null) return ref_field;

        if (lookup.FieldsByName.TryGetValue(ref_field, out var ref_fbo_field))
            return ref_fbo_field.GetDisplayLabel(vietnamese);

        return ref_field;
    }

    private FboLookupModel? LoadLookup(string? controllers_path, string controller_name)
    {
        if (string.IsNullOrWhiteSpace(controllers_path)) return null;

        var cache_key = $"{controllers_path}|{controller_name}";
        if (_cache.TryGetValue(cache_key, out var cached))
            return cached;

        var file_path = FindLookupFile(controllers_path, controller_name);
        if (file_path is null)
        {
            _cache[cache_key] = null;
            return null;
        }

        try
        {
            var doc = new FboXmlParser().Parse(File.ReadAllText(file_path), file_path);
            _cache[cache_key] = doc.Lookup;
            return doc.Lookup;
        }
        catch
        {
            _cache[cache_key] = null;
            return null;
        }
    }

    private static string? FindLookupFile(string controllers_path, string controller_name)
    {
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
