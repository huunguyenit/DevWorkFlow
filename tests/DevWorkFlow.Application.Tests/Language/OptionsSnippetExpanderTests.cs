using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class OptionsSnippetExpanderTests
{
    [Fact]
    public void Expands_canonical_pattern()
    {
        var sql = OptionsSnippetExpander.TryExpand("options.name='m_instock_split' and val = '1'");

        Assert.Equal(
            "SELECT * FROM options WHERE name = 'm_instock_split' and val = '1'",
            sql);
    }

    [Fact]
    public void Tolerates_extra_whitespace_and_leading_indent()
    {
        var sql = OptionsSnippetExpander.TryExpand("   options . name  =  'a'   and   val  =  'b'  ");

        Assert.Equal("SELECT * FROM options WHERE name = 'a' and val = 'b'", sql);
    }

    [Fact]
    public void Preserves_double_quote_style()
    {
        var sql = OptionsSnippetExpander.TryExpand("""options.name="a" and val="b" """);

        Assert.Equal("""SELECT * FROM options WHERE name = "a" and val = "b" """.TrimEnd(), sql);
    }

    [Fact]
    public void Is_case_insensitive_on_keywords()
    {
        var sql = OptionsSnippetExpander.TryExpand("OPTIONS.NAME = 'a' AND VAL = 'b'");

        Assert.NotNull(sql);
        Assert.Contains("name = 'a'", sql, StringComparison.Ordinal);
    }

    [Theory]
    [InlineData("")]
    [InlineData("   ")]
    [InlineData(null)]
    [InlineData("SELECT * FROM options")]
    [InlineData("options.name = 'a'")]                       // thiếu val
    [InlineData("myoptions.name = 'a' and val = 'b'")]       // không neo đầu token
    [InlineData("options.name = 'a' and val = 'b' extra")]   // thừa đuôi
    public void Non_matching_text_returns_null(string? text)
        => Assert.Null(OptionsSnippetExpander.TryExpand(text));
}
