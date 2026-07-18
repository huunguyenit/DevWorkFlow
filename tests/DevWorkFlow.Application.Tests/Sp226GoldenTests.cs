using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class Sp226GoldenParseTests
{
    private readonly FboXmlParser _parser = new();

    [Sp226Fact]
    public void Parse_Dir_Customer_has_fields_and_form()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var doc = _parser.ParseFile(path);

        Assert.Equal(ControllerDisplayKind.Form, doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Dir, doc.FolderKind);
        Assert.Equal("Customer", doc.ControllerName);
        Assert.NotNull(doc.Form);
        Assert.True(doc.Form!.Fields.Count > 0);
        Assert.Contains(doc.Form.Fields, f => f.Name.Equals("ma_kh", StringComparison.OrdinalIgnoreCase));
    }

    [Sp226Fact]
    public void Parse_Dir_DataCopy_has_fields_and_form()
    {
        var path = Sp226Paths.Require("Dir", "DataCopy.xml");
        var doc = _parser.ParseFile(path);

        Assert.Equal(ControllerDisplayKind.Form, doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Dir, doc.FolderKind);
        Assert.Equal("DataCopy", doc.ControllerName);
        Assert.NotNull(doc.Form);
        Assert.True(doc.Form!.Fields.Count > 0);
        Assert.Contains(doc.Form.Fields, f => f.Name.Equals("id", StringComparison.OrdinalIgnoreCase));
    }

    [Sp226Fact]
    public void Parse_Filter_rptIncomeStatement_has_fields()
    {
        // Nhiều Filter .f dùng root <dir type="Report"> — parser theo root name.
        var path = Sp226Paths.Require("Filter", "rptIncomeStatement.f");
        var doc = _parser.ParseFile(path);

        Assert.Equal(ControllerDisplayKind.Form, doc.DisplayKind);
        Assert.NotNull(doc.Form);
        Assert.True(doc.Form!.Fields.Count > 0);
        Assert.Contains(doc.Form.Fields, f => f.Name.Equals("ky_nay_tu", StringComparison.OrdinalIgnoreCase));
    }

    [Sp226Fact]
    public void Parse_Grid_SODetail_has_fields()
    {
        var path = Sp226Paths.Require("Grid", "SODetail.f");
        var doc = _parser.ParseFile(path);

        Assert.Equal(ControllerDisplayKind.Grid, doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Grid, doc.FolderKind);
        Assert.Equal("SODetail", doc.ControllerName);
        Assert.NotNull(doc.Grid);
        Assert.True(doc.Grid!.Fields.Count > 0);
        Assert.Contains(doc.Grid.Fields, f => f.Name.Equals("ma_vt", StringComparison.OrdinalIgnoreCase));
    }

    [Sp226Fact]
    public void Parse_Lookup_Customer_has_fields()
    {
        var path = Sp226Paths.Require("Lookup", "Customer.xml");
        var doc = _parser.ParseFile(path);

        Assert.Equal(ControllerDisplayKind.Lookup, doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Lookup, doc.FolderKind);
        Assert.NotNull(doc.Lookup);
        Assert.True(doc.Lookup!.Fields.Count > 0);
    }
}

public class Sp226StructureAndEntityTests
{
    [Sp226Fact]
    public void Structure_Report_rptIncomeStatement_has_report_root()
    {
        var path = Sp226Paths.Require("Report", "rptIncomeStatement.xml");
        var xml = File.ReadAllText(path);
        var tree = XmlStructureParser.Parse(xml);

        Assert.NotNull(tree);
        Assert.Equal("report", tree!.Name, ignoreCase: true);
        Assert.Contains(tree.Children, n =>
            n.Name.Equals("forms", StringComparison.OrdinalIgnoreCase));
    }

