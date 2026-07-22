using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class FboXmlDesignMetadataTests
{
    private readonly FboXmlParser _parser = new();

    [Fact]
    public void ParseDir_UsesDirViewAndReadsControllerCss()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="Mẫu" e="Sample"/>
              <fields>
                <field name="ma_kh"><header v="Mã khách" e="Customer"/></field>
              </fields>
              <views>
                <view id="Form"><item value="20"/><item value="1: [ma_kh]"/></view>
                <view id="Dir" height="274"><item value="120, 30"/><item value="10: [ma_kh]"/></view>
              </views>
              <css><text><![CDATA[.LabelDescription{color:#73A6DE;}]]></text></css>
            </dir>
            """;

        var document = _parser.Parse(xml, "Customer.xml");

        Assert.Equal("Dir", document.Form!.Layout!.ViewId);
        Assert.Equal(274, document.Form.Layout.HeightPx);
        Assert.Contains(".LabelDescription", document.CssText);
    }

    [Fact]
    public void ParseGrid_UsesGridViewAndReadsDetailType()
    {
        const string xml = """
            <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
              <title v="Chi tiết" e="Detail"/>
              <fields>
                <field name="ma_dvcs" width="90"><header v="Đơn vị" e="Unit"/></field>
                <field name="ma_kh" width="100"><header v="Khách" e="Customer"/></field>
              </fields>
              <views>
                <view id="Other"><field name="ma_kh"/></view>
                <view id="Grid"><field name="ma_dvcs"/></view>
              </views>
            </grid>
            """;

        var document = _parser.Parse(xml, "CustomerUnitDetail.xml");

        Assert.True(document.Grid!.IsDetail);
        Assert.Equal(["ma_dvcs"], document.Grid.VisibleFieldNames);
    }

    [Fact]
    public void SemanticBinder_LegacyDocumentUsesExpandedExternalEntity()
    {
        using var fixture = ExternalEntityFixture.Create(
            controller_xml: """
                <!DOCTYPE dir [<!ENTITY Extra SYSTEM "Extra.ent">]>
                <dir xmlns="urn:schemas-fast-com:data-dir">
                  <title v="Mẫu" e="Sample"/>
                  <fields>&Extra;</fields>
                  <views><view id="Dir"><item value="100"/><item value="1: [ma_kh]"/></view></views>
                </dir>
                """,
            entity_name: "Extra.ent",
            entity_text: """<field name="ma_kh"><header v="Mã khách" e="Customer"/></field>""");

        var service = new ErpLanguageService();
        var document = service.OpenDocument(fixture.ControllerPath);
        var legacy = Assert.IsType<ErpSemanticModel>(document.SemanticModel).LegacyDocument;

        Assert.NotNull(legacy);
        Assert.NotNull(legacy.Form!.FindField("ma_kh"));
    }

    private sealed class ExternalEntityFixture : IDisposable
    {
        private readonly string _directory;
        public string ControllerPath { get; }

        private ExternalEntityFixture(string directory, string controller_path)
        {
            _directory = directory;
            ControllerPath = controller_path;
        }

        public static ExternalEntityFixture Create(
            string controller_xml,
            string entity_name,
            string entity_text)
        {
            var directory = Path.Combine(
                Path.GetTempPath(), $"dwf-design-{Guid.NewGuid():N}");
            Directory.CreateDirectory(directory);
            var controller_path = Path.Combine(directory, "Customer.xml");
            File.WriteAllText(controller_path, controller_xml);
            File.WriteAllText(Path.Combine(directory, entity_name), entity_text);
            return new ExternalEntityFixture(directory, controller_path);
        }

        public void Dispose() =>
            Directory.Delete(_directory, recursive: true);
    }
}
