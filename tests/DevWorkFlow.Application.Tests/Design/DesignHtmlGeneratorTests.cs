using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignHtmlGeneratorTests
{
    [Fact]
    public void Generator_EmitsUtf8DocumentAndStaticAssets()
    {
        var request = DesignTestData.CreateGridRequest(
            assets: new DesignAssetSet(
                "Main/arkh.aspx",
                "Main/MasterPage.master",
                ["Css/Menu.css"],
                ["ClientScript/j8.js"],
                []));

        var html = new DesignHtmlGenerator().Generate(request).Html;

        Assert.Contains("<meta charset=\"utf-8\">", html);
        Assert.Contains("https://devworkflow.program/Css/Menu.css", html);
        Assert.Contains("https://devworkflow.program/ClientScript/j8.js", html);
    }

    [Fact]
    public void Generator_EmitsFullDirDocumentWithBothStylesAndNoAxd()
    {
        var html = new DesignHtmlGenerator().Generate(DesignTestData.CreateDirRequest()).Html;

        Assert.Contains("<!doctype html>", html, StringComparison.OrdinalIgnoreCase);
        Assert.Contains("<style data-dwf-source=\"ide\">", html);
        Assert.Contains("<style data-dwf-source=\"controller\">", html);
        Assert.Contains(".LabelDescription", html);
        Assert.Contains("data-dwf-controller=\"Customer\"", html);
        Assert.Contains("class=\"FormTable\"", html);
        Assert.DoesNotContain("WebResource.axd", html);
        Assert.DoesNotContain("ScriptResource.axd", html);
    }

    [Fact]
    public void Generate_WhenBlueprintEnabled_AddsBodyClassAndCss()
    {
        var html = new DesignHtmlGenerator()
            .Generate(DesignTestData.CreateDirRequest(enable_blueprint: true)).Html;

        Assert.Contains("<body class=\"dwf-blueprint\">", html);
        Assert.Contains("<style data-dwf-source=\"blueprint\">", html);
        Assert.Contains("fbo-design-blueprint.css", html); // comment đầu file CSS
        Assert.Contains("body.dwf-blueprint td[data-dwf-slot]", html);
        Assert.Contains("dwf-blueprint-selected-slot", html);
    }

    [Fact]
    public void Generate_WhenBlueprintDisabled_HasNoBlueprintLayer()
    {
        var html = new DesignHtmlGenerator().Generate(DesignTestData.CreateDirRequest()).Html;

        Assert.Contains("<body>", html);
        Assert.DoesNotContain("dwf-blueprint", html);
        Assert.DoesNotContain("data-dwf-source=\"blueprint\"", html);
    }

    [Fact]
    public void Generator_EmitsGridTableForGridController()
    {
        var html = new DesignHtmlGenerator().Generate(
            DesignTestData.CreateGridRequest(DesignAssetSet.Empty)).Html;

        Assert.Contains("class=\"GridTable\"", html);
    }
}

/// <summary>Dữ liệu test dùng chung cho các test Design (giữ local ở namespace test).</summary>
internal static class DesignTestData
{
    public static DesignRenderRequest CreateGridRequest(DesignAssetSet assets)
    {
        var grid = new FboGridModel
        {
            ControllerName = "Customer",
            Title = new LocalizedText { V = "Danh mục khách", E = "Customer" }
        };
        grid.Fields.Add(new FboField
        {
            Name = "ma_kh",
            Width = 100,
            Header = new LocalizedText { V = "Mã khách", E = "Customer code" }
        });
        grid.FieldsByName = grid.Fields.ToDictionary(f => f.Name, StringComparer.OrdinalIgnoreCase);
        grid.VisibleFieldNames = ["ma_kh"];

        var document = FboControllerDocument.FromGrid(grid, "Grid/Customer.xml", "<grid/>");
        return new DesignRenderRequest(
            document,
            Vietnamese: true,
            Assets: assets,
            FieldIdentities: new Dictionary<string, DesignElementIdentity>(),
            DetailDocuments: new Dictionary<string, FboControllerDocument>());
    }

    public static DesignRenderRequest CreateDirRequest(bool enable_blueprint = false)
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="Khách" e="Customer"/>
              <fields>
                <field name="ma_kh"><header v="Mã khách" e="Customer"/></field>
              </fields>
              <views>
                <view id="Dir" height="100">
                  <item value="120, 200"/>
                  <item value="11: [ma_kh].Label, [ma_kh]"/>
                </view>
              </views>
              <css><text><![CDATA[.LabelDescription{color:#73A6DE;}]]></text></css>
            </dir>
            """;
        var document = new FboXmlParser().Parse(xml, "Customer.xml");
        return new DesignRenderRequest(
            document,
            Vietnamese: true,
            Assets: DesignAssetSet.Empty,
            FieldIdentities: new Dictionary<string, DesignElementIdentity>(),
            DetailDocuments: new Dictionary<string, FboControllerDocument>(),
            EnableBlueprint: enable_blueprint);
    }
}
