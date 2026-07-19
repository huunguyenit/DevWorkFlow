using System.IO;
using System.Windows;
using System.Windows.Media;

namespace UI.Tree;

/// <summary>
/// Icon / màu / style cho Explorer + Menu tree (PackIcon Kind + hex).
/// </summary>
public static class TreeIconCatalog
{
    public const string ColorFolder = "#C9A227";
    public const string ColorMuted = "#6B6B6B";
    public const string ColorXml = "#0078D4";
    public const string ColorFilter = "#CA5010";
    public const string ColorGrid = "#107C10";
    public const string ColorLookup = "#8764B8";
    public const string ColorReport = "#C19C00";
    public const string ColorAspx = "#5C2D91";
    public const string ColorJs = "#F0DB4F";
    public const string ColorCss = "#264DE4";
    public const string ColorExcel = "#1D6F42";
    public const string ColorPdf = "#C62828";
    public const string ColorApi = "#00838F";
    public const string ColorWeb = "#1565C0";
    public const string ColorLink = "#CA5010";
    public const string ColorMenuHighlight = "#0078D4";
    public const string ColorTable = "#1565C0";
    public const string ColorView = "#2E7D32";
    public const string ColorFunction = "#6A1B9A";
    public const string ColorProcedure = "#E65100";
    public const string ColorDbFolder = "#607D8B";
    public const string ColorFinance = "#2E7D32";
    public const string ColorTypeV = "#6A1B9A";
    public const string ColorTypeD = "#1565C0";

    /// <summary>Default ext → PackIcon Kind (override bằng explorer.json fileIcons).</summary>
    public static IReadOnlyDictionary<string, string> DefaultFileIcons { get; } =
        new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            [".txt"] = "TextBoxOutline",
            [".xml"] = "Xml",
            [".f"] = "FileLockOutline",
            [".asmx"] = "Web",
            [".ashx"] = "Api",
            [".xls"] = "FileExcel",
            [".xlsx"] = "FileExcel",
            [".rpt"] = "FilePdfBox",
            [".js"] = "LanguageJavascript",
            [".css"] = "LanguageCss3"
        };

    private static readonly Dictionary<string, string> SemanticIconAliases =
        new(StringComparer.OrdinalIgnoreCase)
        {
            ["Folder"] = "Folder",
            ["PlainText"] = "TextBoxOutline",
            ["XML"] = "Xml",
            ["webservice"] = "Web",
            ["api"] = "Api",
            ["Excel"] = "FileExcel",
            ["PDF"] = "FilePdfBox",
            ["javascript"] = "LanguageJavascript",
            ["CSS"] = "LanguageCss3",
            ["file"] = "FileOutline"
        };

    public static string NormalizeIconName(string? icon_or_alias)
    {
        if (string.IsNullOrWhiteSpace(icon_or_alias))
            return "FileOutline";
        var key = icon_or_alias.Trim();
        return SemanticIconAliases.TryGetValue(key, out var mapped) ? mapped : key;
    }

    public static (string Icon, string Color, bool IsItalic) ForExplorerPath(
        string? full_path,
        bool is_directory,
        IReadOnlyDictionary<string, string>? file_icons_by_ext = null,
        string folder_icon = "Folder",
        string folder_color = ColorFolder,
        string file_icon = "FileOutline",
        string file_color = ColorMuted)
    {
        if (string.IsNullOrWhiteSpace(full_path))
            return (NormalizeIconName(is_directory ? folder_icon : file_icon),
                is_directory ? folder_color : file_color,
                false);

        if (is_directory)
            return (NormalizeIconName(folder_icon), folder_color, false);

        var ext = Path.GetExtension(full_path);
        var is_f = ext.Equals(".f", StringComparison.OrdinalIgnoreCase);
        var icons = file_icons_by_ext ?? DefaultFileIcons;
        if (icons.TryGetValue(ext, out var configured) && !string.IsNullOrWhiteSpace(configured))
            return (NormalizeIconName(configured), ColorForExtension(ext), is_f);

        if (DefaultFileIcons.TryGetValue(ext, out var fallback))
            return (NormalizeIconName(fallback), ColorForExtension(ext), is_f);

        return (NormalizeIconName(file_icon), file_color, false);
    }

    public static string ColorForExtension(string ext) =>
        ext.ToLowerInvariant() switch
        {
            ".xml" => ColorXml,
            ".f" => ColorMuted,
            ".txt" => ColorMuted,
            ".js" => ColorJs,
            ".css" => ColorCss,
            ".xls" or ".xlsx" => ColorExcel,
            ".rpt" => ColorPdf,
            ".asmx" => ColorWeb,
            ".ashx" => ColorApi,
            _ => ColorMuted
        };

    /// <summary>Title có marker (C) hoặc (*) — tô xanh dòng.</summary>
    public static bool HasControllerMarker(string? title)
    {
        if (string.IsNullOrEmpty(title)) return false;
        return title.Contains("(C)", StringComparison.OrdinalIgnoreCase)
               || title.Contains("(*)", StringComparison.Ordinal)
               || title.Contains("(C|*)", StringComparison.OrdinalIgnoreCase);
    }

    public static (string Icon, string Color) ForDatabaseObject(string? object_kind_or_code)
    {
        var key = (object_kind_or_code ?? string.Empty).Trim().ToUpperInvariant();
        return key switch
        {
            "U" or "TABLE" or "TABLES" => ("Table", ColorTable),
            "V" or "VIEW" or "VIEWS" => ("EyeOutline", ColorView),
            "FN" or "IF" or "TF" or "FUNCTION" or "FUNCTIONS" => ("FunctionVariant", ColorFunction),
            "P" or "PROCEDURE" or "STORED PROCEDURES" or "STOREDPROCEDURE" => ("DatabaseCogOutline", ColorProcedure),
            _ => ("DatabaseOutline", ColorDbFolder)
        };
    }

    public static (string Icon, string Color) ForDatabaseFolder(string folder_name)
    {
        var name = folder_name.Trim();
        if (name.Contains("table", StringComparison.OrdinalIgnoreCase))
            return ("TableMultiple", ColorTable);
        if (name.Contains("view", StringComparison.OrdinalIgnoreCase))
            return ("EyeOutline", ColorView);
        if (name.Contains("function", StringComparison.OrdinalIgnoreCase))
            return ("FunctionVariant", ColorFunction);
        if (name.Contains("procedure", StringComparison.OrdinalIgnoreCase)
            || name.Contains("stored", StringComparison.OrdinalIgnoreCase))
            return ("DatabaseCogOutline", ColorProcedure);
        return ("Folder", ColorDbFolder);
    }

    public static Brush BrushFromHex(string? hex, Brush? fallback = null)
    {
        fallback ??= Brushes.Gray;
        if (string.IsNullOrWhiteSpace(hex)) return fallback;
        try
        {
            var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
            if (brush.CanFreeze) brush.Freeze();
            return brush;
        }
        catch
        {
            return fallback;
        }
    }

    public static FontStyle ToFontStyle(bool is_italic) =>
        is_italic ? FontStyles.Italic : FontStyles.Normal;
}
