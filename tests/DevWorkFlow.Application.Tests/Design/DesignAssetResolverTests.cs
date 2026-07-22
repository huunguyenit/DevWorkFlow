using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Design;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignAssetResolverTests
{
    private const string PageAspx = """
        <%@ Page MasterPageFile="~/Main/MasterPage.master" %>
        <FastBusiness:ReportExtender Controller="Customer" />
        """;

    private const string MasterAspx = """
        <%@ Master Language="VB" %>
        <link href="~/Css/Menu.css?v=1" rel="stylesheet" />
        <CompositeScript Path="~/ClientScript/j8.js"></CompositeScript>
        <script src="~/ClientScript/custom.js"></script>
        <link href="~/WebResource.axd?x=1" rel="stylesheet" />
        """;

    private static ProgramFixture NewProgram()
    {
        var root = Path.Combine(Path.GetTempPath(), $"dwf-assets-{Guid.NewGuid():N}");
        Directory.CreateDirectory(Path.Combine(root, "Main"));
        File.WriteAllText(Path.Combine(root, "Main", "arkh.aspx"), PageAspx);
        File.WriteAllText(Path.Combine(root, "Main", "MasterPage.master"), MasterAspx);
        Directory.CreateDirectory(Path.Combine(root, "App_Data", "Controllers", "Grid"));
        File.WriteAllText(
            Path.Combine(root, "App_Data", "Controllers", "Grid", "CustomerUnitDetail.xml"),
            "<grid xmlns=\"urn:schemas-fast-com:data-grid\"><fields/></grid>");
        return new ProgramFixture(root);
    }

    [Fact]
    public async Task Resolve_MenuMatch_CollectsMasterAssetsAndRejectsAxd()
    {
        using var program = NewProgram();
        var menu = new FakeMenuService(new MenuTreeNode { SysId = "Customer", Link = "arkh.aspx" });
        var resolver = new DesignAssetResolver(menu);

        var assets = await resolver.ResolveAsync(program.Context, "Customer");

        Assert.Equal("Main/arkh.aspx", assets.MainRelativePath);
        Assert.Equal("Main/MasterPage.master", assets.MasterRelativePath);
        Assert.Equal(["Css/Menu.css"], assets.Stylesheets);
        Assert.Equal(["ClientScript/j8.js", "ClientScript/custom.js"], assets.Scripts);
        Assert.DoesNotContain(assets.Stylesheets, x => x.Contains(".axd"));
    }

    [Fact]
    public async Task Resolve_NoMenuRow_FallsBackToScanningMainAspx()
    {
        using var program = NewProgram();
        var resolver = new DesignAssetResolver(new FakeMenuService()); // empty menu

        var assets = await resolver.ResolveAsync(program.Context, "Customer");

        Assert.Equal("Main/arkh.aspx", assets.MainRelativePath);
        Assert.Equal(["Css/Menu.css"], assets.Stylesheets);
    }

    [Fact]
    public async Task Resolve_MissingMaster_ReturnsEmptyAssetListsWithoutThrowing()
    {
        using var program = NewProgram();
        // Remove master → page has no assets → empty lists but main still resolves.
        File.Delete(Path.Combine(program.Root, "Main", "MasterPage.master"));
        var resolver = new DesignAssetResolver(new FakeMenuService());

        var assets = await resolver.ResolveAsync(program.Context, "Customer");

        Assert.Equal("Main/arkh.aspx", assets.MainRelativePath);
        Assert.Null(assets.MasterRelativePath);
        Assert.Empty(assets.Stylesheets);
        Assert.Empty(assets.Scripts);
    }

    [Fact]
    public void RelatedLocator_FindsGridXmlUnderControllers()
    {
        using var program = NewProgram();
        var locator = new DesignRelatedDocumentLocator();

        var path = locator.FindGridPath(program.Context, "CustomerUnitDetail");

        Assert.NotNull(path);
        Assert.EndsWith("CustomerUnitDetail.xml", path);
    }

    private sealed class ProgramFixture(string root) : IDisposable
    {
        public string Root { get; } = root;
        public ProgramContext Context { get; } = new() { ProgramPath = root };
        public void Dispose()
        {
            if (Directory.Exists(Root)) Directory.Delete(Root, recursive: true);
        }
    }

    private sealed class FakeMenuService(params MenuTreeNode[] nodes) : IMenuService
    {
        public Task<IReadOnlyList<MenuTreeNode>> LoadMenuTreeAsync(ProgramContext program) =>
            Task.FromResult<IReadOnlyList<MenuTreeNode>>(nodes);

        public MenuResourceBundle ResolveFromMenu(ProgramContext program, MenuTreeNode menu_node) =>
            new();
    }
}
