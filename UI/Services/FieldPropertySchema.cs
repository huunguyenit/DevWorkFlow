using DevWorkFlow.Domain.Models.Fbo;
using DevWorkFlow.Domain.Models.Fbo.Schema;
using UI.ViewModels.Design;

namespace UI.Services;

/// <summary>
/// Định nghĩa thuộc tính field theo Dir.xsd — Text / Boolean / Enum.
/// </summary>
public static class FieldPropertySchema
{
    public static readonly string[] DataTypeOptions =
    [
        "AnsiString", "Boolean", "Byte", "Currency", "Date", "DateTime", "DateTime2",
        "Decimal", "Double", "Guid", "Int16", "Int32", "Int64", "Object", "Single",
        "String", "Time", "Xml", "Byte[]"
    ];

    public static readonly string[] ItemsStyleOptions =
    [
        "Numeric", "Mask", "AutoComplete", "Lookup", "Grid",
        "CheckBox", "DropDownList", "ListBox", "RadioButtonList"
    ];

    public static readonly string[] AlignOptions = ["left", "right", "center"];

    public static readonly string[] AggregateOptions =
        ["None", "Sum", "Count", "Average", "Max", "Min"];

    public static IEnumerable<DesignFieldPropertyVm> BuildEditable(FboField? field, DesignCellVm cell)
    {
        if (field is null)
        {
            yield return Text("Layout", "name", cell.FieldName, read_only: true);
            yield return Text("Layout", "columnIndex", cell.ColumnIndex.ToString(), read_only: true);
            yield return Text("Layout", "columnSpan", cell.ColumnSpan.ToString(), read_only: true);
            yield return Text("Layout", "widthPx", cell.WidthPx.ToString(), read_only: true);
            yield break;
        }

        // Click vào Label → chỉ sửa nhãn hiển thị v / e
        if (cell.IsLabel)
        {
            yield return Text("Header", "header.v", field.Header.V);
            yield return Text("Header", "header.e", field.Header.E);
            yield break;
        }

        yield return Text("Identity", "name", field.Name, read_only: true);
        yield return Text("Header", "header.v", field.Header.V);
        yield return Text("Header", "header.e", field.Header.E);
        yield return Enum("Type", "type", field.DataType, DataTypeOptions);
        yield return Bool("Type", "isPrimaryKey", field.IsPrimaryKey);
        yield return Bool("Type", "allowNulls", field.AllowNulls);

        yield return Enum("Items", "items.style", field.ItemsStyle, ItemsStyleOptions);
        yield return Text("Items", "items.controller", field.ItemsController);
        yield return Text("Items", "items.reference", field.ItemsReference);
        yield return Text("Items", "items.key", field.ItemsKey);
        yield return Text("Items", "items.check", field.ItemsCheck);
        yield return Text("Items", "items.information", field.ItemsInformation);
        yield return Text("Items", "items.new", field.ItemsNew);

        yield return Enum("Display", "align", field.Align, AlignOptions);
        yield return Text("Display", "dataFormatString", field.DataFormatString);
        yield return Text("Display", "width", field.Width?.ToString());
        yield return Text("Display", "maxLength", field.MaxLength?.ToString());
        yield return Text("Display", "columns", field.Columns?.ToString());
        yield return Text("Display", "rows", field.Rows?.ToString());
        yield return Enum("Display", "aggregate", field.Aggregate.ToString(), AggregateOptions);
        yield return Text("Display", "categoryIndex", field.CategoryIndex?.ToString());

        yield return Bool("Behavior", "readOnly", field.ReadOnly);
        yield return Bool("Behavior", "inactivate", field.Inactivate);
        yield return Bool("Behavior", "hidden", field.Hidden);
        yield return Bool("Behavior", "disabled", field.Disabled);
        yield return Bool("Behavior", "external", field.External);
        yield return Bool("Behavior", "onDemand", field.OnDemand);
        yield return Bool("Behavior", "allowQBE", field.AllowQbe);
        yield return Bool("Behavior", "allowSorting", field.AllowSorting);
        yield return Bool("Behavior", "allowFilter", field.AllowFilter);
        yield return Bool("Behavior", "allowContain", field.AllowContain);
        yield return Bool("Behavior", "when", field.When);

        yield return Text("Default", "defaultValue", field.DefaultValue);
        yield return Text("Default", "clientDefault", field.ClientDefault);
        yield return Text("Default", "filterSource", field.FilterSource);
        yield return Text("Default", "operation", field.Operation);

        yield return Text("Layout", "columnIndex", cell.ColumnIndex.ToString(), read_only: true);
        yield return Text("Layout", "columnSpan", cell.ColumnSpan.ToString(), read_only: true);
        yield return Text("Layout", "widthPx", cell.WidthPx.ToString(), read_only: true);
        yield return Text("Layout", "pattern", cell.Pattern, read_only: true);
    }

