namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Tài liệu controller đã parse – một trong 3 loại hiển thị chính.
/// </summary>
public class FboControllerDocument
{
    public ControllerDisplayKind DisplayKind { get; set; }
    public ControllerFolderKind FolderKind { get; set; }

    public string ControllerName { get; set; } = string.Empty;
    public string FilePath { get; set; } = string.Empty;
    public string XmlSource { get; set; } = string.Empty;

    /// <summary>CSS optional trong controller, đã lấy từ css/text.</summary>
    public string CssText { get; set; } = string.Empty;

    public FboFormModel? Form { get; set; }
    public FboGridModel? Grid { get; set; }
    public FboLookupModel? Lookup { get; set; }

    public string DisplayTitle => DisplayKind switch
    {
        ControllerDisplayKind.Form => Form?.DisplayTitle ?? ControllerName,
        ControllerDisplayKind.Grid => Grid?.DisplayTitle ?? ControllerName,
        ControllerDisplayKind.Lookup => Lookup?.DisplayTitle ?? ControllerName,
        _ => ControllerName
    };

    public static FboControllerDocument FromForm(FboFormModel form, string file_path, string xml) => new()
    {
        DisplayKind = ControllerDisplayKind.Form,
        FolderKind = form.FolderKind,
        ControllerName = form.ControllerName,
        FilePath = file_path,
        XmlSource = xml,
        Form = form
    };

    public static FboControllerDocument FromGrid(FboGridModel grid, string file_path, string xml) => new()
    {
        DisplayKind = ControllerDisplayKind.Grid,
        FolderKind = ControllerFolderKind.Grid,
        ControllerName = grid.ControllerName,
        FilePath = file_path,
        XmlSource = xml,
        Grid = grid
    };

    public static FboControllerDocument FromLookup(FboLookupModel lookup, string file_path, string xml) => new()
    {
        DisplayKind = ControllerDisplayKind.Lookup,
        FolderKind = ControllerFolderKind.Lookup,
        ControllerName = lookup.ControllerName,
        FilePath = file_path,
        XmlSource = xml,
        Lookup = lookup
    };
}
