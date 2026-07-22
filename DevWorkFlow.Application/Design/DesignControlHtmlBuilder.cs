using System.Text;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Map một <see cref="FboField"/> → HTML control tĩnh (render-only, KHÔNG gắn handler FBO $df). DOM id bỏ
/// hậu tố "%..." của tên field; mỗi control mang data-symbol-id/data-node-id để overlay sau này định danh.
/// </summary>
internal sealed class DesignControlHtmlBuilder
{
    /// <summary>1×1 transparent GIF — glyph Lookup/Calendar lấy từ CSS background sprite.</summary>
    private const string TransparentGifSrc =
        "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7";

    /// <summary>Placeholder ngày trống runtime FBO (dd/MM/yyyy mask).</summary>
    private const string EmptyDateValue = "  /  /    ";

    /// <summary>Chừa chỗ cho &lt;a&gt;+img Lookup/Calendar (runtime ~23px).</summary>
    private const int AdornmentWidthPx = 23;

    public string Build(
        FboField field,
        bool vietnamese,
        FboOptionsCatalog options,
        DesignElementIdentity? identity)
    {
        var field_name = field.Name.Split('%')[0];
        var dom_id = $"dwf-field-{DesignHtmlEncoder.SafeId(field_name)}";
        var common = BuildIdentityAttrs(field, identity)
            + $" data-field-name=\"{DesignHtmlEncoder.Attribute(field_name)}\"";
        var disabled = field.ReadOnly || field.Disabled || field.Inactivate || field.External;
        var readonly_attr = disabled ? " readonly" : string.Empty;

        // Boolean / CheckBox → checkbox
        if (field.IsBooleanType || HasStyle(field, "CheckBox"))
            return $"<input type=\"checkbox\" id=\"{dom_id}\" class=\"FormCheckInput\"{common}"
                   + $"{(disabled ? " disabled" : string.Empty)}{ValueAttr(field, is_checkbox: true)}>";

        // DropDownList / ListBox → select
        if (field.IsDropDownList || HasStyle(field, "ListBox"))
        {
            var multiple = HasStyle(field, "ListBox") ? " multiple" : string.Empty;
            var sb = new StringBuilder();
            sb.Append($"<select id=\"{dom_id}\" class=\"FormInput\"{multiple}{common}")
              .Append(disabled ? " disabled" : string.Empty).Append('>');
            foreach (var item in field.DropDownItems)
            {
                var selected_value = ResolveSelectionValue(field);
                var selected = selected_value is not null
                               && string.Equals(item.Value, selected_value, StringComparison.Ordinal)
                    ? " selected"
                    : string.Empty;
                sb.Append($"<option value=\"{DesignHtmlEncoder.Attribute(item.Value)}\"{selected}>")
                  .Append(DesignHtmlEncoder.Text(item.Text.Get(vietnamese))).Append("</option>");
            }
            sb.Append("</select>");
            return sb.ToString();
        }

        // RadioButtonList → radio group theo field
        if (HasStyle(field, "RadioButtonList"))
        {
            var sb = new StringBuilder();
            sb.Append($"<span class=\"FormContainer\" id=\"{dom_id}\"{common}>");
            foreach (var item in field.DropDownItems)
            {
                var selected_value = ResolveSelectionValue(field);
                var is_checked = selected_value is not null
                                 && string.Equals(item.Value, selected_value, StringComparison.Ordinal);
                sb.Append("<label><input type=\"radio\" name=\"")
                  .Append(DesignHtmlEncoder.Attribute(field_name)).Append("\" value=\"")
                  .Append(DesignHtmlEncoder.Attribute(item.Value)).Append('"')
                  .Append(disabled ? " disabled" : string.Empty)
                  .Append(is_checked ? " checked" : string.Empty).Append("> ")
                  .Append(DesignHtmlEncoder.Text(item.Text.Get(vietnamese))).Append("</label>");
            }
            sb.Append("</span>");
            return sb.ToString();
        }

        // Textarea (Rows > 1)
        if (field.Rows is > 1)
        {
            var ta_value = ResolveDisplayValue(field, is_calendar: false, is_numeric: false) ?? string.Empty;
            return $"<textarea id=\"{dom_id}\" class=\"FormInput{(disabled ? " FormInputDisabled" : string.Empty)}\""
                   + $" rows=\"{field.Rows}\"{common}{readonly_attr}>{DesignHtmlEncoder.Text(ta_value)}</textarea>";
        }

        var is_lookup = field.HasLookupStyle;
        var is_calendar = IsCalendarField(field, options);
        var style = new StringBuilder();
        var extra = new StringBuilder();
        var format = options.ResolveFormat(field.DataFormatString);

        if (HasStyle(field, "Numeric"))
        {
            style.Append("text-align:right;");
            if (!string.IsNullOrEmpty(format))
                extra.Append($" data-format=\"{DesignHtmlEncoder.Attribute(format)}\"");
        }
        else if (HasStyle(field, "Mask"))
        {
            if (options.IsUpperCase(field.DataFormatString))
                style.Append("text-transform:uppercase;");
            else if (options.IsLowerCase(field.DataFormatString))
                style.Append("text-transform:lowercase;");
            else if (field.DataFormatString?.Contains(',') == true)
                extra.Append($" data-allowed-values=\"{DesignHtmlEncoder.Attribute(NormalizeAllowedValues(field.DataFormatString))}\"");
        }

        AppendAlign(style, field.Align, numeric_forced: HasStyle(field, "Numeric"));

        // Lookup/Calendar: chừa 23px cho icon (width tường minh nếu có field@width, không thì calc).
        if (is_lookup || is_calendar)
        {
            if (field.Width is > AdornmentWidthPx)
                style.Append($"width:{field.Width.Value - AdornmentWidthPx}px;");
            else if (field.Width is null or <= 0)
                style.Append($"width:calc(100% - {AdornmentWidthPx}px);");
            else
                style.Append($"width:{Math.Max(field.Width.Value, 1)}px;");
        }
        else if (field.Width is > 0)
        {
            style.Append($"width:{field.Width.Value}px;");
        }

        var input_class = new StringBuilder("FormInput FormTextInput");
        if (disabled) input_class.Append(" FormInputDisabled");
        if (is_lookup) input_class.Append(" FormTextInputLookup");
        if (is_calendar) input_class.Append(" FormTextInputCalendar");

        var value_attr = BuildTextValueAttr(field, is_calendar);
        var style_attr = style.Length > 0 ? $" style=\"{style}\"" : string.Empty;
        var input = $"<input type=\"text\" id=\"{dom_id}\" class=\"{input_class}\""
                    + $"{style_attr}{extra}{common}{readonly_attr}{value_attr}>";

        if (is_lookup)
            return input + AdornmentAnchor("CellImgLookup");
        if (is_calendar)
            return input + AdornmentAnchor("CellImgCalendar");

        return input;
    }

