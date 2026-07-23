namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Resolve các file liên quan tới <c>showForm('Name')</c> theo prefix/stem trong
/// Filter/Lookup/Grid — rộng hơn <see cref="ControllerRelatedFileResolver"/> (chỉ đúng tên
/// Filter). Phase 3 #15.
/// </summary>
public static class ShowFormRelatedPathResolver
{
    // Thứ tự dài → ngắn để không cắt nhầm "Form" bên trong "MultiForm".
    private static readonly string[] KnownSuffixes =
    [
        "MultiForm", "MultiGrid", "MultiLookup", "Filter", "Form", "Grid", "Lookup", "Multi"
    ];

    private static readonly string[] SearchFolders = ["Filter", "Lookup", "Grid"];
    private static readonly string[] SearchExtensions = [".xml", ".f"];

    /// <summary>SVOrderFilter → SVOrder; không khớp suffix nào → trả nguyên tên.</summary>
    public static string StemFromShowFormName(string name)
    {
        if (string.IsNullOrWhiteSpace(name)) return name ?? string.Empty;

        foreach (var suffix in KnownSuffixes)
        {
            if (name.Length > suffix.Length
                && name.EndsWith(suffix, StringComparison.OrdinalIgnoreCase))
                return name[..^suffix.Length];
        }

        return name;
    }

    /// <summary>
    /// Quét Controllers/{Filter,Lookup,Grid}/ tìm file mà tên (không extension) bằng
    /// <paramref name="show_form_name"/>, hoặc bắt đầu bằng tên đó, hoặc bắt đầu bằng stem.
    /// Cap <paramref name="max_files"/> (mặc định 12).
    /// </summary>
    public static IReadOnlyList<string> FindRelatedFiles(
        string? controllers_path,
        string show_form_name,
        int max_files = 12)
    {
        if (string.IsNullOrWhiteSpace(controllers_path) || string.IsNullOrWhiteSpace(show_form_name))
            return [];

        var stem = StemFromShowFormName(show_form_name);
        var result = new List<string>();
        var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        foreach (var folder in SearchFolders)
        {
            var dir = Path.Combine(controllers_path, folder);
            if (!Directory.Exists(dir)) continue;

            // Cùng tên logic có thể tồn tại cả .xml lẫn .f trong CÙNG folder — chỉ mở một file,
            // ưu tiên .xml (dedupe theo tên trước khi thêm vào result, không phải theo full path).
            var by_name = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

            foreach (var file in Directory.EnumerateFiles(dir))
            {
                var ext = Path.GetExtension(file);
                if (!SearchExtensions.Any(e => e.Equals(ext, StringComparison.OrdinalIgnoreCase)))
                    continue;

                var file_name = Path.GetFileNameWithoutExtension(file);
                var matches =
                    file_name.Equals(show_form_name, StringComparison.OrdinalIgnoreCase)
                    || file_name.StartsWith(show_form_name, StringComparison.OrdinalIgnoreCase)
                    || file_name.StartsWith(stem, StringComparison.OrdinalIgnoreCase);
                if (!matches) continue;

                var is_xml = ext.Equals(".xml", StringComparison.OrdinalIgnoreCase);
                if (!by_name.TryGetValue(file_name, out var existing)
                    || (is_xml && !Path.GetExtension(existing).Equals(".xml", StringComparison.OrdinalIgnoreCase)))
                    by_name[file_name] = file;
            }

            foreach (var file in by_name.Values)
            {
                if (result.Count >= max_files) return result;
                var full_path = Path.GetFullPath(file);
                if (seen.Add(full_path))
                    result.Add(full_path);
            }
        }

        return result;
    }
}
