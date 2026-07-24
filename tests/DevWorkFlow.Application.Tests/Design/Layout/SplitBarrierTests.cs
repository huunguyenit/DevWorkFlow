using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

/// <summary>P6 4b.3/4b.4: view@split = biên cứng merge/Place; merge không nhảy field.</summary>
public sealed class SplitBarrierTests
{
    private static ILayoutEngine Engine() => new LayoutEngine();

    // split="2" (1-based) → cột trái {0,1}, phải {2,3}; biên 0-based = cột 2.
    private static string SplitDir(string row) =>
        $"""
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="x"><header v="X" e="X"/></field></fields>
          <views>
            <view id="Dir" split="2">
              <item value="50,50,50,50"/>
              <item value="{row}"/>
            </view>
          </views>
        </dir>
        """;

    [Fact]
    public void Merge_AcrossSplit_Fails()
    {
        var form = LayoutTestXml.ParseForm(SplitDir("----"));
        Assert.Equal(2, form.Layout!.Split);

        var result = Engine().MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 1),  // left of split
            new LayoutSlotId(LayoutRegionId.Main, 0, 2)); // right of split

        Assert.False(result.Ok);
        Assert.Equal("Cannot merge across view@split.", result.Error);
    }

    [Fact]
    public void Merge_WithinLeftSide_Ok()
    {
        var form = LayoutTestXml.ParseForm(SplitDir("----"));

        var result = Engine().MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.True(result.Ok, result.Error);
        Assert.Equal(2, form.Layout!.TopRows[0].Cells.Single(c => c.ColumnIndex == 0).ColumnSpan);
    }

    [Fact]
    public void Merge_EmptyPlusControl_KeepsField()
    {
        // "-1--": Empty@0, Input(x)@1, Empty@2, Empty@3 — merge @0+@1 (cùng trái), control dời về @0.
        var form = LayoutTestXml.ParseForm(SplitDir("-1--: [x]"));

        var result = Engine().MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.True(result.Ok, result.Error);
        var merged = form.Layout!.TopRows[0].Cells.Single(c => c.ColumnIndex == 0);
        Assert.Equal("x", merged.FieldName);
        Assert.Equal(FormViewCellKind.Input, merged.Kind);
        Assert.Equal(2, merged.ColumnSpan);
    }

    [Fact]
    public void PlaceFieldParts_StopsAtSplitBoundary()
    {
        // "----" all empty; Place x I→L→D bắt đầu ở cột 1 (trái) → chỉ đặt được tới cột < 2 → 1 ô (Input@1).
        var form = LayoutTestXml.ParseForm(SplitDir("----"));

        var result = Engine().PlaceFieldParts(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "x",
            [FormViewCellKind.Input, FormViewCellKind.Label, FormViewCellKind.Description]);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Input, row.Cells.Single(c => c.ColumnIndex == 1).Kind);
        Assert.Equal(FormViewCellKind.Empty, row.Cells.Single(c => c.ColumnIndex == 2).Kind); // qua biên → không đặt
        Assert.Equal(1, row.Cells.Count(c => c.FieldName == "x"));
    }

    [Fact]
    public void ShrinkSlot_Span3_KeepsRequestedColumns_ReleasesRest()
    {
        // "1000: [x]" span 4; shrink giữ 2 cột → control span2 + 2 empty. Không collapse hẳn về 1.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="x"><header v="X" e="X"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="40,40,40,40"/>
                  <item value="1000: [x]"/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);

        Assert.True(Engine().ShrinkSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0), 2).Ok);

        var row = form.Layout!.TopRows[0];
        var ctrl = row.Cells.Single(c => c.FieldName == "x");
        Assert.Equal(0, ctrl.ColumnIndex);
        Assert.Equal(2, ctrl.ColumnSpan);
        Assert.Equal(2, row.Cells.Count(c => c.Kind == FormViewCellKind.Empty));
        Assert.Equal("10--", row.Pattern); // control span2 = "10"; hai empty span1 = "--"
    }

    [Fact]
    public void ShrinkSlot_KeepClampedToSpanMinusOne()
    {
        var form = LayoutTestXml.ParseForm(SplitDir("1000: [x]")); // span4
        // keep >= span → clamp về span-1 (giải phóng ít nhất 1 cột).
        Assert.True(Engine().ShrinkSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0), 9).Ok);
        Assert.Equal(3, form.Layout!.TopRows[0].Cells.Single(c => c.FieldName == "x").ColumnSpan);
    }

    [Fact]
    public void SplitSlot_EqualsShrinkKeepOne()
    {
        var form = LayoutTestXml.ParseForm(SplitDir("1000: [x]"));
        Assert.True(Engine().SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0)).Ok);
        Assert.Equal(1, form.Layout!.TopRows[0].Cells.Single(c => c.FieldName == "x").ColumnSpan);
    }

    [Fact]
    public void MergeRun_MultipleColumns_MergesContiguously()
    {
        // "1---: [x]" (không split) → control x@0 span1, 3 empty. Merge x với 2 sibling phải liên tiếp.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="x"><header v="X" e="X"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="40,40,40,40"/>
                  <item value="1---: [x]"/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);
        var engine = Engine();
        var slot = new LayoutSlotId(LayoutRegionId.Main, 0, 0);

        // Mô phỏng ApplyBlueprintMergeRun: merge với sibling phải 2 lần.
        for (var i = 0; i < 2; i++)
        {
            var row = form.Layout!.TopRows[0];
            var cell = row.Cells.Single(c => c.ColumnIndex == 0);
            var next = cell.ColumnIndex + System.Math.Max(cell.ColumnSpan, 1);
            Assert.True(engine.MergeSlots(form, slot, new LayoutSlotId(LayoutRegionId.Main, 0, next)).Ok);
        }

        var merged = form.Layout!.TopRows[0].Cells.Single(c => c.ColumnIndex == 0);
        Assert.Equal(3, merged.ColumnSpan);
        Assert.Equal("x", merged.FieldName);
    }

    [Fact]
    public void MergeRun_StopsAtSplitBoundary()
    {
        // split=2: x@0; merge run về phải dừng khi tới biên (chỉ gộp trong {0,1}).
        var form = LayoutTestXml.ParseForm(SplitDir("1---: [x]"));
        var engine = Engine();
        var slot = new LayoutSlotId(LayoutRegionId.Main, 0, 0);

        // Lần 1: merge @0 với @1 (cùng trái) → OK.
        Assert.True(engine.MergeSlots(form, slot, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);
        // Lần 2: @0 span2 (0..1), sibling phải @2 (bên phải split) → cross-split → Fail (dừng run).
        var second = engine.MergeSlots(form, slot, new LayoutSlotId(LayoutRegionId.Main, 0, 2));
        Assert.False(second.Ok);
        Assert.Equal("Cannot merge across view@split.", second.Error);
    }

    // ── CanCommitLayout: view thuần đi ApplyLayout Dir; view entity đi write-back ──

    [Fact]
    public void CanCommitLayout_PlainView_NoWritebackNeeded()
    {
        var adapter = new FboDesignLayoutWriterAdapter();
        Assert.False(adapter.RequiresEntityWriteback(LayoutTestXml.SimpleDir));
    }

    [Fact]
    public void CanCommitLayout_EntityInViewText_RequiresWriteback()
    {
        // Mô phỏng Customer.xml: &UnitViews; giữa các <item> → commit phải đi entity write-back.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="100, 100"/>
                  <item value="11: [a].Label, [a]"/>&UnitViews;
                </view>
              </views>
            </dir>
            """;
        var adapter = new FboDesignLayoutWriterAdapter();

        Assert.True(adapter.RequiresEntityWriteback(xml));
    }

    [Fact]
    public void CanCommitLayout_EntityInViewAttribute_RequiresWriteback()
    {
        // anchor="&BI.j;" — attribute entity trong view.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir" anchor="&BI.j;">
                  <item value="100, 100"/>
                  <item value="11: [a].Label, [a]"/>
                </view>
              </views>
            </dir>
            """;
        var adapter = new FboDesignLayoutWriterAdapter();

        Assert.True(adapter.RequiresEntityWriteback(xml));
    }

    [Fact]
    public void CanCommitLayout_EntityRefInComment_NoWritebackNeeded()
    {
        // <!-- &BI.Form.View.Customer; --> = include tắt — không tính là entity view.
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <!-- &BI.Form.View.Customer; -->
                <view id="Dir">
                  <item value="100, 100"/>
                  <item value="11: [a].Label, [a]"/>
                </view>
              </views>
            </dir>
            """;
        var adapter = new FboDesignLayoutWriterAdapter();

        Assert.False(adapter.RequiresEntityWriteback(xml));
    }

    [Fact]
    public void PlaceFieldParts_RightSide_FillsRemainingRightColumns()
    {
        // Bắt đầu ở cột 2 (phải) → đặt được cả cột 2,3 (I,L).
        var form = LayoutTestXml.ParseForm(SplitDir("----"));

        Assert.True(Engine().PlaceFieldParts(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 2), "x",
            [FormViewCellKind.Input, FormViewCellKind.Label, FormViewCellKind.Description]).Ok);

        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Input, row.Cells.Single(c => c.ColumnIndex == 2).Kind);
        Assert.Equal(FormViewCellKind.Label, row.Cells.Single(c => c.ColumnIndex == 3).Kind);
    }
}
