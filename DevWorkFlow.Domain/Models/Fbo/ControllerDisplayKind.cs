namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Loại hiển thị controller FBO (danh mục / chứng từ / lookup).
/// </summary>
public enum ControllerDisplayKind
{
    /// <summary>Form nhập – thư mục Dir hoặc Filter.</summary>
    Form,

    /// <summary>Lưới danh sách – thư mục Grid.</summary>
    Grid,

    /// <summary>Popup chọn – thư mục Lookup.</summary>
    Lookup
}

/// <summary>Nguồn folder trong App_Data/Controllers.</summary>
public enum ControllerFolderKind
{
    Dir,
    Filter,
    Grid,
    Lookup,
    Report,
    Other
}

/// <summary>Chuỗi đa ngôn ngữ v/e trong XML FBO.</summary>
public class LocalizedText
{
    public string V { get; set; } = string.Empty;
    public string E { get; set; } = string.Empty;

    public string Get(bool vietnamese = true) =>
        vietnamese
            ? (!string.IsNullOrWhiteSpace(V) ? V : E)
            : (!string.IsNullOrWhiteSpace(E) ? E : V);

    public override string ToString() => Get(true);
}
