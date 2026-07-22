using DevWorkFlow.Application.Shell;
using Xunit;

namespace DevWorkFlow.Application.Tests.Shell;

public sealed class DocumentTabPathHelperTests
{
    [Theory]
    [InlineData(null, false)]
    [InlineData("", false)]
    [InlineData("   ", false)]
    [InlineData("sql://foo", false)]
    [InlineData(@"C:\work\a.xml", true)]
    public void CanCopyFullPath_rules(string? path, bool expected)
        => Assert.Equal(expected, DocumentTabPathHelper.CanCopyFullPath(path));

    [Fact]
    public void BuildExplorerSelectArguments_quotes_path()
    {
        var args = DocumentTabPathHelper.BuildExplorerSelectArguments(@"C:\work\a.xml");
        Assert.Equal("/select,\"C:\\work\\a.xml\"", args);
    }

    [Fact]
    public void IsVirtualDocumentPath_sql_scheme()
    {
        Assert.True(DocumentTabPathHelper.IsVirtualDocumentPath("sql://x"));
        Assert.False(DocumentTabPathHelper.IsVirtualDocumentPath(@"D:\a.xml"));
    }
}
