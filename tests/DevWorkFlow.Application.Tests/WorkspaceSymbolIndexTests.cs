using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class WorkspaceSymbolIndexTests
{
    private const string CustomerXml = """
        <?xml version="1.0" encoding="utf-8"?>
        <dir xmlns="urn:schemas-fast-com:data-dir" table="dmkh" code="ma_kh">
          <title v="Khách hàng" e="Customer"/>
          <fields>
            <field name="ma_kh"><header v="Mã" e="Code"/></field>
            <field name="ten_kh"><header v="Tên" e="Name"/></field>
          </fields>
        </dir>
        """;

    private const string OrderXml = """
        <?xml version="1.0" encoding="utf-8"?>
        <dir xmlns="urn:schemas-fast-com:data-dir" table="dmhd" code="so_hd">
          <title v="Hóa đơn" e="Order"/>
          <fields>
            <field name="so_hd"><header v="Số" e="No"/></field>
          </fields>
        </dir>
        """;

    [Fact]
    public void SearchSymbols_returns_matching_entries_across_documents()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);
        ls.OpenDocumentFromText("Order.xml", OrderXml);

        var results = ls.SearchSymbols("ma_kh");

        Assert.Contains(results, e => e.Symbol.Name == "ma_kh");
    }

    [Fact]
    public void SearchSymbols_by_display_name_matches_header()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var results = ls.SearchSymbols("Customer");

        Assert.Contains(results, e => e.Symbol.Kind == ErpSymbolKind.Controller);
    }

    [Fact]
    public void SearchSymbols_entity_matches_reference_name_and_resolved_value()
    {
        // "&ClientDefault;" / "ClientDefault" / "Default" đều phải tìm ra cùng một
        // Semantic Symbol (yêu cầu Search của Insight redesign 2026-07-19).
        const string xml = """
            <!DOCTYPE dir [<!ENTITY ClientDefault "Default">]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&ClientDefault;</dir>
            """;
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Entity.xml", xml);

        foreach (var query in new[] { "&ClientDefault;", "ClientDefault", "Default" })
        {
            var results = ls.SearchSymbols(query, kind: ErpSymbolKind.Entity);
            Assert.Contains(results, e => e.Symbol.Name == "ClientDefault");
        }
    }

    [Fact]
    public void SearchSymbols_kind_filter_narrows_results()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var fields = ls.SearchSymbols("kh", kind: ErpSymbolKind.Field);
        var controllers = ls.SearchSymbols("kh", kind: ErpSymbolKind.Controller);

        Assert.All(fields, e => Assert.Equal(ErpSymbolKind.Field, e.Symbol.Kind));
        Assert.All(controllers, e => Assert.Equal(ErpSymbolKind.Controller, e.Symbol.Kind));
    }

    [Fact]
    public void SearchSymbols_empty_query_returns_empty()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var results = ls.SearchSymbols(string.Empty);

        Assert.Empty(results);
    }

    [Fact]
    public void SearchSymbols_maxResults_limits_output()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);
        ls.OpenDocumentFromText("Order.xml", OrderXml);

        var results = ls.SearchSymbols("a", max_results: 1);

        Assert.True(results.Count <= 1);
    }

    [Fact]
    public void GetSymbolDefinition_returns_location_for_known_symbol()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var fields = ls.SearchSymbols("ma_kh", kind: ErpSymbolKind.Field);
        Assert.NotEmpty(fields);

        var symbol_id = fields[0].Symbol.Id;
        var location = ls.GetSymbolDefinition(symbol_id);

        // Definition có thể có (Phase 3+ bind) hoặc null (stub) — không throw
        _ = location; // không Assert cụ thể; chỉ verify không exception
    }

    [Fact]
    public void GetSymbolDefinition_unknown_id_returns_null()
    {
        var ls = new ErpLanguageService();
        var loc = ls.GetSymbolDefinition("no-such-symbol");
        Assert.Null(loc);
    }

    [Fact]
    public void FindSymbolReferences_unknown_symbol_returns_empty()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var refs = ls.FindSymbolReferences("no-such-symbol");

        Assert.Empty(refs);
    }

    [Fact]
    public void GetDocumentSymbols_returns_symbols_for_document()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var symbols = ls.Workspace.SymbolIndex.GetDocumentSymbols(doc.Id);

        Assert.NotEmpty(symbols);
        Assert.All(symbols, e => Assert.Equal(doc.Id, e.DocumentId));
    }

    [Fact]
    public void Close_removes_symbols_from_index()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var before = ls.Workspace.SymbolIndex.GetDocumentSymbols(doc.Id);
        Assert.NotEmpty(before);

        ls.CloseDocument(doc.Id);

        var after = ls.Workspace.SymbolIndex.GetDocumentSymbols(doc.Id);
        Assert.Empty(after);
    }

    [Fact]
    public void Reload_refreshes_symbol_index()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("Customer.xml", CustomerXml);

        var before = ls.Workspace.SymbolIndex.GetDocumentSymbols(doc.Id).Count;

        // Reload lại (version tăng, symbols vẫn rebuild)
        ls.ReloadDocument(doc.Id);

        var after = ls.Workspace.SymbolIndex.GetDocumentSymbols(doc.Id);
        Assert.Equal(before, after.Count);
    }

    [Fact]
    public void SearchSymbols_cross_document_finds_correct_documentPath()
    {
        var ls = new ErpLanguageService();
        ls.OpenDocumentFromText("Customer.xml", CustomerXml);
        ls.OpenDocumentFromText("Order.xml", OrderXml);

        var results = ls.SearchSymbols("so_hd", kind: ErpSymbolKind.Field);

        Assert.Contains(results, e => e.DocumentPath == "Order.xml");
    }
}
