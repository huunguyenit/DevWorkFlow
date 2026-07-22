using System.Collections.ObjectModel;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using UI.ViewModels.Design;

namespace UI.Services;

/// <summary>Chuyển FboControllerDocument → Design surface (ruler px, DIP, key/required).</summary>
public static class FboDesignMapper
{
    private static FboOptionsCatalog _options = new();
    private static readonly LookupReferenceResolver LookupResolver = new();

    public static void SetOptions(FboOptionsCatalog options) =>
        _options = options ?? new FboOptionsCatalog();

    public static DesignSurfaceVm Map(
        FboControllerDocument doc,
        bool vietnamese = true,
        string? controllers_path = null) =>
        doc.DisplayKind switch
        {
            ControllerDisplayKind.Form when doc.Form is not null =>
                MapForm(doc.Form, vietnamese, controllers_path),
            ControllerDisplayKind.Grid when doc.Grid is not null => MapGrid(doc.Grid, vietnamese),
            ControllerDisplayKind.Lookup when doc.Lookup is not null => MapLookup(doc.Lookup, vietnamese),
            _ => new DesignSurfaceVm { DisplayKind = doc.DisplayKind, Title = doc.DisplayTitle }
        };

    public static DesignSurfaceVm MapForm(
        FboFormModel form,
        bool vietnamese = true,
        string? controllers_path = null)
    {
        var title_v = PrefixFormTitle(form.Title.Get(true), vietnamese: true);
        var title_e = PrefixFormTitle(form.Title.Get(false), vietnamese: false);

        var surface = new DesignSurfaceVm
        {
            DisplayKind = ControllerDisplayKind.Form,
            TitleV = title_v,
            TitleE = title_e,
            Title = vietnamese ? title_v : title_e,
            // Giữ giá trị parse — xử lý UI nâng cao ở bản sau
            Anchor = form.Layout?.Anchor ?? 0,
            Split = form.Layout?.Split ?? 0
        };

        var widths = form.Layout?.ColumnWidths?.ToList() ?? [];
        if (widths.Count == 0)
            widths = [120, 30, 20, 50, 50, 280];

        BuildRuler(surface.RulerTicks, surface.ColumnWidthsPx, widths,
            out var table_w_px, out var table_w_dip);
        surface.FormTableWidthPx = table_w_px;
        surface.FormTableWidthDip = table_w_dip;

        // height khai báo → cố định; null → Auto ôm sát phần tử cuối
        if (form.Layout?.HeightPx is int h and > 0)
        {
            surface.FormHeightPx = h;
            surface.FormHeightDip = FboLayoutUnits.PxToDip(h);
            surface.IsHeightFromRows = false;
        }
        else
        {
            surface.FormHeightPx = 0;
            surface.FormHeightDip = double.NaN; // Auto
            surface.IsHeightFromRows = true;
        }

        if (form.Layout is { Rows.Count: > 0 })
        {
            var source_top = form.Layout.HasCategories
                ? form.Layout.TopRows
                : form.Layout.Rows;

            var row_idx = 0;
            foreach (var row in source_top)
            {
                var d_row = MapFormRow(row, form, vietnamese, controllers_path, row_idx++);
                d_row.ColumnWidthsPx = surface.ColumnWidthsPx;
                surface.FormRows.Add(d_row);
            }

            if (form.Layout.HasTabCategories)
            {
                foreach (var category in form.Layout.TabCategories)
                {
                    var tab = new DesignCategoryTabVm
                    {
                        Index = category.Index,
                        HeaderV = category.HeaderV,
                        HeaderE = category.HeaderE
                    };
                    tab.ApplyLanguage(vietnamese);

                    var cat_widths = category.ColumnWidths.Count > 0
                        ? category.ColumnWidths
                        : widths;
                    BuildRuler(tab.RulerTicks, tab.ColumnWidthsPx, cat_widths,
                        out var cat_px, out var cat_dip);
                    tab.FormTableWidthPx = cat_px;
                    tab.FormTableWidthDip = cat_dip;

                    foreach (var row in category.Rows)
                    {
                        var d_row = MapFormRow(row, form, vietnamese, controllers_path, row_idx++);
                        d_row.ColumnWidthsPx = tab.ColumnWidthsPx;
                        tab.Rows.Add(d_row);
                    }

                    surface.CategoryTabs.Add(tab);
                }

                surface.SelectedCategory = surface.CategoryTabs.FirstOrDefault();

                var footer_widths = form.Layout.FooterColumnWidths.ToList();
                var footer_cols = new ObservableCollection<int>();
                BuildRuler(new ObservableCollection<RulerTickVm>(), footer_cols, footer_widths,
                    out _, out _);

                foreach (var row in form.Layout.BottomRows)
                {
                    var d_row = MapFormRow(row, form, vietnamese, controllers_path, row_idx++);
                    d_row.ColumnWidthsPx = footer_cols;
                    surface.BottomRows.Add(d_row);
                }
            }
        }
        else
        {
            foreach (var fbo_field in form.Fields)
            {
                var design_row = MapFallbackRow(fbo_field, widths, vietnamese);
                design_row.HeightDip = FboLayoutUnits.PxToDip(DesignSurfaceVm.RowHeightPx);
                surface.FormRows.Add(design_row);
            }
        }

        return surface;
    }

