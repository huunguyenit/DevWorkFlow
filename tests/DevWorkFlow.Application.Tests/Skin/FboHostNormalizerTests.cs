using System.Linq;
using DevWorkFlow.Application.Skin;
using DevWorkFlow.Infrastructure.Skin;
using Xunit;

namespace DevWorkFlow.Application.Tests.Skin;

public class FboHostNormalizerTests
{
    // Fixture mô phỏng DOM runtime FBO (theo SP226/Main/Server.master): #bodyWrapper > #mpMainBody là
    // vùng nội dung; #mpHeader là chrome. Asset: Css/, ClientScript/, Images/, favicon + external + .axd.
    private const string FboShell = """
        <html><head>
        <link href="Css/Menu.css?v=1" rel="stylesheet" type="text/css"/>
        <link href="../favicon.ico" rel="shortcut icon" type="image/ico"/>
        <script src="ClientScript/MD5.js" type="text/javascript"></script>
        <script src="https://cdn.other.com/lib.js"></script>
        <script src="/ScriptResource.axd?d=abc123"></script>
        </head><body>
        <div id="mpHeader">MENU CHROME</div>
        <div id="bodyWrapper"><div id="mpMainBody"><span>OLD FORM CONTENT</span></div></div>
        <img src="Images/logo.png"/>
        </body></html>
        """;

    [Fact]
    public void Normalize_FboShell_InsertsHostPlaceholder_AndClearsContent()
    {
        var result = new FboHostNormalizer().Normalize(FboShell);

        Assert.Equal(HostStatus.Found, result.HostStatus);
        Assert.Equal("//*[@id='mpMainBody']", result.HostSelector);
        Assert.Contains("id=\"dwf-designer-host\"", result.Html);
        Assert.Contains("data-dwf-host=\"true\"", result.Html);
        // Nội dung form cũ bị xoá khỏi vùng host.
        Assert.DoesNotContain("OLD FORM CONTENT", result.Html);
        // Chrome giữ nguyên.
        Assert.Contains("MENU CHROME", result.Html);
    }

    [Fact]
    public void Normalize_RewritesLocalAssets_ToAssetsFolder()
    {
        var result = new FboHostNormalizer().Normalize(FboShell);

        var css = result.Assets.Single(a => a.OriginalUrl == "Css/Menu.css?v=1");
        Assert.Equal("Css/Menu.css", css.RelativePath);
        Assert.Equal("assets/Css/Menu.css", css.RewrittenUrl);
        Assert.Equal(SkinAssetKind.Css, css.Kind);
        Assert.Equal(AssetResolveStatus.Pending, css.Status);
        Assert.Contains("assets/Css/Menu.css", result.Html);

        var js = result.Assets.Single(a => a.OriginalUrl == "ClientScript/MD5.js");
        Assert.Equal("ClientScript/MD5.js", js.RelativePath);
        Assert.Equal(SkinAssetKind.Script, js.Kind);

        var img = result.Assets.Single(a => a.OriginalUrl == "Images/logo.png");
        Assert.Equal("Images/logo.png", img.RelativePath);
        Assert.Equal(SkinAssetKind.Image, img.Kind);

        var ico = result.Assets.Single(a => a.OriginalUrl == "../favicon.ico");
        Assert.Equal("favicon.ico", ico.RelativePath);
        Assert.Equal(SkinAssetKind.Icon, ico.Kind);
    }

    [Fact]
    public void Normalize_ExternalAndDynamic_MarkedUnresolved_AndNotRewritten()
    {
        var result = new FboHostNormalizer().Normalize(FboShell);

        var external = result.Assets.Single(a => a.OriginalUrl == "https://cdn.other.com/lib.js");
        Assert.Equal(AssetResolveStatus.Unresolved, external.Status);
        Assert.Equal(string.Empty, external.RelativePath);
        Assert.Equal("https://cdn.other.com/lib.js", external.RewrittenUrl);
        Assert.Contains("https://cdn.other.com/lib.js", result.Html); // giữ nguyên

        var axd = result.Assets.Single(a => a.OriginalUrl == "/ScriptResource.axd?d=abc123");
        Assert.Equal(AssetResolveStatus.Unresolved, axd.Status);
        Assert.Contains(".axd", axd.Note);
    }

    [Fact]
    public void Normalize_NoKnownContainer_ReturnsNotFound_AndKeepsShell()
    {
        const string html = "<html><body><div id='someUnknownArea'><p>KEEP ME</p></div></body></html>";

        var result = new FboHostNormalizer().Normalize(html);

        Assert.Equal(HostStatus.NotFound, result.HostStatus);
        Assert.Null(result.HostSelector);
        Assert.DoesNotContain("dwf-designer-host", result.Html);
        Assert.Contains("KEEP ME", result.Html);
    }
}
