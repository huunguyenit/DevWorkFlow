using DevWorkFlow.Application.Design;
using DevWorkFlow.Infrastructure.Design;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignCssCatalogTests
{
    [Fact]
    public void GetBundle_LoadsManifestAndCssFiles()
    {
        var root = CreateTempCssRoot();
        try
        {
            File.WriteAllText(Path.Combine(root, "manifest.json"), """
                {
                  "packs": [
                    {
                      "id": "fbo-form",
                      "path": "fbo-form.css",
                      "enabled": true,
                      "order": 10,
                      "displayKinds": ["Form"],
                      "controllers": ["*"]
                    },
                    {
                      "id": "disabled",
                      "path": "missing.css",
                      "enabled": false,
                      "order": 99,
                      "displayKinds": ["Form"]
                    }
                  ]
                }
                """);
            File.WriteAllText(Path.Combine(root, "fbo-form.css"), ".FormInput{border:0}");

            var bundle = new DesignCssCatalog(root).GetBundle();

            Assert.Single(bundle.Packs);
            Assert.Equal("fbo-form", bundle.Packs[0].Id);
            Assert.Contains(".FormInput{border:0}", bundle.Packs[0].CssText);
            Assert.Equal(["Form"], bundle.Packs[0].DisplayKinds);
        }
        finally
        {
            Directory.Delete(root, recursive: true);
        }
    }

    [Fact]
    public void GetBundle_RewritesRelativeUrlToDataUri()
    {
        var root = CreateTempCssRoot();
        try
        {
            // 1x1 GIF
            var gif = Convert.FromBase64String("R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7");
            File.WriteAllBytes(Path.Combine(root, "icon.gif"), gif);
            File.WriteAllText(Path.Combine(root, "manifest.json"), """
                {
                  "packs": [
                    {
                      "id": "lookup",
                      "path": "lookup.css",
                      "enabled": true,
                      "order": 1,
                      "displayKinds": ["Form"]
                    }
                  ]
                }
                """);
            File.WriteAllText(Path.Combine(root, "lookup.css"),
                ".CellImgLookup{background-image:url(icon.gif);background-position:-16px 0}");

            var css = new DesignCssCatalog(root).GetBundle().Packs[0].CssText;

            Assert.Contains("data:image/gif;base64,", css);
            Assert.DoesNotContain("url(icon.gif)", css);
            Assert.Contains("background-position:-16px 0", css);
        }
        finally
        {
            Directory.Delete(root, recursive: true);
        }
    }

    [Fact]
    public void GetBundle_MissingRoot_ReturnsEmpty()
    {
        var bundle = new DesignCssCatalog(Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString("N")))
            .GetBundle();
        Assert.Empty(bundle.Packs);
    }

    private static string CreateTempCssRoot()
    {
        var dir = Path.Combine(Path.GetTempPath(), "dwf-css-" + Guid.NewGuid().ToString("N"));
        Directory.CreateDirectory(dir);
        return dir;
    }
}
