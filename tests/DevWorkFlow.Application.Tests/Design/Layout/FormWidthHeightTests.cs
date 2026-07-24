using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Engine;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class FormWidthHeightTests
{
    private static ILayoutEngine Engine() => new LayoutEngine();

    [Fact]
    public void ResizeFormWidth_ScalesProportionally_KeepsNewTotal()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir); // 100,100,100,100 = 400
        var result = Engine().ResizeFormWidth(form, LayoutRegionId.Main, 800);

        Assert.True(result.Ok, result.Error);
        Assert.Equal(800, form.Layout!.ColumnWidths.Sum());
        Assert.Equal(new[] { 200, 200, 200, 200 }, form.Layout.ColumnWidths);
    }

    [Fact]
    public void ResizeFormWidth_RejectsBelowMinimumTotal()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var result = Engine().ResizeFormWidth(form, LayoutRegionId.Main, 2);

        Assert.False(result.Ok);
        Assert.Equal(400, form.Layout!.ColumnWidths.Sum());
    }

    [Fact]
    public void SetRegionHeight_NormalCategory_WritesViewHeight()
    {
        // CategoryAndFooterDir có tab index 1 (Normal, không seed Grid).
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        Assert.True(Engine().SetRegionHeight(form, LayoutRegionId.Category(1), 320, out var rows_field).Ok);

        Assert.Null(rows_field);
        var xml = new FboXmlWriter().ApplyLayout(LayoutTestXml.CategoryAndFooterDir, form);
        Assert.Contains("height=\"320\"", xml);
        Assert.Equal(320, LayoutTestXml.ParseForm(xml).Layout!.HeightPx);
    }

    [Fact]
    public void SetRegionHeight_GridCategory_ReturnsSeedFieldForRows()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        Assert.True(Engine().AddTabCategory(form, "Grid", "Detail", "Detail", "DetailX", out var seed).Ok);

        Assert.True(Engine().SetRegionHeight(form, LayoutRegionId.Category(seed!.CategoryIndex!.Value), 240, out var rows_field).Ok);

        Assert.Equal(seed.Name, rows_field);
        Assert.Equal(240, seed.Rows);
    }

    [Fact]
    public void SetRegionHeight_MainOrFooter_Fails()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        Assert.False(Engine().SetRegionHeight(form, LayoutRegionId.Main, 320, out _).Ok);
        Assert.False(Engine().SetRegionHeight(form, LayoutRegionId.Footer, 100, out _).Ok);
    }
}