    private static void BuildRuler(
        ObservableCollection<RulerTickVm> ticks,
        ObservableCollection<int> widths_px,
        List<int> widths,
        out int table_w_px,
        out double table_w_dip)
    {
        ticks.Clear();
        widths_px.Clear();
        double offset = 0;
        var sum_px = 0;
        for (var i = 0; i < widths.Count; i++)
        {
            var px = Math.Max(0, widths[i]);
            // Cột 0 trong FBO = spacer/remaining — ruler vẫn hiện tối thiểu 8px
            var display_px = px > 0 ? px : 8;
            var dip = FboLayoutUnits.PxToDip(display_px);
            widths_px.Add(px);
            ticks.Add(new RulerTickVm
            {
                Index = i,
                WidthPx = display_px,
                WidthDip = dip,
                OffsetDip = offset
            });
            offset += dip;
            sum_px += display_px;
        }

        table_w_px = sum_px;
        table_w_dip = offset;
    }

    private static DesignFormRowVm MapFormRow(
        FormViewRow row,
        FboFormModel form,
        bool vietnamese,
        string? controllers_path,
        int row_index)
    {
        var design_row = new DesignFormRowVm
        {
            Pattern = row.Pattern,
            HeightDip = FboLayoutUnits.PxToDip(DesignSurfaceVm.RowHeightPx),
            Source = row
        };
        foreach (var cell in row.Cells)
        {
            var width_px = Math.Max(1, cell.WidthPx);
            var width_dip = FboLayoutUnits.PxToDip(width_px);

            if (cell.Kind == FormViewCellKind.Empty)
            {
                design_row.Cells.Add(new DesignCellVm
                {
                    Kind = FormViewCellKind.Empty,
                    WidthPx = width_px,
                    WidthDip = width_dip,
                    ColumnIndex = cell.ColumnIndex,
                    ColumnSpan = cell.ColumnSpan,
                    RowIndex = row_index,
                    Pattern = row.Pattern
                });
                continue;
            }

            var fbo_field = cell.FieldName is null ? null : form.FindField(cell.FieldName);
            var format = _options.ResolveFormat(fbo_field?.DataFormatString);
            var text_v = cell.Kind switch
            {
                FormViewCellKind.Label => fbo_field?.GetDisplayLabel(true) ?? cell.FieldName ?? "",
                FormViewCellKind.Description => fbo_field?.GetDisplayFooter(true) ?? "",
                _ => string.Empty
            };
            var text_e = cell.Kind switch
            {
                FormViewCellKind.Label => fbo_field?.GetDisplayLabel(false) ?? cell.FieldName ?? "",
                FormViewCellKind.Description => fbo_field?.GetDisplayFooter(false) ?? "",
                _ => string.Empty
            };

            var editor = ResolveEditorKind(fbo_field);
            var ref_label = cell.Kind == FormViewCellKind.Input && fbo_field?.HasLookupStyle == true
                ? LookupResolver.ResolveReferenceLabel(controllers_path, fbo_field, vietnamese)
                : string.Empty;
            var drop_text = ResolveDropDownText(fbo_field, vietnamese);

            var design_cell = new DesignCellVm
            {
                Kind = cell.Kind,
                FieldName = cell.FieldName ?? string.Empty,
                TextV = text_v,
                TextE = text_e,
                Value = cell.Kind == FormViewCellKind.Input
                    ? ResolveInputValue(fbo_field)
                    : string.Empty,
                ReferenceText = ref_label,
                DropDownText = drop_text,
                EditorKind = editor,
                IsCheckbox = editor == DesignEditorKind.Boolean,
                ShowLookupIcon = editor == DesignEditorKind.Lookup,
                ShowDateIcon = editor == DesignEditorKind.DateTime,
                ShowInputBorder = fbo_field?.Hidden != true,
                DataType = fbo_field?.DataType,
                ItemsStyle = fbo_field?.ItemsStyle,
                ItemsController = fbo_field?.ItemsController,
                ItemsReference = fbo_field?.ItemsReference,
                IsReadOnly = fbo_field?.Inactivate == true || fbo_field?.ReadOnly == true,
                IsRequired = fbo_field is { AllowNulls: false } || fbo_field?.IsPrimaryKey == true,
                IsPrimaryKey = cell.Kind == FormViewCellKind.Label && fbo_field?.IsPrimaryKey == true,
                WidthPx = width_px,
                WidthDip = width_dip,
                ColumnIndex = cell.ColumnIndex,
                ColumnSpan = cell.ColumnSpan,
                RowIndex = row_index,
                Pattern = row.Pattern,
                TextAlign = fbo_field is null ? "Left" : ResolveAlign(fbo_field),
                IsUpperCase = _options.IsUpperCase(fbo_field?.DataFormatString),
                IsLowerCase = _options.IsLowerCase(fbo_field?.DataFormatString),
                FormatHint = string.IsNullOrEmpty(format) ? null : format
            };
            design_cell.ApplyLanguage(vietnamese);
            design_row.Cells.Add(design_cell);
        }

        return design_row;
    }

