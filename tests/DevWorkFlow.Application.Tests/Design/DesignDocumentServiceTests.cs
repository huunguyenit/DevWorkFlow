using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class DesignDocumentServiceTests
{
    private const string SimpleDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="Khách" e="Customer"/>
          <fields>
            <field name="ma_kh"><header v="Mã khách" e="Customer"/></field>
          </fields>
          <views>
            <view id="Dir" height="100">
              <item value="120, 200"/>
              <item value="11: [ma_kh].Label, [ma_kh]"/>
            </view>
          </views>
        </dir>
        """;

    private const string DirWithDetail = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="Hóa đơn" e="Invoice"/>
          <fields>
            <field name="ma_kh"><header v="Khách" e="Customer"/></field>
            <field name="chitiet"><header v="Chi tiết" e="Detail"/><items style="Grid" controller="CustomerUnitDetail"/></field>
          </fields>
          <views>
            <view id="Dir" height="200">
              <item value="120, 200"/>
              <item value="11: [ma_kh].Label, [ma_kh]"/>
              <item value="10: [chitiet]"/>
            </view>
          </views>
        </dir>
        """;

    private const string DetailGridXml = """
        <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
          <title v="Chi tiết" e="Detail"/>
          <fields>
            <field name="ma_dvcs" width="90"><header v="Đơn vị chi tiết" e="Unit"/></field>
          </fields>
          <views><view id="Grid"><field name="ma_dvcs"/></view></views>
        </grid>
        """;

    private static FboControllerDocument Dir(string xml) =>
        new FboXmlParser().Parse(xml, "Customer.xml");

    private static DesignBuildRequest Request(FboControllerDocument document, ProgramContext? program) =>
        new(document, Vietnamese: true, program, new Dictionary<string, DesignElementIdentity>());

    private static DesignDocumentService Service(
        IDesignAssetResolver assets,
        IDesignRelatedDocumentLocator locator) =>
        new(new ErpLanguageService(), assets, locator, new DesignHtmlGenerator());

    [Fact]
    public async Task Build_NoProgram_ReturnsHtmlWithWarning()
    {
        var service = Service(
            new FakeAssetResolver(() => DesignAssetSet.Empty),
            new FakeLocator(_ => null));

        var result = await service.BuildAsync(Request(Dir(SimpleDir), program: null));

        Assert.Contains("Chưa chọn Program", result.Warnings);
        Assert.Contains("class=\"FormTable\"", result.Html);
    }

    [Fact]
    public async Task Build_AssetResolverThrows_StillReturnsHtmlWithWarning()
    {
        var program = new ProgramContext { ProgramPath = Path.GetTempPath() };
        var service = Service(
            new FakeAssetResolver(() => throw new IOException("boom")),
            new FakeLocator(_ => null));

        var result = await service.BuildAsync(Request(Dir(SimpleDir), program));

        Assert.Contains(result.Warnings, w => w.Contains("asset"));
        Assert.Contains("class=\"FormTable\"", result.Html);
    }

    [Fact]
    public async Task Build_DirWithGridDetail_EmbedsDetailViaLanguageService()
    {
        var temp = Path.Combine(Path.GetTempPath(), $"dwf-detail-{Guid.NewGuid():N}");
        var grid_dir = Path.Combine(temp, "App_Data", "Controllers", "Grid");
        Directory.CreateDirectory(grid_dir);
        var grid_path = Path.Combine(grid_dir, "CustomerUnitDetail.xml");
        File.WriteAllText(grid_path, DetailGridXml);
        try
        {
            var program = new ProgramContext { ProgramPath = temp };
            var service = Service(
                new FakeAssetResolver(() => DesignAssetSet.Empty),
                new FakeLocator(name => name == "CustomerUnitDetail" ? grid_path : null));

            var result = await service.BuildAsync(Request(Dir(DirWithDetail), program));

            Assert.Contains("DwfDetailGrid", result.Html);
            Assert.Contains("Đơn vị chi tiết", result.Html);
        }
        finally
        {
            Directory.Delete(temp, recursive: true);
        }
    }

    [Fact]
    public async Task Build_MissingDetail_WarnsWithoutCrash()
    {
        var program = new ProgramContext { ProgramPath = Path.GetTempPath() };
        var service = Service(
            new FakeAssetResolver(() => DesignAssetSet.Empty),
            new FakeLocator(_ => null));

        var result = await service.BuildAsync(Request(Dir(DirWithDetail), program));

        Assert.Contains(result.Warnings, w => w.Contains("CustomerUnitDetail"));
        Assert.Contains("class=\"FormTable\"", result.Html);
    }

    private sealed class FakeAssetResolver(Func<DesignAssetSet> factory) : IDesignAssetResolver
    {
        public Task<DesignAssetSet> ResolveAsync(
            ProgramContext program, string controller_name, CancellationToken ct = default) =>
            Task.FromResult(factory());
    }

    private sealed class FakeLocator(Func<string, string?> find) : IDesignRelatedDocumentLocator
    {
        public string? FindGridPath(ProgramContext program, string controller_name) =>
            find(controller_name);
    }
}
