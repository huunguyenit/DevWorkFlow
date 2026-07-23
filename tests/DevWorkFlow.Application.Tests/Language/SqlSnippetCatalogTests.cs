using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class SqlSnippetCatalogTests
{
    private static string? FindSeed()
    {
        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            var candidate = Path.Combine(dir.FullName, "UI", "Config", "xml", "sql-snippets.xml");
            if (File.Exists(candidate)) return candidate;
            dir = dir.Parent;
        }
        return null;
    }

    // File ship thật phải parse được và expand đúng — sửa hỏng XML thì test đỏ, không im lặng.
    [Fact]
    public void Shipped_config_expands_options_pattern()
    {
        var path = FindSeed();
        Assert.True(path is not null, "Không tìm thấy UI/Config/xml/sql-snippets.xml");

        var catalog = SqlSnippetCatalog.FromFile(path!);

        Assert.NotEmpty(catalog.Definitions);
        Assert.Equal(
            "SELECT * FROM options WHERE name = 'm_instock_split' and val = '1'",
            catalog.TryExpand("options.name='m_instock_split' and val = '1'"));
    }

    [Fact]
    public void Shipped_config_expands_name_only_pattern()
    {
        var catalog = SqlSnippetCatalog.FromFile(FindSeed()!);

        Assert.Equal(
            "SELECT * FROM options WHERE name = 'abc'",
            catalog.TryExpand("options.name = 'abc'"));
    }

    [Fact]
    public void New_snippet_needs_only_config_no_code()
    {
        // Chứng minh yêu cầu "khai báo động ở Config/xml": thêm mẫu mới hoàn toàn bằng XML.
        const string xml = """
            <sqlSnippets version="1">
              <snippet id="dmvt" match="^\s*vt\s*=\s*'(?&lt;ma&gt;[^']*)'\s*$"
                       expand="SELECT * FROM dmvt WHERE ma_vt = '${ma}'" />
            </sqlSnippets>
            """;

        var catalog = SqlSnippetCatalog.FromXml(xml);

        Assert.Equal(
            "SELECT * FROM dmvt WHERE ma_vt = 'VT01'",
            catalog.TryExpand("vt='VT01'"));
    }

    [Fact]
    public void Preserves_quote_style_from_capture()
    {
        var catalog = SqlSnippetCatalog.FromFile(FindSeed()!);

        var expanded = catalog.TryExpand("""options.name="a" and val="b" """.TrimEnd());

        Assert.Equal("""SELECT * FROM options WHERE name = "a" and val = "b" """.TrimEnd(), expanded);
    }

    [Fact]
    public void Non_matching_text_returns_null()
    {
        var catalog = SqlSnippetCatalog.FromFile(FindSeed()!);

        Assert.Null(catalog.TryExpand("SELECT * FROM options"));
        Assert.Null(catalog.TryExpand("myoptions.name = 'a' and val = 'b'"));
        Assert.Null(catalog.TryExpand(""));
    }

    [Fact]
    public void Invalid_regex_is_skipped_without_killing_other_snippets()
    {
        const string xml = """
            <sqlSnippets version="1">
              <snippet id="bad" match="^([unclosed" expand="X" />
              <snippet id="good" match="^ok$" expand="FINE" />
            </sqlSnippets>
            """;

        var catalog = SqlSnippetCatalog.FromXml(xml);

        Assert.Single(catalog.Definitions);
        Assert.Equal("FINE", catalog.TryExpand("ok"));
    }

    [Fact]
    public void Missing_or_broken_file_yields_empty_catalog()
    {
        Assert.Empty(SqlSnippetCatalog.FromFile("khong-ton-tai.xml").Definitions);
        Assert.Empty(SqlSnippetCatalog.FromXml("<not-valid").Definitions);
    }

    [Fact]
    public void Expander_falls_back_to_builtin_when_catalog_empty()
    {
        // Thiếu config → vẫn expand được mẫu options mặc định (tính năng không chết hẳn).
        var expanded = OptionsSnippetExpander.TryExpand(
            "options.name='a' and val='b'", SqlSnippetCatalog.Empty);

        Assert.Equal("SELECT * FROM options WHERE name = 'a' and val = 'b'", expanded);
    }
}
