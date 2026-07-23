using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class InformationAttributeAtOffsetTests
{
    // Start-tag lấy nguyên mẫu từ corpus (Dir/*.xml).
    private const string Xml = """
        <dir table="t" database="Sys">
          <fields>
            <field name="ma_kh">
              <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
            </field>
            <field name="ma_nt">
              <items controller="Currency" information="ma_nt$dmnt.ten_nt%l"/>
            </field>
          </fields>
        </dir>
        """;

    [Fact]
    public void Resolves_information_with_key_and_check_from_same_tag()
    {
        var offset = Xml.IndexOf("ma_kh$dmkh", StringComparison.Ordinal) + 3;

        var request = InformationAttributeAtOffset.TryResolve(Xml, offset);

        Assert.NotNull(request);
        Assert.Equal("ma_kh$dmkh.ten_kh%l", request!.Information);
        Assert.Equal("kh_yn = 1 and status = '1'", request.Key);
        Assert.Equal("kh_yn = 1", request.Check);
    }

    [Fact]
    public void Tag_without_key_or_check_yields_nulls()
    {
        var offset = Xml.IndexOf("ma_nt$dmnt", StringComparison.Ordinal) + 3;

        var request = InformationAttributeAtOffset.TryResolve(Xml, offset);

        Assert.NotNull(request);
        Assert.Equal("ma_nt$dmnt.ten_nt%l", request!.Information);
        Assert.Null(request.Key);
        Assert.Null(request.Check);
    }

    [Fact]
    public void Offset_elsewhere_in_same_tag_does_not_hit()
    {
        // Ctrl+Click trên controller="Customer" KHÔNG được mở SQL tra cứu.
        var offset = Xml.IndexOf("\"Customer\"", StringComparison.Ordinal) + 2;

        Assert.Null(InformationAttributeAtOffset.TryResolve(Xml, offset));
    }

    [Fact]
    public void Offset_outside_any_tag_is_null()
    {
        var offset = Xml.IndexOf("<fields>", StringComparison.Ordinal) + 8;

        Assert.Null(InformationAttributeAtOffset.TryResolve(Xml, offset));
    }

    [Theory]
    [InlineData(-1)]
    [InlineData(int.MaxValue)]
    public void Out_of_range_offset_is_null(int offset)
        => Assert.Null(InformationAttributeAtOffset.TryResolve(Xml, offset));

    [Fact]
    public void Does_not_borrow_key_from_a_different_tag()
    {
        // key nằm ở tag TRƯỚC; tag chứa information không có key → phải là null.
        const string xml = """
            <fields>
              <items key="status = '1'"/>
              <items information="ma_vt$dmvt.ten_vt%l"/>
            </fields>
            """;
        var offset = xml.IndexOf("ma_vt$dmvt", StringComparison.Ordinal) + 3;

        var request = InformationAttributeAtOffset.TryResolve(xml, offset);

        Assert.NotNull(request);
        Assert.Null(request!.Key);
    }

    // ── Qua Language Service ────────────────────────────────────────────────

    [Fact]
    public void Language_service_builds_sql_at_offset()
    {
        var service = new ErpLanguageService();
        var doc = service.OpenDocumentFromText("buffer:info.xml", Xml);
        var offset = Xml.IndexOf("ma_kh$dmkh", StringComparison.Ordinal) + 3;

        var sql = service.BuildInformationSqlAtOffset(doc.Id, offset);

        Assert.NotNull(sql);
        Assert.Contains("SELECT ma_kh, ten_kh, ten_kh2", sql, StringComparison.Ordinal);
        Assert.Contains("FROM dmkh", sql, StringComparison.Ordinal);
        Assert.Contains("WHERE kh_yn = 1 and status = '1'", sql, StringComparison.Ordinal);
        Assert.Contains("-- check: kh_yn = 1", sql, StringComparison.Ordinal);
    }

    [Fact]
    public void Language_service_resolves_database_kind_from_root()
    {
        var service = new ErpLanguageService();
        var doc = service.OpenDocumentFromText("buffer:sys.xml", Xml);

        Assert.Equal(ControllerDatabaseKind.Sys, service.ResolveDatabaseKind(doc.Id));
    }

    [Fact]
    public void Language_service_resolves_sql_object_in_island()
    {
        var service = new ErpLanguageService();
        const string xml = "<dir><command><![CDATA[ EXEC dbo.tinh_gia_von ]]></command></dir>";
        var doc = service.OpenDocumentFromText("buffer:obj.xml", xml);
        var offset = xml.IndexOf("tinh_gia_von", StringComparison.Ordinal) + 3;

        var name = service.ResolveSqlObjectAtOffset(doc.Id, offset);

        Assert.NotNull(name);
        Assert.Equal("dbo.tinh_gia_von", name!.Qualified);
    }

    [Fact]
    public void Language_service_returns_null_for_unknown_document()
    {
        var service = new ErpLanguageService();
        var missing = ErpDocumentId.FromPath("buffer:khong-mo.xml");

        Assert.Null(service.BuildInformationSqlAtOffset(missing, 0));
        Assert.Null(service.ResolveSqlObjectAtOffset(missing, 0));
        Assert.Equal(ControllerDatabaseKind.App, service.ResolveDatabaseKind(missing));
    }
}
