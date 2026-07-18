using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// Navigation/Outline generic theo XSD schema — mirror cây XML.
/// Đặt tên node theo xs:key (field→name, view→id, command→event, action→id).
/// </summary>
public class ErpNavigationOutlineFixTests
{
    [Fact]
    public void Views_lists_all_view_elements_with_spans()
    {
        var ls = new ErpLanguageService();
        const string xml =
            """
            <?xml version="1.0" encoding="utf-8"?>
            <dir table="t" code="a">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
              </fields>
              <views>
                <view id="Dir" height="100">
                  <item value="100"/>
                  <item value="[a]"/>
                </view>
                <view id="Form">
                  <item value="100"/>
                  <item value="[a]"/>
                </view>
              </views>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:views-nav.xml", xml);
        var views = ls.Navigation.GetOutlineRoots(doc.Id)
            .First(r => r.NodeType.Equals("views", StringComparison.OrdinalIgnoreCase));

        Assert.Equal(2, views.Children.Count);
        Assert.Contains(views.Children, c => c.DisplayName.Equals("Dir", StringComparison.OrdinalIgnoreCase));
        Assert.Contains(views.Children, c => c.DisplayName.Equals("Form", StringComparison.OrdinalIgnoreCase));

        var dir = views.Children.First(c => c.DisplayName.Equals("Dir", StringComparison.OrdinalIgnoreCase));
        Assert.Equal("view", dir.NodeType);
        var target = ls.Navigation.GoToNode(doc.Id, dir.Id);
        Assert.NotNull(target);
        Assert.True(target.TextRange.StartOffset > 0);
    }

    [Fact]
    public void Response_section_shows_entity_fragment_children()
    {
        var ls = new ErpLanguageService();
        const string xml =
            """
            <?xml version="1.0" encoding="utf-8"?>
            <!DOCTYPE dir [
              <!ENTITY XMLSuggestion "<action id=""Suggestion""><text>select 1</text></action>">
            ]>
            <dir table="t" code="a">
              <fields>
                <field name="a"/>
              </fields>
              <response>
                &XMLSuggestion;
              </response>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:response-nav.xml", xml);
        var response = ls.Navigation.GetOutlineRoots(doc.Id)
            .FirstOrDefault(r => r.NodeType.Equals("response", StringComparison.OrdinalIgnoreCase));
        Assert.NotNull(response);
        Assert.NotEmpty(response.Children);

        Assert.Contains(response.Children, c =>
            c.NodeType.Equals("action", StringComparison.OrdinalIgnoreCase)
            || c.DisplayName.Contains("Suggestion", StringComparison.OrdinalIgnoreCase));

        var target = ls.Navigation.GoToNode(doc.Id, response.Id);
        Assert.NotNull(target);
        Assert.True(target.TextRange.StartOffset > 0);
    }

    [Fact]
    public void Script_functions_prefer_caret_only()
    {
        var ls = new ErpLanguageService();
        const string xml =
            """
            <dir table="t" code="a">
              <fields><field name="a"/></fields>
              <script><![CDATA[
            function onInit() {}
            function onSave() {}
            ]]></script>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:script-nav.xml", xml);
        var script = ls.Navigation.GetOutlineRoots(doc.Id)
            .First(r => r.NodeType.Equals("script", StringComparison.OrdinalIgnoreCase));
        Assert.True(script.PreferCaretOnly);
        Assert.True(script.Children.Count >= 2);

        var fn = script.Children[0];
        Assert.Equal("function", fn.NodeType);
        Assert.True(fn.PreferCaretOnly);

        var target = ls.Navigation.GoToNode(doc.Id, fn.Id);
        Assert.NotNull(target);
        Assert.True(target.PreferCaretOnly);
    }

    [Fact]
    public void Commands_named_by_event_from_schema_key()
    {
        var ls = new ErpLanguageService();
        const string xml =
            """
            <dir table="t" code="a">
              <fields><field name="a"/></fields>
              <commands>
                <command event="Loading"><text>select 1</text></command>
                <command event="Showing"><text>select 2</text></command>
              </commands>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:commands-nav.xml", xml);
        var commands = ls.Navigation.GetOutlineRoots(doc.Id)
            .First(r => r.NodeType.Equals("commands", StringComparison.OrdinalIgnoreCase));
        Assert.Equal(2, commands.Children.Count);
        Assert.Contains(commands.Children, c => c.DisplayName.Equals("Loading", StringComparison.Ordinal));
        Assert.Contains(commands.Children, c => c.DisplayName.Equals("Showing", StringComparison.Ordinal));
        Assert.All(commands.Children, c => Assert.Equal("command", c.NodeType));
    }

    [Fact]
    public void Fields_named_by_name_and_linked_to_symbol()
    {
        var ls = new ErpLanguageService();
        const string xml =
            """
            <dir table="t" code="ma_kh">
              <fields>
                <field name="ma_kh"/>
                <field name="ten_kh"/>
              </fields>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:fields-nav.xml", xml);
        var fields = ls.Navigation.GetOutlineRoots(doc.Id)
            .First(r => r.NodeType.Equals("fields", StringComparison.OrdinalIgnoreCase));

        var ma_kh = fields.Children.First(c => c.DisplayName.Equals("ma_kh", StringComparison.Ordinal));
        Assert.Equal("field:ma_kh", ma_kh.SymbolId);

        var target = ls.Navigation.GoToNode(doc.Id, ma_kh.Id);
        Assert.NotNull(target);
        Assert.IsType<FieldSymbol>(target.Symbol);
    }
}
