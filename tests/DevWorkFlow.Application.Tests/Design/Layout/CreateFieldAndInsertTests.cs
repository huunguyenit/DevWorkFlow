using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class CreateFieldAndInsertTests
{
    private const string EmptyMain = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields>
            <field name="a"><header v="A" e="A"/></field>
          </fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1---: [a].Label"/>
            </view>
          </views>
        </dir>
        """;

    [Fact]
    public void CreateFieldAndInsert_AddsUniqueTextField_AndPlacesInput()
    {
        var form = LayoutTestXml.ParseForm(EmptyMain);
        var result = new LayoutEngine().CreateFieldAndInsert(
            form, ToolboxControlKind.TextBox, new LayoutSlotId(LayoutRegionId.Main, 0, 1));

        Assert.True(result.Ok, result.Error);
        Assert.Contains(form.Fields, f => f.Name == "text_1");
        var field = form.FindField("text_1")!;
        Assert.Null(field.CategoryIndex);
        Assert.Equal("String", field.DataType);
        var cell = form.Layout!.TopRows[0].Cells.Single(c => c.ColumnIndex == 1);
        Assert.Equal(FormViewCellKind.Input, cell.Kind);
        Assert.Equal("text_1", cell.FieldName);
    }

    [Fact]
    public void CreateFieldAndInsert_IncrementsSuffixWhenNameTaken()
    {
        var form = LayoutTestXml.ParseForm(EmptyMain);
        var taken = new FboField { Name = "text_1", DataType = "String" };
        form.Fields.Add(taken);
        form.FieldsByName[taken.Name] = taken;
        var result = new LayoutEngine().CreateFieldAndInsert(
            form, ToolboxControlKind.TextBox, new LayoutSlotId(LayoutRegionId.Main, 0, 2));

        Assert.True(result.Ok, result.Error);
        Assert.Contains(form.Fields, f => f.Name == "text_2");
    }

    [Fact]
    public void CreateFieldAndInsert_FooterRegion_SetsCategoryMinusOne()
    {
        var xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="c" categoryIndex="-1"><header v="C" e="C"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="50,50,50,50"/>
                  <item value="----"/>
                  <item value="1---: [c].Label"/>
                  <categories>
                    <category index="-1" columns="50,50,50,50"><header v="" e=""/></category>
                  </categories>
                </view>
              </views>
            </dir>
            """;
        var form = LayoutTestXml.ParseForm(xml);
        var result = new LayoutEngine().CreateFieldAndInsert(
            form, ToolboxControlKind.CheckBox, new LayoutSlotId(LayoutRegionId.Footer, 0, 1));

        Assert.True(result.Ok, result.Error);
        var field = form.FindField("check_1")!;
        Assert.Equal(-1, field.CategoryIndex);
        Assert.Equal("Boolean", field.DataType);
    }

    [Fact]
    public void ApplyNewField_ThenApplyLayout_PersistsFieldAndView()
    {
        var form = LayoutTestXml.ParseForm(EmptyMain);
        Assert.True(new LayoutEngine().CreateFieldAndInsert(
            form, ToolboxControlKind.TextBox, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);

        var writer = new FboXmlWriter();
        var xml = writer.ApplyNewField(EmptyMain, form.FindField("text_1")!);
        xml = writer.ApplyLayout(xml, form);

        Assert.Contains("name=\"text_1\"", xml);
        Assert.Contains("type=\"String\"", xml);
        Assert.Contains("[text_1]", xml);
    }
}
