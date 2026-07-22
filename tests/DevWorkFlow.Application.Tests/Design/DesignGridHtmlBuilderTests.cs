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
            <button command="New"><title v="Mới" e="New"/></button>
          </toolbar>
          <views><view id="Grid"><field name="ma_kh"/></view></views>
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
        Assert.Contains("style=\"width:100px\"", html);
        Assert.Equal(5, CountDataRows(html));
        Assert.Contains("data-field-name=\"ma_kh\"", html);
    }

    [Fact]
    public void Build_VisibleFieldNamesDetermineOrderAndHideExcludes()
    {
        var html = new DesignGridHtmlBuilder().Build(Grid(CustomerGrid), vietnamese: true, placeholder_rows: 5);

        Assert.DoesNotContain("Ẩn", html); // hidden field not visible
        Assert.True(html.IndexOf("Mã khách", StringComparison.Ordinal)
                    < html.IndexOf("Tên khách hàng", StringComparison.Ordinal));
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

        Assert.Contains("DwfGridToolbar", html);
    }
}
