using System.IO;
using System.Text.Json;
using System.Windows.Media;
using System.Xml.Linq;

namespace UI.Services;

/// <summary>
/// Đọc Config/{SQL,json,xml} từ thư mục output — sửa file không cần đổi code.
/// </summary>
public sealed class AppConfigStore
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true,
        ReadCommentHandling = JsonCommentHandling.Skip,
        AllowTrailingCommas = true
    };

    public AppConfigStore(string? config_root = null)
    {
        ConfigRoot = ResolveConfigRoot(config_root);
        Explorer = LoadExplorerOptions();
        Database = LoadDatabaseOptions();
        Menu = LoadMenuOptions();
        ControllerFolders = LoadControllerFolders();
        DatabaseObjectTypes = LoadDatabaseObjectTypes();
        DatabaseObjectActions = LoadDatabaseObjectActions();
        CatalogSql = LoadSql(Database.CatalogScriptFile);
    }

    public string ConfigRoot { get; }

    public ExplorerOptions Explorer { get; }
    public DatabaseOptions Database { get; }
    public MenuOptions Menu { get; }
    public IReadOnlyList<ControllerFolderOption> ControllerFolders { get; }
    public IReadOnlyList<DatabaseObjectTypeOption> DatabaseObjectTypes { get; }
    public IReadOnlyList<DatabaseObjectActionOption> DatabaseObjectActions { get; }
    public string CatalogSql { get; }

    public string GetSqlPath(string file_name) =>
        Path.Combine(ConfigRoot, "SQL", file_name);

    public string GetJsonPath(string file_name) =>
        Path.Combine(ConfigRoot, "json", file_name);

    public string GetXmlPath(string file_name) =>
        Path.Combine(ConfigRoot, "xml", file_name);

    public string LoadSqlFile(string file_name) => LoadSql(file_name);

    public Brush FreezeBrush(string hex, Brush fallback)
    {
        try
        {
            var brush = (SolidColorBrush)new BrushConverter().ConvertFromString(hex)!;
            brush.Freeze();
            return brush;
        }
        catch
        {
            return fallback;
        }
    }

    private static string ResolveConfigRoot(string? override_root)
    {
        if (!string.IsNullOrWhiteSpace(override_root) && Directory.Exists(override_root))
            return Path.GetFullPath(override_root);

        var candidates = new[]
        {
            Path.Combine(AppContext.BaseDirectory, "Config"),
            Path.Combine(Directory.GetCurrentDirectory(), "Config"),
            Path.GetFullPath(Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "Config"))
        };

        foreach (var path in candidates)
        {
            if (Directory.Exists(path))
                return path;
        }

        return candidates[0];
    }

    private ExplorerOptions LoadExplorerOptions()
    {
        var path = GetJsonPath("explorer.json");
        var options = ReadJson(path, new ExplorerOptions());
        options.FolderBrush = FreezeBrush(options.FolderIconColor, Brushes.Gray);
        options.FileBrush = FreezeBrush(options.FileIconColor, Brushes.Gray);
        return options;
    }

    private DatabaseOptions LoadDatabaseOptions() =>
        ReadJson(GetJsonPath("database.json"), new DatabaseOptions());

    private MenuOptions LoadMenuOptions() =>
        ReadJson(GetJsonPath("menu.json"), new MenuOptions());

    private string LoadSql(string file_name)
    {
        var path = GetSqlPath(file_name);
        if (File.Exists(path))
            return File.ReadAllText(path);

        return """
               SELECT
                   SCHEMA_NAME(o.schema_id) AS schema_name,
                   o.name AS object_name,
                   o.type AS object_type,
                   o.modify_date AS modify_date
               FROM sys.objects o WITH (NOLOCK)
               WHERE o.is_ms_shipped = 0
                 AND o.type IN ('U', 'V', 'FN', 'IF', 'TF', 'P');
               """;
    }

    private IReadOnlyList<ControllerFolderOption> LoadControllerFolders()
    {
        var path = GetXmlPath("explorer.controller-folders.xml");
        if (!File.Exists(path))
            return DefaultControllerFolders();

        try
        {
            var doc = XDocument.Load(path);
            return doc.Root?
                       .Elements("folder")
                       .Select(el => new ControllerFolderOption
                       {
                           Name = (string?)el.Attribute("name") ?? string.Empty,
                           Kind = (string?)el.Attribute("kind") ?? "Folder",
                           Order = ParseInt(el.Attribute("order")?.Value, 50)
                       })
                       .Where(f => !string.IsNullOrWhiteSpace(f.Name))
                       .OrderBy(f => f.Order)
                       .ToList()
                   ?? DefaultControllerFolders();
        }
        catch
        {
            return DefaultControllerFolders();
        }
    }

    private IReadOnlyList<DatabaseObjectTypeOption> LoadDatabaseObjectTypes()
    {
        var path = GetXmlPath("database.object-types.xml");
        if (!File.Exists(path))
            return DefaultDatabaseObjectTypes();

        try
        {
            var doc = XDocument.Load(path);
            var list = doc.Root?
                .Elements("type")
                .Select(el => new DatabaseObjectTypeOption
                {
                    Code = ((string?)el.Attribute("code") ?? string.Empty).Trim(),
                    Kind = (string?)el.Attribute("kind") ?? "Folder",
                    Folder = (string?)el.Attribute("folder") ?? "Other",
                    Icon = (string?)el.Attribute("icon") ?? "Database",
                    Color = (string?)el.Attribute("color") ?? "#616161",
                    Order = ParseInt(el.Attribute("order")?.Value, 9)
                })
                .Where(t => !string.IsNullOrWhiteSpace(t.Code))
                .ToList();

            if (list is null || list.Count == 0)
                return DefaultDatabaseObjectTypes();

            foreach (var item in list)
                item.Brush = FreezeBrush(item.Color, Brushes.Gray);

            return list;
        }
        catch
        {
            return DefaultDatabaseObjectTypes();
        }
    }

    private IReadOnlyList<DatabaseObjectActionOption> LoadDatabaseObjectActions()
    {
        var path = GetXmlPath(
            string.IsNullOrWhiteSpace(Database.ObjectActionsFile)
                ? "database.object-actions.xml"
                : Database.ObjectActionsFile);

        if (!File.Exists(path))
            return DefaultDatabaseObjectActions();

        try
        {
            var doc = XDocument.Load(path);
            var list = doc.Root?
                .Elements("action")
                .Select(el => new DatabaseObjectActionOption
                {
                    Kind = (string?)el.Attribute("kind") ?? string.Empty,
                    Click = ParseInt(el.Attribute("click")?.Value, 1),
                    Mode = (string?)el.Attribute("mode") ?? "create",
                    Script = (string?)el.Attribute("script") ?? string.Empty,
                    Title = (string?)el.Attribute("title") ?? string.Empty,
                    DropTemplate = (string?)el.Attribute("dropTemplate") ?? string.Empty
                })
                .Where(a => !string.IsNullOrWhiteSpace(a.Kind) && a.Click is 1 or 2)
                .ToList();

            return list is { Count: > 0 } ? list : DefaultDatabaseObjectActions();
        }
        catch
        {
            return DefaultDatabaseObjectActions();
        }
    }

    private T ReadJson<T>(string path, T fallback) where T : class
    {
        try
        {
            if (!File.Exists(path)) return fallback;
            var json = File.ReadAllText(path);
            return JsonSerializer.Deserialize<T>(json, JsonOptions) ?? fallback;
        }
        catch
        {
            return fallback;
        }
    }

    private static int ParseInt(string? value, int fallback) =>
        int.TryParse(value, out var n) ? n : fallback;

    private static List<ControllerFolderOption> DefaultControllerFolders() =>
    [
        new() { Name = "Dir", Kind = "Dir", Order = 0 },
        new() { Name = "Filter", Kind = "Filter", Order = 1 },
        new() { Name = "Grid", Kind = "Grid", Order = 2 },
        new() { Name = "Lookup", Kind = "Lookup", Order = 3 },
        new() { Name = "Report", Kind = "Report", Order = 4 },
        new() { Name = "Include", Kind = "Include", Order = 5 }
    ];

    private List<DatabaseObjectTypeOption> DefaultDatabaseObjectTypes()
    {
        var list = new List<DatabaseObjectTypeOption>
        {
            new() { Code = "U", Kind = "Table", Folder = "Tables", Icon = "Table", Color = "#1565C0", Order = 1 },
            new() { Code = "V", Kind = "View", Folder = "Views", Icon = "EyeOutline", Color = "#2E7D32", Order = 2 },
            new() { Code = "FN", Kind = "Function", Folder = "Functions", Icon = "Function", Color = "#6A1B9A", Order = 3 },
            new() { Code = "IF", Kind = "Function", Folder = "Functions", Icon = "Function", Color = "#6A1B9A", Order = 3 },
            new() { Code = "TF", Kind = "Function", Folder = "Functions", Icon = "Function", Color = "#6A1B9A", Order = 3 },
            new() { Code = "P", Kind = "Procedure", Folder = "Stored Procedures", Icon = "DatabaseCogOutline", Color = "#E65100", Order = 4 }
        };
        foreach (var item in list)
            item.Brush = FreezeBrush(item.Color, Brushes.Gray);
        return list;
    }

    private static List<DatabaseObjectActionOption> DefaultDatabaseObjectActions() =>
    [
        new() { Kind = "Table", Click = 1, Mode = "create", Script = "table_columns.sql", Title = "{schema}.{name} — CREATE TABLE" },
        new()
        {
            Kind = "Table", Click = 2, Mode = "dropCreate", Script = "table_columns.sql",
            Title = "{schema}.{name} — DROP + CREATE TABLE",
            DropTemplate = "IF OBJECT_ID(N'{full_name}', N'U') IS NOT NULL\n    DROP TABLE {quoted_name};\nGO\n\n"
        },
        new() { Kind = "View", Click = 1, Mode = "alter", Script = "object_definition.sql", Title = "{schema}.{name} — ALTER VIEW" },
        new()
        {
            Kind = "View", Click = 2, Mode = "dropCreate", Script = "object_definition.sql",
            Title = "{schema}.{name} — DROP + CREATE VIEW",
            DropTemplate = "IF OBJECT_ID(N'{full_name}', N'V') IS NOT NULL\n    DROP VIEW {quoted_name};\nGO\n\n"
        },
        new() { Kind = "Function", Click = 1, Mode = "alter", Script = "object_definition.sql", Title = "{schema}.{name} — ALTER FUNCTION" },
        new()
        {
            Kind = "Function", Click = 2, Mode = "dropCreate", Script = "object_definition.sql",
            Title = "{schema}.{name} — DROP + CREATE FUNCTION",
            DropTemplate = "IF OBJECT_ID(N'{full_name}') IS NOT NULL\n    DROP FUNCTION {quoted_name};\nGO\n\n"
        },
        new() { Kind = "Procedure", Click = 1, Mode = "alter", Script = "object_definition.sql", Title = "{schema}.{name} — ALTER PROCEDURE" },
        new()
        {
            Kind = "Procedure", Click = 2, Mode = "dropCreate", Script = "object_definition.sql",
            Title = "{schema}.{name} — DROP + CREATE PROCEDURE",
            DropTemplate = "IF OBJECT_ID(N'{full_name}', N'P') IS NOT NULL\n    DROP PROCEDURE {quoted_name};\nGO\n\n"
        }
    ];
}

