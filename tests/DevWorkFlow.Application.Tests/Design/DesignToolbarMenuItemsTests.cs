using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignToolbarMenuItemsTests
{
    private const string GridWithExtra = """
        <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
          <fields>
            <field name="ma" width="100"><header v="Mã" e="Code"/></field>
          </fields>
          <toolbar>
            <button command="Extra">
              <title v="Khác..." e="More..."/>
              <menuItems>
                <menuItem commandArgument="05">
                  <header v="Chèn dòng..." e="Insert Line Above..."/>
                </menuItem>
                <menuItem commandArgument="-">
                  <header v="-" e="-"/>
                </menuItem>
                <menuItem commandArgument="10">
                  <header v="Cập nhật cho các bản ghi..." e="Update all empty values..."/>
                </menuItem>
              </menuItems>
            </button>
          </toolbar>
          <views><view id="Grid"><field name="ma"/></view></views>
        </grid>
        """;

    [Fact]
    public void Parser_ReadsMenuItems()
    {
        var grid = new FboXmlParser().Parse(GridWithExtra, "X.xml").Grid!;
        var btn = Assert.Single(grid.Toolbar);
        Assert.Equal("Extra", btn.Command);
        Assert.True(btn.HasMenuItems);
        Assert.Equal(3, btn.MenuItems.Count);
        Assert.Equal("05", btn.MenuItems[0].CommandArgument);
        Assert.True(btn.MenuItems[1].IsSeparator);
        Assert.Equal("Chèn dòng...", btn.MenuItems[0].Header.V);
    }

    [Fact]
    public void Build_GroupWithoutText_UsesGroupExtraWidth30_NoSpan()
    {
        var grid = new FboXmlParser().Parse(GridWithExtra, "X.xml").Grid!;
        var html = new DesignGridHtmlBuilder().Build(
            grid, vietnamese: true, placeholder_rows: 1, embedded_in_form: true);

        Assert.Contains("GroupExtra", html);
        Assert.Contains("width:30px", html);
        Assert.DoesNotContain("<span class=\"ToolbarGroupSpan\">", html);
        Assert.Contains("ToolbarGroupMenu", html);
        Assert.Contains("Chèn dòng...", html);
    }

    [Fact]
    public void Build_GroupWithText_WrapsLabelInToolbarGroupSpan()
    {
        const string xml = """
            <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
              <fields><field name="ma" width="100"><header v="Mã" e="Code"/></field></fields>
              <toolbar>
                <button command="Retrieve">
                  <title v="Lấy dữ liệu$$120" e="Retrieve$$120"/>
                  <menuItems>
                    <menuItem commandArgument="1"><header v="Mục 1" e="Item 1"/></menuItem>
                  </menuItems>
                </button>
              </toolbar>
              <views><view id="Grid"><field name="ma"/></view></views>
            </grid>
            """;
        var grid = new FboXmlParser().Parse(xml, "X.xml").Grid!;
        var html = new DesignGridHtmlBuilder().Build(
            grid, vietnamese: true, placeholder_rows: 1, embedded_in_form: true);

        Assert.Contains("TextGroupRetrieve", html);
        Assert.Contains("ToolbarTextButton", html);
        Assert.Contains("max-width:120px", html);
        Assert.Contains("<span class=\"ToolbarGroupSpan\">Lấy dữ liệu</span>", html);
    }
}
