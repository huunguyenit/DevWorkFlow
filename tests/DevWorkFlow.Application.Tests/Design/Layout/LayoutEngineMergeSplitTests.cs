using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutEngineMergeSplitTests
{
    [Fact]
    public void MergeSlots_ExtendsSpan_WhenBothEmpty()
    {
        // "1---" → Label@0, Empty@1, Empty@2, Empty@3
        var form = LayoutTestXml.ParseForm(LayoutTestXml.OneControlDir);
        var engine = new LayoutEngine();

        var result = engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 1),
            new LayoutSlotId(LayoutRegionId.Main, 0, 2));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        var merged = row.Cells.Single(c => c.ColumnIndex == 1);
        Assert.Equal(2, merged.ColumnSpan);
        Assert.Equal(FormViewCellKind.Empty, merged.Kind);
        Assert.Equal(100, merged.WidthPx);
        Assert.Equal(3, row.Cells.Count);
        // Label span1 → '1'; Empty span2 → '1' + '0'; Empty span1 → '-'
        Assert.Equal("110-", row.Pattern);
    }

    [Fact]
    public void MergeSlots_KeepsControlContent_WhenOneSideEmpty()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.OneControlDir);
        var engine = new LayoutEngine();

        var result = engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        var merged = row.Cells[0];
        Assert.Equal(FormViewCellKind.Label, merged.Kind);
        Assert.Equal("a", merged.FieldName);
        Assert.Equal(".Label", merged.Suffix);
        Assert.Equal(2, merged.ColumnSpan);
        Assert.Equal("10--", row.Pattern);
    }

    [Fact]
    public void MergeSlots_MovesControlToStart_WhenLeftEmpty()
    {
        // "-1--" → Empty@0, Label@1, Empty@2, Empty@3
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="50,50,50,50"/>
                  <item value="-1--: [a].Label"/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);
        var engine = new LayoutEngine();

        var result = engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        var merged = row.Cells.Single(c => c.ColumnIndex == 0);
        Assert.Equal(FormViewCellKind.Label, merged.Kind);
        Assert.Equal("a", merged.FieldName);
        Assert.Equal(2, merged.ColumnSpan);
        Assert.Equal("10--", row.Pattern);
    }

    [Fact]
    public void MergeSlots_RejectsTwoOccupiedSlots()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);
        var engine = new LayoutEngine();

        var result = engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.False(result.Ok);
        Assert.Equal(4, form.Layout!.TopRows[0].Cells.Count);
        Assert.Equal("1111", form.Layout.TopRows[0].Pattern);
    }

    [Fact]
    public void MergeSlots_RejectsNonAdjacentSlots()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.OneControlDir);
        var engine = new LayoutEngine();

        var result = engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 1),
            new LayoutSlotId(LayoutRegionId.Main, 0, 3));

        Assert.False(result.Ok);
        Assert.Equal(4, form.Layout!.TopRows[0].Cells.Count);
    }

    [Fact]
    public void MergeSlots_RejectsDifferentRows()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.OneControlDir);
        var engine = new LayoutEngine();

        var result = engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 1),
            new LayoutSlotId(LayoutRegionId.Main, 1, 2));

        Assert.False(result.Ok);
    }

    [Fact]
    public void SplitSlot_BreaksSpan_ControlStaysAtStart()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SpannedControlDir);
        var engine = new LayoutEngine();

        var result = engine.SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(1, row.Cells[0].ColumnSpan);
        Assert.Equal(FormViewCellKind.Label, row.Cells[0].Kind);
        Assert.Equal(50, row.Cells[0].WidthPx);
        Assert.Equal(3, row.Cells.Count(c => c.Kind == FormViewCellKind.Empty));
        Assert.Equal("1---", row.Pattern);
    }

    [Fact]
    public void SplitSlot_RejectsSpanOne()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.OneControlDir);
        var engine = new LayoutEngine();

        var result = engine.SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0));

        Assert.False(result.Ok);
        Assert.Equal("1---", form.Layout!.TopRows[0].Pattern);
    }

    [Fact]
    public void SplitSlot_UnknownSlot_Fails()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.OneControlDir);
        var engine = new LayoutEngine();

        Assert.False(engine.SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 9)).Ok);
        Assert.False(engine.SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 7, 0)).Ok);
    }
}
