using System.IO;
using System.Text.Json;

namespace DevWorkFlow.Infrastructure.Services;

/// <summary>Lưu cài đặt user (recent programs) vào %AppData%/DevWorkFlow/settings.json.</summary>
public class UserSettingsStore
{
    private static readonly JsonSerializerOptions JsonOpts = new() { WriteIndented = true };

    public UserSettings Data { get; private set; } = new();

    public string SettingsPath { get; }

    public UserSettingsStore()
    {
        var folder = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData),
            "DevWorkFlow");
        Directory.CreateDirectory(folder);
        SettingsPath = Path.Combine(folder, "settings.json");
        Load();
    }

    public void Load()
    {
        try
        {
            if (!File.Exists(SettingsPath)) return;
            var json = File.ReadAllText(SettingsPath);
            Data = JsonSerializer.Deserialize<UserSettings>(json) ?? new UserSettings();
        }
        catch
        {
            Data = new UserSettings();
        }
    }

    public void Save()
    {
        try
        {
            var json = JsonSerializer.Serialize(Data, JsonOpts);
            File.WriteAllText(SettingsPath, json);
        }
        catch
        {
            // ignore IO errors
        }
    }

    public void AddRecentProgram(string program_path)
    {
        if (string.IsNullOrWhiteSpace(program_path)) return;
        var full = Path.GetFullPath(program_path);
        Data.RecentPrograms.RemoveAll(p =>
            string.Equals(p, full, StringComparison.OrdinalIgnoreCase));
        Data.RecentPrograms.Insert(0, full);
        if (Data.RecentPrograms.Count > 12)
            Data.RecentPrograms = Data.RecentPrograms.Take(12).ToList();
        Data.LastProgramPath = full;
        Save();
    }
}

public class UserSettings
{
    public string? LastProgramPath { get; set; }
    public List<string> RecentPrograms { get; set; } = [];
}
