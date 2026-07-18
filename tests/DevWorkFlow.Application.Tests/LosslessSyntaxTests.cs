using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language.Syntax;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class LosslessSyntaxTests
{
    [Fact]
    public void Serialize_roundtrip_exact_synthetic()
    {
        const string xml = """
            <?xml version="1.0" encoding="utf-8"?>
            <!DOCTYPE dir [
              <!ENTITY ClientDefault "Default">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir" table="t" code="c">
              <title v="T" e="T"/>
              <fields>
                <field name="c"><header v="C" e="C"/></field>
              </fields>
              <script><![CDATA[
            function onChange$Voucher$c(sender) { }
            ]]></script>
            </dir>
            """;

        var tree = FboSyntaxParser.Parse(xml);
        Assert.Equal(xml, tree.Serialize());
        Assert.Contains(tree.Tokens, t => t.Kind == SyntaxKind.DocType);
        Assert.Contains(tree.Root.Children, n => n.Kind == SyntaxKind.DocType);
        Assert.Contains(
            tree.Root.Children.SelectMany(Flatten),
            n => n.Kind == SyntaxKind.EntityDeclaration && n.Name == "ClientDefault");

        var structure = XmlStructureParser.Parse(tree);
        Assert.NotNull(structure);
        Assert.Equal("dir", structure!.Name, ignoreCase: true);
    }

    [Fact]
    public void Invalid_xml_recovers_without_throw()
    {
        const string xml = "<dir><field name='a'><unclosed";
        var tree = FboSyntaxParser.Parse(xml);
        Assert.NotNull(tree.Root);
        Assert.Equal(xml, tree.Serialize());
        Assert.Contains(tree.Diagnostics, d => d.Id == "ERP1001");
    }

    [Fact]
    public void LanguageService_attaches_syntax_tree()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("x.xml", "<dir xmlns='urn:schemas-fast-com:data-dir'/>");
        Assert.NotNull(doc.SyntaxTree);
        Assert.Equal(doc.Snapshot.RawText, doc.SyntaxTree!.Serialize());
    }

    [Sp226Fact]
    public void Roundtrip_SP226_Customer()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var xml = File.ReadAllText(path);
        var tree = FboSyntaxParser.Parse(xml, path);
        Assert.Equal(xml, tree.Serialize());

        var structure = XmlStructureParser.Parse(tree);
        Assert.NotNull(structure);
        Assert.Equal("dir", structure!.Name, ignoreCase: true);
    }

    [Sp226Fact]
    public void Roundtrip_SP226_SODetail_and_Report()
    {
        foreach (var relative in new[]
                 {
                     new[] { "Grid", "SODetail.f" },
                     new[] { "Report", "rptIncomeStatement.xml" }
                 })
        {
            var path = Sp226Paths.Require(relative);
            var xml = File.ReadAllText(path);
            var tree = FboSyntaxParser.Parse(xml, path);
            Assert.Equal(xml, tree.Serialize());
        }
    }

    private static IEnumerable<SyntaxNode> Flatten(SyntaxNode node)
    {
        yield return node;
        foreach (var c in node.Children)
        foreach (var x in Flatten(c))
            yield return x;
    }
}
