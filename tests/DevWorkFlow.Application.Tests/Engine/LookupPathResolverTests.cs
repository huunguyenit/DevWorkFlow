using DevWorkFlow.Application.Engine;
using Xunit;

namespace DevWorkFlow.Application.Tests.Engine;

public sealed class LookupPathResolverTests : IDisposable
{
    private readonly string _controllers =
        Path.Combine(Path.GetTempPath(), $"fbo-lookup-{Guid.NewGuid():N}");

    public LookupPathResolverTests() => Directory.CreateDirectory(_controllers);

    [Fact]
    public void Finds_xml_lookup_file()
    {
        var lookup_dir = Path.Combine(_controllers, "Lookup");
        Directory.CreateDirectory(lookup_dir);
        var account = Path.Combine(lookup_dir, "Account.xml");
        File.WriteAllText(account, "<dir/>");

        var result = LookupPathResolver.FindLookupFile(_controllers, "Account");

        Assert.Equal(Path.GetFullPath(account), Path.GetFullPath(result!));
    }

    [Fact]
    public void Prefers_xml_then_f_extension()
    {
        var lookup_dir = Path.Combine(_controllers, "Lookup");
        Directory.CreateDirectory(lookup_dir);
        File.WriteAllText(Path.Combine(lookup_dir, "Only.f"), "<dir/>");

        var result = LookupPathResolver.FindLookupFile(_controllers, "Only");

        Assert.EndsWith("Only.f", result);
    }

    [Fact]
    public void Missing_file_returns_null()
        => Assert.Null(LookupPathResolver.FindLookupFile(_controllers, "Nope"));

    [Theory]
    [InlineData(null, "Account")]
    [InlineData("", "Account")]
    [InlineData("  ", "Account")]
    public void Blank_controllers_path_returns_null(string? controllers, string name)
        => Assert.Null(LookupPathResolver.FindLookupFile(controllers, name));

    [Fact]
    public void Blank_controller_name_returns_null()
        => Assert.Null(LookupPathResolver.FindLookupFile(_controllers, "  "));

    public void Dispose()
    {
        try { Directory.Delete(_controllers, recursive: true); }
        catch { /* temp cleanup */ }
    }
}
