using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class ErpNavigationServiceTests
{
    [Fact]
    public void GoToNode_returns_target_from_schema_field()
    {
        var ls = new ErpLanguageService();
        var xml =
            """
            <?xml version="1.0" encoding="utf-8"?>
            <dir table="test" code="ma_kh">
              <fields>
                <field name="ma_kh" allowNulls="false"/>
                <field name="ten_kh"/>
              </fields>
              <script>
              <![CDATA[
              function onInit() {}
              ]]>
              </script>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:nav-test.xml", xml);
        var roots = ls.Navigation.GetOutlineRoots(doc.Id);
        Assert.NotEmpty(roots);

        var fields = roots.FirstOrDefault(r =>
            r.NodeType.Equals("fields", StringComparison.OrdinalIgnoreCase));
        Assert.NotNull(fields);
        Assert.NotEmpty(fields.Children);

        var field_node = fields.Children[0];
        Assert.Equal("field", field_node.NodeType);
        Assert.Equal("ma_kh", field_node.DisplayName);

        var target = ls.Navigation.GoToNode(doc.Id, field_node.Id);
        Assert.NotNull(target);
        Assert.Equal(field_node.Id, target.NodeId);
        Assert.False(target.TextRange.IsEmpty);
        Assert.Equal("field", target.NodeType);
    }

    [Fact]
    public void GoToDefinition_by_symbol_id()
    {
        var ls = new ErpLanguageService();
        var xml =
            """
            <dir table="t" code="a">
              <fields>
                <field name="ma_kh"/>
              </fields>
            </dir>
            """;
        var doc = ls.OpenDocumentFromText("buffer:nav-def.xml", xml);
        var target = ls.Navigation.GoToDefinition(doc.Id, "field:ma_kh");
        Assert.NotNull(target);
        Assert.Equal("field:ma_kh", target.SymbolId);
    }

    [Fact]
    public void FindChildren_and_FindParent_roundtrip()
    {
        var ls = new ErpLanguageService();
        var xml =
            """
            <dir table="t" code="a">
              <fields>
                <field name="a1"/>
                <field name="a2"/>
              </fields>
            </dir>
            """;
        var doc = ls.OpenDocumentFromText("buffer:nav-tree.xml", xml);
        var roots = ls.Navigation.GetOutlineRoots(doc.Id);
        var fields = roots.First(r => r.NodeType.Equals("fields", StringComparison.OrdinalIgnoreCase));
        var children = ls.Navigation.FindChildren(doc.Id, fields.Id);
        Assert.Equal(2, children.Count);

        var parent = ls.Navigation.FindParent(doc.Id, children[0].Id);
        Assert.NotNull(parent);
        Assert.Equal(fields.Id, parent.Id);
    }
}
