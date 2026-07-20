using System.Collections.Generic;
using System.IO;
using DevWorkFlow.Application.Skin;
using DevWorkFlow.Infrastructure.Skin;
using Xunit;

namespace DevWorkFlow.Application.Tests.Skin;

public class ProgramAssetResolverTests
{
    [Fact]
    public void ResolveAndMirror_CopiesExistingFiles_AndFlagsMissingOrExternal()
    {
        var temp = Path.Combine(Path.GetTempPath(), "dwf-skin-test-" + Guid.NewGuid().ToString("N"));
        var program_root = Path.Combine(temp, "program");
        var assets_dir = Path.Combine(temp, "skin", "assets");
        try
        {
            // Dựng cây Program giả: Css/Menu.css + ClientScript/j8.js.
            Directory.CreateDirectory(Path.Combine(program_root, "Css"));
            Directory.CreateDirectory(Path.Combine(program_root, "ClientScript"));
            File.WriteAllText(Path.Combine(program_root, "Css", "Menu.css"), "body{}");
            File.WriteAllText(Path.Combine(program_root, "ClientScript", "j8.js"), "//js");

            var assets = new List<SkinAssetEntry>
            {
                new() { OriginalUrl = "Css/Menu.css", RelativePath = "Css/Menu.css", Kind = SkinAssetKind.Css, Status = AssetResolveStatus.Pending },
                new() { OriginalUrl = "ClientScript/j8.js", RelativePath = "ClientScript/j8.js", Kind = SkinAssetKind.Script, Status = AssetResolveStatus.Pending },
                new() { OriginalUrl = "Images/missing.png", RelativePath = "Images/missing.png", Kind = SkinAssetKind.Image, Status = AssetResolveStatus.Pending },
                new() { OriginalUrl = "https://cdn.other/x.js", RelativePath = "", Kind = SkinAssetKind.Script, Status = AssetResolveStatus.Unresolved, Note = "external host" }
            };

            var result = new ProgramAssetResolver().ResolveAndMirror(assets, program_root, assets_dir);

            Assert.Equal(2, result.ResolvedCount);
            Assert.Equal(2, result.UnresolvedCount);

            Assert.True(File.Exists(Path.Combine(assets_dir, "Css", "Menu.css")));
            Assert.True(File.Exists(Path.Combine(assets_dir, "ClientScript", "j8.js")));

            Assert.Equal(AssetResolveStatus.Resolved, assets[0].Status);
            Assert.Equal(AssetResolveStatus.Resolved, assets[1].Status);
            Assert.Equal(AssetResolveStatus.Unresolved, assets[2].Status);
            Assert.Equal("file not found under program_root", assets[2].Note);
            Assert.Equal(AssetResolveStatus.Unresolved, assets[3].Status);
        }
        finally
        {
            if (Directory.Exists(temp)) Directory.Delete(temp, recursive: true);
        }
    }
}
