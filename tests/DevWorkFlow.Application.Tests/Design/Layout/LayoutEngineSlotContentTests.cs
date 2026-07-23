using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutEngineSlotContentTests
{
    /// <summary>main: "1---" (Label@0 + 3 ô trống); footer/cat khai báo để test biên vùng.</summary>
    private const string MixedDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields>
            <field name="a"><header v="A" e="A"/></field>
            <field name="b"><header v="B" e="B"/></field>
            <field name="c" categoryIndex="-1"><header v="C" e="C"/></field>
          </fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1---: [a].Label"/>
              <item value="1--1: [c], [c].Description"/>
              <categories>
                <category index="-1" columns="50,50,50,50"><header v="" e=""/></category>
              </categories>
            </view>
          </views>
        </dir>
        """;

    private static ILayoutEngine Engine() => new LayoutEngine();

    // ── InsertFieldAtSlot ────────────────────────────────────────────

    [Fact]
    public void InsertFieldAtSlot_Replace_FillsEmptySlot()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "b", FormViewCellKind.Input);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        var cell = row.Cells.Single(c => c.ColumnIndex == 1);
        Assert.Equal(FormViewCellKind.Input, cell.Kind);
        Assert.Equal("b", cell.FieldName);
        Assert.Equal(string.Empty, cell.Suffix);
        Assert.Equal("11--", row.Pattern);
    }

    [Fact]
    public void InsertFieldAtSlot_Replace_UsesDefaultSuffixPerKind()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);
        var engine = Engine();

        Assert.True(engine.InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "b", FormViewCellKind.Label).Ok);
        Assert.True(engine.InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 2), "b", FormViewCellKind.Description).Ok);

        var row = form.Layout!.TopRows[0];
        Assert.Equal(".Label", row.Cells.Single(c => c.ColumnIndex == 1).Suffix);
        Assert.Equal(".Description", row.Cells.Single(c => c.ColumnIndex == 2).Suffix);
    }

    [Fact]
    public void InsertFieldAtSlot_Replace_RejectsOccupiedSlot()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 0), "b", FormViewCellKind.Input);

        Assert.False(result.Ok);
        Assert.Equal("a", form.Layout!.TopRows[0].Cells[0].FieldName);
    }

    [Fact]
    public void InsertFieldAtSlot_After_BorrowsEmptyColumn_KeepsColumnCount()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 0), "b", FormViewCellKind.Input,
            SlotInsertMode.After);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(4, row.Cells.Sum(c => c.ColumnSpan));
        Assert.Equal(FormViewCellKind.Label, row.Cells[0].Kind);
        Assert.Equal("b", row.Cells[1].FieldName);
        Assert.Equal(1, row.Cells[1].ColumnIndex);
        Assert.Equal("11--", row.Pattern);
    }

    [Fact]
    public void InsertFieldAtSlot_Before_ShiftsTargetRight()
    {
        // "--1-": Empty@0, Empty@1, Input a@2, Empty@3
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="b"><header v="B" e="B"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="50,50,50,50"/>
                  <item value="--1-: [a]"/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);

        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 2), "b", FormViewCellKind.Label,
            SlotInsertMode.Before);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(4, row.Cells.Sum(c => c.ColumnSpan));
        var b = row.Cells.Single(c => c.FieldName == "b");
        var a = row.Cells.Single(c => c.FieldName == "a");
        Assert.True(b.ColumnIndex < a.ColumnIndex);
        Assert.Equal("-11-", row.Pattern);
    }

    [Fact]
    public void InsertFieldAtSlot_Before_FailsWhenRowIsFull()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir); // "1111" — không còn ô trống

        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "a", FormViewCellKind.Input,
            SlotInsertMode.After);

        Assert.False(result.Ok);
        Assert.Equal("1111", form.Layout!.TopRows[0].Pattern);
    }

    [Fact]
    public void InsertFieldAtSlot_RejectsFieldFromAnotherRegion()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        // c thuộc footer (categoryIndex=-1) → không được thả vào main.
        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "c", FormViewCellKind.Input);

        Assert.False(result.Ok);
        Assert.Contains("footer", result.Error);
    }

    [Fact]
    public void InsertFieldAtSlot_RejectsUnknownField()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        Assert.False(Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "zzz", FormViewCellKind.Input).Ok);
    }

    [Fact]
    public void InsertFieldAtSlot_AllowsFooterFieldIntoFooterRegion()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        // footer row 0 = "1--1": Input c@0, Empty@1, Empty@2, Description c@3
        var result = Engine().InsertFieldAtSlot(
            form, new LayoutSlotId(LayoutRegionId.Footer, 0, 1), "c", FormViewCellKind.Label);

        Assert.True(result.Ok, result.Error);
        Assert.Equal("11-1", form.Layout!.BottomRows[0].Pattern);
    }

    // ── MoveField ────────────────────────────────────────────────────

    [Fact]
    public void MoveField_ToEmptySlot_MovesContentAndLeavesEmpty()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 2));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Empty, row.Cells[0].Kind);
        Assert.Null(row.Cells[0].FieldName);
        var moved = row.Cells.Single(c => c.ColumnIndex == 2);
        Assert.Equal(FormViewCellKind.Label, moved.Kind);
        Assert.Equal("a", moved.FieldName);
        Assert.Equal("--1-", row.Pattern);
    }

    [Fact]
    public void MoveField_ToOccupiedSlot_SwapsContent()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir); // Label, Input, Description, Description

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Input, row.Cells[0].Kind);
        Assert.Equal(FormViewCellKind.Label, row.Cells[1].Kind);
        Assert.Equal("1111", row.Pattern);
    }

    [Fact]
    public void MoveField_AcrossRowsInSameRegion_IsAllowed()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="50,50"/>
                  <item value="1-: [a].Label"/>
                  <item value="--"/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 1, 1));

        Assert.True(result.Ok, result.Error);
        Assert.Equal("--", form.Layout!.TopRows[0].Pattern);
        Assert.Equal("-1", form.Layout.TopRows[1].Pattern);
    }

    [Fact]
    public void MoveField_RejectsCrossRegion()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Footer, 0, 1));

        Assert.False(result.Ok);
    }

    [Fact]
    public void MoveField_RejectsEmptySource()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 1),
            new LayoutSlotId(LayoutRegionId.Main, 0, 2));

        Assert.False(result.Ok);
    }

    [Fact]
    public void MoveField_After_PlacesControlNextToTarget_UsingFreedColumn()
    {
        // "1--1: [c], [c].Description" (footer) — chuyển Input c ra ngay sau Description.
        var form = LayoutTestXml.ParseForm(MixedDir);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Footer, 0, 0),
            new LayoutSlotId(LayoutRegionId.Footer, 0, 3),
            SlotInsertMode.Before);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.BottomRows[0];
        Assert.Equal(4, row.Cells.Sum(c => c.ColumnSpan));
        var input = row.Cells.Single(c => c.Kind == FormViewCellKind.Input);
        var desc = row.Cells.Single(c => c.Kind == FormViewCellKind.Description);
        Assert.Equal(desc.ColumnIndex - 1, input.ColumnIndex);
        Assert.Equal("--11", row.Pattern);
    }

    [Fact]
    public void MoveField_After_InFullRow_ReordersUsingTheFreedSourceColumn()
    {
        // "1111" không còn ô trống, nhưng cột nguồn vừa dọn chính là cột được mượn → reorder hợp lệ.
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SimpleDir);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 3),
            SlotInsertMode.After);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal("1111", row.Pattern);
        Assert.Equal(FormViewCellKind.Label, row.Cells[^1].Kind);
        Assert.Equal(3, row.Cells[^1].ColumnIndex);
        Assert.Equal(FormViewCellKind.Input, row.Cells[0].Kind);
    }

    [Fact]
    public void MoveField_After_FailsAndRestoresSource_WhenTargetRowIsFull()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="50,50"/>
                  <item value="1-: [a].Label"/>
                  <item value="11: [a], [a].Description"/>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);

        var result = Engine().MoveField(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 1, 0),
            SlotInsertMode.After);

        Assert.False(result.Ok);
        Assert.Equal("1-", form.Layout!.TopRows[0].Pattern);
        Assert.Equal(FormViewCellKind.Label, form.Layout.TopRows[0].Cells[0].Kind);
        Assert.Equal("11", form.Layout.TopRows[1].Pattern);
    }

    // ── ClearSlot ────────────────────────────────────────────────────

    [Fact]
    public void ClearSlot_RemovesControlKeepsSpan()
    {
        var form = LayoutTestXml.ParseForm(LayoutTestXml.SpannedControlDir); // "1000" span 4

        var result = Engine().ClearSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0));

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Single(row.Cells);
        Assert.Equal(FormViewCellKind.Empty, row.Cells[0].Kind);
        Assert.Equal(4, row.Cells[0].ColumnSpan);
        // Ô trống span > 1 vẫn cần 1+0… để giữ số cột khi parse lại.
        Assert.Equal("1000", row.Pattern);
    }

    [Fact]
    public void ClearSlot_RejectsAlreadyEmpty()
    {
        var form = LayoutTestXml.ParseForm(MixedDir);

        Assert.False(Engine().ClearSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);
    }
}
