using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class ScriptIslandLocatorTests
{
    private const string Xml = """
        <form>
        <script><![CDATA[
        function foo() { f.getItemValue('a'); }
        ]]></script>
        <commands>
          <command event="Checking"><![CDATA[
            if (1) { g.showForm('X'); }
          ]]></command>
          <command event="Loading"><![CDATA[
            notJsAssisted();
          ]]></command>
        </commands>
        <field name="x"/>
        </form>
        """;

    [Fact]
    public void Offset_inside_script_body_is_island()
    {
        var offset = Xml.IndexOf("f.getItemValue", StringComparison.Ordinal);
        Assert.True(ScriptIslandLocator.IsInsideJsIsland(Xml, offset));
    }

    [Fact]
    public void Offset_inside_checking_command_is_island()
    {
        var offset = Xml.IndexOf("g.showForm", StringComparison.Ordinal);
        Assert.True(ScriptIslandLocator.IsInsideJsIsland(Xml, offset));
    }

    [Fact]
    public void Offset_on_plain_xml_element_is_not_island()
    {
        var offset = Xml.IndexOf("<field name=", StringComparison.Ordinal) + 3;
        Assert.False(ScriptIslandLocator.IsInsideJsIsland(Xml, offset));
    }

    [Fact]
    public void Non_checking_command_body_is_not_island()
    {
        // Chỉ command event="Checking" mới là island JS theo spec Phase 4.
        var offset = Xml.IndexOf("notJsAssisted", StringComparison.Ordinal);
        Assert.False(ScriptIslandLocator.IsInsideJsIsland(Xml, offset));
    }

    [Theory]
    [InlineData(-1)]
    [InlineData(int.MaxValue)]
    public void Out_of_range_offset_is_not_island(int offset)
        => Assert.False(ScriptIslandLocator.IsInsideJsIsland(Xml, offset));

    [Fact]
    public void Empty_buffer_is_not_island()
        => Assert.False(ScriptIslandLocator.IsInsideJsIsland(string.Empty, 0));

    [Fact]
    public void Unclosed_script_fails_closed()
    {
        // Không có </script> → không xác định được vùng → KHÔNG gợi ý (fail closed).
        const string broken = "<form><script><![CDATA[ f.get ";
        Assert.False(ScriptIslandLocator.IsInsideJsIsland(broken, broken.Length - 1));
    }
}
