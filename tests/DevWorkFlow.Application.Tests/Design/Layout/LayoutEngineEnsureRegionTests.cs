using DevWorkFlow.Application.Design.Layout;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutEngineEnsureRegionTests
{
    private static ILayoutEngine Engine() => new LayoutEngine();

    [Fact]
    public void EnsureFooter_CreatesMinusOneCategoryFromViewWidths()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);

        var result = Engine().EnsureFooter(form);

        Assert.True(result.Ok, result.Error);
        var footer = form.Layout!.FooterCategory;
        Assert.NotNull(footer);
        Assert.Equal(-1, footer!.Index);
        Assert.Equal(new[] { 100, 100, 100, 100 }, footer.ColumnWidths);
    }

    [Fact]
    public void EnsureFooter_IsIdempotent()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        var engine = Engine();

        Assert.True(engine.EnsureFooter(form).Ok);
        Assert.True(engine.EnsureFooter(form).Ok);

        Assert.Single(form.Layout!.Categories, c => c.Index == -1);
        // Không ghi đè columns footer đã khai báo.
        Assert.Equal(new[] { 80, 120 }, form.Layout.FooterCategory!.ColumnWidths);
    }

    [Fact]
    public void EnsureFooter_UsesExplicitWidthsWhenGiven()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);

        Assert.True(Engine().EnsureFooter(form, [200, 300]).Ok);

        Assert.Equal(new[] { 200, 300 }, form.Layout!.FooterCategory!.ColumnWidths);
    }

    [Fact]
    public void AddCategory_AppendsTabWithHeaderAndWidths()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);

        var result = Engine().AddCategory(form, 2, "Khác", "Other");

        Assert.True(result.Ok, result.Error);
        var cat = form.Layout!.Categories.Single(c => c.Index == 2);
        Assert.Equal("Khác", cat.HeaderV);
        Assert.Equal("Other", cat.HeaderE);
        Assert.Equal(new[] { 100, 100, 100, 100 }, cat.ColumnWidths);
        Assert.True(form.Layout.HasTabCategories);
    }

    [Fact]
    public void AddCategory_RejectsDuplicateIndex()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);

        var result = Engine().AddCategory(form, 1, "X", "X");

        Assert.False(result.Ok);
        Assert.Single(form.Layout!.Categories, c => c.Index == 1);
    }

    [Fact]
    public void AddCategory_RejectsNonPositiveIndex()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = Engine();

        Assert.False(engine.AddCategory(form, 0, "X", "X").Ok);
        Assert.False(engine.AddCategory(form, -1, "X", "X").Ok);
    }

    [Fact]
    public void WriteLayout_CreatesCategoriesElementForNewFooter()
    {
        var xml = LayoutTestXml.SimpleDir;
        var form = LayoutTestXml.ParseForm(xml);
        Assert.True(Engine().EnsureFooter(form, [120, 280]).Ok);

        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);

        Assert.Contains("<categories>", out_xml);
        Assert.Contains("index=\"-1\"", out_xml);
        Assert.Contains("columns=\"120, 280\"", out_xml);

        var reparsed = LayoutTestXml.ParseForm(out_xml);
        Assert.Equal(new[] { 120, 280 }, reparsed.Layout!.FooterCategory!.ColumnWidths);
    }

    [Fact]
    public void WriteLayout_AppendsNewCategoryToExistingCategoriesElement()
    {
        var xml = LayoutTestXml.CategoryAndFooterDir;
        var form = LayoutTestXml.ParseForm(xml);
        Assert.True(Engine().AddCategory(form, 3, "Ghi chú", "Notes", [90, 110]).Ok);

        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);

        var reparsed = LayoutTestXml.ParseForm(out_xml);
        var cat = reparsed.Layout!.Categories.Single(c => c.Index == 3);
        Assert.Equal("Ghi chú", cat.HeaderV);
        Assert.Equal("Notes", cat.HeaderE);
        Assert.Equal(new[] { 90, 110 }, cat.ColumnWidths);
        // Category cũ giữ nguyên.
        Assert.Equal(new[] { 60, 140 }, reparsed.Layout.Categories.Single(c => c.Index == 1).ColumnWidths);
    }

    [Fact]
    public void WriteLayout_PersistsInsertedFieldIntoPattern()
    {
        var xml = LayoutTestXml.OneControlDir;
        var form = LayoutTestXml.ParseForm(xml);

        Assert.True(Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 2), "a",
            DevWorkFlow.Domain.Models.Fbo.FormViewCellKind.Input).Ok);

        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);

        Assert.Contains("1-1-: [a].Label, [a]", out_xml);

        var reparsed = LayoutTestXml.ParseForm(out_xml);
        Assert.Equal("1-1-", reparsed.Layout!.TopRows[0].Pattern);
    }
}
