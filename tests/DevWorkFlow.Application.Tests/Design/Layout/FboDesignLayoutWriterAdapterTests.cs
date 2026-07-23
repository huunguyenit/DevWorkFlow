using DevWorkFlow.Application.Design.Layout;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class FboDesignLayoutWriterAdapterTests
{
    private static IDesignLayoutCommands Commands() => new DesignLayoutCommands(new LayoutEngine());

    [Fact]
    public void WriteLayout_PersistsResizedWidths()
    {
        var xml = LayoutTestXml.SimpleDir;
        var form = LayoutTestXml.ParseForm(xml);

        Assert.True(Commands().ResizeColumns(form, LayoutRegionId.Main, 0, -20).Ok);
        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);

        Assert.Contains("80, 120, 100, 100", out_xml);
    }

    [Fact]
    public void WriteLayout_PersistsMergedPattern()
    {
        var xml = LayoutTestXml.OneControlDir;
        var form = LayoutTestXml.ParseForm(xml);

        var result = Commands().MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 1),
            new LayoutSlotId(LayoutRegionId.Main, 0, 2));
        Assert.True(result.Ok, result.Error);

        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);

        Assert.Contains("110-: [a].Label", out_xml);
    }

    [Fact]
    public void WriteLayout_PersistsSplitPatternAndCategoryColumns()
    {
        var xml = LayoutTestXml.CategoryAndFooterDir;
        var form = LayoutTestXml.ParseForm(xml);
        var commands = Commands();

        Assert.True(commands.ResizeColumns(form, LayoutRegionId.Category(1), 0, 20).Ok);
        Assert.True(commands.ResizeColumns(form, LayoutRegionId.Footer, 0, -30).Ok);

        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);

        Assert.Contains("columns=\"80, 120\"", out_xml);
        Assert.Contains("columns=\"50, 150\"", out_xml);
    }

    [Fact]
    public void WriteLayout_RoundTripsThroughParserWithSameLayout()
    {
        var xml = LayoutTestXml.SimpleDir;
        var form = LayoutTestXml.ParseForm(xml);

        Assert.True(Commands().ResizeColumns(form, LayoutRegionId.Main, 1, 30).Ok);
        var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);
        var reparsed = LayoutTestXml.ParseForm(out_xml);

        Assert.Equal(new[] { 100, 130, 70, 100 }, reparsed.Layout!.ColumnWidths);
        Assert.Equal("1111", reparsed.Layout.TopRows[0].Pattern);
    }
}