    private static DesignEditorKind ResolveEditorKind(FboField? fbo_field)
    {
        if (fbo_field is null) return DesignEditorKind.Text;
        if (fbo_field.IsBooleanType) return DesignEditorKind.Boolean;
        if (fbo_field.IsDateTimeType) return DesignEditorKind.DateTime;
        if (fbo_field.IsDropDownList) return DesignEditorKind.DropDown;
        if (fbo_field.HasLookupStyle) return DesignEditorKind.Lookup;
        return DesignEditorKind.Text;
    }

    private static string ResolveInputValue(FboField? fbo_field)
    {
        if (fbo_field is null) return string.Empty;
        if (fbo_field.IsBooleanType)
            return string.Equals(fbo_field.ClientDefault, "1", StringComparison.Ordinal)
                   || string.Equals(fbo_field.ClientDefault, "true", StringComparison.OrdinalIgnoreCase)
                ? "True" : "False";
        return fbo_field.ClientDefault ?? string.Empty;
    }

    private static string ResolveDropDownText(FboField? fbo_field, bool vietnamese)
    {
        if (fbo_field is null || !fbo_field.IsDropDownList) return string.Empty;
        var val = fbo_field.ClientDefault ?? fbo_field.DefaultValue ?? string.Empty;
        var item = fbo_field.DropDownItems.FirstOrDefault(i => i.Value == val);
        if (item is not null)
            return item.GetText(vietnamese);
        return fbo_field.DropDownItems.FirstOrDefault()?.GetText(vietnamese) ?? val;
    }

