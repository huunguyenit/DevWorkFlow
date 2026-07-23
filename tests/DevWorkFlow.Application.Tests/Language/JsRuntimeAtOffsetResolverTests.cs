using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class JsRuntimeAtOffsetResolverTests : IDisposable
{
    private readonly string _controllers =
        Path.Combine(Path.GetTempPath(), $"fbo-jsruntime-{Guid.NewGuid():N}");

    public JsRuntimeAtOffsetResolverTests() => Directory.CreateDirectory(_controllers);

    private const string Fixture = """
        <dir table="t" code="a">
          <response name="Customer">
            <text>ok</text>
          </response>
          <script>
          <![CDATA[
          function on$Voucher$ResponseComplete(response, context) {
              switch (context) {
                  case 'Customer':
                      doSomething();
                      break;
              }
          }

          function onChange(sender) {
              doSomethingElse();
          }

          g.$a = {
              gia2: '[gia2]:=[gia_nt2]*[$ty_gia]'
          };

          function onInit() {
              o.parentForm.request('Customer', 'Customer', {});
              onChange(this);
              g.executeExpression(o, [g.$a.gia2]);
              g.showForm('SVOrderFilter');
          }
          ]]>
          </script>
        </dir>
        """;

    [Fact]
    public void RequestAction_navigates_to_response_definition()
    {
        var (service, document) = Open();
        var action_offset = Fixture.IndexOf("'Customer', 'Customer'", StringComparison.Ordinal) + 1;

        var hit = service.ResolveJsRuntimeAtOffset(document.Id, action_offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.RequestAction, hit!.Kind);
        Assert.True(hit.TargetOffset >= 0);
        Assert.Equal(
            Fixture.IndexOf("<response name=\"Customer\"", StringComparison.Ordinal),
            hit.TargetOffset);
    }

    [Fact]
    public void RequestResponseCase_navigates_to_exact_case_string()
    {
        var (service, document) = Open();
        var context_offset = Fixture.LastIndexOf("'Customer'", StringComparison.Ordinal) + 1;

        var hit = service.ResolveJsRuntimeAtOffset(document.Id, context_offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.RequestResponseCase, hit!.Kind);
        Assert.True(hit.TargetOffset >= 0);
    }

    [Fact]
    public void DollarAProperty_usage_site_resolves_hover_value()
    {
        var (service, document) = Open();
        var usage_offset = Fixture.IndexOf("g.$a.gia2", StringComparison.Ordinal) + "g.$a.".Length + 1;

        var hit = service.ResolveJsRuntimeAtOffset(document.Id, usage_offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.DollarAProperty, hit!.Kind);
        Assert.Contains("ty_gia", hit.HoverValue, StringComparison.Ordinal);
        Assert.Equal(
            Fixture.IndexOf("gia2:", StringComparison.Ordinal),
            hit.TargetOffset);
    }

    [Fact]
    public void ShowFormRelated_opens_multi_files_by_stem()
    {
        var filter_dir = Path.Combine(_controllers, "Filter");
        Directory.CreateDirectory(filter_dir);
        File.WriteAllText(Path.Combine(filter_dir, "SVOrderFilter.xml"), "<dir/>");
        File.WriteAllText(Path.Combine(filter_dir, "SVOrderMultiForm.xml"), "<dir/>");

        var (service, document) = Open();
        var literal_offset = Fixture.IndexOf("SVOrderFilter", StringComparison.Ordinal);

        var hit = service.ResolveJsRuntimeAtOffset(document.Id, literal_offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.ShowFormRelated, hit!.Kind);
        Assert.Equal(2, hit.RelatedPaths.Count);
    }

    [Fact]
    public void ScriptFunctionRefs_on_definition_returns_call_site_references()
    {
        var (service, document) = Open();
        var def_offset = Fixture.IndexOf("function onChange", StringComparison.Ordinal) + "function ".Length + 1;

        var hit = service.ResolveJsRuntimeAtOffset(document.Id, def_offset, _controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.ScriptFunctionRefs, hit!.Kind);
        Assert.Equal("script:onChange", hit.SymbolId);
        Assert.Equal(2, hit.References.Count); // 1 definition + 1 call site
        Assert.Single(hit.References, r => r.NodeType == "Reference");
    }

    [Fact]
    public void Miss_returns_null()
    {
        var (service, document) = Open();
        var offset = Fixture.IndexOf("doSomethingElse", StringComparison.Ordinal);

        Assert.Null(service.ResolveJsRuntimeAtOffset(document.Id, offset, _controllers));
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
