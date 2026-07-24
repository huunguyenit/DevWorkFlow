using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Surface Command ổn định của Layout Blueprint Designer (spec §9). UI/Overlay chỉ gọi interface này —
/// backend hiện là <see cref="LayoutEngine"/> + Adapter <c>FboXmlWriter</c>, sau migrate sang
/// Semantic Serializer (ADR-0006) mà không đổi chữ ký.
/// </summary>
public interface IDesignLayoutCommands
{
    LayoutMutationResult ResizeColumns(
        FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px);

    LayoutMutationResult ResizeFormWidth(FboFormModel form, LayoutRegionId region, int new_total_px);

    LayoutMutationResult SetRegionHeight(
        FboFormModel form, LayoutRegionId region, int? height_px, out string? rows_field_name);

    LayoutMutationResult MergeSlots(FboFormModel form, LayoutSlotId left, LayoutSlotId right);

    LayoutMutationResult SplitSlot(FboFormModel form, LayoutSlotId slot);

    LayoutMutationResult ShrinkSlot(FboFormModel form, LayoutSlotId slot, int keep_span);

    LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based);

    LayoutMutationResult SetSplit(FboFormModel form, LayoutRegionId region, int? split_1_based);

    LayoutMutationResult InsertFieldAtSlot(
        FboFormModel form,
        LayoutSlotId slot,
        string field_name,
        FormViewCellKind kind,
        SlotInsertMode mode = SlotInsertMode.Replace,
        string? suffix = null);

    LayoutMutationResult MoveField(
        FboFormModel form, LayoutSlotId from, LayoutSlotId to, SlotInsertMode mode = SlotInsertMode.Replace);

    LayoutMutationResult ClearSlot(FboFormModel form, LayoutSlotId slot);

    LayoutMutationResult EnsureFooter(FboFormModel form, IReadOnlyList<int>? column_widths = null);

    LayoutMutationResult AddCategory(
        FboFormModel form,
        int index,
        string header_v,
        string header_e,
        IReadOnlyList<int>? column_widths = null);

    LayoutMutationResult CreateFieldAndInsert(
        FboFormModel form,
        ToolboxControlKind control_kind,
        LayoutSlotId slot,
        SlotInsertMode mode = SlotInsertMode.Replace);

    LayoutMutationResult RemoveField(
        FboFormModel form, string field_name, out IReadOnlyList<string> removed_names);

    LayoutMutationResult AddTabCategory(
        FboFormModel form,
        string tab_kind,
        string header_v,
        string header_e,
        string? controller,
        out FboField? seed_field);
}
