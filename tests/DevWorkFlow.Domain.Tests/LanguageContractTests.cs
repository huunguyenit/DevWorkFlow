using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Domain.Tests;

public class LanguageContractTests
{
    [Fact]
    public void ErpDocumentId_ignores_path_case()
    {
        var a = ErpDocumentId.FromPath(@"C:\Prog\Dir\Customer.xml");
        var b = ErpDocumentId.FromPath(@"c:\prog\dir\customer.xml");
        Assert.Equal(a, b);
        Assert.Equal(a.GetHashCode(), b.GetHashCode());
    }

    [Fact]
    public void SourceSpan_end_offset()
    {
        var span = new SourceSpan(10, 5);
        Assert.Equal(15, span.EndOffset);
        Assert.False(span.IsEmpty);
        Assert.True(SourceSpan.Empty.IsEmpty);
    }

    [Fact]
    public void EntitySymbol_is_entity_kind()
    {
        var entity = new EntitySymbol
        {
            Id = "entity:ClientDefault",
            Name = "ClientDefault",
            DisplayText = "Default",
            DeclarationKind = EntityDeclarationKind.Inline
        };
        Assert.Equal(ErpSymbolKind.Entity, entity.Kind);
        Assert.Equal("Default", entity.DisplayText);
    }
}
