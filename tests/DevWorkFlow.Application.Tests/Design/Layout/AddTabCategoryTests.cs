using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class AddTabCategoryTests
{
    private static ILayoutEngine Engine() => new LayoutEngine();

    [Fact]
    public void AddTabNormal_AddsCategoryWithoutSeedField()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var result = Engine().AddTabCategory(form, "Normal", "Chính", "Main", null, out var seed);

        Assert.True(result.Ok, result.Error);
        Assert.Null(seed);
        var cat = form.Layout!.Categories.Single(c => c.Index == 1);
        Assert.Equal("Chính", cat.HeaderV);
    }

    [Fact]
    public void AddTabGrid_SeedsFieldWithGridStyleAndCategoryIndex()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var result = Engine().AddTabCategory(form, "Grid", "Chi tiết", "Detail", "DetailX", out var seed);

        Assert.True(result.Ok, result.Error);
        Assert.NotNull(seed);
        Assert.Equal("Grid", seed!.ItemsStyle);
        Assert.Equal("DetailX", seed.ItemsController);
        Assert.Equal(1, seed.CategoryIndex);
        var cat = form.Layout!.Categories.Single(c => c.Index == 1);
        Assert.Contains(cat.Rows.SelectMany(r => r.Cells), c => c.FieldName == seed.Name);
    }

    [Fact]
    public void AddTabCategory_IndexIncrementsAcrossAdds()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = Engine();

        Assert.True(engine.AddTabCategory(form, "Normal", "A", "A", null, out _).Ok);
        Assert.True(engine.AddTabCategory(form, "Normal", "B", "B", null, out _).Ok);

        Assert.Contains(form.Layout!.Categories, c => c.Index == 1);
        Assert.Contains(form.Layout.Categories, c => c.Index == 2);
    }

    [Fact]
    public void AddTabGrid_SeedRowReparsesIntoCategory()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        Assert.True(Engine().AddTabCategory(form, "Grid", "Detail", "Detail", "DetailX", out var seed).Ok);

        var writer = new DevWorkFlow.Application.Engine.FboXmlWriter();
        var xml = writer.ApplyLayout(writer.ApplyNewField(LayoutTestXml.SimpleDir, seed!), form);
        var reparsed = LayoutTestXml.ParseForm(xml);

        var cat = reparsed.Layout!.Categories.Single(c => c.Index == 1);
        Assert.Contains(cat.Rows.SelectMany(r => r.Cells), c => c.FieldName == seed!.Name);
    }
}