public sealed class ExplorerOptions
{
    public int FilterDebounceMs { get; set; } = 300;
    public int FilterMinLength { get; set; } = 1;
    public bool PreloadOnFilter { get; set; } = true;
    public bool ExpandOnFolderClick { get; set; } = true;
    public bool SearchScanFilesystem { get; set; } = true;
    public int SearchMaxHits { get; set; } = 400;
    public int ActivationDelayMs { get; set; } = 200;
    public string FolderIcon { get; set; } = "FolderOutline";
    public string FileIcon { get; set; } = "FileOutline";
    public string FolderIconColor { get; set; } = "#757575";
    public string FileIconColor { get; set; } = "#616161";
    public bool ShowFileBadges { get; set; }
    public string[] PreferredRootFolders { get; set; } =
    [
        "App_Data", "Main", "ClientScript", "Css", "Images", "Help",
        "AppHandler", "AppService", "Upload"
    ];
    public string[] ExplorerFileExtensions { get; set; } =
        [".xml", ".f", ".aspx", ".js", ".css", ".sql"];
    public string[] HiddenRootFolders { get; set; } = ["bin"];

    public Brush FolderBrush { get; set; } = Brushes.Gray;
    public Brush FileBrush { get; set; } = Brushes.Gray;
}

public sealed class DatabaseOptions
{
    public int FilterDebounceMs { get; set; } = 250;
    public int FilterMinLength { get; set; } = 1;
    public int CommandTimeoutSeconds { get; set; } = 45;
    public string CatalogScriptFile { get; set; } = "database_catalog.sql";
    public string DefaultTarget { get; set; } = "App";
    public bool ShowModifiedDate { get; set; } = true;
    public bool SortByModifiedDesc { get; set; } = true;
    public int BatchUiSize { get; set; } = 200;
    public int SingleClickDelayMs { get; set; } = 280;
    public string ObjectActionsFile { get; set; } = "database.object-actions.xml";
}

public sealed class MenuOptions
{
    public int FilterDebounceMs { get; set; } = 300;
    public int FilterBatchSize { get; set; } = 120;
}

public sealed class ControllerFolderOption
{
    public string Name { get; set; } = string.Empty;
    public string Kind { get; set; } = "Folder";
    public int Order { get; set; }
}

public sealed class DatabaseObjectTypeOption
{
    public string Code { get; set; } = string.Empty;
    public string Kind { get; set; } = "Folder";
    public string Folder { get; set; } = "Other";
    public string Icon { get; set; } = "Database";
    public string Color { get; set; } = "#616161";
    public int Order { get; set; }
    public Brush Brush { get; set; } = Brushes.Gray;
}

public sealed class DatabaseObjectActionOption
{
    public string Kind { get; set; } = string.Empty;
    public int Click { get; set; } = 1;
    public string Mode { get; set; } = "create";
    public string Script { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public string DropTemplate { get; set; } = string.Empty;
}
