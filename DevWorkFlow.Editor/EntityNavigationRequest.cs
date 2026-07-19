namespace DevWorkFlow.Editor;

/// <summary>
/// Yêu cầu điều hướng tới một entity, phát khi người dùng Ctrl+Click vào vùng text có nguồn
/// từ entity trong Insight mode (ClearText). Editor chỉ BÁO — nó không tự mở file, không tự
/// quyết định tab (Rule R6: Editor render only).
///
/// Host xử lý theo thứ tự:
///   1. <see cref="OpenPath"/> có giá trị (entity SYSTEM) → mở file đó ra tab mới. Đuôi file
///      là bất kỳ (.ent/.xml/.txt/...) — không được giả định .ent.
///   2. Ngược lại, <see cref="DefinitionPath"/> khác document đang mở → mở file khai báo ra
///      tab mới tại <see cref="DefinitionOffset"/>.
///   3. Ngược lại (entity inline khai báo trong chính document) → nhảy tới
///      <see cref="DefinitionOffset"/> trong tab đang mở.
///
/// Với nhánh 1 và 2, caret/scroll của tab hiện tại KHÔNG được đụng tới — người dùng quay lại
/// tab cũ là thấy đúng chỗ vừa click, không phải cuộn tìm lại.
/// </summary>
public sealed class EntityNavigationRequest
{
    public string EntityName { get; init; } = string.Empty;

    public string SymbolId { get; init; } = string.Empty;

    /// <summary>File chứa khai báo &lt;!ENTITY&gt;.</summary>
    public string DefinitionPath { get; init; } = string.Empty;

    /// <summary>Offset của khai báo trong <see cref="DefinitionPath"/>; -1 nếu không xác định.</summary>
    public int DefinitionOffset { get; init; } = -1;

    /// <summary>Entity SYSTEM: file nội dung cần mở. Rỗng với entity inline.</summary>
    public string OpenPath { get; init; } = string.Empty;
}
