using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class StructuralAtOffsetResolverTests : IDisposable
{
    private readonly string _controllers =
        Path.Combine(Path.GetTempPath(), $"fbo-structural-{Guid.NewGuid():N}");

    public StructuralAtOffsetResolverTests() => Directory.CreateDirectory(_controllers);

    private const string Fixture = """
        <dir table="t" code="ma_kh">
          <fields>
            <field name="ma_kh">
              <items controller="Account"/>
            </field>
          </fields>
          <views>
            <view id="Dir"><field name="ma_kh"/></view>
          </views>
          <script>
          <![CDATA[
          function onChangeAccount(sender) {}
          ]]>
          </script>
        </dir>
        """;

    [Fact]
    public void ItemsController_resolves_lookup_path()
    {
        var lookup_dir = Path.Combine(_controllers, "Lookup");
        Directory.CreateDirectory(lookup_dir);
        var account_path = Path.Combine(lookup_dir, "Account.xml");
        File.WriteAllText(account_path, "<dir/>");

        var (service, document) = Open();
        var offset = Fixture.IndexOf("Account", StringComparison.Ordinal);

        var hit = service.ResolveStructuralAtOffset(document.Id, offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(StructuralNavKind.ItemsController, hit!.Kind);
        Assert.Equal(Path.GetFullPath(account_path), Path.GetFullPath(hit.TargetPath));
    }

    [Fact]
    public void FieldToView_finds_containing_view()
    {
        var (service, document) = Open();
        var offset = Fixture.IndexOf("<field name=\"ma_kh\">", StringComparison.Ordinal) + "<field name=\"".Length + 1;

        var hit = service.ResolveStructuralAtOffset(document.Id, offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(StructuralNavKind.FieldToView, hit!.Kind);
        Assert.True(hit.TargetOffset >= 0);
    }

    [Fact]
    public void ClientScript_miss_when_no_client_script_present()
    {
        var (service, document) = Open();
        // Offset trong <items controller="Account"/> nhưng ngoài value literal — không match kind nào cụ thể khác.
        var offset = Fixture.IndexOf("<script>", StringComparison.Ordinal);

        var hit = service.ResolveStructuralAtOffset(document.Id, offset, _controllers);

        Assert.Null(hit);
    }

    private (ErpLanguageService Service, IErpDocument Document) Open()
    {
        var service = new ErpLanguageService();
        var document = service.OpenDocumentFromText(
            Path.Combine(_controllers, "Voucher.xml"), Fixture);
        return (service, document);
    }

    public void Dispose()
    {
        try { Directory.Delete(_controllers, recursive: true); }
        catch { /* temp cleanup */ }
    }
}
