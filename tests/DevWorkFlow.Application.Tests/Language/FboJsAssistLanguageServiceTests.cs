using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

/// <summary>
/// Assist đi qua Language Service: chọn đúng buffer (Source vs ClearText) theo offset, và
/// catalog nạp từ file seed thật.
/// </summary>
public sealed class FboJsAssistLanguageServiceTests
{
    private const string Xml = """
        <!DOCTYPE dir [
          <!ENTITY Helper "var helper = 1;">
        ]>
        <dir table="t" code="a">
        <script><![CDATA[
        &Helper;
        function foo() {
          var v = f.get
        }
        ]]></script>
        </dir>
        """;

    private static ErpLanguageService OpenWithSeedCatalog(out IErpDocument document)
    {
        var service = new ErpLanguageService();
        var seed = FboJsCatalogParserTests.FindSeedCatalog();
        Assert.True(seed is not null, "Không tìm thấy seed catalog để nạp.");
        service.LoadFboJsCatalog(seed!);
        document = service.OpenDocumentFromText("buffer:assist.xml", Xml);
        return service;
    }

    [Fact]
    public void Complete_uses_source_buffer_when_offset_is_source()
    {
        var service = OpenWithSeedCatalog(out var doc);
        var offset = Xml.IndexOf("f.get", StringComparison.Ordinal) + "f.get".Length;

        var list = service.CompleteFboJs(
            doc.Id, offset, EditorAssistMode.Source, offset_is_clear_text: false);

        Assert.Contains(list.Items, i => i.Label == "getItemValue");
    }

    [Fact]
    public void Complete_uses_clear_text_buffer_when_offset_is_clear_text()
    {
        var service = OpenWithSeedCatalog(out var doc);
        var clear = doc.GetProjection(ErpProjectionKind.ClearText);
        var offset = clear.Text.IndexOf("f.get", StringComparison.Ordinal) + "f.get".Length;

        // Source mode nhưng offset thuộc hệ ClearText → phải tra trên đúng buffer đó.
        var list = service.CompleteFboJs(
            doc.Id, offset, EditorAssistMode.Source, offset_is_clear_text: true);

        Assert.Contains(list.Items, i => i.Label == "getItemValue");
    }

    [Fact]
    public void Insight_mode_completes_nothing_but_still_hovers()
    {
        var service = OpenWithSeedCatalog(out var doc);
        var clear = doc.GetProjection(ErpProjectionKind.ClearText);
        var complete_offset = clear.Text.IndexOf("f.get", StringComparison.Ordinal) + "f.get".Length;

        var list = service.CompleteFboJs(
            doc.Id, complete_offset, EditorAssistMode.Insight, offset_is_clear_text: true);
        Assert.Empty(list.Items);

        var hover_text = clear.Text;
        var hover_offset = hover_text.IndexOf("f.get", StringComparison.Ordinal) + 3;
        var hover = service.HoverFboJs(
            doc.Id, hover_offset, EditorAssistMode.Insight, offset_is_clear_text: true);

        // "get" không phải member đầy đủ → null; nhưng đường Hover ở Insight KHÔNG bị chặn cứng:
        // kiểm chứng bằng một member đúng tên.
        Assert.Null(hover);
    }

    [Fact]
    public void Hover_in_insight_returns_catalog_description_for_exact_member()
    {
        var service = new ErpLanguageService();
        service.LoadFboJsCatalog(FboJsCatalogParserTests.FindSeedCatalog()!);
        var doc = service.OpenDocumentFromText(
            "buffer:hover.xml",
            "<dir><script><![CDATA[ f.getItemValue('ma_kh') ]]></script></dir>");

        var clear = doc.GetProjection(ErpProjectionKind.ClearText);
        var offset = clear.Text.IndexOf("getItemValue", StringComparison.Ordinal) + 3;

        var hover = service.HoverFboJs(
            doc.Id, offset, EditorAssistMode.Insight, offset_is_clear_text: true);

        Assert.NotNull(hover);
        Assert.False(string.IsNullOrWhiteSpace(hover!.Body));
    }

    [Fact]
    public void Signature_from_language_service_reports_active_parameter()
    {
        var service = new ErpLanguageService();
        service.LoadFboJsCatalog(FboJsCatalogParserTests.FindSeedCatalog()!);
        var doc = service.OpenDocumentFromText(
            "buffer:sig.xml",
            "<dir><script><![CDATA[ g.request(o, 'Item', ]]></script></dir>");

        var raw = doc.Snapshot.RawText;
        var offset = raw.IndexOf("'Item', ", StringComparison.Ordinal) + "'Item', ".Length;

        var help = service.SignatureFboJs(
            doc.Id, offset, EditorAssistMode.Source, offset_is_clear_text: false);

        Assert.NotNull(help);
        Assert.Equal(2, help!.ActiveParameter);
    }

    [Fact]
    public void Unknown_document_returns_empty_without_throwing()
    {
        var service = new ErpLanguageService();
        var missing = ErpDocumentId.FromPath("buffer:khong-mo.xml");

        Assert.Empty(service.CompleteFboJs(missing, 0, EditorAssistMode.Source, false).Items);
        Assert.Null(service.HoverFboJs(missing, 0, EditorAssistMode.Source, false));
        Assert.Null(service.SignatureFboJs(missing, 0, EditorAssistMode.Source, false));
    }

    [Fact]
    public void Without_loading_catalog_assist_is_empty()
    {
        var service = new ErpLanguageService();
        var doc = service.OpenDocumentFromText("buffer:no-catalog.xml", Xml);
        var offset = Xml.IndexOf("f.get", StringComparison.Ordinal) + "f.get".Length;

        Assert.Empty(service.CompleteFboJs(doc.Id, offset, EditorAssistMode.Source, false).Items);
    }
}
