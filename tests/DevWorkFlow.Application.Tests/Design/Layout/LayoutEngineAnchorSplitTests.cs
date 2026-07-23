using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Engine;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutEngineAnchorSplitTests
{
    [Fact]
    public void SetAnchor_StoresOneBasedColumnCount()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        Assert.True(engine.SetAnchor(form, LayoutRegionId.Main, 2).Ok);

        Assert.Equal(2, form.Layout!.Anchor);
    }

    [Fact]
    public void SetAnchor_ZeroOrNull_ClearsValue()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();
        engine.SetAnchor(form, LayoutRegionId.Main, 2);

        Assert.True(engine.SetAnchor(form, LayoutRegionId.Main, 0).Ok);
        Assert.Null(form.Layout!.Anchor);

        engine.SetAnchor(form, LayoutRegionId.Main, 3);
        Assert.True(engine.SetAnchor(form, LayoutRegionId.Main, null).Ok);
        Assert.Null(form.Layout.Anchor);
    }

    [Fact]
    public void SetAnchor_OutOfRange_Fails()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        Assert.False(engine.SetAnchor(form, LayoutRegionId.Main, 5).Ok);
        Assert.False(engine.SetAnchor(form, LayoutRegionId.Main, -1).Ok);
        Assert.Null(form.Layout!.Anchor);
    }

    [Fact]
    public void SetAnchor_NonMainRegion_FailsInP0()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.CategoryAndFooterDir);
        var engine = new LayoutEngine();

        Assert.False(engine.SetAnchor(form, LayoutRegionId.Category(1), 1).Ok);
        Assert.False(engine.SetSplit(form, LayoutRegionId.Footer, 1).Ok);
    }

    [Fact]
    public void SetSplit_StoresOneBasedColumnCount()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        Assert.True(engine.SetSplit(form, LayoutRegionId.Main, 3).Ok);

        Assert.Equal(3, form.Layout!.Split);
    }

    [Fact]
    public void ApplyLayout_PersistsAnchorAndSplitAttributes()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();
        engine.SetAnchor(form, LayoutRegionId.Main, 2);
        engine.SetSplit(form, LayoutRegionId.Main, 3);

        var xml = new FboXmlWriter().ApplyLayout(LayoutTestXml.SimpleDir, form);

        Assert.Contains("anchor=\"2\"", xml);
        Assert.Contains("split=\"3\"", xml);
    }

    [Fact]
    public void ApplyLayout_RemovesAnchorAttribute_WhenCleared()
    {
        const string xml_with_anchor = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir" anchor="2" split="3">
                  <item value="100, 100, 100, 100"/>
                  <item value="1111: [a].Label, [a], [a].Description, [a]."/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml_with_anchor);
        Assert.Equal(2, form.Layout!.Anchor);

        var engine = new LayoutEngine();
        engine.SetAnchor(form, LayoutRegionId.Main, null);
        engine.SetSplit(form, LayoutRegionId.Main, null);

        var xml = new FboXmlWriter().ApplyLayout(xml_with_anchor, form);

        Assert.DoesNotContain("anchor=", xml);
        Assert.DoesNotContain("split=", xml);
    }
}
