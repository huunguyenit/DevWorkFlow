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

    [Fact]
    public void FindReferences_entity_returns_definition_and_reference_targets()
    {
        var ls = new ErpLanguageService();
        var xml =
            """
            <!DOCTYPE dir [
              <!ENTITY Hello "hi">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Hello;&Hello;</dir>
            """;
        var doc = ls.OpenDocumentFromText("buffer:nav-entity-refs.xml", xml);

        var targets = ls.Navigation.FindReferences(doc.Id, "entity:Hello");

        Assert.True(targets.Count >= 2);
        Assert.Contains(targets, t => t.NodeType != "Reference");
        Assert.Contains(targets, t => t.NodeType == "Reference");
    }

    [Fact]
    public void FindReferences_script_function_returns_definition_and_call_sites()
    {
        var ls = new ErpLanguageService();
        var xml =
            """
            <dir table="t" code="a">
              <script>
              <![CDATA[
              function onChange(sender) {
                  doSomething();
              }
              function onInit() {
                  onChange(this);
                  onChange(null);
              }
              ]]>
              </script>
            </dir>
            """;
        var doc = ls.OpenDocumentFromText("buffer:nav-script-refs.xml", xml);

        var targets = ls.Navigation.FindReferences(doc.Id, "script:onChange");

        Assert.Equal(3, targets.Count); // 1 definition + 2 call sites
        Assert.Single(targets, t => t.NodeType != "Reference");
        Assert.Equal(2, targets.Count(t => t.NodeType == "Reference"));
    }
}
