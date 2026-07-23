using DevWorkFlow.Application.Engine;
using Xunit;

namespace DevWorkFlow.Application.Tests.Engine;

public sealed class ShowFormRelatedPathResolverTests : IDisposable
{
    private readonly string _controllers =
        Path.Combine(Path.GetTempPath(), $"fbo-showform-{Guid.NewGuid():N}");

    public ShowFormRelatedPathResolverTests() => Directory.CreateDirectory(_controllers);

    [Theory]
    [InlineData("SVOrderFilter", "SVOrder")]
    [InlineData("SVOrderMultiForm", "SVOrder")]
    [InlineData("SVOrderMultiGrid", "SVOrder")]
    [InlineData("SVOrderLookup", "SVOrder")]
    [InlineData("PlainName", "PlainName")]
    public void StemFromShowFormName_strips_known_suffix(string input, string expected)
    {
        Assert.Equal(expected, ShowFormRelatedPathResolver.StemFromShowFormName(input));
    }

    [Fact]
    public void FindRelatedFiles_returns_all_matches_across_filter_lookup_grid()
    {
        var filter_dir = Path.Combine(_controllers, "Filter");
        var grid_dir = Path.Combine(_controllers, "Grid");
        var lookup_dir = Path.Combine(_controllers, "Lookup");
        Directory.CreateDirectory(filter_dir);
        Directory.CreateDirectory(grid_dir);
        Directory.CreateDirectory(lookup_dir);

        File.WriteAllText(Path.Combine(filter_dir, "SVOrderFilter.xml"), "<dir/>");
        File.WriteAllText(Path.Combine(filter_dir, "SVOrderMultiForm.xml"), "<dir/>");
        File.WriteAllText(Path.Combine(grid_dir, "SVOrderMultiGrid.xml"), "<dir/>");
        File.WriteAllText(Path.Combine(lookup_dir, "SVOrderFilter.xml"), "<dir/>");
        // Unrelated file — không match stem "SVOrder".
        File.WriteAllText(Path.Combine(filter_dir, "CustomerFilter.xml"), "<dir/>");

        var result = ShowFormRelatedPathResolver.FindRelatedFiles(_controllers, "SVOrderFilter");

        Assert.Equal(4, result.Count);
        Assert.DoesNotContain(result, p => p.Contains("CustomerFilter", StringComparison.OrdinalIgnoreCase));
    }

    [Fact]
    public void FindRelatedFiles_caps_at_max_files()
    {
        var filter_dir = Path.Combine(_controllers, "Filter");
        Directory.CreateDirectory(filter_dir);
        for (var i = 0; i < 5; i++)
            File.WriteAllText(Path.Combine(filter_dir, $"SVOrderFilter{i}.xml"), "<dir/>");

        var result = ShowFormRelatedPathResolver.FindRelatedFiles(_controllers, "SVOrderFilter", max_files: 2);

        Assert.Equal(2, result.Count);
    }

    [Fact]
    public void FindRelatedFiles_prefers_xml_over_f_for_same_logical_name()
    {
        var filter_dir = Path.Combine(_controllers, "Filter");
        Directory.CreateDirectory(filter_dir);
        File.WriteAllText(Path.Combine(filter_dir, "SVOrderFilter.xml"), "<dir/>");
        File.WriteAllText(Path.Combine(filter_dir, "SVOrderFilter.f"), "<dir/>");

        var result = ShowFormRelatedPathResolver.FindRelatedFiles(_controllers, "SVOrderFilter");

        Assert.Single(result);
        Assert.EndsWith(".xml", result[0], StringComparison.OrdinalIgnoreCase);
    }

    [Fact]
    public void FindRelatedFiles_no_match_returns_empty()
    {
        var filter_dir = Path.Combine(_controllers, "Filter");
        Directory.CreateDirectory(filter_dir);
        File.WriteAllText(Path.Combine(filter_dir, "Customer.xml"), "<dir/>");

        var result = ShowFormRelatedPathResolver.FindRelatedFiles(_controllers, "SVOrderFilter");

        Assert.Empty(result);
    }

    [Fact]
    public void Blank_controllers_path_returns_empty()
    {
        Assert.Empty(ShowFormRelatedPathResolver.FindRelatedFiles(null, "SVOrderFilter"));
        Assert.Empty(ShowFormRelatedPathResolver.FindRelatedFiles("", "SVOrderFilter"));
    }

    public void Dispose()
    {
        try { Directory.Delete(_controllers, recursive: true); }
        catch { /* temp cleanup */ }
    }
}
