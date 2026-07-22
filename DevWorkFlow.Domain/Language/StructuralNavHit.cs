namespace DevWorkFlow.Domain.Language;

/// <summary>Loại điều hướng cấu trúc XML (không phải entity) tại một offset source.</summary>
public enum StructuralNavKind
{
    /// <summary>Định nghĩa <c>&lt;field name="X"&gt;</c> trong <c>&lt;fields&gt;</c> → view chứa field.</summary>
    FieldToView = 0,

    /// <summary><c>items@controller="Name"</c> → file <c>Lookup/Name.xml</c>.</summary>
    ItemsController = 1,

    /// <summary>Tên hàm trong <c>&lt;clientScript&gt;</c> → <c>function …</c> trong <c>&lt;script&gt;</c>.</summary>
    ClientScriptFunction = 2
}

/// <summary>
/// Kết quả hit-test cấu trúc (SoT cho Ctrl+Click structural ở Source mode, sau khi entity miss).
/// In-doc nav dùng <see cref="TargetOffset"/> (offset source từ span đã resolve — nhất quán với
/// entity nav Phase 1, không dùng số dòng); mở file ngoài dùng <see cref="TargetPath"/>.
/// </summary>
public sealed class StructuralNavHit
{
    public StructuralNavKind Kind { get; init; }

    /// <summary>SymbolId nếu có (optional; VM ưu tiên nếu map resolve được).</summary>
    public string SymbolId { get; init; } = string.Empty;

    /// <summary>File cần mở (ItemsController → Lookup path tuyệt đối).</summary>
    public string TargetPath { get; init; } = string.Empty;

    /// <summary>Nhãn status bar.</summary>
    public string DisplayLabel { get; init; } = string.Empty;

    /// <summary>Offset source để reveal trong document đang mở; -1 nếu không áp dụng.</summary>
    public int TargetOffset { get; init; } = -1;
}
