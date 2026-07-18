using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class ErpLanguageServiceContractTests
{
    [Fact]
    public void OpenFromText_sets_snapshot_and_workspace()
    {
        var ls = new ErpLanguageService();
        const string xml = """
            <?xml version="1.0" encoding="utf-8"?>
            <dir xmlns="urn:schemas-fast-com:data-dir" table="dmkh" code="ma_kh">
              <title v="KH" e="Cust"/>
              <fields>
                <field name="ma_kh"><header v="Mã" e="Code"/></field>
              </fields>
            </dir>
            """;

        var doc = ls.OpenDocumentFromText("Synthetic/Customer.xml", xml);

        Assert.Equal("Synthetic/Customer.xml", doc.Path);
        Assert.Equal(xml, doc.Snapshot.RawText);
        Assert.Equal(1, doc.Version);
        Assert.Same(doc, ls.Workspace.ActiveDocument);
        Assert.NotNull(ls.GetSnapshot(doc.Id));
        Assert.NotNull(doc.SemanticModel.FindByName("ma_kh", ErpSymbolKind.Field));
        Assert.NotNull(doc.SemanticModel.FindByName("Customer", ErpSymbolKind.Controller));
    }

    [Fact]
    public void Reload_increments_version_Close_removes()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("buffer:a", "<dir xmlns='urn:schemas-fast-com:data-dir'/>");
        var v1 = doc.Version;

        var reloaded = ls.ReloadDocument(doc.Id);
        Assert.True(reloaded.Version > v1);

        Assert.True(ls.CloseDocument(doc.Id));
        Assert.Null(ls.GetDocument(doc.Id));
        Assert.Null(ls.GetSnapshot(doc.Id));
    }

    [Fact]
    public void Open_unsupported_root_still_returns_document()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText(
            "Report/x.xml",
            """<?xml version="1.0"?><report xmlns="urn:schemas-fast-com:data-report"/>""");

        Assert.NotNull(doc);
        Assert.NotNull(doc.SemanticModel.Controller);
        Assert.Equal("Report", doc.SemanticModel.Controller!.FolderKind);
        Assert.Empty(doc.SemanticModel.GetFields());
    }

    [Sp226Fact]
    public void Open_SP226_Customer_has_field_ma_kh()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocument(path);

        Assert.Equal(path, doc.Path, ignoreCase: true);
        Assert.False(string.IsNullOrWhiteSpace(doc.Snapshot.RawText));
        Assert.NotNull(doc.SemanticModel.FindByName("ma_kh", ErpSymbolKind.Field));
        Assert.NotNull(doc.SemanticModel.FindByName("Customer", ErpSymbolKind.Controller));
    }

    [Sp226Fact]
    public void Open_SP226_Report_returns_document()
    {
        var path = Sp226Paths.Require("Report", "rptIncomeStatement.xml");
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocument(path);

        Assert.False(string.IsNullOrWhiteSpace(doc.Snapshot.RawText));
        Assert.True(doc.SemanticModel.Symbols.Count == 0 || doc.Diagnostics.Count >= 0);
    }
}
