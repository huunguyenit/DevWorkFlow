using DevWorkFlow.Application.Design;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignCssPackSelectionTests
{
    [Fact]
    public void SelectConfigPacks_Form_InjectsFormAndLookup_NotToolbar()
    {
        var bundle = new DesignCssBundle(
        [
            Pack("fbo-form", order: 10, kinds: ["Form"], css: ".FormInput{}"),
            Pack("fbo-grid", order: 20, kinds: ["Form", "Grid"], css: ".GridTable{}"),
            Pack("fbo-tabs", order: 30, kinds: ["Form"], require_categories: true, css: ".DwfTabs{}"),
            Pack("fbo-toolbar", order: 40, kinds: ["Grid"], require_toolbar: true, css: ".DwfGridToolbar{}"),
            Pack("fbo-lookup", order: 50, kinds: ["Form"], css: ".CellImgLookup{}")
        ]);

        var html = new DesignHtmlGenerator().Generate(
            DesignTestData.CreateDirRequest() with { CssBundle = bundle }).Html;

        Assert.Contains("data-dwf-source=\"config\" data-dwf-pack=\"fbo-form\"", html);
        Assert.Contains("data-dwf-pack=\"fbo-grid\"", html);
        Assert.Contains("data-dwf-pack=\"fbo-lookup\"", html);
        Assert.DoesNotContain("data-dwf-pack=\"fbo-tabs\"", html); // no categories
        Assert.DoesNotContain("data-dwf-pack=\"fbo-toolbar\"", html);
        Assert.Contains(".FormInput{}", html);
        // cascade: ide before config before controller
        var ide = html.IndexOf("data-dwf-source=\"ide\"", StringComparison.Ordinal);
        var config = html.IndexOf("data-dwf-source=\"config\"", StringComparison.Ordinal);
        var controller = html.IndexOf("data-dwf-source=\"controller\"", StringComparison.Ordinal);
        Assert.True(ide >= 0 && config > ide && controller > config);
    }

    [Fact]
    public void SelectConfigPacks_RespectsExcludeController()
    {
        var bundle = new DesignCssBundle(
        [
            Pack("fbo-form", order: 10, kinds: ["Form"], css: ".FormInput{}",
                exclude: ["Customer"])
        ]);

        var html = new DesignHtmlGenerator().Generate(
            DesignTestData.CreateDirRequest() with { CssBundle = bundle }).Html;

        Assert.DoesNotContain("data-dwf-pack=\"fbo-form\"", html);
    }

    private static DesignCssPack Pack(
        string id,
        int order,
        string[] kinds,
        string css,
        bool require_categories = false,
        bool require_toolbar = false,
        string[]? exclude = null) =>
        new(id, css, order, kinds, require_categories, RequireDetailGrid: false, require_toolbar,
            Controllers: ["*"], ExcludeControllers: exclude);
}
