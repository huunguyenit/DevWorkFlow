using DevWorkFlow.Domain.Models.Fbo.Schema;

namespace DevWorkFlow.Domain.Models.Fbo;

/// <summary>
/// Field theo fieldType trong Dir.xsd / Grid.xsd / Lookup.xsd.
/// </summary>
public class FboField
{
    // ── XSD fieldType (bắt buộc / phổ biến) ──────────────────────────

    public string Name { get; set; } = string.Empty;
    public string? AliasName { get; set; }

    /// <summary>Thuộc tính type trong XSD (AnsiString, Decimal, ...).</summary>
    public string? DataType { get; set; }

    public FboDataType? DataTypeEnum { get; set; }

    public bool IsPrimaryKey { get; set; }
    public bool OnDemand { get; set; }

    public string? Align { get; set; }
    public int? Width { get; set; }
    public int? MaxLength { get; set; }

    /// <summary>@upperCaseFormat, ####0, "0, 1", X, ...</summary>
    public string? DataFormatString { get; set; }
    public string? HyperlinkFormatString { get; set; }

    public int? Columns { get; set; }
    public int? Rows { get; set; }

    public FboAggregateType Aggregate { get; set; } = FboAggregateType.None;
    public int? CategoryIndex { get; set; }

    public bool ReadOnly { get; set; }
    public bool Inactivate { get; set; }
    public bool Hidden { get; set; }
    public bool Disabled { get; set; }

    public bool AllowContain { get; set; }
    public bool AllowQbe { get; set; }
    public bool AllowSorting { get; set; }
    public bool AllowFilter { get; set; }

    /// <summary>false = bắt buộc nhập (Required).</summary>
    public bool AllowNulls { get; set; } = true;

    public string? DefaultValue { get; set; }
    public string? ClientDefault { get; set; }

    public bool When { get; set; }
    public bool External { get; set; }
    public string? Operation { get; set; }
    public string? FilterSource { get; set; }

    // ── Phần tử con (không phải attribute XSD) ───────────────────────

    public LocalizedText Header { get; set; } = new();
    public LocalizedText? Footer { get; set; }

    /// <summary>Mask, Numeric, AutoComplete, Lookup, DropDownList, ...</summary>
    public string? ItemsStyle { get; set; }

    /// <summary>items/@controller – file Lookup (không extension).</summary>
    public string? ItemsController { get; set; }

    /// <summary>items/@reference – field hiển thị tên (vd. ten_tk%l).</summary>
    public string? ItemsReference { get; set; }

    /// <summary>items/@key – điều kiện lọc dữ liệu khi mở lookup.</summary>
    public string? ItemsKey { get; set; }

    /// <summary>items/@check – điều kiện kiểm tra chéo khi gõ thẳng (không qua nút lookup).</summary>
    public string? ItemsCheck { get; set; }

    /// <summary>
    /// items/@information – vd. "ma_nvbh$dmnvbh.ten_nvbh%l":
    /// lấy cột ten_nvbh%l trong bảng dmnvbh where ma_nvbh = giá trị field.
    /// </summary>
    public string? ItemsInformation { get; set; }

    /// <summary>items/@new – cho phép thêm mới nhanh (vd. "Default").</summary>
    public string? ItemsNew { get; set; }

    public List<FboDropDownItem> DropDownItems { get; set; } = [];

    public bool IsBooleanType =>
        string.Equals(DataType, "Boolean", StringComparison.OrdinalIgnoreCase);

    public bool IsDateTimeType =>
        string.Equals(DataType, "DateTime", StringComparison.OrdinalIgnoreCase)
        || string.Equals(DataType, "Date", StringComparison.OrdinalIgnoreCase);

    public bool HasLookupStyle =>
        string.Equals(ItemsStyle, "Lookup", StringComparison.OrdinalIgnoreCase)
        || string.Equals(ItemsStyle, "AutoComplete", StringComparison.OrdinalIgnoreCase);

    public bool IsDropDownList =>
        string.Equals(ItemsStyle, "DropDownList", StringComparison.OrdinalIgnoreCase);

    /// <summary>Field name trong Lookup (bỏ hậu tố %l).</summary>
    public string? ReferenceFieldName =>
        string.IsNullOrWhiteSpace(ItemsReference)
            ? null
            : ItemsReference.Split('%')[0].Trim();

    public bool IsRequired => !AllowNulls || IsPrimaryKey;

    public string DisplayLabel => StripHtml(Header.Get(true));

    public string DisplayFooter => Footer is null ? string.Empty : StripHtml(Footer.Get(true));

    public string GetDisplayLabel(bool vietnamese) => StripHtml(Header.Get(vietnamese));

    public string GetDisplayFooter(bool vietnamese) =>
        Footer is null ? string.Empty : StripHtml(Footer.Get(vietnamese));

    private static string StripHtml(string text)
    {
        if (string.IsNullOrEmpty(text)) return text;
        var s = System.Net.WebUtility.HtmlDecode(text);
        return System.Text.RegularExpressions.Regex.Replace(s, "<.*?>", string.Empty).Trim();
    }
}
