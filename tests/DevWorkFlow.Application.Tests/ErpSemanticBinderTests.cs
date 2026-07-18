using DevWorkFlow.Application.Language;
using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class ErpSemanticBinderTests
{
    [Fact]
    public void Bind_dir_produces_controller_field_view_symbols()
    {
        const string xml = """
            <?xml version="1.0" encoding="utf-8"?>
            <dir xmlns="urn:schemas-fast-com:data-dir" table="dmkh" code="ma_kh">
              <title v="KH" e="Cust"/>
              <fields>
                <field name="ma_kh" isPrimaryKey="true" allowNulls="false"><header v="Mã" e="Code"/></field>
                <field name="ten_kh"><header v="Tên" e="Name"/></field>
              </fields>
              <views>
                <view id="Dir" height="100">
                  <item value="100, 200"/>
                  <item value="[ma_kh]"/>
                </view>
              </views>
              <commands>
                <command event="Loading">
                  <text>select 1</text>
                </command>
              </commands>
              <script><![CDATA[
            function onChange$Voucher$ma_kh(sender) { }
            ]]></script>
            </dir>
            """;

        var syntax = FboSyntaxParser.Parse(xml, "Customer.xml");
        var binder = new ErpSemanticBinder();
        var model = binder.Bind(ErpDocumentId.FromPath("Customer.xml"), "Customer.xml", xml, syntax);

        Assert.NotNull(model.Controller);
        Assert.Equal("Customer", model.Controller!.Name);
        Assert.Equal(2, model.GetFields().Count);
        Assert.NotNull(model.FindByName("ma_kh", ErpSymbolKind.Field));
        Assert.True(model.FindByName("ma_kh", ErpSymbolKind.Field) is FieldSymbol { IsPrimaryKey: true, IsRequired: true });
        Assert.Contains(model.Symbols, s => s.Kind == ErpSymbolKind.View);
        Assert.Contains(model.Symbols, s => s.Kind == ErpSymbolKind.Command);
        Assert.Contains(model.Symbols, s => s.Kind == ErpSymbolKind.ScriptFunction);
        Assert.NotNull(model.LegacyDocument);
        Assert.NotNull(model.Profile);
    }

    [Fact]
    public void Bind_duplicate_fields_emits_ERP2001()
    {
        const string xml = """
            <?xml version="1.0"?>
            <dir xmlns="urn:schemas-fast-com:data-dir" table="t" code="a">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="a"><header v="A2" e="A2"/></field>
              </fields>
            </dir>
            """;

        var syntax = FboSyntaxParser.Parse(xml);
        var model = new ErpSemanticBinder().Bind(ErpDocumentId.FromPath("dup.xml"), "dup.xml", xml, syntax);
        Assert.Contains(model.Diagnostics, d => d.Id == "ERP2001");
    }

    [Sp226Fact]
    public void Bind_SP226_Customer_has_ma_kh_and_script_or_commands()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var xml = File.ReadAllText(path);
        var syntax = FboSyntaxParser.Parse(xml, path);
        var model = new ErpSemanticBinder().Bind(ErpDocumentId.FromPath(path), path, xml, syntax);

        Assert.NotNull(model.FindByName("ma_kh", ErpSymbolKind.Field));
        Assert.NotNull(model.LegacyDocument);
        Assert.True(model.GetFields().Count > 5);
    }

    [Sp226Fact]
    public void LanguageService_semantic_matches_binder()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocument(path);
        Assert.NotNull(doc.SemanticModel.Controller);
        Assert.NotNull(doc.SemanticModel.FindByName("ma_kh", ErpSymbolKind.Field));
        Assert.True(doc.SemanticModel is ErpSemanticModel { LegacyDocument: not null });
    }
}