    private static DesignFormRowVm MapFallbackRow(FboField fbo_field, List<int> widths, bool vietnamese)
    {
        var design_row = new DesignFormRowVm();
        var label_px = widths[0];
        var input_px = widths.Skip(1).Sum();
        var label = new DesignCellVm
        {
            Kind = FormViewCellKind.Label,
            FieldName = fbo_field.Name,
            TextV = fbo_field.GetDisplayLabel(true),
            TextE = fbo_field.GetDisplayLabel(false),
            WidthPx = label_px,
            WidthDip = FboLayoutUnits.PxToDip(label_px),
            IsRequired = !fbo_field.AllowNulls || fbo_field.IsPrimaryKey,
            IsPrimaryKey = fbo_field.IsPrimaryKey
        };
        label.ApplyLanguage(vietnamese);
        design_row.Cells.Add(label);

        var input = new DesignCellVm
        {
            Kind = FormViewCellKind.Input,
            FieldName = fbo_field.Name,
            Value = fbo_field.ClientDefault ?? string.Empty,
            WidthPx = input_px,
            WidthDip = FboLayoutUnits.PxToDip(input_px),
            IsReadOnly = fbo_field.Inactivate || fbo_field.ReadOnly,
            IsRequired = !fbo_field.AllowNulls || fbo_field.IsPrimaryKey,
            TextAlign = ResolveAlign(fbo_field),
            IsUpperCase = _options.IsUpperCase(fbo_field.DataFormatString),
            FormatHint = _options.ResolveFormat(fbo_field.DataFormatString)
        };
        design_row.Cells.Add(input);
        return design_row;
    }

    public static DesignSurfaceVm MapGrid(FboGridModel grid, bool vietnamese = true)
    {
        var title_v = grid.Title.Get(true);
        var title_e = grid.Title.Get(false);
        var sub_v = grid.SubTitle.Get(true);
        var sub_e = grid.SubTitle.Get(false);

        var surface = new DesignSurfaceVm
        {
            DisplayKind = ControllerDisplayKind.Grid,
            TitleV = title_v,
            TitleE = title_e,
            SubTitleV = sub_v,
            SubTitleE = sub_e,
            Title = vietnamese ? title_v : title_e,
            SubTitle = vietnamese ? sub_v : sub_e
        };

        foreach (var btn in grid.Toolbar)
        {
            surface.ToolbarItems.Add(new DesignToolbarItemVm
            {
                Command = btn.Command,
                Title = ResolveToolbarTitle(btn, vietnamese),
                TitleV = ResolveToolbarTitle(btn, true),
                TitleE = ResolveToolbarTitle(btn, false),
                IsSeparator = btn.IsSeparator
            });
        }

        var columns = grid.VisibleColumns.ToList();
        var widths = columns.Select(c => c.Width ?? 140).ToList();
        BuildRuler(surface.RulerTicks, surface.ColumnWidthsPx, widths,
            out var g_px, out var g_dip);
        surface.FormTableWidthPx = g_px;
        surface.FormTableWidthDip = g_dip;

        foreach (var col in columns)
        {
            var px = col.Width ?? 140;
            var col_vm = new DesignColumnVm
            {
                Name = col.Name,
                HeaderV = col.GetDisplayLabel(true),
                HeaderE = col.GetDisplayLabel(false),
                Width = px,
                WidthDip = FboLayoutUnits.PxToDip(px),
                Align = col.Align ?? "left",
                IsPrimaryKey = col.IsPrimaryKey
            };
            col_vm.ApplyLanguage(vietnamese);
            surface.Columns.Add(col_vm);
        }

        var filter_row = new DesignDataRowVm();
        foreach (var _ in columns) filter_row.Values.Add("*");
        surface.SampleRows.Add(filter_row);

        for (var i = 1; i <= 3; i++)
        {
            var data_row = new DesignDataRowVm();
            foreach (var col in columns)
            {
                data_row.Values.Add(col.Name.Contains("ten", StringComparison.OrdinalIgnoreCase)
                    ? (vietnamese ? $"Mẫu {i}" : $"Sample {i}")
                    : $"{i * 10}");
            }
            surface.SampleRows.Add(data_row);
        }

        return surface;
    }

