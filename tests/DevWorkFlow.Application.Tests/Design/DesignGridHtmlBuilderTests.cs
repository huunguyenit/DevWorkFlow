using System.Text.RegularExpressions;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignGridHtmlBuilderTests
{
    private const string CustomerGrid = """
        <grid xmlns="urn:schemas-fast-com:data-grid">
          <title v="Danh mục khách" e="Customer"/>
          <fields>
            <field name="ma_kh" width="100"><header v="Mã khách" e="Code"/></field>
            <field name="ten_kh%l" width="300"><header v="Tên khách hàng" e="Name"/></field>
            <field name="secret" width="50" hidden="true"><header v="Ẩn" e="Hidden"/></field>
          </fields>
          <toolbar>
            <button command="New"><title v="Mới" e="New"/></button>
          </toolbar>
          <views>
            <view id="Grid">
              <field name="ma_kh"/>
              <field name="ten_kh%l"/>
            </view>
          </views>
        </grid>
        """;

    private const string DetailGrid = """
        <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
          <title v="Chi tiết" e="Detail"/>
          <fields>
            <field name="ma_kh" width="100"><header v="Mã khách" e="Code"/></field>
          </fields>
          <toolbar>
            <button command="Insert"><title v="Thêm" e="Insert"/></button>
          </toolbar>
          <views><view id="Grid"><field name="ma_kh"/></view></views>
        </grid>
        """;

    private const string DetailGridWithHidden = """
        <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
          <fields>
            <field name="ma_kh" width="100"><header v="Mã" e="Code"/></field>
            <field name="line_nbr" width="0" hidden="true"><header v="Ẩn" e="Hidden"/></field>
          </fields>
          <toolbar>
            <button command="Insert"><title v="Thêm" e="Insert"/></button>
          </toolbar>
          <views>
            <view id="Grid">
              <field name="ma_kh"/>
              <field name="line_nbr"/>
            </view>
          </views>
        </grid>
        """;

    private static FboGridModel Grid(string xml) =>
        new FboXmlParser().Parse(xml, "Customer.xml").Grid!;

    private static int CountDataRows(string html) =>
        Regex.Matches(html, "class=\"GridDataRow\"").Count;

    [Fact]
    public void Build_RendersListHeadersWidthsAndFivePlaceholderRows()
    {
        var html = new DesignGridHtmlBuilder().Build(Grid(CustomerGrid), vietnamese: true, placeholder_rows: 5);

        Assert.Contains("class=\"GridTable\"", html);
        Assert.Contains("Mã khách", html);
        Assert.Contains("Tên khách hàng", html);
        Assert.Contains("width:100px", html);
        Assert.Equal(5, CountDataRows(html));
        Assert.Contains("data-field-name=\"ma_kh\"", html);
    }

    [Fact]
    public void Build_VisibleFieldNamesDetermineOrderAndHideExcludes()
    {
        var html = new DesignGridHtmlBuilder().Build(Grid(CustomerGrid), vietnamese: true, placeholder_rows: 5);

        Assert.DoesNotContain("Ẩn", html);
        Assert.DoesNotContain("data-field-name=\"secret\"", html);
        Assert.True(html.IndexOf("Mã khách", StringComparison.Ordinal)
                    < html.IndexOf("Tên khách hàng", StringComparison.Ordinal));
    }

    [Fact]
    public void Build_HiddenFieldInView_IsExcluded()
    {
        var html = new DesignGridHtmlBuilder().Build(
            Grid(DetailGridWithHidden), vietnamese: true, placeholder_rows: 3, embedded_in_form: true);

        Assert.Contains("Mã", html);
        Assert.DoesNotContain("line_nbr", html);
        Assert.DoesNotContain("Ẩn", html);
    }

    [Fact]
    public void Build_EmbeddedFormGrid_UsesErpStructureAndToolbarClass()
    {
        var html = new DesignGridHtmlBuilder().Build(
            Grid(DetailGrid), vietnamese: true, placeholder_rows: 3,
            embedded_in_form: true, body_height_px: 120);

        Assert.Contains("class=\"GridTabPanel\"", html);
        Assert.Contains("class=\"ToolbarStyle Green\"", html);
        Assert.Contains(" Insert ", html); // class = command
        Assert.DoesNotContain("data:image", html);
        Assert.Contains("class=\"divGrid GridStyle\"", html);
        Assert.Contains("height:120px", html);
        Assert.Contains("class=\"SplitStyle\"", html);
        Assert.Contains("class=\"GridFooter\"", html);
        Assert.DoesNotContain("DwfGridBody", html);
    }

    [Fact]
    public void Build_DetailMode_AddsDetailClassAndOmitsToolbar()
    {
        var html = new DesignGridHtmlBuilder().Build(Grid(DetailGrid), vietnamese: true, placeholder_rows: 5);

        Assert.Contains("DwfDetailGrid", html);
        Assert.DoesNotContain("DwfGridToolbar", html);
    }

    [Fact]
    public void Build_ListMode_RendersToolbar()
    {
        var html = new DesignGridHtmlBuilder().Build(Grid(CustomerGrid), vietnamese: true, placeholder_rows: 5);

        Assert.Contains("ToolbarStyle Green", html);
        Assert.Contains(" New ", html);
        Assert.DoesNotContain("data:image", html);
    }
}
