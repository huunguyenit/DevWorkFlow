using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class SqlIslandAndObjectNameTests
{
    private const string Xml = """
        <dir table="t">
          <fields><field name="ma_vt"/></fields>
          <commands>
            <command event="Loading"><![CDATA[
              EXEC dbo.my_proc @a = 1
            ]]></command>
          </commands>
          <queries>
            <query event="Load"><![CDATA[
              SELECT * FROM [dbo].[my_func](1)
            ]]></query>
          </queries>
        </dir>
        """;

    [Fact]
    public void Finds_both_command_and_query_islands()
        => Assert.Equal(2, SqlIslandLocator.FindIslands(Xml).Count);

    [Fact]
    public void Offset_inside_command_body_is_island()
        => Assert.True(SqlIslandLocator.IsInside(
            Xml, Xml.IndexOf("EXEC", StringComparison.Ordinal)));

    [Fact]
    public void Offset_on_plain_xml_is_not_island()
        => Assert.False(SqlIslandLocator.IsInside(
            Xml, Xml.IndexOf("<field name=", StringComparison.Ordinal) + 3));

    [Theory]
    [InlineData(-1)]
    [InlineData(int.MaxValue)]
    public void Out_of_range_offset_is_not_island(int offset)
        => Assert.False(SqlIslandLocator.IsInside(Xml, offset));

    [Fact]
    public void Checking_command_is_not_a_sql_island()
    {
        // event="Checking" chứa JavaScript (island Phase 4), không phải SQL — nếu nhận nhầm thì
        // Ctrl+Click trong Checking sẽ đi tra ALTER PROCEDURE thay vì trợ giúp JS.
        const string xml = """
            <dir>
              <command event="Checking"><![CDATA[ if (f.getItemValue('a')) { } ]]></command>
              <command event="Loading"><![CDATA[ EXEC dbo.real_proc ]]></command>
            </dir>
            """;

        Assert.Single(SqlIslandLocator.FindIslands(xml));
        Assert.False(SqlIslandLocator.IsInside(
            xml, xml.IndexOf("getItemValue", StringComparison.Ordinal)));
        Assert.True(SqlIslandLocator.IsInside(
            xml, xml.IndexOf("real_proc", StringComparison.Ordinal)));
    }

    [Fact]
    public void Unclosed_command_fails_closed()
    {
        const string broken = "<dir><command><![CDATA[ EXEC dbo.x ";
        Assert.False(SqlIslandLocator.IsInside(broken, broken.Length - 1));
    }

    [Fact]
    public void Resolves_schema_qualified_name()
    {
        var offset = Xml.IndexOf("my_proc", StringComparison.Ordinal) + 2;

        var name = SqlObjectNameAtOffset.TryResolve(Xml, offset);

        Assert.NotNull(name);
        Assert.Equal("dbo", name!.Schema);
        Assert.Equal("my_proc", name.Name);
        Assert.Equal("dbo.my_proc", name.Qualified);
    }

    [Fact]
    public void Resolves_bracketed_name_and_schema()
    {
        var offset = Xml.IndexOf("my_func", StringComparison.Ordinal) + 2;

        var name = SqlObjectNameAtOffset.TryResolve(Xml, offset);

        Assert.NotNull(name);
        Assert.Equal("dbo", name!.Schema);
        Assert.Equal("my_func", name.Name);
    }

    [Fact]
    public void Unqualified_name_defaults_to_dbo()
    {
        const string xml = "<dir><command><![CDATA[ EXEC my_solo_proc ]]></command></dir>";
        var offset = xml.IndexOf("my_solo_proc", StringComparison.Ordinal) + 2;

        var name = SqlObjectNameAtOffset.TryResolve(xml, offset);

        Assert.NotNull(name);
        Assert.Equal("dbo", name!.Schema);
        Assert.Equal("my_solo_proc", name.Name);
    }

    [Fact]
    public void Custom_schema_is_preserved()
    {
        const string xml = "<dir><command><![CDATA[ EXEC sales.recalc ]]></command></dir>";
        var offset = xml.IndexOf("recalc", StringComparison.Ordinal) + 2;

        var name = SqlObjectNameAtOffset.TryResolve(xml, offset);

        Assert.NotNull(name);
        Assert.Equal("sales", name!.Schema);
        Assert.Equal("recalc", name.Name);
    }

    [Fact]
    public void Plain_identifier_outside_island_is_null()
    {
        // Không trong island VÀ không đứng sau EXEC → không nhận (tránh mọi identifier đều thành
        // "object SQL").
        const string xml = """<dir><field name="ma_vt"/><command><![CDATA[ x ]]></command></dir>""";
        var offset = xml.IndexOf("ma_vt", StringComparison.Ordinal) + 2;

        Assert.Null(SqlObjectNameAtOffset.TryResolve(xml, offset));
    }

    // SQL của FBO nằm trong khai báo <!ENTITY>, KHÔNG nằm trong <command> của source — đo trên
    // Dir/AITran.xml. Chỉ gate theo island thì Ctrl+Click tên proc luôn trượt.
    [Fact]
    public void Exec_inside_entity_declaration_resolves_even_though_not_an_island()
    {
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY AfterUpdate "
            exec FastBusiness$App$Voucher$UpdateInquiryTable @@id, 'ihddc'
            ">
            ]>
            <dir><commands><command event="Loading">&AfterUpdate;</command></commands></dir>
            """;
        var offset = xml.IndexOf("FastBusiness$App", StringComparison.Ordinal) + 4;

        var name = SqlObjectNameAtOffset.TryResolve(xml, offset);

        Assert.NotNull(name);
        Assert.Equal("FastBusiness$App$Voucher$UpdateInquiryTable", name!.Name);
        Assert.Equal("dbo", name.Schema);
    }

    [Fact]
    public void Exec_with_schema_outside_island_keeps_schema()
    {
        const string xml = """<!DOCTYPE dir [ <!ENTITY E "exec sales.recalc_all @a"> ]><dir/>""";
        var offset = xml.IndexOf("recalc_all", StringComparison.Ordinal) + 3;

        var name = SqlObjectNameAtOffset.TryResolve(xml, offset);

        Assert.NotNull(name);
        Assert.Equal("sales", name!.Schema);
        Assert.Equal("recalc_all", name.Name);
    }

    [Fact]
    public void Execute_keyword_is_also_accepted()
    {
        const string xml = """<!DOCTYPE dir [ <!ENTITY E "EXECUTE dbo.do_thing"> ]><dir/>""";
        var offset = xml.IndexOf("do_thing", StringComparison.Ordinal) + 2;

        Assert.NotNull(SqlObjectNameAtOffset.TryResolve(xml, offset));
    }
}
