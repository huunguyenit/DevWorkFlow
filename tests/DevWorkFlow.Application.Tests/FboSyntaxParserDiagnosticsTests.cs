using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// Lỗi cấu trúc XML (tag đóng không khớp / thiếu đóng / đóng thừa) — ERP1002, severity Error.
/// Trước đây chỉ BadToken từ lexer sinh ERP1001; tag lệch không được báo.
/// </summary>
public class FboSyntaxParserDiagnosticsTests
{
    private static ErpDiagnostic[] Erp1002(string xml) =>
        FboSyntaxParser.Parse(xml, "buffer:test.xml").Diagnostics
            .Where(d => d.Id == "ERP1002")
            .ToArray();

    [Fact]
    public void Mismatched_close_tag_reports_error_at_that_tag()
    {
        // <b> mở, gặp </a> → không khớp.
        const string xml = "<a><b></a>";
        var errors = Erp1002(xml);

        var d = Assert.Single(errors);
        Assert.Equal(ErpDiagnosticSeverity.Error, d.Severity);
        Assert.Contains("</a>", d.Message);
        // Location trỏ tới token </a> (nằm sau <a><b>).
        Assert.Equal(xml.IndexOf("</a>", StringComparison.Ordinal), d.Location.Span.StartOffset);
    }

    [Fact]
    public void Missing_close_tag_before_outer_close_is_reported()
    {
        const string xml =
            """
            <dir table="t" code="a">
              <fields>
                <field name="a"/>
              </dir>
            """;
        // <fields> chưa đóng khi gặp </dir>.
        var errors = Erp1002(xml);
        Assert.NotEmpty(errors);
        Assert.Contains(errors, d =>
            d.Message.Contains("</dir>", StringComparison.Ordinal)
            && d.Message.Contains("fields", StringComparison.OrdinalIgnoreCase));
    }

    [Fact]
    public void Unclosed_tags_at_eof_are_reported_at_start_tag()
    {
        const string xml = "<dir>\n  <fields>\n    <field name=\"a\"/>";
        var errors = Erp1002(xml);

        // Cả <dir> và <fields> đều chưa đóng.
        Assert.Contains(errors, d => d.Message.Contains("<dir>", StringComparison.Ordinal));
        Assert.Contains(errors, d => d.Message.Contains("<fields>", StringComparison.Ordinal));

        var fields_err = errors.First(d => d.Message.Contains("<fields>", StringComparison.Ordinal));
        Assert.Equal(2, fields_err.Location.Line); // <fields> ở dòng 2
    }

    [Fact]
    public void Stray_close_tag_without_open_is_reported()
    {
        const string xml = "<dir></foo></dir>";
        var errors = Erp1002(xml);

        Assert.Contains(errors, d =>
            d.Message.Contains("</foo>", StringComparison.Ordinal)
            && d.Message.Contains("không có tag mở", StringComparison.Ordinal));
    }

    [Fact]
    public void Wellformed_xml_has_no_structure_error()
    {
        const string xml =
            """
            <dir table="t" code="a">
              <fields>
                <field name="a"/>
              </fields>
              <commands>
                <command event="Loading"><text>select 1</text></command>
              </commands>
            </dir>
            """;
        Assert.Empty(Erp1002(xml));
    }
}