    public static void ApplyToField(FboField field, string name, string value)
    {
        switch (name)
        {
            case "type":
                field.DataType = NullIfEmpty(value);
                break;
            case "isPrimaryKey":
                field.IsPrimaryKey = IsTrue(value);
                break;
            case "allowNulls":
                field.AllowNulls = IsTrue(value);
                break;
            case "items.style":
                field.ItemsStyle = NullIfEmpty(value);
                break;
            case "items.controller":
                field.ItemsController = NullIfEmpty(value);
                break;
            case "items.reference":
                field.ItemsReference = NullIfEmpty(value);
                break;
            case "items.key":
                field.ItemsKey = NullIfEmpty(value);
                break;
            case "items.check":
                field.ItemsCheck = NullIfEmpty(value);
                break;
            case "items.information":
                field.ItemsInformation = NullIfEmpty(value);
                break;
            case "items.new":
                field.ItemsNew = NullIfEmpty(value);
                break;
            case "header.v":
                field.Header.V = value ?? string.Empty;
                break;
            case "header.e":
                field.Header.E = value ?? string.Empty;
                break;
            case "footer.v":
                if (field.Footer is not null) field.Footer.V = value ?? string.Empty;
                break;
            case "footer.e":
                if (field.Footer is not null) field.Footer.E = value ?? string.Empty;
                break;
            case "align":
                field.Align = NullIfEmpty(value);
                break;
            case "dataFormatString":
                field.DataFormatString = NullIfEmpty(value);
                break;
            case "width":
                field.Width = ParseInt(value);
                break;
            case "maxLength":
                field.MaxLength = ParseInt(value);
                break;
            case "columns":
                field.Columns = ParseInt(value);
                break;
            case "rows":
                field.Rows = ParseInt(value);
                break;
            case "aggregate":
                if (System.Enum.TryParse<FboAggregateType>(value, true, out var agg))
                    field.Aggregate = agg;
                break;
            case "categoryIndex":
                field.CategoryIndex = ParseInt(value);
                break;
            case "readOnly":
                field.ReadOnly = IsTrue(value);
                break;
            case "inactivate":
                field.Inactivate = IsTrue(value);
                break;
            case "hidden":
                field.Hidden = IsTrue(value);
                break;
            case "disabled":
                field.Disabled = IsTrue(value);
                break;
            case "external":
                field.External = IsTrue(value);
                break;
            case "onDemand":
                field.OnDemand = IsTrue(value);
                break;
            case "allowQBE":
                field.AllowQbe = IsTrue(value);
                break;
            case "allowSorting":
                field.AllowSorting = IsTrue(value);
                break;
            case "allowFilter":
                field.AllowFilter = IsTrue(value);
                break;
            case "allowContain":
                field.AllowContain = IsTrue(value);
                break;
            case "when":
                field.When = IsTrue(value);
                break;
            case "defaultValue":
                field.DefaultValue = NullIfEmpty(value);
                break;
            case "clientDefault":
                field.ClientDefault = NullIfEmpty(value);
                break;
            case "filterSource":
                field.FilterSource = NullIfEmpty(value);
                break;
            case "operation":
                field.Operation = NullIfEmpty(value);
                break;
        }
    }

    private static DesignFieldPropertyVm Text(string cat, string name, string? value, bool read_only = false) =>
        new()
        {
            Category = cat,
            Name = name,
            DisplayName = name,
            Value = value ?? string.Empty,
            EditorKind = FieldPropertyEditorKind.Text,
            IsReadOnly = read_only
        };

    private static DesignFieldPropertyVm Bool(string cat, string name, bool value) =>
        new()
        {
            Category = cat,
            Name = name,
            DisplayName = name,
            Value = value ? "true" : "false",
            EditorKind = FieldPropertyEditorKind.Boolean
        };

    private static DesignFieldPropertyVm Enum(string cat, string name, string? value, IReadOnlyList<string> options) =>
        new()
        {
            Category = cat,
            Name = name,
            DisplayName = name,
            Value = value ?? string.Empty,
            EditorKind = FieldPropertyEditorKind.Enum,
            EnumOptions = options
        };

    private static bool IsTrue(string? v) =>
        string.Equals(v, "true", StringComparison.OrdinalIgnoreCase) || v == "1";

    private static string? NullIfEmpty(string? v) =>
        string.IsNullOrWhiteSpace(v) ? null : v.Trim();

    private static int? ParseInt(string? v) =>
        int.TryParse(v, out var n) ? n : null;
}
