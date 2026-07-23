using DevWorkFlow.Application.Design.Toolbox;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Toolbox;

public sealed class BlueprintThemeCatalogTests
{
    [Fact]
    public void MissingFile_ReturnsDefaults()
    {
        var theme = new BlueprintThemeCatalog("Z:\\nope\\blueprint-theme.json").GetTheme();

        Assert.Equal(BlueprintTheme.Default.ColumnGuide, theme.ColumnGuide);
        Assert.Equal(12, theme.TopResizeHitPx);
    }

    [Fact]
    public void ToJsonObject_ContainsKeysForScriptInjection()
    {
        var json = BlueprintTheme.Default.ToJsonObject();

        Assert.Contains("columnGuide", json);
        Assert.Contains("splitDivider", json);
        Assert.Contains("anchorIcon", json);
        Assert.Contains("topResizeHitPx", json);
    }
}
