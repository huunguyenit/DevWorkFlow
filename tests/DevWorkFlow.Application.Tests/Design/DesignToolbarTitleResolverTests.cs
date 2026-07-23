using DevWorkFlow.Application.Design;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignToolbarTitleResolverTests
{
    private static DesignToolbarBundle Bundle() =>
        new(new Dictionary<string, DesignToolbarSystemItem>(StringComparer.OrdinalIgnoreCase)
        {
            ["Toolbar.Down"] = new("Toolbar.Down", "Xuống", "Down", HasText: false),
            ["Toolbar.Insert"] = new("Toolbar.Insert", "Thêm dòng", "Insert", HasText: false),
            ["Toolbar.Remove"] = new("Toolbar.Remove", "Xóa", "Remove", HasText: true)
        });

    [Fact]
    public void Resolve_ToolbarKey_UsesCatalog()
    {
        var btn = new GridToolbarButton
        {
            Command = "Down",
            Title = new LocalizedText { V = "Toolbar.Down", E = "Toolbar.Down" }
        };

        var info = DesignToolbarTitleResolver.Resolve(btn, vietnamese: true, Bundle());

        Assert.Equal("Down", info.CssClass);
        Assert.Equal("Xuống", info.Tooltip);
        Assert.False(info.ShowLabel);
        Assert.Equal(22, info.WidthPx);
    }

    [Fact]
    public void Resolve_HasTextTrue_RendersFullCatalogLabel()
    {
        var btn = new GridToolbarButton
        {
            Command = "Remove",
            Title = new LocalizedText { V = "Toolbar.Remove", E = "Toolbar.Remove" }
        };

        var info = DesignToolbarTitleResolver.Resolve(btn, vietnamese: true, Bundle());

        Assert.Equal("TextRemove", info.CssClass);
        Assert.Equal("Xóa", info.DisplayText);
        Assert.True(info.ShowLabel);
        Assert.False(info.HasFixedWidth);
    }

    [Fact]
    public void Resolve_DollarDollarWidth_UsesTextCommandClass()
    {
        var btn = new GridToolbarButton
        {
            Command = "Lookup",
            Title = new LocalizedText { V = "Xem phiếu nhập$$120", E = "Lookup$" }
        };

        var info = DesignToolbarTitleResolver.Resolve(btn, vietnamese: true, Bundle());

        Assert.Equal("TextLookup", info.CssClass);
        Assert.Equal("Xem phiếu nhập", info.DisplayText);
        Assert.Equal(120, info.WidthPx);
        Assert.True(info.ShowLabel);
        Assert.True(info.HasFixedWidth);
    }

    [Fact]
    public void SplitWidthSuffix_ParsesTextAndPx()
    {
        var (text, width) = DesignToolbarTitleResolver.SplitWidthSuffix("Xem phiếu nhập$$120");
        Assert.Equal("Xem phiếu nhập", text);
        Assert.Equal(120, width);
    }

    [Fact]
    public void Resolve_MenuItems_UsesGroupCommandClass()
    {
        var btn = new GridToolbarButton
        {
            Command = "Extra",
            Title = new LocalizedText { V = "Khác...", E = "More..." },
            MenuItems =
            [
                new GridToolbarMenuItem
                {
                    CommandArgument = "05",
                    Header = new LocalizedText { V = "Chèn dòng...", E = "Insert..." }
                }
            ]
        };

        var info = DesignToolbarTitleResolver.Resolve(btn, vietnamese: true, Bundle());

        Assert.Equal("GroupExtra", info.CssClass);
        Assert.True(info.HasMenuItems);
        Assert.False(info.ShowLabel);
    }

    [Fact]
    public void Resolve_MenuItemsWithWidth_UsesTextGroupCommandClass()
    {
        var btn = new GridToolbarButton
        {
            Command = "Extra",
            Title = new LocalizedText { V = "Khác...$$80", E = "More...$$80" },
            MenuItems =
            [
                new GridToolbarMenuItem { CommandArgument = "10", Header = new LocalizedText { V = "A", E = "A" } }
            ]
        };

        var info = DesignToolbarTitleResolver.Resolve(btn, vietnamese: true, Bundle());

        Assert.Equal("TextGroupExtra", info.CssClass);
        Assert.Equal("Khác...", info.DisplayText);
        Assert.Equal(80, info.WidthPx);
        Assert.True(info.HasMenuItems);
        Assert.True(info.ShowLabel);
    }
}
