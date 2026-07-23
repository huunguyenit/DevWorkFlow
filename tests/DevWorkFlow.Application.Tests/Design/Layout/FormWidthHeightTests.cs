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
    public void SetRegionHeight_MainWritesViewHeight()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        Assert.True(Engine().SetRegionHeight(form, LayoutRegionId.Main, 320).Ok);

        var xml = new FboXmlWriter().ApplyLayout(LayoutTestXml.SimpleDir, form);
        Assert.Contains("height=\"320\"", xml);

        var reparsed = LayoutTestXml.ParseForm(xml);
        Assert.Equal(320, reparsed.Layout!.HeightPx);
    }

    [Fact]
    public void SetRegionHeight_NonMainFails()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        Assert.False(Engine().SetRegionHeight(form, LayoutRegionId.Footer, 100).Ok);
    }
}
