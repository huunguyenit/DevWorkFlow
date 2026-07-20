using System.IO;
using System.Text.Json;

namespace UI.Docking;

/// <summary>Persist workspace dock layout JSON — %AppData%/DevWorkFlow/dock-layout.json</summary>
public sealed class JsonDockLayoutStore : IDockLayoutStore
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        WriteIndented = true,
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };

    private readonly string _path;

    public JsonDockLayoutStore(string? path = null)
    {
        var folder = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
            "DevWorkFlow");
        Directory.CreateDirectory(folder);
        _path = path ?? Path.Combine(folder, "dock-layout.json");
    }

    public DockLayoutSnapshot? Load()
    {
        if (!File.Exists(_path)) return null;
        try
        {
            var json = File.ReadAllText(_path);
            return JsonSerializer.Deserialize<DockLayoutSnapshot>(json, JsonOptions);
        }
        catch
        {
            return null;
        }
    }

    public void Save(DockLayoutSnapshot snapshot)
    {
        var json = JsonSerializer.Serialize(snapshot, JsonOptions);
        File.WriteAllText(_path, json);
    }
}
