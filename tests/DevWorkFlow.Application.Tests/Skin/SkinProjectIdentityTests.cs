using System.IO;
using System.Linq;
using DevWorkFlow.Application.Skin;
using Xunit;

namespace DevWorkFlow.Application.Tests.Skin;

public class SkinProjectIdentityTests
{
    [Fact]
    public void From_SamePath_IsStable_RegardlessOfSeparatorCaseTrailingSlash()
    {
        var a = SkinProjectIdentity.From(@"\\srv\CustomerPro\FBO\AEQN\SP2261", "AEQN - SP2261");
        var b = SkinProjectIdentity.From(@"\\srv/CustomerPro/FBO/AEQN/SP2261\", "AEQN - SP2261");
        var c = SkinProjectIdentity.From(@"\\SRV\customerpro\fbo\aeqn\sp2261", "AEQN - SP2261");

        Assert.Equal(a, b);
        Assert.Equal(a, c);
    }

    [Fact]
    public void From_DifferentPath_ProducesDifferentId()
    {
        var a = SkinProjectIdentity.From(@"\\srv\FBO\AEQN\SP2261", "AEQN - SP2261");
        var b = SkinProjectIdentity.From(@"\\srv\FBO\BEQN\SP2261", "BEQN - SP2261");

        Assert.NotEqual(a, b);
    }

    [Fact]
    public void From_ProducesFolderSafeId()
    {
        var id = SkinProjectIdentity.From(@"\\srv\FBO\AEQN\SP2261", "AEQN - SP2261");

        Assert.DoesNotContain(id, s => Path.GetInvalidFileNameChars().Contains(s));
        Assert.StartsWith("AEQN-SP2261-", id);
    }
}
