using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Hiện thực luật layout §7 của spec Layout Blueprint Designer. Mọi thao tác là all-or-nothing:
/// validate trước, chỉ mutate khi hợp lệ.
/// </summary>
public sealed class LayoutEngine : ILayoutEngine
{
    /// <summary>Ngưỡng clamp tạm của IDE — KHÔNG persist vào XML.</summary>
    public const int MinColumnWidthPx = 1;

    // ── Resize ───────────────────────────────────────────────────────

    public LayoutMutationResult ResizeColumns(
        FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px)
    {
        if (!TryResolveRegion(form, region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);

        if (splitter_index < 0 || splitter_index + 1 >= widths.Count)
            return LayoutMutationResult.Fail("Invalid splitter index.");

        var left = widths[splitter_index] + delta_px;
        var right = widths[splitter_index + 1] - delta_px;
        if (left < MinColumnWidthPx || right < MinColumnWidthPx)
            return LayoutMutationResult.Fail("Column would be below minimum width.");

        widths[splitter_index] = left;
        widths[splitter_index + 1] = right;
        RecalcRowWidths(rows, widths);
        return LayoutMutationResult.Success();
    }

    /// <summary>
    /// Kéo dãn NGANG toàn form: phân bổ lại <c>ColumnWidths</c> theo tỉ lệ để tổng = <paramref name="new_total_px"/>.
    /// Giữ nguyên số cột; mỗi cột tối thiểu <see cref="MinColumnWidthPx"/>; sai số làm tròn dồn vào cột cuối.
    /// </summary>
    public LayoutMutationResult ResizeFormWidth(FboFormModel form, LayoutRegionId region, int new_total_px)
    {
        if (!TryResolveRegion(form, region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);

        var count = widths.Count;
        if (new_total_px < count * MinColumnWidthPx)
            return LayoutMutationResult.Fail("Form width below minimum.");

        var old_total = widths.Sum();
        if (old_total <= 0)
            return LayoutMutationResult.Fail("Region has no width to scale.");

        var scaled = new int[count];
        var running = 0;
        for (var i = 0; i < count - 1; i++)
        {
            var w = (int)Math.Round((double)widths[i] * new_total_px / old_total);
            if (w < MinColumnWidthPx) w = MinColumnWidthPx;
            scaled[i] = w;
            running += w;
        }
        scaled[count - 1] = Math.Max(MinColumnWidthPx, new_total_px - running);

        for (var i = 0; i < count; i++) widths[i] = scaled[i];
        RecalcRowWidths(rows, widths);
        return LayoutMutationResult.Success();
    }

    /// <summary>Đặt chiều cao vùng (P6: chỉ Main → <c>view@height</c>). null/0 = bỏ.</summary>
    public LayoutMutationResult SetRegionHeight(FboFormModel form, LayoutRegionId region, int? height_px)
    {
        if (form.Layout is null)
            return LayoutMutationResult.Fail("Form has no layout.");
        if (region.Kind != LayoutRegionKind.Main)
            return LayoutMutationResult.Fail("Region height is only supported on the main view in P6.");

        if (height_px is null or <= 0)
        {
            form.Layout.HeightPx = null;
            form.Layout.HeightExpression = null;
        }
        else
        {
            form.Layout.HeightPx = height_px;
            form.Layout.HeightExpression = height_px.Value.ToString();
        }
        return LayoutMutationResult.Success();
    }

    // ── Merge / Split ────────────────────────────────────────────────

    public LayoutMutationResult MergeSlots(FboFormModel form, LayoutSlotId left, LayoutSlotId right)
    {
        if (!left.Region.Equals(right.Region))
            return LayoutMutationResult.Fail("Slots belong to different regions.");
        if (left.RowIndex != right.RowIndex)
            return LayoutMutationResult.Fail("Slots belong to different rows.");
        if (left.ColumnIndex == right.ColumnIndex)
            return LayoutMutationResult.Fail("Slots are identical.");

        if (!TryResolveRegion(form, left.Region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);
        if (left.RowIndex < 0 || left.RowIndex >= rows.Count)
            return LayoutMutationResult.Fail("Invalid row index.");

        var row = rows[left.RowIndex];
        var left_cell = FindCell(row, left.ColumnIndex);
        var right_cell = FindCell(row, right.ColumnIndex);
        if (left_cell is null || right_cell is null)
            return LayoutMutationResult.Fail("Slot not found.");

        // Chuẩn hoá theo vị trí cột thực tế — người dùng có thể chọn phải trước.
        if (left_cell.ColumnIndex > right_cell.ColumnIndex)
            (left_cell, right_cell) = (right_cell, left_cell);

        if (left_cell.ColumnIndex + Math.Max(left_cell.ColumnSpan, 1) != right_cell.ColumnIndex)
            return LayoutMutationResult.Fail("Slots are not adjacent.");

        var left_empty = left_cell.Kind == FormViewCellKind.Empty;
        var right_empty = right_cell.Kind == FormViewCellKind.Empty;
        if (!left_empty && !right_empty)
            return LayoutMutationResult.Fail("Cannot merge two occupied slots.");

        // Ô trống bên trái + control bên phải → control dời về cột bắt đầu.
        if (left_empty && !right_empty)
        {
            left_cell.Kind = right_cell.Kind;
            left_cell.FieldName = right_cell.FieldName;
            left_cell.Suffix = right_cell.Suffix;
        }

        left_cell.ColumnSpan = Math.Max(left_cell.ColumnSpan, 1) + Math.Max(right_cell.ColumnSpan, 1);
        row.Cells.Remove(right_cell);

        RebuildRow(row, widths);
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult SplitSlot(FboFormModel form, LayoutSlotId slot)
    {
        if (!TryResolveRegion(form, slot.Region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);
        if (slot.RowIndex < 0 || slot.RowIndex >= rows.Count)
            return LayoutMutationResult.Fail("Invalid row index.");

        var row = rows[slot.RowIndex];
        var cell = FindCell(row, slot.ColumnIndex);
        if (cell is null)
            return LayoutMutationResult.Fail("Slot not found.");

        var span = Math.Max(cell.ColumnSpan, 1);
        if (span <= 1)
            return LayoutMutationResult.Fail("Slot does not span multiple columns.");

        var insert_at = row.Cells.IndexOf(cell) + 1;
        cell.ColumnSpan = 1;
        for (var i = 1; i < span; i++)
        {
            row.Cells.Insert(insert_at + i - 1, new FormViewCell
            {
                Kind = FormViewCellKind.Empty,
                ColumnIndex = cell.ColumnIndex + i,
                ColumnSpan = 1
            });
        }

        RebuildRow(row, widths);
        return LayoutMutationResult.Success();
    }

    // ── Nội dung slot (Insert / Move / Clear) ────────────────────────

    public LayoutMutationResult InsertFieldAtSlot(
        FboFormModel form,
        LayoutSlotId slot,
        string field_name,
        FormViewCellKind kind,
        SlotInsertMode mode = SlotInsertMode.Replace,
        string? suffix = null)
    {
        if (string.IsNullOrWhiteSpace(field_name))
            return LayoutMutationResult.Fail("Field name is required.");
        if (kind == FormViewCellKind.Empty)
            return LayoutMutationResult.Fail("Use ClearSlot to empty a slot.");

        var field = form.FindField(field_name);
        if (field is null)
            return LayoutMutationResult.Fail($"Field '{field_name}' is not declared on this form.");

        // Vùng của một dòng suy ra từ field trong dòng đó → thả sang vùng khác sẽ ghi XML sai.
        if (!RegionMatchesField(slot.Region, field.CategoryIndex))
            return LayoutMutationResult.Fail(
                $"Field '{field_name}' belongs to region {FieldRegionName(field.CategoryIndex)}, not {slot.Region}.");

        if (!TryResolveRegion(form, slot.Region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);
        if (slot.RowIndex < 0 || slot.RowIndex >= rows.Count)
            return LayoutMutationResult.Fail("Invalid row index.");

        var row = rows[slot.RowIndex];
        var target = FindCell(row, slot.ColumnIndex);
        if (target is null)
            return LayoutMutationResult.Fail("Slot not found.");

        var resolved_suffix = suffix ?? DefaultSuffix(kind);

        if (mode == SlotInsertMode.Replace)
        {
            if (target.Kind != FormViewCellKind.Empty)
                return LayoutMutationResult.Fail(
                    "Slot is occupied — use Insert Before/After (replace-on-drop not supported).");

            target.Kind = kind;
            target.FieldName = field.Name;
            target.Suffix = resolved_suffix;
            RebuildRow(row, widths);
            return LayoutMutationResult.Success();
        }

        // Before/After: mượn một ô trống span 1 trong hàng để không đổi tổng số cột.
        if (!TryInsertRelative(row, target, mode, kind, field.Name, resolved_suffix))
            return LayoutMutationResult.Fail("No free column left in this row to insert into.");

        RebuildRow(row, widths);
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult MoveField(
        FboFormModel form, LayoutSlotId from, LayoutSlotId to, SlotInsertMode mode = SlotInsertMode.Replace)
    {
        if (!from.Region.Equals(to.Region))
            return LayoutMutationResult.Fail("Moving between regions is not supported (field category would change).");
        if (from.RowIndex == to.RowIndex && from.ColumnIndex == to.ColumnIndex)
            return LayoutMutationResult.Fail("Source and target slots are identical.");

        if (!TryResolveRegion(form, from.Region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);
        if (from.RowIndex < 0 || from.RowIndex >= rows.Count
            || to.RowIndex < 0 || to.RowIndex >= rows.Count)
            return LayoutMutationResult.Fail("Invalid row index.");

        var from_row = rows[from.RowIndex];
        var to_row = rows[to.RowIndex];
        var from_cell = FindCell(from_row, from.ColumnIndex);
        var to_cell = FindCell(to_row, to.ColumnIndex);
        if (from_cell is null || to_cell is null)
            return LayoutMutationResult.Fail("Slot not found.");
        if (from_cell.Kind == FormViewCellKind.Empty)
            return LayoutMutationResult.Fail("Source slot has no control.");

        if (mode == SlotInsertMode.Replace)
        {
            // Nội dung đổi chỗ; span/vị trí thuộc về slot, không đi theo control.
            (from_cell.Kind, to_cell.Kind) = (to_cell.Kind, from_cell.Kind);
            (from_cell.FieldName, to_cell.FieldName) = (to_cell.FieldName, from_cell.FieldName);
            (from_cell.Suffix, to_cell.Suffix) = (to_cell.Suffix, from_cell.Suffix);

            RebuildRow(from_row, widths);
            if (!ReferenceEquals(from_row, to_row)) RebuildRow(to_row, widths);
            return LayoutMutationResult.Success();
        }

        // Before/After: dọn nguồn TRƯỚC để cột vừa trống có thể làm "donor" khi cùng hàng.
        var moved_kind = from_cell.Kind;
        var moved_field = from_cell.FieldName ?? string.Empty;
        var moved_suffix = from_cell.Suffix;
        from_cell.Kind = FormViewCellKind.Empty;
        from_cell.FieldName = null;
        from_cell.Suffix = string.Empty;

        if (!TryInsertRelative(to_row, to_cell, mode, moved_kind, moved_field, moved_suffix))
        {
            from_cell.Kind = moved_kind;
            from_cell.FieldName = moved_field;
            from_cell.Suffix = moved_suffix;
            return LayoutMutationResult.Fail("No free column left in the target row to insert into.");
        }

        RebuildRow(from_row, widths);
        if (!ReferenceEquals(from_row, to_row)) RebuildRow(to_row, widths);
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult ClearSlot(FboFormModel form, LayoutSlotId slot)
    {
        if (!TryResolveRegion(form, slot.Region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);
        if (slot.RowIndex < 0 || slot.RowIndex >= rows.Count)
            return LayoutMutationResult.Fail("Invalid row index.");

        var row = rows[slot.RowIndex];
        var cell = FindCell(row, slot.ColumnIndex);
        if (cell is null)
            return LayoutMutationResult.Fail("Slot not found.");
        if (cell.Kind == FormViewCellKind.Empty)
            return LayoutMutationResult.Fail("Slot is already empty.");

        cell.Kind = FormViewCellKind.Empty;
        cell.FieldName = null;
        cell.Suffix = string.Empty;
        RebuildRow(row, widths);
        return LayoutMutationResult.Success();
    }

    // ── Ensure region ────────────────────────────────────────────────

    public LayoutMutationResult EnsureFooter(FboFormModel form, IReadOnlyList<int>? column_widths = null)
    {
        if (form.Layout is null)
            return LayoutMutationResult.Fail("Form has no layout.");
        if (form.Layout.FooterCategory is not null)
            return LayoutMutationResult.Success();

        var widths = column_widths is { Count: > 0 }
            ? column_widths.ToList()
            : [.. form.Layout.ColumnWidths];
        if (widths.Count == 0)
            return LayoutMutationResult.Fail("Cannot create footer without column widths.");

        form.Layout.Categories.Add(new FormCategory { Index = -1, ColumnWidths = widths });
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult AddCategory(
        FboFormModel form,
        int index,
        string header_v,
        string header_e,
        IReadOnlyList<int>? column_widths = null)
    {
        if (form.Layout is null)
            return LayoutMutationResult.Fail("Form has no layout.");
        if (index <= 0)
            return LayoutMutationResult.Fail("Category index must be greater than 0 (index -1 = footer).");
        if (form.Layout.Categories.Exists(c => c.Index == index))
            return LayoutMutationResult.Fail($"Category {index} already exists.");

        var widths = column_widths is { Count: > 0 }
            ? column_widths.ToList()
            : [.. form.Layout.ColumnWidths];
        if (widths.Count == 0)
            return LayoutMutationResult.Fail("Cannot create category without column widths.");

        form.Layout.Categories.Add(new FormCategory
        {
            Index = index,
            HeaderV = header_v ?? string.Empty,
            HeaderE = header_e ?? string.Empty,
            ColumnWidths = widths
        });
        return LayoutMutationResult.Success();
    }

    // ── Anchor / Split (metadata view) ───────────────────────────────

    public LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based)
    {
        if (!TryValidateViewMetadata(form, region, anchor_1_based, out var normalized, out var error))
            return LayoutMutationResult.Fail(error);

        form.Layout!.Anchor = normalized;
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult SetSplit(FboFormModel form, LayoutRegionId region, int? split_1_based)
    {
        if (!TryValidateViewMetadata(form, region, split_1_based, out var normalized, out var error))
            return LayoutMutationResult.Fail(error);

        form.Layout!.Split = normalized;
        return LayoutMutationResult.Success();
    }

    private static bool TryValidateViewMetadata(
        FboFormModel form, LayoutRegionId region, int? value, out int? normalized, out string error)
    {
        normalized = null;
        error = string.Empty;

        if (form.Layout is null)
        {
            error = "Form has no layout.";
            return false;
        }
        if (region.Kind != LayoutRegionKind.Main)
        {
            error = "Anchor/Split is only supported on the main view in P0.";
            return false;
        }
        if (value is null or 0)
            return true;
        if (value < 1 || value > form.Layout.ColumnCount)
        {
            error = "Value out of column range.";
            return false;
        }

        normalized = value;
        return true;
    }

    // ── Region resolution ────────────────────────────────────────────

    /// <summary>
    /// Trả về danh sách width **live** của Region (mutate trực tiếp) + các dòng thuộc Region.
    /// Category / Footer chưa khai báo columns → materialize từ cột view (theo <c>ResolveRowColumnWidths</c>
    /// của parser) để resize có nguồn ghi.
    /// </summary>
    private static bool TryResolveRegion(
        FboFormModel form,
        LayoutRegionId region,
        out List<int> widths,
        out List<FormViewRow> rows,
        out string error)
    {
        widths = [];
        rows = [];
        error = string.Empty;

        var layout = form.Layout;
        if (layout is null)
        {
            error = "Form has no layout.";
            return false;
        }

        switch (region.Kind)
        {
            case LayoutRegionKind.Main:
                widths = layout.ColumnWidths;
                rows = layout.TopRows;
                break;

            case LayoutRegionKind.Category:
                var category = layout.Categories.FirstOrDefault(c => c.Index == region.CategoryIndex);
                if (category is null)
                {
                    error = $"Category {region.CategoryIndex} not found.";
                    return false;
                }
                if (category.ColumnWidths.Count == 0)
                    category.ColumnWidths = [.. layout.ColumnWidths];
                widths = category.ColumnWidths;
                rows = category.Rows;
                break;

            default:
                var footer = layout.FooterCategory;
                if (footer is null)
                {
                    error = "Footer category (index -1) is not declared.";
                    return false;
                }
                if (footer.ColumnWidths.Count == 0)
                    footer.ColumnWidths = [.. layout.ColumnWidths];
                widths = footer.ColumnWidths;
                rows = layout.BottomRows;
                break;
        }

        if (widths.Count == 0)
        {
            error = "Region has no column widths.";
            return false;
        }

        return true;
    }

    /// <summary>Vùng của một dòng = <c>field@categoryIndex</c> (null/0 main, -1 footer, n tab).</summary>
    private static bool RegionMatchesField(LayoutRegionId region, int? category_index) => region.Kind switch
    {
        LayoutRegionKind.Main => category_index is null or 0,
        LayoutRegionKind.Footer => category_index == -1,
        _ => category_index == region.CategoryIndex
    };

    private static string FieldRegionName(int? category_index) => category_index switch
    {
        null or 0 => "main",
        -1 => "footer",
        _ => $"cat:{category_index}"
    };

    private static string DefaultSuffix(FormViewCellKind kind) => kind switch
    {
        FormViewCellKind.Label => ".Label",
        FormViewCellKind.Description => ".Description",
        _ => string.Empty
    };

    /// <summary>
    /// Chèn một ô span 1 ngay trước/sau <paramref name="target"/> bằng cách mượn ô trống span 1 gần nhất
    /// trong cùng hàng — tổng số cột không đổi. Chỉ mutate khi thành công.
    /// </summary>
    private static bool TryInsertRelative(
        FormViewRow row,
        FormViewCell target,
        SlotInsertMode mode,
        FormViewCellKind kind,
        string field_name,
        string suffix)
    {
        var target_index = row.Cells.IndexOf(target);
        if (target_index < 0) return false;

        var donor_index = FindDonorEmpty(row, target_index, prefer_left: mode == SlotInsertMode.Before);
        if (donor_index < 0) return false;

        row.Cells.RemoveAt(donor_index);
        if (donor_index < target_index) target_index--;

        var insert_at = mode == SlotInsertMode.Before ? target_index : target_index + 1;
        row.Cells.Insert(insert_at, new FormViewCell
        {
            Kind = kind,
            FieldName = field_name,
            Suffix = suffix,
            ColumnSpan = 1
        });
        return true;
    }

    /// <summary>Ô trống span 1 gần nhất để "nhường" cột cho Insert Before/After; ưu tiên một phía rồi phía kia.</summary>
    private static int FindDonorEmpty(FormViewRow row, int target_index, bool prefer_left)
    {
        var first = prefer_left
            ? ScanForEmpty(row, target_index - 1, -1)
            : ScanForEmpty(row, target_index + 1, 1);
        if (first >= 0) return first;

        return prefer_left
            ? ScanForEmpty(row, target_index + 1, 1)
            : ScanForEmpty(row, target_index - 1, -1);
    }

    private static int ScanForEmpty(FormViewRow row, int start, int step)
    {
        for (var i = start; i >= 0 && i < row.Cells.Count; i += step)
        {
            var cell = row.Cells[i];
            if (cell.Kind == FormViewCellKind.Empty && Math.Max(cell.ColumnSpan, 1) == 1)
                return i;
        }
        return -1;
    }

    private static FormViewCell? FindCell(FormViewRow row, int column_index) =>
        row.Cells.Find(c => c.ColumnIndex == column_index);

    /// <summary>Đồng bộ lại ColumnIndex liên tiếp, WidthPx và Pattern sau khi Cells đổi.</summary>
    private static void RebuildRow(FormViewRow row, IReadOnlyList<int> widths)
    {
        var column = 0;
        foreach (var cell in row.Cells)
        {
            cell.ColumnIndex = column;
            column += Math.Max(cell.ColumnSpan, 1);
        }

        RecalcCellWidths(row, widths);
        ViewRowPatternBuilder.Rebuild(row, widths.Count);
    }

    private static void RecalcRowWidths(IReadOnlyList<FormViewRow> rows, IReadOnlyList<int> widths)
    {
        foreach (var row in rows)
            RecalcCellWidths(row, widths);
    }

    private static void RecalcCellWidths(FormViewRow row, IReadOnlyList<int> widths)
    {
        foreach (var cell in row.Cells)
        {
            var span = Math.Max(cell.ColumnSpan, 1);
            var total = 0;
            for (var i = 0; i < span; i++)
            {
                var col = cell.ColumnIndex + i;
                if (col >= 0 && col < widths.Count) total += widths[col];
            }
            cell.WidthPx = total;
        }
    }

    // ── Create field from Toolbox control ────────────────────────────

    /// <summary>Thứ tự Place mặc định cho TextBox-family: Input trước (ô thả), rồi Label, Description.</summary>
    private static readonly FormViewCellKind[] DefaultPlaceKinds =
        [FormViewCellKind.Input, FormViewCellKind.Label, FormViewCellKind.Description];

    public LayoutMutationResult CreateFieldAndInsert(
        FboFormModel form,
        ToolboxControlKind control_kind,
        LayoutSlotId slot,
        SlotInsertMode mode = SlotInsertMode.Replace)
    {
        var defaults = DescribeControl(control_kind);
        if (defaults is null)
            return LayoutMutationResult.Fail("Tab controls use AddTabCategory, not CreateFieldAndInsert.");

        var category_index = CategoryIndexForRegion(slot.Region);
        var name = NextFieldName(form, defaults.Prefix);

        var field = new FboField
        {
            Name = name,
            DataType = defaults.DataType,
            ItemsStyle = defaults.ItemsStyle,
            DataFormatString = defaults.DataFormatString,
            CategoryIndex = category_index,
            Header = new LocalizedText { V = name, E = name }
        };

        FboField? ref_field = null;
        if (defaults.CreateReference)
        {
            var ref_name = UniqueName(form, $"ten_{name}");
            field.ItemsReference = $"{ref_name}%l";
            ref_field = new FboField
            {
                Name = ref_name,
                DataType = "String",
                ReadOnly = true,
                CategoryIndex = category_index,
                Header = new LocalizedText { V = ref_name, E = ref_name }
            };
        }

        form.Fields.Add(field);
        form.FieldsByName[field.Name] = field;
        if (ref_field is not null)
        {
            form.Fields.Add(ref_field);
            form.FieldsByName[ref_field.Name] = ref_field;
        }

        // Replace (ô trống) → Place I→L→D; Before/After (ô đã có) → chỉ chèn Input cạnh đích.
        var place = mode == SlotInsertMode.Replace
            ? PlaceFieldParts(form, slot, name, DefaultPlaceKinds)
            : InsertFieldAtSlot(form, slot, name, FormViewCellKind.Input, mode);

        if (!place.Ok)
        {
            form.Fields.Remove(field);
            form.FieldsByName.Remove(field.Name);
            if (ref_field is not null)
            {
                form.Fields.Remove(ref_field);
                form.FieldsByName.Remove(ref_field.Name);
            }
            return place;
        }

        EnsureSpareTrailingRow(form, slot.Region);
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult PlaceFieldParts(
        FboFormModel form,
        LayoutSlotId start,
        string field_name,
        IReadOnlyList<FormViewCellKind> kinds_in_order)
    {
        if (string.IsNullOrWhiteSpace(field_name))
            return LayoutMutationResult.Fail("Field name is required.");
        var field = form.FindField(field_name);
        if (field is null)
            return LayoutMutationResult.Fail($"Field '{field_name}' is not declared on this form.");
        if (!RegionMatchesField(start.Region, field.CategoryIndex))
            return LayoutMutationResult.Fail(
                $"Field '{field_name}' belongs to region {FieldRegionName(field.CategoryIndex)}, not {start.Region}.");

        if (!TryResolveRegion(form, start.Region, out var widths, out var rows, out var error))
            return LayoutMutationResult.Fail(error);

        var row = ResolveOrCreateRow(form, start.Region, rows, widths, start.RowIndex);
        if (row is null)
            return LayoutMutationResult.Fail("Invalid row index.");

        // Ô trống span 1, bắt đầu từ cột đích sang phải cùng hàng.
        var empties = row.Cells
            .Where(c => c.ColumnIndex >= start.ColumnIndex
                        && c.Kind == FormViewCellKind.Empty
                        && Math.Max(c.ColumnSpan, 1) == 1)
            .OrderBy(c => c.ColumnIndex)
            .ToList();
        if (empties.Count == 0)
            return LayoutMutationResult.Fail("No empty cell at the drop point to place the field.");

        var count = Math.Min(kinds_in_order.Count, empties.Count);
        for (var i = 0; i < count; i++)
        {
            var kind = kinds_in_order[i];
            empties[i].Kind = kind;
            empties[i].FieldName = field.Name;
            empties[i].Suffix = DefaultSuffix(kind);
        }

        RebuildRow(row, widths);
        return LayoutMutationResult.Success();
    }

    public LayoutMutationResult RemoveField(
        FboFormModel form, string field_name, out IReadOnlyList<string> removed_names)
    {
        removed_names = [];
        if (string.IsNullOrWhiteSpace(field_name))
            return LayoutMutationResult.Fail("Field name is required.");

        var field = form.FindField(field_name);
        if (field is null)
            return LayoutMutationResult.Fail($"Field '{field_name}' not found.");

        var names = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { field.Name };
        if (field.ReferenceFieldName is { Length: > 0 } ref_name && form.FindField(ref_name) is not null)
            names.Add(ref_name);

        // Xóa mọi ô view mọi region rồi rebuild.
        foreach (var (region, region_widths, region_rows) in EnumerateRegions(form))
        {
            var touched = false;
            foreach (var row in region_rows)
            {
                var changed = false;
                foreach (var cell in row.Cells)
                {
                    if (cell.FieldName is { } n && names.Contains(n))
                    {
                        cell.Kind = FormViewCellKind.Empty;
                        cell.FieldName = null;
                        cell.Suffix = string.Empty;
                        changed = true;
                    }
                }
                if (changed) { RebuildRow(row, region_widths); touched = true; }
            }
            if (touched) EnsureSpareTrailingRow(form, region);
        }

        foreach (var name in names)
        {
            var f = form.FindField(name);
            if (f is not null) form.Fields.Remove(f);
            form.FieldsByName.Remove(name);
        }

        removed_names = names.ToList();
        return LayoutMutationResult.Success();
    }

    public void EnsureSpareTrailingRow(FboFormModel form, LayoutRegionId region)
    {
        // Chỉ Main là reparse-ổn định: hàng trống không mang field → parser gán về vùng main (categoryIndex 0).
        // Với category/footer, hàng trống sẽ "trôi" về main khi reparse nên không thêm ở model.
        if (region.Kind != LayoutRegionKind.Main) return;

        var layout = form.Layout;
        if (layout is null || layout.ColumnWidths.Count == 0) return;

        var rows = layout.TopRows;
        if (rows.Count > 0 && IsAllEmpty(rows[^1])) return;

        var last_top = rows.Count > 0 ? rows[^1] : null;
        var spare = MakeEmptyRow(layout.ColumnWidths, category_index: 0);
        rows.Add(spare);

        var anchor = last_top is null ? -1 : layout.Rows.IndexOf(last_top);
        if (anchor >= 0) layout.Rows.Insert(anchor + 1, spare);
        else layout.Rows.Add(spare);
    }

    public LayoutMutationResult AddTabCategory(
        FboFormModel form,
        string tab_kind,
        string header_v,
        string header_e,
        string? controller,
        out FboField? seed_field)
    {
        seed_field = null;
        if (form.Layout is null)
            return LayoutMutationResult.Fail("Form has no layout.");

        var next_index = 1;
        while (form.Layout.Categories.Exists(c => c.Index == next_index)) next_index++;

        var add = AddCategory(form, next_index, header_v, header_e);
        if (!add.Ok) return add;

        var category = form.Layout.Categories.First(c => c.Index == next_index);
        var seed_style = SeedStyleForTab(tab_kind);

        if (seed_style is null)
            return LayoutMutationResult.Success(); // Normal tab — no seed field.

        // Grid/Post/List: seed field chiếm trọn hàng (span = số cột) → reparse-ổn định (mang categoryIndex).
        var seed_name = NextFieldName(form, seed_style.ToLowerInvariant());
        seed_field = new FboField
        {
            Name = seed_name,
            DataType = "String",
            ItemsStyle = seed_style,
            ItemsController = string.IsNullOrWhiteSpace(controller) ? null : controller.Trim(),
            CategoryIndex = next_index,
            Header = new LocalizedText { V = seed_name, E = seed_name }
        };
        form.Fields.Add(seed_field);
        form.FieldsByName[seed_field.Name] = seed_field;

        var widths = category.ColumnWidths.Count > 0 ? category.ColumnWidths : form.Layout.ColumnWidths;
        var row = MakeEmptyRow(widths, category_index: next_index);
        // Gộp thành một ô Input span toàn bộ cột.
        var first = row.Cells[0];
        first.Kind = FormViewCellKind.Input;
        first.FieldName = seed_name;
        first.Suffix = string.Empty;
        first.ColumnSpan = widths.Count;
        row.Cells.RemoveRange(1, row.Cells.Count - 1);
        RebuildRow(row, widths);

        category.Rows.Add(row);
        form.Layout.Rows.Add(row);
        return LayoutMutationResult.Success();
    }

    private static string? SeedStyleForTab(string? tab_kind) => tab_kind?.Trim().ToLowerInvariant() switch
    {
        "grid" => "Grid",
        "post" => "Post",
        "list" => "List",
        _ => null
    };

    private sealed record ControlDefaults(
        string Prefix,
        string? DataType,
        string? ItemsStyle,
        string? DataFormatString,
        bool CreateReference);

    private static ControlDefaults? DescribeControl(ToolboxControlKind kind) => kind switch
    {
        ToolboxControlKind.TextBox => new("text", "String", null, null, false),
        ToolboxControlKind.DateTime => new("date", "DateTime", null, "@dateTimeFormat", false),
        ToolboxControlKind.Numeric => new("num", "Decimal", null, "", false),
        ToolboxControlKind.CheckBox => new("check", "Boolean", "Checkbox", null, false),
        ToolboxControlKind.ComboBox => new("combo", "String", "DropDownList", null, false),
        ToolboxControlKind.AutoComplete => new("ac", "String", "AutoComplete", null, true),
        ToolboxControlKind.Lookup => new("lookup", "String", "Lookup", null, false),
        _ => null // Tab* — không phải TextBox-family
    };

    private static int? CategoryIndexForRegion(LayoutRegionId region) => region.Kind switch
    {
        LayoutRegionKind.Main => null,
        LayoutRegionKind.Footer => -1,
        _ => region.CategoryIndex
    };

    /// <summary>
    /// Lấy hàng theo index; nếu index = số hàng hiện có (hàng "spare" render), tạo hàng trống mới trong model
    /// (region rows + flat Rows) để thả tạo được backing row — cần cho tab/category chưa có hàng nào.
    /// </summary>
    private static FormViewRow? ResolveOrCreateRow(
        FboFormModel form, LayoutRegionId region, List<FormViewRow> rows, List<int> widths, int row_index)
    {
        if (row_index >= 0 && row_index < rows.Count) return rows[row_index];
        if (row_index != rows.Count) return null;

        var row = MakeEmptyRow(widths, CategoryIndexForRegion(region) ?? 0);
        rows.Add(row);
        form.Layout!.Rows.Add(row);
        return row;
    }

    private static FormViewRow MakeEmptyRow(IReadOnlyList<int> widths, int category_index)
    {
        var row = new FormViewRow { CategoryIndex = category_index };
        for (var i = 0; i < widths.Count; i++)
            row.Cells.Add(new FormViewCell
            {
                Kind = FormViewCellKind.Empty,
                ColumnIndex = i,
                ColumnSpan = 1,
                WidthPx = widths[i]
            });
        ViewRowPatternBuilder.Rebuild(row, widths.Count);
        return row;
    }

    private static bool IsAllEmpty(FormViewRow row) =>
        row.Cells.All(c => c.Kind == FormViewCellKind.Empty);

    /// <summary>Duyệt (region, widths, rows) của mọi vùng có khai báo — cho Remove/rebuild toàn cục.</summary>
    private static IEnumerable<(LayoutRegionId Region, List<int> Widths, List<FormViewRow> Rows)>
        EnumerateRegions(FboFormModel form)
    {
        var layout = form.Layout;
        if (layout is null) yield break;

        yield return (LayoutRegionId.Main, layout.ColumnWidths, layout.TopRows);

        foreach (var cat in layout.Categories)
        {
            var widths = cat.ColumnWidths.Count > 0 ? cat.ColumnWidths : layout.ColumnWidths;
            var region = cat.Index == -1 ? LayoutRegionId.Footer : LayoutRegionId.Category(cat.Index);
            var rows = cat.Index == -1 ? layout.BottomRows : cat.Rows;
            yield return (region, widths, rows);
        }
    }

    private static string UniqueName(FboFormModel form, string desired)
    {
        if (form.FindField(desired) is null) return desired;
        for (var n = 2; n < 10_000; n++)
        {
            var candidate = $"{desired}_{n}";
            if (form.FindField(candidate) is null) return candidate;
        }
        return $"{desired}_{Guid.NewGuid():N}"[..20];
    }

    internal static string NextFieldName(FboFormModel form, string prefix)
    {
        for (var n = 1; n < 10_000; n++)
        {
            var candidate = $"{prefix}_{n}";
            if (form.FindField(candidate) is null)
                return candidate;
        }

        return $"{prefix}_{Guid.NewGuid():N}"[..20];
    }
}
