using System.Text.Json;
using DevWorkFlow.Application.Design;

namespace DevWorkFlow.Infrastructure.Design;

/// <summary>Đọc <c>Config/json/toolbar.json</c> → <see cref="DesignToolbarBundle"/>.</summary>
public sealed class DesignToolbarCatalog : IDesignToolbarCatalog
{
    private static readonly JsonSerializerOptions JsonOpts = new()
    {
        PropertyNameCaseInsensitive = true,
        ReadCommentHandling = JsonCommentHandling.Skip,
        AllowTrailingCommas = true
    };

    private readonly string _json_path;
    private readonly object _gate = new();
    private DesignToolbarBundle? _cached;

    public DesignToolbarCatalog(string json_path) =>
        _json_path = json_path ?? string.Empty;

    public DesignToolbarBundle GetBundle()
    {
        lock (_gate)
            return _cached ??= Load();
    }

    public void Invalidate()
    {
        lock (_gate)
            _cached = null;
    }

    private DesignToolbarBundle Load()
    {
        if (string.IsNullOrWhiteSpace(_json_path) || !File.Exists(_json_path))
            return DesignToolbarBundle.Empty;

        try
        {
            var dto = JsonSerializer.Deserialize<ToolbarFileDto>(File.ReadAllText(_json_path), JsonOpts);
            if (dto?.Items is null || dto.Items.Count == 0)
                return DesignToolbarBundle.Empty;

            var map = new Dictionary<string, DesignToolbarSystemItem>(StringComparer.OrdinalIgnoreCase);
            foreach (var (key, entry) in dto.Items)
            {
                if (string.IsNullOrWhiteSpace(key) || entry is null) continue;
                map[key.Trim()] = new DesignToolbarSystemItem(
                    key.Trim(),
                    entry.V ?? string.Empty,
                    entry.E ?? string.Empty,
                    entry.HasText);
            }

            return map.Count == 0 ? DesignToolbarBundle.Empty : new DesignToolbarBundle(map);
        }
        catch (Exception ex) when (ex is JsonException or IOException or UnauthorizedAccessException)
        {
            return DesignToolbarBundle.Empty;
        }
    }

    private sealed class ToolbarFileDto
    {
        public Dictionary<string, ToolbarItemDto?>? Items { get; set; }
    }

    private sealed class ToolbarItemDto
    {
        public string? V { get; set; }
        public string? E { get; set; }
        public bool HasText { get; set; }
    }
}
