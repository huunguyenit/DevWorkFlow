namespace DevWorkFlow.Domain.Models;

/// <summary>
/// Bundle resource của một menu: aspx (link) + Controller + các XML tồn tại.
/// Không bắt buộc đủ Dir/Grid/Filter/Lookup.
/// </summary>
public class MenuResourceBundle
{
    public string MenuTitle { get; set; } = string.Empty;
    public string? Link { get; set; }
    public string? AspxPath { get; set; }
    public bool AspxExists => !string.IsNullOrEmpty(AspxPath) && File.Exists(AspxPath);

    /// <summary>Tên Controller chính (đầu tiên tìm thấy trong aspx).</summary>
    public string ControllerName { get; set; } = string.Empty;

    /// <summary>Tất cả giá trị Controller="..." trong aspx.</summary>
    public List<string> Controllers { get; set; } = [];

    /// <summary>Phân cấp file thực tế tồn tại (aspx + Controllers/*).</summary>
    public List<ControllerFileItem> Files { get; set; } = [];

    public string? ErrorMessage { get; set; }
}
