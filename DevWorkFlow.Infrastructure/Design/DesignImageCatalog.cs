using DevWorkFlow.Application.Design;

namespace DevWorkFlow.Infrastructure.Design;

/// <summary>Load Config/image/fbo-*.png → <see cref="DesignImageBundle"/> (data-URI cho WebView).</summary>
public sealed class DesignImageCatalog : IDesignImageCatalog
{
    private readonly string _image_root;
    private readonly object _gate = new();
    private DesignImageBundle? _cached;

    public DesignImageCatalog(string image_root) =>
        _image_root = image_root ?? string.Empty;

    public DesignImageBundle GetBundle()
    {
        lock (_gate)
            return _cached ??= Load();
    }

    public void Invalidate()
    {
        lock (_gate)
            _cached = null;
    }

    private DesignImageBundle Load()
    {
        if (string.IsNullOrWhiteSpace(_image_root) || !Directory.Exists(_image_root))
            return DesignImageBundle.Empty;

        var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        foreach (var path in Directory.EnumerateFiles(_image_root, "fbo-*.png", SearchOption.TopDirectoryOnly))
        {
            var file_name = Path.GetFileNameWithoutExtension(path);
            if (!file_name.StartsWith("fbo-", StringComparison.OrdinalIgnoreCase)) continue;
            var key = file_name["fbo-".Length..];
            if (string.IsNullOrEmpty(key)) continue;

            try
            {
                var bytes = File.ReadAllBytes(path);
                map[key] = $"data:image/png;base64,{Convert.ToBase64String(bytes)}";
            }
            catch (IOException)
            {
                // Bỏ qua file lỗi.
            }
        }

        return map.Count == 0 ? DesignImageBundle.Empty : new DesignImageBundle(map);
    }
}
