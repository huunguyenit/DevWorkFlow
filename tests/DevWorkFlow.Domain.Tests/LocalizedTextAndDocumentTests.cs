using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Domain.Tests;

public class LocalizedTextTests
{
    [Fact]
    public void Get_prefers_vietnamese_when_available()
    {
        var text = new LocalizedText { V = "Khách hàng", E = "Customer" };
        Assert.Equal("Khách hàng", text.Get(vietnamese: true));
        Assert.Equal("Customer", text.Get(vietnamese: false));
    }

    [Fact]
    public void Get_falls_back_when_preferred_empty()
    {
        var text = new LocalizedText { V = "", E = "Customer" };
        Assert.Equal("Customer", text.Get(vietnamese: true));

        text = new LocalizedText { V = "Khách hàng", E = "" };
        Assert.Equal("Khách hàng", text.Get(vietnamese: false));
    }
}

public class FboControllerDocumentTests
{
    [Fact]
    public void FromForm_sets_display_and_folder_kind()
    {
        var form = new FboFormModel
        {
            FolderKind = ControllerFolderKind.Dir,
            ControllerName = "Customer",
            Title = new LocalizedText { V = "Khách hàng" }
        };

        var doc = FboControllerDocument.FromForm(form, @"C:\Customer.xml", "<dir/>");

        Assert.Equal(ControllerDisplayKind.Form, doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Dir, doc.FolderKind);
        Assert.Equal("Customer", doc.ControllerName);
        Assert.Same(form, doc.Form);
        Assert.Null(doc.Grid);
        Assert.Null(doc.Lookup);
    }

    [Fact]
    public void FromGrid_and_FromLookup_set_expected_kinds()
    {
        var grid = new FboGridModel { ControllerName = "SODetail" };
        var lookup = new FboLookupModel { ControllerName = "Customer" };

        var grid_doc = FboControllerDocument.FromGrid(grid, "SODetail.f", "<grid/>");
        var lookup_doc = FboControllerDocument.FromLookup(lookup, "Customer.xml", "<lookup/>");

        Assert.Equal(ControllerDisplayKind.Grid, grid_doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Grid, grid_doc.FolderKind);
        Assert.Equal(ControllerDisplayKind.Lookup, lookup_doc.DisplayKind);
        Assert.Equal(ControllerFolderKind.Lookup, lookup_doc.FolderKind);
    }
}
