using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class SqlHoverResolverTests
{
    private const string CatalogXml = """
        <sqlFunctions version="1">
          <group id="fbo">
            <function name="ff_InList" schema="dbo"
                      signature="dbo.ff_InList(value, list)"
                      summary="Kiểm tra giá trị có trong danh sách."
                      returns="Khác 0 khi trùng khớp.">
              <param name="value" summary="Giá trị cần kiểm tra." />
              <param name="list" summary="Danh sách ngăn cách bằng dấu phẩy." />
            </function>
          </group>
          <group id="fbo-proc">
            <function name="FastBusiness$Current$Stock" schema="dbo"
                      signature="exec FastBusiness$Current$Stock type, @ma_vt, …"
                      summary="Lấy tồn tức thời.">
              <param name="type" summary="0 - Item, 1 - UOM." />
            </function>
          </group>
          <group id="tsql">
            <function name="getdate" signature="getdate()" summary="Ngày giờ hiện tại của server." />
          </group>
        </sqlFunctions>
        """;

    private static SqlFunctionCatalog Catalog() =>
        SqlFunctionCatalog.FromData(SqlFunctionCatalogParser.ParseXml(CatalogXml));

    /// <summary>Offset trỏ vào giữa tên hàm trong <paramref name="sql"/>.</summary>
    private static int OffsetOf(string sql, string name) => sql.IndexOf(name, StringComparison.Ordinal) + 2;

    [Fact]
    public void Hovers_qualified_function_call()
    {
        const string sql = "select * from ct where dbo.ff_InList(tk, @list) = 1";

        var hover = SqlHoverResolver.Hover(sql, OffsetOf(sql, "ff_InList"), Catalog());

        Assert.NotNull(hover);
        Assert.Equal("dbo.ff_InList(value, list)", hover!.Title);
        Assert.Contains("Kiểm tra giá trị có trong danh sách.", hover.Body);
        Assert.Contains("• value — Giá trị cần kiểm tra.", hover.Body);
        Assert.Contains("Trả về: Khác 0 khi trùng khớp.", hover.Body);
    }

    [Fact]
    public void Hovers_without_schema_prefix_and_ignores_case()
    {
        const string sql = "select FF_INLIST(tk, @list)";

        var hover = SqlHoverResolver.Hover(sql, OffsetOf(sql, "FF_INLIST"), Catalog());

        Assert.NotNull(hover);
    }

    [Fact]
    public void Hovers_niladic_function_without_parens_in_catalog()
    {
        const string sql = "select getdate()";

        Assert.NotNull(SqlHoverResolver.Hover(sql, OffsetOf(sql, "getdate"), Catalog()));
    }

    // Cột trùng tên hàm không được hover — đó là lý do phải có dấu "(" theo sau.
    [Fact]
    public void Does_not_hover_column_named_like_function()
    {
        const string sql = "select ff_InList from ct";

        Assert.Null(SqlHoverResolver.Hover(sql, OffsetOf(sql, "ff_InList"), Catalog()));
    }

    [Fact]
    public void Returns_null_for_unknown_name_and_for_variable()
    {
        const string sql = "select dbo.ff_Unknown(@ff_InList)";

        Assert.Null(SqlHoverResolver.Hover(sql, OffsetOf(sql, "ff_Unknown"), Catalog()));
        Assert.Null(SqlHoverResolver.Hover(sql, OffsetOf(sql, "@ff_InList") + 1, Catalog()));
    }

    [Fact]
    public void Empty_catalog_never_hovers()
    {
        const string sql = "select getdate()";

        Assert.Null(SqlHoverResolver.Hover(sql, OffsetOf(sql, "getdate"), SqlFunctionCatalog.Empty));
    }

    // ── Gate island: trong XML chỉ hover khi ở trong <command>/<query> ──────

    [Fact]
    public void Hovers_inside_sql_island_only()
    {
        const string xml = """
            <controller>
              <field name="ff_InList(x)" />
              <query><![CDATA[ select dbo.ff_InList(tk, @list) ]]></query>
            </controller>
            """;

        var in_island = xml.LastIndexOf("ff_InList", StringComparison.Ordinal) + 2;
        var in_attribute = xml.IndexOf("ff_InList", StringComparison.Ordinal) + 2;

        Assert.NotNull(SqlHoverResolver.HoverInSqlIsland(xml, in_island, Catalog()));
        Assert.Null(SqlHoverResolver.HoverInSqlIsland(xml, in_attribute, Catalog()));
    }

    // ── Stored procedure FBO: tên có $ và gọi bằng exec, không ngoặc ───────

    [Fact]
    public void Hovers_exec_stored_procedure_with_dollar_in_name()
    {
        const string sql = "exec FastBusiness$Current$Stock 0, @ma_vt, @ma_kho, @stock output";

        var hover = SqlHoverResolver.Hover(sql, OffsetOf(sql, "FastBusiness"), Catalog());

        Assert.NotNull(hover);
        Assert.Contains("Lấy tồn tức thời.", hover!.Body);
    }

    // Hover ở KHÚC GIỮA tên ($Current$) vẫn phải ra đúng proc, không đọc cụt thành "Current".
    [Fact]
    public void Hovers_from_middle_segment_of_dollar_name()
    {
        const string sql = "exec dbo.FastBusiness$Current$Stock 1, @ma_vt";

        Assert.NotNull(SqlHoverResolver.Hover(
            sql, sql.IndexOf("Current", StringComparison.Ordinal) + 2, Catalog()));
    }

    [Fact]
    public void Does_not_hover_proc_name_without_exec_or_parens()
    {
        const string sql = "select FastBusiness$Current$Stock from log";

        Assert.Null(SqlHoverResolver.Hover(sql, OffsetOf(sql, "FastBusiness"), Catalog()));
    }

    // SQL của response action nằm trong <response><action><text>, không phải <command>.
    [Fact]
    public void Hovers_inside_response_action_island()
    {
        const string xml = """
            <controller>
              <response>
                <action id="Item">
                  <text><![CDATA[
            exec FastBusiness$Current$Stock 0, @ma_vt, @ma_kho, @stock output
            ]]></text>
                </action>
              </response>
            </controller>
            """;

        var offset = xml.IndexOf("FastBusiness", StringComparison.Ordinal) + 2;

        Assert.NotNull(SqlHoverResolver.HoverInSqlIsland(xml, offset, Catalog()));
    }

    // ── File ship thật phải parse được ─────────────────────────────────────

    [Fact]
    public void Shipped_config_describes_fbo_and_tsql_functions()
    {
        var path = FindShippedCatalog();
        Assert.True(path is not null, "Không tìm thấy UI/Config/xml/sql-functions.xml");

        var catalog = SqlFunctionCatalog.FromData(SqlFunctionCatalogParser.ParseFile(path!));

        Assert.False(catalog.IsEmpty);
        Assert.NotNull(catalog.Find("dbo.ff_InList"));
        Assert.NotNull(catalog.Find("ff_GetStartDateOfCycle"));
        Assert.NotNull(catalog.Find("isnull"));
        Assert.All(catalog.Functions, f => Assert.False(string.IsNullOrWhiteSpace(f.Summary)));
    }

    // Ca thật đã fail: Grid/SVDetail.xml — proc tên có $, gọi bằng exec, nằm trong response action.
    [Fact]
    public void Shipped_config_hovers_svdetail_stock_proc()
    {
        var catalog = SqlFunctionCatalog.FromData(
            SqlFunctionCatalogParser.ParseFile(FindShippedCatalog()!));

        const string xml = """
            <grid>
              <response>
                <action id="Item">
                  <text><![CDATA[
            if exists(select 1 from dmvt where ma_vt = @ma_vt) begin
              exec FastBusiness$Current$Stock 0, @ma_vt, @ma_kho, @ma_vi_tri, '', @$stt_rec, 1, @voucherCode, @unitCode, @action, 2, @stock output
              return
            end
            ]]></text>
                </action>
              </response>
            </grid>
            """;

        var offset = xml.IndexOf("FastBusiness$Current$Stock", StringComparison.Ordinal) + 5;
        var hover = SqlHoverResolver.HoverInSqlIsland(xml, offset, catalog);

        Assert.NotNull(hover);
        Assert.Contains("FastBusiness$Current$Stock", hover!.Title);
    }

    [Fact]
    public void Broken_xml_yields_empty_catalog()
    {
        var catalog = SqlFunctionCatalog.FromData(
            SqlFunctionCatalogParser.ParseXml("<sqlFunctions><group"));

        Assert.True(catalog.IsEmpty);
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
