using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignControlHtmlBuilderTests
{
    [Theory]
    [InlineData("X", "text-transform:uppercase")]
    [InlineData("x", "text-transform:lowercase")]
    public void Mask_UsesCaseFormat(string format, string expected_style)
    {
        var html = Build(Field("code", items_style: "Mask", data_format: format));
        Assert.Contains(expected_style, html);
    }

    [Fact]
    public void Mask_LiteralValues_EmitsAllowedValuesMetadata()
    {
        var html = Build(Field("status", items_style: "Mask", data_format: "1, 0, *"));
        Assert.Contains("data-allowed-values=\"1,0,*\"", html);
    }

    [Fact]
    public void Numeric_ResolvesOptionsAndAlignsRight()
    {
        var html = Build(Field("so_luong", items_style: "Numeric", data_format: "@quantityInputFormat"));
        Assert.Contains("data-format=\"# ### ### ##0.00\"", html);
        Assert.Contains("text-align:right", html);
    }

    [Fact]
    public void DropDownList_EmitsSelectOptions()
    {
        var field = Field("loai", items_style: "DropDownList");
        field.DropDownItems.Add(new FboDropDownItem { Value = "1", Text = new LocalizedText { V = "Một" } });
        field.DropDownItems.Add(new FboDropDownItem { Value = "2", Text = new LocalizedText { V = "Hai" } });

        var html = Build(field);

        Assert.Contains("<select", html);
        Assert.Contains("value=\"1\"", html);
        Assert.Contains("Một", html);
        Assert.Contains("value=\"2\"", html);
    }

    [Fact]
    public void Boolean_EmitsCheckbox()
    {
        var html = Build(Field("active", data_type: "Boolean"));
        Assert.Contains("type=\"checkbox\"", html);
    }

    [Theory]
    [InlineData("AutoComplete")]
    [InlineData("Lookup")]
    public void LookupStyles_EmitLookupButton(string style)
    {
        var html = Build(Field("ma_kh", items_style: style));
        Assert.Contains("type=\"text\"", html);
        Assert.Contains("FormTextInputLookup", html);
        Assert.Contains("width:calc(100% - 23px)", html);
        Assert.Contains("class=\"CellDivContainer\"", html);
        Assert.Contains("<img class=\"CellImage CellImgLookup\"", html);
        Assert.DoesNotContain("<span class=\"FormContainerInput\">", html);
    }

    [Fact]
    public void Lookup_WithWidth_ReducesBy23Px()
    {
        var field = Field("tk", items_style: "Lookup");
        field.Width = 100;
        var html = Build(field);
        Assert.Contains("width:77px", html);
        Assert.Contains("FormTextInputLookup", html);
    }

    [Fact]
    public void DateTime_EmitsCalendarAndEmptyDateValue()
    {
        var html = Build(Field("ngay_gh", data_type: "DateTime"));
        Assert.Contains("FormTextInputCalendar", html);
        Assert.Contains("CellImgCalendar", html);
        Assert.Contains("value=\"  /  /    \"", html);
        Assert.Contains("width:calc(100% - 23px)", html);
    }

    [Fact]
    public void DateTimeFormat_EmitsCalendar()
    {
        var html = Build(Field("ngay", data_format: "@datetimeFormat"));
        Assert.Contains("CellImgCalendar", html);
        Assert.Contains("FormTextInputCalendar", html);
    }

    [Fact]
    public void DefaultValue_SetsInputValue()
    {
        var field = Field("status", items_style: "Mask", data_format: "0,1");
        field.DefaultValue = "1";
        var html = Build(field);
        Assert.Contains("value=\"1\"", html);
    }

    [Fact]
    public void ClientDefault_TakesPriorityOverDefaultValue()
    {
        var field = Field("ma");
        field.DefaultValue = "fromDefault";
        field.ClientDefault = "fromClient";
        var html = Build(field);
        Assert.Contains("value=\"fromClient\"", html);
        Assert.DoesNotContain("value=\"fromDefault\"", html);
    }

    [Fact]
    public void ClientDefault_Default_String_EmitsEmptyValue()
    {
        var field = Field("ma");
        field.ClientDefault = "Default";
        field.DefaultValue = "ignored";
        var html = Build(field);
        Assert.Contains("value=\"\"", html);
    }

    [Fact]
    public void ClientDefault_Default_Numeric_EmitsZero()
    {
        var field = Field("tien", items_style: "Numeric");
        field.ClientDefault = "Default";
        var html = Build(field);
        Assert.Contains("value=\"0\"", html);
    }

    [Fact]
    public void ClientDefault_Default_DateTime_EmitsEmptyDateMask()
    {
        var field = Field("ngay", data_type: "DateTime");
        field.ClientDefault = "Default";
        var html = Build(field);
        Assert.Contains("value=\"  /  /    \"", html);
    }

    [Fact]
    public void DefaultValue_OverridesEmptyDatePlaceholder()
    {
        var field = Field("ngay", data_type: "DateTime");
        field.DefaultValue = "01/01/2026";
        var html = Build(field);
        Assert.Contains("value=\"01/01/2026\"", html);
        Assert.DoesNotContain("value=\"  /  /    \"", html);
    }

    [Theory]
    [InlineData("left")]
    [InlineData("right")]
    [InlineData("center")]
    public void Align_AppliesTextAlign(string align)
    {
        var field = Field("ten");
        field.Align = align;
        var html = Build(field);
        Assert.Contains($"text-align:{align}", html);
    }

    [Fact]
    public void ReadOnlyReference_StripsPercentSuffixFromDomId()
    {
        var html = Build(Field("ten_tk%l", read_only: true));
        Assert.Contains("id=\"dwf-field-ten_tk\"", html);
        Assert.Contains("readonly", html);
    }

    [Fact]
    public void Control_EmitsSymbolAndNodeIdentity()
    {
        var html = Build(Field("ma_kh"), new DesignElementIdentity("field:ma_kh", "node-123"));
        Assert.Contains("data-symbol-id=\"field:ma_kh\"", html);
        Assert.Contains("data-node-id=\"node-123\"", html);
    }

    private static FboField Field(
        string name,
        string? items_style = null,
        string? data_format = null,
        bool read_only = false,
        string? data_type = null) =>
        new()
        {
            Name = name,
            ItemsStyle = items_style,
            DataFormatString = data_format,
            ReadOnly = read_only,
            DataType = data_type,
            Header = new LocalizedText { V = name }
        };

    private static string Build(FboField field, DesignElementIdentity? identity = null) =>
        new DesignControlHtmlBuilder().Build(field, vietnamese: true, new FboOptionsCatalog(), identity);
}
