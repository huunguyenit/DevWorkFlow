using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class SqlCompletionResolverTests
{
    private const string CatalogXml = """
        <sqlFunctions version="1">
          <group id="fbo">
            <function name="ff_InList" schema="dbo"
                      signature="dbo.ff_InList(value, list)" summary="Kiểm tra trong danh sách." />
            <function name="ff_PadL" schema="dbo"
                      signature="dbo.ff_PadL(value, length, pad)" summary="Đệm trái." />
            <function name="FastBusiness$Current$Stock" schema="dbo"
                      signature="exec FastBusiness$Current$Stock type, @ma_vt" summary="Tồn tức thời." />
          </group>
          <group id="tsql">
            <function name="isnull" signature="isnull(a, b)" summary="Thay NULL." />
          </group>
          <keywords names="select, from, where" />
          <keywords>
            <keyword name="select top" insert="select top 100 " summary="Xem thử dữ liệu." />
          </keywords>
        </sqlFunctions>
        """;

    private static SqlFunctionCatalog Catalog() =>
        SqlFunctionCatalog.FromData(SqlFunctionCatalogParser.ParseXml(CatalogXml));

    private static IReadOnlyList<string> LabelsAt(string sql, SqlFunctionCatalog? catalog = null) =>
        [.. SqlCompletionResolver.Complete(sql, sql.Length, catalog ?? Catalog()).Items.Select(i => i.Label)];

    [Fact]
    public void Suggests_functions_and_keywords_filtered_by_prefix()
    {
        var labels = LabelsAt("select * from ct where ff_");

        Assert.Contains("ff_InList", labels);
        Assert.Contains("ff_PadL", labels);
        Assert.DoesNotContain("isnull", labels);
        Assert.DoesNotContain("select", labels);
    }

    [Fact]
    public void Prefix_is_case_insensitive_like_tsql()
    {
        Assert.Contains("ff_InList", LabelsAt("select FF_IN"));
        Assert.Contains("select", LabelsAt("SEL"));
    }

    [Fact]
    public void Empty_prefix_returns_everything()
    {
        var labels = LabelsAt("select * from ct where ");

        Assert.Contains("ff_InList", labels);
        Assert.Contains("where", labels);
        Assert.Contains("select top", labels);
    }

    // Sau "dbo." chỉ còn hàm của schema đó — từ khoá ở đó là vô nghĩa.
    [Fact]
    public void After_schema_dot_only_that_schema_functions()
    {
        var labels = LabelsAt("select dbo.");

        Assert.Contains("ff_InList", labels);
        Assert.DoesNotContain("isnull", labels);   // hàm T-SQL không có schema
        Assert.DoesNotContain("select", labels);   // không gợi ý từ khoá sau dấu chấm
    }

    [Fact]
    public void Keyword_can_carry_its_own_insert_text()
    {
        var item = SqlCompletionResolver
            .Complete("sel", 3, Catalog()).Items
            .First(i => i.Label == "select top");

        Assert.Equal("select top 100 ", item.InsertText);
        Assert.Equal(SqlCompletionKind.Keyword, item.Kind);
    }

    // Proc (signature bắt đầu bằng exec) phân loại khác hàm scalar để icon Monaco khác nhau.
    [Fact]
    public void Exec_procedure_is_classified_as_procedure()
    {
        var item = SqlCompletionResolver
            .Complete("FastBusiness", 12, Catalog()).Items
            .First(i => i.Label == "FastBusiness$Current$Stock");

        Assert.Equal(SqlCompletionKind.Procedure, item.Kind);
        Assert.Equal(SqlCompletionKind.Function, LabelKind("isnull"));

        SqlCompletionKind LabelKind(string label) => SqlCompletionResolver
            .Complete("isnull", 6, Catalog()).Items.First(i => i.Label == label).Kind;
    }

    [Fact]
    public void Empty_catalog_suggests_nothing()
    {
        Assert.Empty(SqlCompletionResolver.Complete("sel", 3, SqlFunctionCatalog.Empty).Items);
    }

    // ── Gate island trong XML ───────────────────────────────────────────────

    [Fact]
    public void In_xml_only_inside_sql_islands()
    {
        const string xml = """
            <grid>
              <fields><field name="ff_" /></fields>
              <response>
                <action id="Item"><text><![CDATA[ exec ff_ ]]></text></action>
              </response>
            </grid>
            """;

        var in_action = xml.LastIndexOf("ff_", StringComparison.Ordinal) + 3;
        var in_attribute = xml.IndexOf("ff_", StringComparison.Ordinal) + 3;

        Assert.NotEmpty(SqlCompletionResolver.CompleteInSqlIsland(xml, in_action, Catalog()).Items);
        Assert.Empty(SqlCompletionResolver.CompleteInSqlIsland(xml, in_attribute, Catalog()).Items);
    }

    // ── File ship thật ──────────────────────────────────────────────────────

    [Fact]
    public void Shipped_config_provides_functions_and_keywords()
    {
        var path = FindShippedCatalog();
        Assert.True(path is not null, "Không tìm thấy UI/Config/xml/sql-functions.xml");

        var catalog = SqlFunctionCatalog.FromData(SqlFunctionCatalogParser.ParseFile(path!));
        var labels = LabelsAt("select * from ct where ", catalog);

        Assert.Contains("ff_InList", labels);
        Assert.Contains("select", labels);
        Assert.Contains("left join", labels);
        Assert.All(catalog.Keywords, k => Assert.False(string.IsNullOrWhiteSpace(k.Name)));
        // CSV nhiều dòng trong XML không được để lọt xuống dòng vào tên từ khoá.
        Assert.All(catalog.Keywords, k => Assert.DoesNotContain('\n', k.Name));
    }

    private static string? FindShippedCatalog()
    {
        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            var candidate = Path.Combine(dir.FullName, "UI", "Config", "xml", "sql-functions.xml");
            if (File.Exists(candidate)) return candidate;
            dir = dir.Parent;
        }
        return null;
    }
}