    public static DesignSurfaceVm MapLookup(FboLookupModel lookup, bool vietnamese = true)
    {
        var title_v = lookup.Header.Get(true);
        var title_e = lookup.Header.Get(false);
        var search_v = lookup.FieldsByName.TryGetValue(lookup.SearchField, out var sf)
            ? sf.GetDisplayLabel(true)
            : lookup.SearchField;
        var search_e = lookup.FieldsByName.TryGetValue(lookup.SearchField, out var sf2)
            ? sf2.GetDisplayLabel(false)
            : lookup.SearchField;

        var surface = new DesignSurfaceVm
        {
            DisplayKind = ControllerDisplayKind.Lookup,
            TitleV = title_v,
            TitleE = title_e,
            Title = vietnamese ? title_v : title_e,
            SearchFieldLabelV = search_v,
            SearchFieldLabelE = search_e,
            SearchFieldLabel = vietnamese ? search_v : search_e
        };

        var widths = lookup.Fields.Select(c => c.Width ?? 160).ToList();
        BuildRuler(surface.RulerTicks, surface.ColumnWidthsPx, widths,
            out var l_px, out var l_dip);
        surface.FormTableWidthPx = l_px;
        surface.FormTableWidthDip = l_dip;

        foreach (var col in lookup.Fields)
        {
            var px = col.Width ?? 160;
            var col_vm = new DesignColumnVm
            {
                Name = col.Name,
                HeaderV = col.GetDisplayLabel(true),
                HeaderE = col.GetDisplayLabel(false),
                Width = px,
                WidthDip = FboLayoutUnits.PxToDip(px),
                Align = col.Align ?? "left",
                IsPrimaryKey = col.IsPrimaryKey
            };
            col_vm.ApplyLanguage(vietnamese);
            surface.Columns.Add(col_vm);
        }

        for (var i = 1; i <= 3; i++)
        {
            var data_row = new DesignDataRowVm();
            foreach (var col in lookup.Fields)
            {
                data_row.Values.Add(col.Name.Contains("ten", StringComparison.OrdinalIgnoreCase)
                    ? (vietnamese
                        ? $"Hạn thanh toán trong vòng {i * 10} ngày"
                        : $"Payment due within {i * 10} days")
                    : $"{i * 10}");
            }
            surface.SampleRows.Add(data_row);
        }

        return surface;
    }

    private static string ResolveAlign(FboField fbo_field)
    {
        if (string.Equals(fbo_field.Align, "right", StringComparison.OrdinalIgnoreCase))
            return "Right";
        if (string.Equals(fbo_field.ItemsStyle, "Numeric", StringComparison.OrdinalIgnoreCase))
            return "Right";
        return "Left";
    }

    private static string PrefixFormTitle(string title, bool vietnamese)
    {
        if (string.IsNullOrWhiteSpace(title)) return "Form";
        if (vietnamese)
        {
            if (title.StartsWith("Thêm ", StringComparison.OrdinalIgnoreCase)
                || title.StartsWith("Sửa ", StringComparison.OrdinalIgnoreCase))
                return title;
            return "Thêm " + char.ToLowerInvariant(title[0]) + title[1..];
        }

        if (title.StartsWith("Add ", StringComparison.OrdinalIgnoreCase)
            || title.StartsWith("Edit ", StringComparison.OrdinalIgnoreCase))
            return title;
        return "Add " + title;
    }

    private static string ResolveToolbarTitle(GridToolbarButton btn, bool vietnamese)
    {
        var raw = btn.Title.Get(vietnamese);
        if (raw.StartsWith("Toolbar.", StringComparison.OrdinalIgnoreCase))
        {
            return btn.Command switch
            {
                "New" => vietnamese ? "Mới" : "New",
                "Edit" => vietnamese ? "Sửa" : "Edit",
                "Delete" => vietnamese ? "Xóa" : "Delete",
                "View" => vietnamese ? "Xem" : "View",
                "Export" => "Export",
                "Freeze" => "Freeze",
                _ => btn.Command
            };
        }
        return string.IsNullOrWhiteSpace(raw) ? btn.Command : raw;
    }
}
