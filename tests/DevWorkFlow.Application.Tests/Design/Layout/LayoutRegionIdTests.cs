using DevWorkFlow.Application.Design.Layout;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutRegionIdTests
{
    [Theory]
    [InlineData("main", LayoutRegionKind.Main, 0)]
    [InlineData("MAIN", LayoutRegionKind.Main, 0)]
    [InlineData("footer", LayoutRegionKind.Footer, 0)]
    [InlineData("cat:1", LayoutRegionKind.Category, 1)]
    [InlineData("cat:9", LayoutRegionKind.Category, 9)]
    public void TryParse_AcceptsCanonicalIds(string raw, LayoutRegionKind kind, int index)
    {
        Assert.True(LayoutRegionId.TryParse(raw, out var id));
        Assert.Equal(kind, id.Kind);
        Assert.Equal(index, id.CategoryIndex);
        Assert.Equal(raw.ToLowerInvariant().StartsWith("cat") ? $"cat:{index}" : raw.ToLowerInvariant(), id.ToString());
    }

    [Theory]
    [InlineData(null)]
    [InlineData("")]
    [InlineData(" ")]
    [InlineData("header")]
    [InlineData("cat")]
    [InlineData("cat:")]
    [InlineData("cat:x")]
    [InlineData("cat:0")]
    [InlineData("cat:-1")]
    public void TryParse_RejectsInvalid(string? raw)
    {
        Assert.False(LayoutRegionId.TryParse(raw, out _));
    }

    [Fact]
    public void TryParseSlotAttr_ReadsRegionRowColSpan()
    {
        Assert.True(LayoutRegionId.TryParseSlotAttr("main:2:3:1", out var region, out var row, out var col, out var span));
        Assert.Equal(LayoutRegionId.Main, region);
        Assert.Equal(2, row);
        Assert.Equal(3, col);
        Assert.Equal(1, span);
    }

    [Fact]
    public void TryParseSlotAttr_Category()
    {
        Assert.True(LayoutRegionId.TryParseSlotAttr("cat:1:0:2:2", out var region, out var row, out var col, out var span));
        Assert.Equal(LayoutRegionKind.Category, region.Kind);
        Assert.Equal(1, region.CategoryIndex);
        Assert.Equal(0, row);
        Assert.Equal(2, col);
        Assert.Equal(2, span);
    }
}
