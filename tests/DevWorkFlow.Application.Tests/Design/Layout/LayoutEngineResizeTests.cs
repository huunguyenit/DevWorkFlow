using DevWorkFlow.Application.Design.Layout;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutEngineResizeTests
{
    [Fact]
    public void ResizeColumns_MovesPxBetweenNeighbors_KeepsTotal()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        var result = engine.ResizeColumns(form, LayoutRegionId.Main, splitter_index: 0, delta_px: -25);

        Assert.True(result.Ok);
        Assert.Equal(new[] { 75, 125, 100, 100 }, form.Layout!.ColumnWidths);
        Assert.Equal(400, form.Layout.TotalWidthPx);
    }

    [Fact]
    public void ResizeColumns_RecalculatesCellWidthPx()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SpannedControlDir);
        var engine = new LayoutEngine();

        var result = engine.ResizeColumns(form, LayoutRegionId.Main, splitter_index: 0, delta_px: 10);

        Assert.True(result.Ok);
        // Ô span 4 phủ toàn bộ cột → tổng width không đổi.
        Assert.Equal(200, form.Layout!.TopRows[0].Cells[0].WidthPx);
        Assert.Equal(new[] { 60, 40, 50, 50 }, form.Layout.ColumnWidths);
    }

    [Fact]
    public void ResizeColumns_RejectsWhenBelowMin()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        var result = engine.ResizeColumns(form, LayoutRegionId.Main, splitter_index: 0, delta_px: -100);

        Assert.False(result.Ok);
        Assert.Equal(new[] { 100, 100, 100, 100 }, form.Layout!.ColumnWidths);
    }

    [Fact]
    public void ResizeColumns_RejectsInvalidSplitterIndex()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        Assert.False(engine.ResizeColumns(form, LayoutRegionId.Main, -1, 5).Ok);
        Assert.False(engine.ResizeColumns(form, LayoutRegionId.Main, 3, 5).Ok);
        Assert.Equal(new[] { 100, 100, 100, 100 }, form.Layout!.ColumnWidths);
    }

    [Fact]
    public void ResizeColumns_CategoryRegion_UsesCategoryWidths()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        var engine = new LayoutEngine();

        var result = engine.ResizeColumns(form, LayoutRegionId.Category(1), splitter_index: 0, delta_px: 20);

        Assert.True(result.Ok);
        var category = form.Layout!.Categories.Single(c => c.Index == 1);
        Assert.Equal(new[] { 80, 120 }, category.ColumnWidths);
        // Cột view không đổi.
        Assert.Equal(new[] { 100, 100 }, form.Layout.ColumnWidths);
    }

    [Fact]
    public void ResizeColumns_FooterRegion_UsesFooterCategoryWidths()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        var engine = new LayoutEngine();

        var result = engine.ResizeColumns(form, LayoutRegionId.Footer, splitter_index: 0, delta_px: -30);

        Assert.True(result.Ok);
        Assert.Equal(new[] { 50, 150 }, form.Layout!.FooterCategory!.ColumnWidths);
        Assert.Equal(new[] { 100, 100 }, form.Layout.ColumnWidths);
    }

    [Fact]
    public void ResizeColumns_FooterWithoutFooterCategory_Fails()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        var result = engine.ResizeColumns(form, LayoutRegionId.Footer, 0, 10);

        Assert.False(result.Ok);
        Assert.NotNull(result.Error);
    }
}
