using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignControllerCssRewriterTests
{
    [Fact]
    public void Generator_RewritesControllerToolbarCssToProgramImages()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="ma"><header v="Mã" e="Code"/></field></fields>
              <views><view id="Dir"><item value="100"/><item value="1: [ma]"/></view></views>
              <css><text><![CDATA[
            div.ImportData{background-image:url(../images/Upload.png);background-repeat:no-repeat;background-position:0 0;}
            div.Download{background-image:url(../Images/Download.png);background-repeat:no-repeat;background-position:0 0;}
            ]]></text></css>
            </dir>
            """;
        var document = new FboXmlParser().Parse(xml, "T.xml");
        var request = new DesignRenderRequest(
            document,
            Vietnamese: true,
            Assets: DesignAssetSet.Empty,
            FieldIdentities: new Dictionary<string, DesignElementIdentity>(),
            DetailDocuments: new Dictionary<string, FboControllerDocument>());

        var html = new DesignHtmlGenerator().Generate(request).Html;

        Assert.Contains(
            "div.ImportData{background-image:url(\"https://devworkflow.program/Images/Upload.png\")",
            html);
        Assert.Contains(
            "div.Download{background-image:url(\"https://devworkflow.program/Images/Download.png\")",
            html);
        Assert.DoesNotContain("data:image/png;base64,UP", html);
        Assert.DoesNotContain("../images/Upload.png", html);
        Assert.DoesNotContain("../Images/Download.png", html);
    }

    [Fact]
    public void ToProgramImagesUrl_NormalizesRelativePathToImagesFolder()
    {
        Assert.Equal(
            "https://devworkflow.program/Images/Download.png",
            DesignControllerCssRewriter.ToProgramImagesUrl("../Images/Download.png"));
        Assert.Equal(
            "https://devworkflow.program/Images/Upload.png",
            DesignControllerCssRewriter.ToProgramImagesUrl("../images/Upload.png"));
    }
}
