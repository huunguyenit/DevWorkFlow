using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Engine;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

/// <summary>Sau CreateField, Property Grid đổi value → XML đổi (regression Task 6).</summary>
public sealed class FieldPropertyWriteTests
{
    private const string EmptyMain = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1---: [a].Label"/>
            </view>
          </views>
        </dir>
        """;

    private static string CreateTextField(out string field_name)
    {
        var form = LayoutTestXml.ParseForm(EmptyMain);
        var before = form.Fields.Select(f => f.Name).ToHashSet();
        Assert.True(new LayoutEngine().CreateFieldAndInsert(
            form, ToolboxControlKind.TextBox, new LayoutSlotId(LayoutRegionId.Main, 0, 1)).Ok);
        var created = form.Fields.Single(f => !before.Contains(f.Name));
        field_name = created.Name;
        var writer = new FboXmlWriter();
        return writer.ApplyLayout(writer.ApplyNewField(EmptyMain, created), form);
    }

    [Fact]
    public void ApplyFieldProperty_ChangesHeaderV()
    {
        var xml = CreateTextField(out var name);
        var updated = new FboXmlWriter().ApplyFieldProperty(xml, name, "header.v", "Mã khách");

        Assert.Contains("v=\"Mã khách\"", updated);
        var reparsed = LayoutTestXml.ParseForm(updated);
        Assert.Equal("Mã khách", reparsed.FindField(name)!.Header.V);
    }

    [Fact]
    public void ApplyFieldProperty_ChangesDataFormatString()
    {
        var xml = CreateTextField(out var name);
        var updated = new FboXmlWriter().ApplyFieldProperty(xml, name, "dataFormatString", "@upperCaseFormat");

        Assert.Contains("dataFormatString=\"@upperCaseFormat\"", updated);
    }

    [Fact]
    public void ApplyFieldProperty_SetsItemsController()
    {
        var xml = CreateTextField(out var name);
        var updated = new FboXmlWriter().ApplyFieldProperty(xml, name, "items.controller", "DmKhachHang");

        Assert.Contains("controller=\"DmKhachHang\"", updated);
    }
}