    [Sp226Fact]
    public void EntitySymbols_SODetail_resolve_Grid_ent_include()
    {
        var path = Sp226Paths.Require("Grid", "SODetail.f");
        var xml = File.ReadAllText(path);
        Assert.Contains("Grid.ent", xml, StringComparison.OrdinalIgnoreCase);

        var grid_ent = Sp226Paths.Require("Include", "Grid.ent");
        Assert.True(File.Exists(grid_ent));

        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocument(path);
        var entities = document.SemanticModel.GetEntities();

        Assert.NotEmpty(entities);
        Assert.Contains(entities, entity =>
            entity.DeclarationKind == EntityDeclarationKind.Parameter
            && entity.SystemId?.Contains("Grid.ent", StringComparison.OrdinalIgnoreCase) == true
            && entity.IsResolved);
    }

    [Sp226Fact]
    public void Include_FilterQuery_xml_exists_and_has_structure()
    {
        var path = Sp226Paths.Require("Include", "FilterQuery.xml");
        var xml = File.ReadAllText(path);
        var tree = XmlStructureParser.Parse(xml);
        Assert.NotNull(tree);
        Assert.True(tree!.Children.Count > 0 || tree.Name.Length > 0);
    }

    [Sp226Fact]
    public void SqlExtractor_Dir_Customer_returns_without_throw()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var xml = File.ReadAllText(path);
        var fragments = FboSqlFragmentExtractor.Extract(xml);
        Assert.NotNull(fragments);
    }
}

public class FboXmlWriterRoundtripTests
{
    [Fact]
    public void ApplyLayout_updates_column_widths_on_synthetic_dir()
    {
        const string xml = """
            <?xml version="1.0" encoding="utf-8"?>
            <dir xmlns="urn:schemas-fast-com:data-dir" table="dmkh" code="ma_kh">
              <title v="KH" e="Cust"/>
              <fields>
                <field name="ma_kh"><header v="Mã" e="Code"/></field>
              </fields>
              <views>
                <view id="Dir" height="100">
                  <categories>
                    <category index="0" columns="100, 200">
                      <header v="Chung" e="General"/>
                    </category>
                  </categories>
                  <item value="100, 200"/>
                  <item value="[ma_kh]"/>
                </view>
              </views>
            </dir>
            """;

        var parser = new FboXmlParser();
        var doc = parser.Parse(xml, "Synthetic.xml");
        Assert.NotNull(doc.Form?.Layout);

        doc.Form!.Layout!.ColumnWidths = [120, 240];
        if (doc.Form.Layout.Categories.Count > 0)
            doc.Form.Layout.Categories[0].ColumnWidths = [120, 240];

        var writer = new FboXmlWriter();
        var written = writer.ApplyLayout(xml, doc.Form);

        Assert.Contains("120, 240", written, StringComparison.Ordinal);
        var again = parser.Parse(written, "Synthetic.xml");
        Assert.NotNull(again.Form?.Layout);
        Assert.Equal(2, again.Form!.Layout!.ColumnWidths.Count);
        Assert.Equal(120, again.Form.Layout.ColumnWidths[0]);
        Assert.Equal(240, again.Form.Layout.ColumnWidths[1]);
    }

    [Fact]
    public void ParseCategories_without_header_does_not_throw()
    {
        const string xml = """
            <?xml version="1.0" encoding="utf-8"?>
            <dir xmlns="urn:schemas-fast-com:data-dir" table="t" code="c">
              <title v="T" e="T"/>
              <fields>
                <field name="c"><header v="C" e="C"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <categories>
                    <category index="0" columns="100"/>
                  </categories>
                  <item value="100"/>
                  <item value="[c]"/>
                </view>
              </views>
            </dir>
            """;

        var doc = new FboXmlParser().Parse(xml);
        Assert.NotNull(doc.Form?.Layout);
        Assert.Single(doc.Form!.Layout!.Categories);
        Assert.Equal(string.Empty, doc.Form.Layout.Categories[0].HeaderV);
        Assert.Equal(string.Empty, doc.Form.Layout.Categories[0].HeaderE);
    }
}
