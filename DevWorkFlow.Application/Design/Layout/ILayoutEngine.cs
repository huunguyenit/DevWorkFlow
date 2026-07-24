using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Cách chèn control vào một slot đã có vị trí. <see cref="Replace"/> chỉ hợp lệ khi slot đang trống
/// (spec: Replace-on-drop lên control khác = backlog). <see cref="Before"/>/<see cref="After"/> mượn một
/// cột trống gần nhất trong cùng hàng để giữ nguyên tổng số cột của Region.
/// </summary>
public enum SlotInsertMode
{
    Replace,
    Before,
    After
}

/// <summary>
/// Áp thao tác layout Slot-based lên <see cref="FboFormModel"/> in-memory theo luật FBO
/// (tổng width Region không đổi, pattern <c>1/0/-</c>, anchor/split 1-based).
/// Không biết WebView, không ghi XML — việc ghi thuộc <see cref="IDesignLayoutWriterAdapter"/>.
/// </summary>
public interface ILayoutEngine
{
    /// <summary>Kéo biên giữa cột <c>splitter_index</c> và <c>splitter_index + 1</c>.</summary>
    LayoutMutationResult ResizeColumns(
        FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px);

    /// <summary>Kéo dãn ngang toàn form: phân bổ lại widths theo tỉ lệ để tổng = <paramref name="new_total_px"/>.</summary>
    LayoutMutationResult ResizeFormWidth(FboFormModel form, LayoutRegionId region, int new_total_px);

    /// <summary>Đặt chiều cao vùng — P6 gap: chỉ category tab (Normal→view@height, Grid seed→field@rows).</summary>
    LayoutMutationResult SetRegionHeight(
        FboFormModel form, LayoutRegionId region, int? height_px, out string? rows_field_name);

    /// <summary>Gộp hai slot liền kề cùng hàng thành một slot span tổng.</summary>
    LayoutMutationResult MergeSlots(FboFormModel form, LayoutSlotId left, LayoutSlotId right);

    /// <summary>Tách slot span &gt; 1: control giữ cột đầu, phần còn lại thành ô trống.</summary>
    LayoutMutationResult SplitSlot(FboFormModel form, LayoutSlotId slot);

    /// <summary>Thu span của ô về <paramref name="keep_span"/> cột; phần còn lại thành ô trống (split từng cột).</summary>
    LayoutMutationResult ShrinkSlot(FboFormModel form, LayoutSlotId slot, int keep_span);

    LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based);

    LayoutMutationResult SetSplit(FboFormModel form, LayoutRegionId region, int? split_1_based);

    /// <summary>
    /// Đặt một field (Label / Input / Description) vào slot. Region đích phải khớp
    /// <c>field@categoryIndex</c> — đổi vùng của field là thao tác field, không phải layout.
    /// </summary>
    LayoutMutationResult InsertFieldAtSlot(
        FboFormModel form,
        LayoutSlotId slot,
        string field_name,
        FormViewCellKind kind,
        SlotInsertMode mode = SlotInsertMode.Replace,
        string? suffix = null);

    /// <summary>
    /// Chuyển control giữa hai slot cùng Region. <see cref="SlotInsertMode.Replace"/> = đổi chỗ nội dung
    /// (đích trống → di chuyển); Before/After = đặt cạnh slot đích, mượn cột trống để giữ số cột.
    /// </summary>
    LayoutMutationResult MoveField(
        FboFormModel form, LayoutSlotId from, LayoutSlotId to, SlotInsertMode mode = SlotInsertMode.Replace);

    /// <summary>Gỡ control khỏi slot, giữ nguyên span (slot thành ô trống).</summary>
    LayoutMutationResult ClearSlot(FboFormModel form, LayoutSlotId slot);

    /// <summary>Khai báo <c>&lt;category index="-1"&gt;</c> (vùng footer) nếu chưa có. Idempotent.</summary>
    LayoutMutationResult EnsureFooter(FboFormModel form, IReadOnlyList<int>? column_widths = null);

    /// <summary>Thêm tab category mới (index &gt; 0). Trùng index → Fail.</summary>
    LayoutMutationResult AddCategory(
        FboFormModel form,
        int index,
        string header_v,
        string header_e,
        IReadOnlyList<int>? column_widths = null);

    /// <summary>
    /// Tạo field mới theo control Toolbox rồi đặt vào slot (categoryIndex khớp Region đích).
    /// Replace (ô trống) → Place Input→Label→Description theo ô trống còn lại; Before/After → chỉ Input.
    /// AutoComplete tạo thêm field reference (<c>ten_*</c>).
    /// </summary>
    LayoutMutationResult CreateFieldAndInsert(
        FboFormModel form,
        ToolboxControlKind control_kind,
        LayoutSlotId slot,
        SlotInsertMode mode = SlotInsertMode.Replace);

    /// <summary>
    /// Đặt các phần của một field đã có vào các ô trống liên tiếp từ <paramref name="start"/> sang phải cùng
    /// hàng, theo thứ tự <paramref name="kinds_in_order"/> (mặc định Input, Label, Description). Không tạo ô
    /// mới / không đổi số cột; cần ít nhất 1 ô trống cho phần đầu.
    /// </summary>
    LayoutMutationResult PlaceFieldParts(
        FboFormModel form,
        LayoutSlotId start,
        string field_name,
        IReadOnlyList<FormViewCellKind> kinds_in_order);

    /// <summary>
    /// Gỡ hẳn một field: xóa mọi ô view (mọi region) + <c>&lt;field&gt;</c> XML. AutoComplete xóa luôn field
    /// reference. Trả danh sách tên field đã xóa để Writer xóa XML tương ứng.
    /// </summary>
    LayoutMutationResult RemoveField(FboFormModel form, string field_name, out IReadOnlyList<string> removed_names);

    /// <summary>
    /// Thêm tab category loại Normal/Grid/Post/List. Grid/Post/List seed một field <c>items@style</c> tương ứng
    /// (categoryIndex = tab) chiếm trọn hàng. Trả tên field seed (nếu có) để Writer ghi field mới.
    /// </summary>
    LayoutMutationResult AddTabCategory(
        FboFormModel form,
        string tab_kind,
        string header_v,
        string header_e,
        string? controller,
        out FboField? seed_field);
}
