using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public sealed class InsightProviderPipelineTests
{
    [Fact]
    public void Entity_provider_preserves_reference_value_and_nested_tree()
    {
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY Parent "Hello &Child;">
              <!ENTITY Child "World">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Parent;</dir>
            """;
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocumentFromText("nested.xml", xml);

        var insight = Assert.Single(
            document.Insights,
            item => item.Type == InsightType.Entity
                    && item.ReferenceText == "&Parent;");

        Assert.Equal("Hello &Child;", insight.ResolvedValue);
        Assert.True(insight.CanEditResolvedValue);
        var child = Assert.Single(insight.Children);
        Assert.Equal("&Child;", child.ReferenceText);
        Assert.Equal("World", child.ResolvedValue);
        Assert.Contains(insight.Actions, action => action.Id == "entity.edit");
    }

    [Fact]
    public void Validation_provider_converts_diagnostics_to_common_insight_items()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir" table="t" code="a">
              <fields>
                <field name="a"/>
                <field name="a"/>
              </fields>
            </dir>
            """;
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocumentFromText("duplicate.xml", xml);

        Assert.Contains(document.Diagnostics, diagnostic => diagnostic.Id == "ERP2001");
        Assert.Contains(document.Insights, insight =>
            insight.Type == InsightType.Validation
            && insight.Metadata.TryGetValue("diagnostic_id", out var id)
            && id == "ERP2001");
    }

    [Sp226Fact]
    public void Customer_ClientDefault_is_an_editable_entity_insight()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocument(path);

        var insight = Assert.Single(
            document.Insights,
            item => item.Type == InsightType.Entity
                    && item.ReferenceText == "&ClientDefault;");

        Assert.True(insight.CanEditResolvedValue);
        Assert.Equal(string.Empty, insight.ResolvedValue);
        Assert.False(insight.Range.Span.IsEmpty);
        Assert.Same(document.Insights, language_service.GetInsights(document.Id));
    }
}