    private static bool IsCalendarField(FboField field, FboOptionsCatalog options) =>
        field.IsDateTimeType
        || options.IsDateTime(field.DataFormatString)
        || HasStyle(field, "Calendar");

    private static void AppendAlign(StringBuilder style, string? align, bool numeric_forced)
    {
        if (numeric_forced) return; // Numeric đã set right
        if (string.IsNullOrWhiteSpace(align)) return;
        var a = align.Trim().ToLowerInvariant();
        if (a is "left" or "right" or "center")
            style.Append($"text-align:{a};");
    }

    private static string BuildTextValueAttr(FboField field, bool is_calendar)
    {
        var is_numeric = HasStyle(field, "Numeric") || IsNumericDataType(field);
        var value = ResolveDisplayValue(field, is_calendar, is_numeric);
        if (value is null) return string.Empty;
        return $" value=\"{DesignHtmlEncoder.Attribute(value)}\"";
    }

    /// <summary>
    /// Ưu tiên <c>clientDefault</c> rồi <c>defaultValue</c>.
    /// <c>clientDefault|defaultValue = Default</c> → string "", số "0", datetime empty mask.
    /// Không có nguồn: datetime vẫn hiện empty mask; field thường không gắn value.
    /// </summary>
    private static string? ResolveDisplayValue(FboField field, bool is_calendar, bool is_numeric)
    {
        var source = !string.IsNullOrEmpty(field.ClientDefault)
            ? field.ClientDefault
            : field.DefaultValue;

        if (string.IsNullOrEmpty(source))
            return is_calendar ? EmptyDateValue : null;

        if (string.Equals(source, "Default", StringComparison.OrdinalIgnoreCase))
        {
            if (is_calendar) return EmptyDateValue;
            if (is_numeric) return "0";
            return string.Empty;
        }

        return source;
    }

    private static bool IsNumericDataType(FboField field)
    {
        var t = field.DataType;
        if (string.IsNullOrEmpty(t)) return false;
        return t.Equals("Decimal", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Double", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Single", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Int16", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Int32", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Int64", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Byte", StringComparison.OrdinalIgnoreCase)
               || t.Equals("Currency", StringComparison.OrdinalIgnoreCase);
    }

    private static string ValueAttr(FboField field, bool is_checkbox)
    {
        if (!is_checkbox) return string.Empty;
        var source = !string.IsNullOrEmpty(field.ClientDefault)
            ? field.ClientDefault
            : field.DefaultValue;
        if (string.IsNullOrEmpty(source)) return string.Empty;
        if (string.Equals(source, "Default", StringComparison.OrdinalIgnoreCase))
            return string.Empty; // unchecked
        var v = source.Trim();
        var on = v is "1" or "true" or "True" or "yes" or "Yes";
        return on ? " checked" : string.Empty;
    }

    /// <summary>Giá trị chọn option/radio: ưu tiên clientDefault → defaultValue; bỏ qua token Default.</summary>
    private static string? ResolveSelectionValue(FboField field)
    {
        var source = !string.IsNullOrEmpty(field.ClientDefault)
            ? field.ClientDefault
            : field.DefaultValue;
        if (string.IsNullOrEmpty(source)) return null;
        if (string.Equals(source, "Default", StringComparison.OrdinalIgnoreCase)) return null;
        return source;
    }

    private static string AdornmentAnchor(string img_class) =>
        "<a class=\"CellDivContainer\" tabindex=\"-1\">"
        + $"<img class=\"CellImage {img_class}\" tabindex=\"-1\" alt=\"\""
        + $" src=\"{TransparentGifSrc}\""
        + " style=\"border:0;padding:0\">"
        + "</a>";

    private static bool HasStyle(FboField field, string style) =>
        string.Equals(field.ItemsStyle, style, StringComparison.OrdinalIgnoreCase);

    private static string BuildIdentityAttrs(FboField field, DesignElementIdentity? identity) =>
        identity is null
            ? $" data-symbol-id=\"field:{DesignHtmlEncoder.Attribute(field.Name)}\""
            : $" data-symbol-id=\"{DesignHtmlEncoder.Attribute(identity.SymbolId)}\""
              + (identity.NodeId is null
                  ? string.Empty
                  : $" data-node-id=\"{DesignHtmlEncoder.Attribute(identity.NodeId)}\"");

    private static string NormalizeAllowedValues(string raw) =>
        string.Join(",", raw.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries));
}
