using System.IO;
using System.Text.Json;
using System.Windows.Media;
using System.Xml.Linq;
using UI.Tree;

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
        DiagnosticsCatalog = LoadDiagnosticsCatalog();
        EditorTheme = LoadEditorTheme();
    }

    public string ConfigRoot { get; }

    public ExplorerOptions Explorer { get; }
    public DatabaseOptions Database { get; }
    public MenuOptions Menu { get; }
    public IReadOnlyList<ControllerFolderOption> ControllerFolders { get; }
    public IReadOnlyList<DatabaseObjectTypeOption> DatabaseObjectTypes { get; }
    public IReadOnlyList<DatabaseObjectActionOption> DatabaseObjectActions { get; }
    public string CatalogSql { get; }

    /// <summary>Màu/kích thước/kiểu chữ cho từng loại token XML + Insight Block, đọc từ editor-theme.json.</summary>
    public EditorThemeOptions EditorTheme { get; }

    /// <summary>Mã Diagnostic (ERP3001, …) → message/severity/resolution, đọc từ diagnostics.catalog.xml.</summary>
    public IReadOnlyDictionary<string, DiagnosticCatalogEntry> DiagnosticsCatalog { get; }

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
        options.FileIcons = NormalizeFileIcons(options.FileIcons);
        return options;
    }

    private static Dictionary<string, string> NormalizeFileIcons(Dictionary<string, string>? raw)
    {
        var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        foreach (var (ext, icon) in TreeIconCatalog.DefaultFileIcons)
            map[ext] = icon;

        if (raw is null) return map;
        foreach (var (key, value) in raw)
        {
            if (string.IsNullOrWhiteSpace(key) || string.IsNullOrWhiteSpace(value)) continue;
            var ext = key.Trim();
            if (!ext.StartsWith('.'))
                ext = "." + ext;
            map[ext] = value.Trim();
        }

        return map;
    }

    private DatabaseOptions LoadDatabaseOptions() =>
        ReadJson(GetJsonPath("database.json"), new DatabaseOptions());

    private EditorThemeOptions LoadEditorTheme() =>
        ReadJson(GetJsonPath("editor-theme.json"), new EditorThemeOptions());

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

    private IReadOnlyDictionary<string, DiagnosticCatalogEntry> LoadDiagnosticsCatalog()
    {
        var path = GetXmlPath("diagnostics.catalog.xml");
        if (!File.Exists(path))
            return new Dictionary<string, DiagnosticCatalogEntry>();

        try
        {
            var doc = XDocument.Load(path);
            var map = new Dictionary<string, DiagnosticCatalogEntry>(StringComparer.OrdinalIgnoreCase);
            foreach (var el in doc.Root?.Elements("diagnostic") ?? Enumerable.Empty<XElement>())
            {
                var code = ((string?)el.Attribute("code") ?? string.Empty).Trim();
                if (string.IsNullOrWhiteSpace(code)) continue;

                map[code] = new DiagnosticCatalogEntry
                {
                    Code = code,
                    Severity = (string?)el.Attribute("severity") ?? "Info",
                    Message = (string?)el.Attribute("message") ?? string.Empty,
                    Resolution = (string?)el.Attribute("resolution") ?? string.Empty
                };
            }

            return map;
        }
        catch
        {
            return new Dictionary<string, DiagnosticCatalogEntry>();
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
            new() { Code = "FN", Kind = "Function", Folder = "Functions", Icon = "FunctionVariant", Color = "#6A1B9A", Order = 3 },
            new() { Code = "IF", Kind = "Function", Folder = "Functions", Icon = "FunctionVariant", Color = "#6A1B9A", Order = 3 },
            new() { Code = "TF", Kind = "Function", Folder = "Functions", Icon = "FunctionVariant", Color = "#6A1B9A", Order = 3 },
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
        public string FolderIcon { get; set; } = "Folder";
    public string FileIcon { get; set; } = "FileOutline";
    public string FolderIconColor { get; set; } = "#C9A227";
    public string FileIconColor { get; set; } = "#616161";
    public bool ShowFileBadges { get; set; }
    public string[] PreferredRootFolders { get; set; } =
    [
        "App_Data", "Main", "ClientScript", "Css", "Images", "Help",
        "AppHandler", "AppService", "Upload"
    ];
    /// <summary>
    /// Extension bị loại khỏi Explorer (blacklist). Rỗng = hiện mọi file.
    /// JSON: explorerFileExtensions
    /// </summary>
    public string[] ExplorerFileExtensions { get; set; } =
        [".dll", ".pdb", ".exe", ".cache", ".user", ".bak", ".tmp"];

    /// <summary>
    /// Extension KHÔNG cho mở làm document (file nhị phân/không phải text — editor
    /// không đọc được: Excel, Crystal Report, ảnh, thư viện...). JSON: blockedOpenExtensions.
    /// </summary>
    public string[] BlockedOpenExtensions { get; set; } =
    [
        ".xls", ".xlsx", ".xlsm", ".rpt", ".png", ".jpg", ".jpeg", ".gif", ".bmp",
        ".ico", ".dll", ".exe", ".pdb", ".zip", ".rar", ".7z", ".pdf", ".doc", ".docx"
    ];
    public string[] HiddenRootFolders { get; set; } = ["bin"];

    /// <summary>
    /// Map extension → PackIcon Kind hoặc alias (PlainText, XML, Excel, PDF, javascript, CSS, webservice, api).
    /// JSON: fileIcons — { ".txt": "PlainText", ".xml": "XML", ... }
    /// </summary>
    public Dictionary<string, string> FileIcons { get; set; } = new(StringComparer.OrdinalIgnoreCase)
    {
        [".txt"] = "PlainText",
        [".xml"] = "XML",
        [".f"] = "FileLockOutline",
        [".asmx"] = "webservice",
        [".ashx"] = "api",
        [".xls"] = "Excel",
        [".xlsx"] = "Excel",
        [".rpt"] = "PDF",
        [".js"] = "javascript",
        [".css"] = "CSS"
    };

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

/// <summary>Màu/kiểu chữ cho một loại token (dùng cho cả tokens.* và insightBlock.*.color/fontStyle trong editor-theme.json).</summary>
public sealed class EditorTokenStyle
{
    public string Color { get; set; } = "#1E1E1E";
    public string FontStyle { get; set; } = string.Empty;
    public int? FontSize { get; set; }
}

/// <summary>tokens.* trong editor-theme.json — theo đúng tên token Monarch thật của erp-xml (xem erp-xml-language.js).</summary>
public sealed class EditorTokenPalette
{
    public EditorTokenStyle Tag { get; set; } = new() { Color = "#800000" };
    public EditorTokenStyle AttributeName { get; set; } = new() { Color = "#B8860B" };
    public EditorTokenStyle AttributeValue { get; set; } = new() { Color = "#0451A5" };
    public EditorTokenStyle EntityReference { get; set; } = new() { Color = "#AB47BC", FontStyle = "italic" };

    /// <summary>Tên trong khai báo &lt;!ENTITY X ...&gt; — khác tham chiếu &amp;X;, không in nghiêng.</summary>
    public EditorTokenStyle EntityName { get; set; } = new() { Color = "#267F99" };

    /// <summary>Từ khoá DTD (SYSTEM/PUBLIC).</summary>
    public EditorTokenStyle Keyword { get; set; } = new() { Color = "#0000FF" };

    public EditorTokenStyle Comment { get; set; } = new() { Color = "#008000", FontStyle = "italic" };
    public EditorTokenStyle Cdata { get; set; } = new() { Color = "#1E1E1E" };

    /// <summary>
    /// Dấu cú pháp: &lt; &gt; /&gt; &lt;/ = . Phải XÁM NHẠT, không cùng màu với tên thẻ —
    /// đây là thay đổi chính giúp file nhiều thẻ bớt rối (xem erp-xml-language.js).
    /// </summary>
    public EditorTokenStyle Delimiter { get; set; } = new() { Color = "#767676" };

    public EditorTokenStyle Metatag { get; set; } = new() { Color = "#808080" };
}

/// <summary>insightBlock.* trong editor-theme.json — màu cho khối hiển thị Entity Insight (xem bridge.js buildInsightNode).</summary>
public sealed class EditorInsightBlockPalette
{
    public EditorTokenStyle ReferenceText { get; set; } = new() { Color = "#757575", FontStyle = "italic", FontSize = 12 };
    public EditorTokenStyle Separator { get; set; } = new() { Color = "#AB47BC" };
    public EditorTokenStyle ResolvedValue { get; set; } = new() { Color = "#2D2D2D", FontSize = 12 };
    public string Border { get; set; } = "#CE93D8";
    public string BackgroundDepth0 { get; set; } = "#F8F0FA";
    public string BackgroundNested { get; set; } = "#FCF8FD";
}

/// <summary>
/// clearTextEntity.* trong editor-theme.json — nền tô cho các đoạn ClearText có nguồn từ
/// entity trong Insight mode.
///
/// Màu do CẤP LỒNG quyết định: cấp 1 (entity tham chiếu trực tiếp trong body) lấy
/// <see cref="Levels"/>[0], cấp 2 lấy [1], ... Tối đa 9 cấp — từ cấp 10 trở đi dùng chung
/// màu của cấp 9 (không sinh thêm màu, tránh bảng màu vô hạn).
///
/// Nền phải NHẠT (alpha thấp) để chữ và syntax highlighting bên dưới vẫn đọc được — đây là
/// lớp nền chỉ ra nguồn gốc, không phải lớp tô chữ.
/// </summary>
public sealed class EditorClearTextEntityPalette
{
    /// <summary>
    /// Màu nền theo cấp lồng, index 0 = cấp 1. Tối đa 9 phần tử được dùng; thừa thì bỏ qua,
    /// thiếu thì các cấp còn lại dùng màu cuối cùng có trong danh sách.
    /// </summary>
    public string[] Levels { get; set; } =
    [
        "rgba(240, 180,  0, 0.20)",  // cấp 1 — vàng
        "rgba( 38, 166, 91, 0.18)",  // cấp 2 — xanh lá
        "rgba(231,  76, 60, 0.16)",  // cấp 3 — đỏ
        "rgba( 41, 128, 185, 0.16)", // cấp 4 — xanh dương
        "rgba(155,  89, 182, 0.16)", // cấp 5 — tím
        "rgba(230, 126, 34, 0.16)",  // cấp 6 — cam
        "rgba( 26, 188, 156, 0.18)", // cấp 7 — ngọc
        "rgba(233,  30, 99, 0.14)",  // cấp 8 — hồng
        "rgba(121,  85, 72, 0.16)"   // cấp 9+ — nâu
    ];

    /// <summary>Entity không resolve được / chu kỳ — thắng mọi màu cấp.</summary>
    public string Error { get; set; } = "#FBE0E0";

    /// <summary>
    /// Màu gạch chân đứt cho entity SYSTEM (nội dung đến từ file ngoài). Dùng kênh riêng
    /// thay vì màu nền vì màu nền đã thuộc về cấp lồng — xem ghi chú trong index.html.
    /// </summary>
    public string SystemMarker { get; set; } = "#0B6E99";

    /// <summary>Màu gạch chân khi hover — báo vùng Ctrl+Click được.</summary>
    public string HoverBorder { get; set; } = "#7E57C2";
}

/// <summary>
/// sql.* trong editor-theme.json — màu cho SQL nhúng trong &lt;command&gt;/&lt;query&gt;/&lt;response&gt;
/// (không event). Vùng này dùng tokenizer SQL built-in của Monaco (nextEmbedded: 'sql' —
/// xem erp-xml-language.js), token có hậu tố ".sql" (keyword.sql, string.sql, ...). Không có
/// section này thì màu SQL rơi về mặc định VS Light thay vì đọc từ theme.
/// </summary>
public sealed class EditorSqlPalette
{
    public EditorTokenStyle Keyword { get; set; } = new() { Color = "#0000FF" };
    public EditorTokenStyle String { get; set; } = new() { Color = "#A31515" };
    public EditorTokenStyle Comment { get; set; } = new() { Color = "#008000", FontStyle = "italic" };
    public EditorTokenStyle Number { get; set; } = new() { Color = "#098658" };
    public EditorTokenStyle Operator { get; set; } = new() { Color = "#800000" };
}

/// <summary>
/// js.* trong editor-theme.json — màu cho JavaScript nhúng trong &lt;script&gt; và
/// &lt;command event="..."&gt;, cũng như file .js mở trực tiếp. Vùng nhúng dùng tokenizer
/// JS/TS built-in của Monaco (nextEmbedded: 'text/javascript' — xem erp-xml-language.js),
/// token có hậu tố ".js" (keyword.js, string.js, ...).
/// </summary>
public sealed class EditorJsPalette
{
    public EditorTokenStyle Keyword { get; set; } = new() { Color = "#0000FF" };
    public EditorTokenStyle String { get; set; } = new() { Color = "#A31515" };
    public EditorTokenStyle Comment { get; set; } = new() { Color = "#008000", FontStyle = "italic" };
    public EditorTokenStyle Number { get; set; } = new() { Color = "#098658" };
    public EditorTokenStyle Regexp { get; set; } = new() { Color = "#811F3F" };
    public EditorTokenStyle Type { get; set; } = new() { Color = "#267F99" };
}

/// <summary>Toàn bộ editor-theme.json — nguồn cấu hình màu/font cho Monaco (không hardcode trong bridge.js).</summary>
public sealed class EditorThemeOptions
{
    public string FontFamily { get; set; } = "Cascadia Code, Consolas, Courier New";
    public int BaseFontSize { get; set; } = 13;
    public string Background { get; set; } = "#FFFFFF";
    public string Foreground { get; set; } = "#1E1E1E";
    public EditorTokenPalette Tokens { get; set; } = new();
    public EditorInsightBlockPalette InsightBlock { get; set; } = new();
    public EditorClearTextEntityPalette ClearTextEntity { get; set; } = new();
    public EditorSqlPalette Sql { get; set; } = new();
    public EditorJsPalette Js { get; set; } = new();
}

/// <summary>Một mã Diagnostic trong diagnostics.catalog.xml (message/severity/resolution).</summary>
public sealed class DiagnosticCatalogEntry
{
    public string Code { get; set; } = string.Empty;
    public string Severity { get; set; } = "Info";
    public string Message { get; set; } = string.Empty;
    public string Resolution { get; set; } = string.Empty;
}
