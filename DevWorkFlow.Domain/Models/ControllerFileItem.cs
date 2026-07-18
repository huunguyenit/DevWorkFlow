namespace DevWorkFlow.Domain.Models;

/// <summary>Loại resource gắn với menu (aspx chính hoặc XML/.f controller).</summary>
public enum ControllerFileKind
{
    Dir,
    Filter,
    Grid,
    Lookup,
    Report,
    TemplateUpload,
    TemplateExcel,
    TemplateRpt,
    /// <summary>File Main (.aspx) từ link menu.</summary>
    Aspx,
    Other
}

/// <summary>Một file thuộc controller của menu (chỉ các file thật sự tồn tại).</summary>
public class ControllerFileItem
{
    public ControllerFileKind Kind { get; set; }
    public string ControllerName { get; set; } = string.Empty;
    public string DisplayName { get; set; } = string.Empty;
    public string RelativePath { get; set; } = string.Empty;
    public string FullPath { get; set; } = string.Empty;

    /// <summary>.f = bản mã hóa của .xml (field/view vẫn đọc được để render).</summary>
    public bool IsEncrypted =>
        FullPath.EndsWith(".f", StringComparison.OrdinalIgnoreCase);

    public bool IsXml =>
        FullPath.EndsWith(".xml", StringComparison.OrdinalIgnoreCase);

    /// <summary>Nguồn form lowcode: .xml hoặc .f.</summary>
    public bool IsFormSource => IsXml || IsEncrypted
        || Kind is ControllerFileKind.Dir or ControllerFileKind.Grid or ControllerFileKind.Filter
            or ControllerFileKind.Lookup or ControllerFileKind.Report;

    public string KindLabel => Kind switch
    {
        ControllerFileKind.Aspx => "Main",
        ControllerFileKind.Dir => "Dir",
        ControllerFileKind.Grid => "Grid",
        ControllerFileKind.Filter => "Filter",
        ControllerFileKind.Lookup => "Lookup",
        ControllerFileKind.Report => "Report",
        ControllerFileKind.TemplateUpload => "Upload",
        ControllerFileKind.TemplateExcel => "Excel",
        ControllerFileKind.TemplateRpt => "Rpt",
        _ => "File"
    };

    /// <summary>Thứ tự hiển thị: Dir → Filter → Grid → Lookup → Report → Upload → Excel → Rpt → Main.</summary>
    public int SortOrder => (int)Kind;

    public string ExtensionLabel =>
        IsEncrypted ? ".f" :
        IsXml ? ".xml" :
        Path.GetExtension(FullPath);
}
