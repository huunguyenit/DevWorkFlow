using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class PlaceCreateRemoveTests
{
    private static ILayoutEngine Engine() => new LayoutEngine();

    /// <summary>main row0 = Label(a)@0 + 3 empty; second row all empty for spare-testing.</summary>
    private static string MainWith(int empty_cols_after_label) =>
        $"""
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="{string.Join(",", Enumerable.Repeat(50, empty_cols_after_label + 1))}"/>
              <item value="1{new string('-', empty_cols_after_label)}: [a].Label"/>
            </view>
          </views>
        </dir>
        """;

    // ── PlaceFieldParts: 1 / 2 / 3 empty ─────────────────────────────

    [Fact]
    public void Place_OneEmpty_PlacesInputOnly()
    {
        // columns=50,50 ; row "1-": Label@0, Empty@1
        var form = LayoutTestXml.ParseForm(MainWith(1));
        var field = new FboField { Name = "x", DataType = "String", Header = new LocalizedText { V = "x", E = "x" } };
        form.Fields.Add(field); form.FieldsByName["x"] = field;

        var result = Engine().PlaceFieldParts(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "x",
            [FormViewCellKind.Input, FormViewCellKind.Label, FormViewCellKind.Description]);

        Assert.True(result.Ok, result.Error);
        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Input, row.Cells.Single(c => c.ColumnIndex == 1).Kind);
        Assert.Equal(1, row.Cells.Count(c => c.FieldName == "x"));
    }

    [Fact]
    public void Place_TwoEmpty_PlacesInputAndLabel()
    {
        var form = LayoutTestXml.ParseForm(MainWith(2));
        var field = new FboField { Name = "x", DataType = "String", Header = new LocalizedText { V = "x", E = "x" } };
        form.Fields.Add(field); form.FieldsByName["x"] = field;

        Assert.True(Engine().PlaceFieldParts(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "x",
            [FormViewCellKind.Input, FormViewCellKind.Label, FormViewCellKind.Description]).Ok);

        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Input, row.Cells.Single(c => c.ColumnIndex == 1).Kind);
        Assert.Equal(FormViewCellKind.Label, row.Cells.Single(c => c.ColumnIndex == 2).Kind);
        Assert.Equal(2, row.Cells.Count(c => c.FieldName == "x"));
    }

    [Fact]
    public void Place_ThreeEmpty_PlacesInputLabelDescription()
    {
        var form = LayoutTestXml.ParseForm(MainWith(3));
        var field = new FboField { Name = "x", DataType = "String", Header = new LocalizedText { V = "x", E = "x" } };
        form.Fields.Add(field); form.FieldsByName["x"] = field;

        Assert.True(Engine().PlaceFieldParts(
            form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "x",
            [FormViewCellKind.Input, FormViewCellKind.Label, FormViewCellKind.Description]).Ok);

        var row = form.Layout!.TopRows[0];
        Assert.Equal(FormViewCellKind.Input, row.Cells.Single(c => c.ColumnIndex == 1).Kind);
        Assert.Equal(FormViewCellKind.Label, row.Cells.Single(c => c.ColumnIndex == 2).Kind);
        Assert.Equal(FormViewCellKind.Description, row.Cells.Single(c => c.ColumnIndex == 3).Kind);
        Assert.Equal(".Description", row.Cells.Single(c => c.ColumnIndex == 3).Suffix);
    }

    // ── CreateFieldAndInsert control XML attrs ───────────────────────

    private static string WriteCreated(ToolboxControlKind kind, out FboFormModel form, out System.Collections.Generic.List<FboField> created)
    {
        var xml = MainWith(3);
        form = LayoutTestXml.ParseForm(xml);
        var before = form.Fields.Select(f => f.Name).ToHashSet();
        Assert.True(Engine().CreateFieldAndInsert(
            form, kind, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);
        created = form.Fields.Where(f => !before.Contains(f.Name)).ToList();
        var writer = new FboXmlWriter();
        var result = xml;
        foreach (var f in created) result = writer.ApplyNewField(result, f);
        return writer.ApplyLayout(result, form);
    }

    [Fact]
    public void Create_CheckBox_WritesBooleanAndCheckboxStyle()
    {
        var xml = WriteCreated(ToolboxControlKind.CheckBox, out _, out _);
        Assert.Contains("type=\"Boolean\"", xml);
        Assert.Contains("style=\"Checkbox\"", xml);
    }

    [Fact]
    public void Create_DateTime_WritesTypeAndDataFormatString()
    {
        var xml = WriteCreated(ToolboxControlKind.DateTime, out _, out _);
        Assert.Contains("type=\"DateTime\"", xml);
        Assert.Contains("dataFormatString=\"@dateTimeFormat\"", xml);
    }

    [Fact]
    public void Create_Numeric_WritesDecimalTypeAndEmptyFormat()
    {
        var xml = WriteCreated(ToolboxControlKind.Numeric, out _, out _);
        Assert.Contains("type=\"Decimal\"", xml);
        Assert.Contains("dataFormatString=\"\"", xml);
    }

    [Fact]
    public void Create_Lookup_WritesLookupStyle()
    {
        var xml = WriteCreated(ToolboxControlKind.Lookup, out _, out _);
        Assert.Contains("style=\"Lookup\"", xml);
    }

    [Fact]
    public void Create_AutoComplete_AddsReferenceFieldAndAttr()
    {
        var xml = WriteCreated(ToolboxControlKind.AutoComplete, out var form, out var created);

        Assert.Equal(2, created.Count);
        var main = created.Single(f => !f.Name.StartsWith("ten_"));
        var reference = created.Single(f => f.Name.StartsWith("ten_"));
        Assert.Equal($"{reference.Name}%l", main.ItemsReference);
        Assert.True(reference.ReadOnly);
        Assert.Contains($"reference=\"{reference.Name}%l\"", xml);
        Assert.Contains($"name=\"{reference.Name}\"", xml);
        Assert.Contains("readOnly=\"true\"", xml);
    }

    // ── RemoveField ──────────────────────────────────────────────────

    [Fact]
    public void RemoveField_ClearsViewAndReportsName()
    {
        var form = LayoutTestXml.ParseForm(MainWith(3));
        // place a real field first
        var field = new FboField { Name = "x", DataType = "String", Header = new LocalizedText { V = "x", E = "x" } };
        form.Fields.Add(field); form.FieldsByName["x"] = field;
        Engine().PlaceFieldParts(form, new LayoutSlotId(LayoutRegionId.Main, 0, 1), "x",
            [FormViewCellKind.Input, FormViewCellKind.Label]);

        var ok = Engine().RemoveField(form, "x", out var removed);

        Assert.True(ok.Ok, ok.Error);
        Assert.Contains("x", removed);
        Assert.Null(form.FindField("x"));
        Assert.DoesNotContain(form.Layout!.Rows.SelectMany(r => r.Cells), c => c.FieldName == "x");
    }

    [Fact]
    public void RemoveField_AutoComplete_RemovesReferencePair()
    {
        var form = LayoutTestXml.ParseForm(MainWith(3));
        var before = form.Fields.Select(f => f.Name).ToHashSet();
        Assert.True(Engine().CreateFieldAndInsert(
            form, ToolboxControlKind.AutoComplete, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);
        var main = form.Fields.Single(f => !before.Contains(f.Name) && !f.Name.StartsWith("ten_"));
        var reference = form.Fields.Single(f => f.Name.StartsWith("ten_"));

        Assert.True(Engine().RemoveField(form, main.Name, out var removed).Ok);

        Assert.Contains(main.Name, removed);
        Assert.Contains(reference.Name, removed);
        Assert.Null(form.FindField(main.Name));
        Assert.Null(form.FindField(reference.Name));
    }

    [Fact]
    public void RemoveField_WriterDropsFieldElement()
    {
        var form = LayoutTestXml.ParseForm(MainWith(3));
        var before = form.Fields.Select(f => f.Name).ToHashSet();
        Assert.True(Engine().CreateFieldAndInsert(
            form, ToolboxControlKind.TextBox, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);
        var created = form.Fields.Single(f => !before.Contains(f.Name));
        var writer = new FboXmlWriter();
        var xml = writer.ApplyLayout(writer.ApplyNewField(MainWith(3), created), form);
        Assert.Contains($"name=\"{created.Name}\"", xml);

        Assert.True(Engine().RemoveField(form, created.Name, out var removed).Ok);
        var after = writer.ApplyLayout(writer.ApplyRemoveField(xml, removed[0]), form);

        Assert.DoesNotContain($"name=\"{created.Name}\"", after);
    }

    // ── Create không duplicate dòng model (spare là render-side, không phải model) ─────

    [Fact]
    public void CreateField_DoesNotAppendModelSpareRow()
    {
        var form = LayoutTestXml.ParseForm(MainWith(2)); // 1 row
        Assert.True(Engine().CreateFieldAndInsert(
            form, ToolboxControlKind.TextBox, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);

        // Không thêm hàng model (spare do builder render) → không duplicate.
        Assert.Single(form.Layout!.TopRows);
    }
}
