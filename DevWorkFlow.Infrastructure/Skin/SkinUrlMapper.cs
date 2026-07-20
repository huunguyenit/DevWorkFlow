namespace DevWorkFlow.Infrastructure.Skin;

/// <summary>
/// Ánh xạ URL asset (trong shell capture) → đường dẫn tương đối chuẩn hoá dưới program_root/assets.
/// Quy ước FBO: asset tĩnh nằm ở các thư mục cấp gốc (Css/, ClientScript/, Images/, favicon.ico); URL
/// dạng ~/, ../, root-relative đều quy về path anchored theo gốc site. External host / *.axd không map được.
/// </summary>
public static class SkinUrlMapper
{
    /// <summary>
    /// Trả (mappable, relative_path, note). mappable=false kèm note khi external/động/không hợp lệ.
    /// </summary>
    public static (bool Mappable, string RelativePath, string? Note) MapToRelative(string url, Uri? base_uri)
    {
        if (string.IsNullOrWhiteSpace(url))
            return (false, string.Empty, "empty url");

        var trimmed = url.Trim();

        // Tài nguyên động ASP.NET (WebResource.axd / ScriptResource.axd) — không có file trên đĩa.
        if (IsAxd(trimmed))
            return (false, string.Empty, "dynamic resource (.axd)");

        string path_part;

        if (Uri.TryCreate(trimmed, UriKind.Absolute, out var abs)
            && (abs.Scheme == Uri.UriSchemeHttp || abs.Scheme == Uri.UriSchemeHttps))
        {
            // Tuyệt đối: chỉ map nếu cùng host với trang capture; khác host = ngoại vi.
            if (base_uri is not null && !string.Equals(abs.Host, base_uri.Host, StringComparison.OrdinalIgnoreCase))
                return (false, string.Empty, $"external host ({abs.Host})");
            if (base_uri is null)
                return (false, string.Empty, "absolute url without known base");
            path_part = abs.AbsolutePath;
        }
        else if (trimmed.StartsWith("//", StringComparison.Ordinal))
        {
            // Protocol-relative //host/path — coi như ngoại vi (không chắc host).
            return (false, string.Empty, "protocol-relative url");
        }
        else
        {
            path_part = trimmed;
        }

        var rel = NormalizeToRelative(path_part);
        return string.IsNullOrEmpty(rel)
            ? (false, string.Empty, "cannot resolve relative path")
            : (true, rel, null);
    }

    private static bool IsAxd(string url)
    {
        var path = url;
        var q = path.IndexOfAny(['?', '#']);
        if (q >= 0) path = path[..q];
        return path.EndsWith(".axd", StringComparison.OrdinalIgnoreCase);
    }

    /// <summary>
    /// Bỏ query/fragment, tháo ~/ ./ ../ và slash đầu → path tương đối anchored gốc site.
    /// Vd: "~/Css/Menu.css?v=1" → "Css/Menu.css"; "../ClientScript/MD5.js" → "ClientScript/MD5.js";
    /// "/Images/logo.png" → "Images/logo.png".
    /// </summary>
    public static string NormalizeToRelative(string path)
    {
        if (string.IsNullOrWhiteSpace(path)) return string.Empty;

        var clean = path;
        var q = clean.IndexOfAny(['?', '#']);
        if (q >= 0) clean = clean[..q];
        clean = clean.Replace('\\', '/');

        var stack = new List<string>();
        foreach (var seg in clean.Split('/', StringSplitOptions.RemoveEmptyEntries))
        {
            if (seg == "." || seg == "~") continue;
            if (seg == "..")
            {
                if (stack.Count > 0) stack.RemoveAt(stack.Count - 1);
                continue;
            }

            stack.Add(seg);
        }

        return string.Join('/', stack);
    }
}
