using DevWorkFlow.Application.Skin;
using Xunit;

namespace DevWorkFlow.Application.Tests.Skin;

public class SkinUrlHelperTests
{
    [Fact]
    public void BuildDefaultBaseUrl_UsesSecondToLastSegment_AsProjectName()
    {
        var url = SkinUrlHelper.BuildDefaultBaseUrl(@"\\172.168.5.14\CustomerPro\FBI\AMERICAN\FBISP2422");

        Assert.Equal("https://dev.fast.com.vn/AMERICAN", url);
    }

    [Fact]
    public void BuildDefaultBaseUrl_CustomHost_TrimsTrailingSlash()
    {
        var url = SkinUrlHelper.BuildDefaultBaseUrl(
            @"\\172.168.5.14\CustomerPro\FBO\AEQN\SP2261", "http://172.168.5.14/");

        Assert.Equal("http://172.168.5.14/AEQN", url);
    }

    [Fact]
    public void BuildDefaultBaseUrl_SingleSegmentPath_ReturnsBareHost()
    {
        var url = SkinUrlHelper.BuildDefaultBaseUrl("SP2261");

        Assert.Equal("https://dev.fast.com.vn", url);
    }

    [Fact]
    public void BuildDefaultBaseUrl_EmptyPath_ReturnsBareHost()
    {
        var url = SkinUrlHelper.BuildDefaultBaseUrl(string.Empty);

        Assert.Equal("https://dev.fast.com.vn", url);
    }

    [Fact]
    public void BuildLoginUrl_AppendsMainLoginAspx()
    {
        var login = SkinUrlHelper.BuildLoginUrl("https://dev.fast.com.vn/fsd_dev");

        Assert.Equal("https://dev.fast.com.vn/fsd_dev/Main/Login.aspx", login);
    }

    [Fact]
    public void BuildLoginUrl_TrimsTrailingSlashOnBaseUrl()
    {
        var login = SkinUrlHelper.BuildLoginUrl("https://dev.fast.com.vn/fsd_dev/");

        Assert.Equal("https://dev.fast.com.vn/fsd_dev/Main/Login.aspx", login);
    }

    [Fact]
    public void BuildLoginUrl_EmptyBaseUrl_ReturnsEmpty()
    {
        Assert.Equal(string.Empty, SkinUrlHelper.BuildLoginUrl(string.Empty));
    }
}
