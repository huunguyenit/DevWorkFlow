using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// ERP3005 — XML lỗi bên trong nội dung entity (trước đây im lặng). Validate ở Language Service.
/// </summary>
public class ErpEntityContentDiagnosticsTests
{
    [Fact]
    public void Invalid_xml_in_inline_entity_reports_ERP3005()
    {
        var ls = new ErpLanguageService();
        // Bad: <text> chưa đóng trước </action> → lỗi cấu trúc trong nội dung entity.
        const string xml =
            """
            <?xml version="1.0" encoding="utf-8"?>
            <!DOCTYPE dir [
              <!ENTITY Bad '<action id="x"><text>select 1</action>'>
            ]>
            <dir table="t" code="a">
              <fields><field name="a"/></fields>
              <response>&Bad;</response>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:bad-entity.xml", xml);
        var d = Assert.Single(doc.Diagnostics, x => x.Id == "ERP3005");
        Assert.Equal(ErpDiagnosticSeverity.Error, d.Severity);
        Assert.Equal("Bad", d.EntityName);
        Assert.Equal("entity:Bad", d.SymbolId);
        // Inline → điều hướng vào file đang mở (không RelatedPath file ngoài).
        Assert.Null(d.RelatedPath);
        Assert.True(d.Location.Span.StartOffset > 0);
    }

    [Fact]
    public void Valid_xml_in_entity_has_no_ERP3005()
    {
        var ls = new ErpLanguageService();
        const string xml =
            """
            <?xml version="1.0" encoding="utf-8"?>
            <!DOCTYPE dir [
              <!ENTITY Ok '<action id="x"><text>select 1</text></action>'>
            ]>
            <dir table="t" code="a">
              <fields><field name="a"/></fields>
              <response>&Ok;</response>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:ok-entity.xml", xml);
        Assert.DoesNotContain(doc.Diagnostics, x => x.Id == "ERP3005");
    }

    [Fact]
    public void Sql_only_entity_is_not_validated_as_xml()
    {
        var ls = new ErpLanguageService();
        // Nội dung SQL thuần (không phải XML body) → không phát ERP3005 dù có '<' trong so sánh.
        const string xml =
            """
            <?xml version="1.0" encoding="utf-8"?>
            <!DOCTYPE dir [
              <!ENTITY Sql 'select 1 where a < b'>
            ]>
            <dir table="t" code="a">
              <fields><field name="a"/></fields>
              <response>&Sql;</response>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("buffer:sql-entity.xml", xml);
        Assert.DoesNotContain(doc.Diagnostics, x => x.Id == "ERP3005");
    }
}
