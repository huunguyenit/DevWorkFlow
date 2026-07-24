using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>Ủy quyền thẳng cho <see cref="ILayoutEngine"/>; nơi gắn undo/telemetry về sau.</summary>
public sealed class DesignLayoutCommands(ILayoutEngine engine) : IDesignLayoutCommands
{
    public LayoutMutationResult ResizeColumns(
        FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px) =>
        engine.ResizeColumns(form, region, splitter_index, delta_px);

    public LayoutMutationResult ResizeFormWidth(FboFormModel form, LayoutRegionId region, int new_total_px) =>
        engine.ResizeFormWidth(form, region, new_total_px);

    public LayoutMutationResult SetRegionHeight(
        FboFormModel form, LayoutRegionId region, int? height_px, out string? rows_field_name) =>
        engine.SetRegionHeight(form, region, height_px, out rows_field_name);

    public LayoutMutationResult MergeSlots(FboFormModel form, LayoutSlotId left, LayoutSlotId right) =>
        engine.MergeSlots(form, left, right);

    public LayoutMutationResult SplitSlot(FboFormModel form, LayoutSlotId slot) =>
        engine.SplitSlot(form, slot);

    public LayoutMutationResult ShrinkSlot(FboFormModel form, LayoutSlotId slot, int keep_span) =>
        engine.ShrinkSlot(form, slot, keep_span);

    public LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based) =>
        engine.SetAnchor(form, region, anchor_1_based);

    public LayoutMutationResult SetSplit(FboFormModel form, LayoutRegionId region, int? split_1_based) =>
        engine.SetSplit(form, region, split_1_based);

    public LayoutMutationResult InsertFieldAtSlot(
        FboFormModel form,
        LayoutSlotId slot,
        string field_name,
        FormViewCellKind kind,
        SlotInsertMode mode = SlotInsertMode.Replace,
        string? suffix = null) =>
        engine.InsertFieldAtSlot(form, slot, field_name, kind, mode, suffix);

    public LayoutMutationResult MoveField(
        FboFormModel form, LayoutSlotId from, LayoutSlotId to, SlotInsertMode mode = SlotInsertMode.Replace) =>
        engine.MoveField(form, from, to, mode);

    public LayoutMutationResult ClearSlot(FboFormModel form, LayoutSlotId slot) =>
        engine.ClearSlot(form, slot);

    public LayoutMutationResult EnsureFooter(FboFormModel form, IReadOnlyList<int>? column_widths = null) =>
        engine.EnsureFooter(form, column_widths);

    public LayoutMutationResult AddCategory(
        FboFormModel form,
        int index,
        string header_v,
        string header_e,
        IReadOnlyList<int>? column_widths = null) =>
        engine.AddCategory(form, index, header_v, header_e, column_widths);

    public LayoutMutationResult CreateFieldAndInsert(
        FboFormModel form,
        ToolboxControlKind control_kind,
        LayoutSlotId slot,
        SlotInsertMode mode = SlotInsertMode.Replace) =>
        engine.CreateFieldAndInsert(form, control_kind, slot, mode);

    public LayoutMutationResult RemoveField(
        FboFormModel form, string field_name, out IReadOnlyList<string> removed_names) =>
        engine.RemoveField(form, field_name, out removed_names);

    public LayoutMutationResult AddTabCategory(
        FboFormModel form,
        string tab_kind,
        string header_v,
        string header_e,
        string? controller,
        out FboField? seed_field) =>
        engine.AddTabCategory(form, tab_kind, header_v, header_e, controller, out seed_field);
}
