using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class ControllerDatabaseKindResolverTests
{
    [Theory]
    [InlineData(null, ControllerDatabaseKind.App)]
    [InlineData("", ControllerDatabaseKind.App)]
    [InlineData("   ", ControllerDatabaseKind.App)]
    [InlineData("App", ControllerDatabaseKind.App)]
    [InlineData("Sys", ControllerDatabaseKind.Sys)]
    // Corpus có cả "sys" thường → phải case-insensitive.
    [InlineData("sys", ControllerDatabaseKind.Sys)]
    [InlineData(" Sys ", ControllerDatabaseKind.Sys)]
    public void Attribute_value_maps_to_kind(string? value, ControllerDatabaseKind expected)
        => Assert.Equal(expected, ControllerDatabaseKindResolver.ResolveFromDatabaseAttribute(value));

    [Theory]
    [InlineData("""<grid database="Sys"><commands/></grid>""", ControllerDatabaseKind.Sys)]
    [InlineData("""<dir database="sys"/>""", ControllerDatabaseKind.Sys)]
    [InlineData("""<lookup database="App"/>""", ControllerDatabaseKind.App)]
    [InlineData("""<dir table="t"/>""", ControllerDatabaseKind.App)]
    [InlineData("", ControllerDatabaseKind.App)]
    public void Xml_root_attribute_maps_to_kind(string xml, ControllerDatabaseKind expected)
        => Assert.Equal(expected, ControllerDatabaseKindResolver.ResolveFromXml(xml));

    [Fact]
    public void Doctype_before_root_still_resolves()
    {
        const string xml = """
            <?xml version="1.0"?>
            <!DOCTYPE dir [ <!ENTITY X "1"> ]>
            <dir database="Sys" table="t"><fields/></dir>
            """;

        Assert.Equal(ControllerDatabaseKind.Sys, ControllerDatabaseKindResolver.ResolveFromXml(xml));
    }

    [Fact]
    public void Database_attribute_on_non_root_element_is_not_used()
    {
        // Chỉ root dir|grid|lookup mới quyết định; attribute trùng tên ở chỗ khác không tính.
        const string xml = """<dir table="t"><field name="a" database="Sys"/></dir>""";

        Assert.Equal(ControllerDatabaseKind.App, ControllerDatabaseKindResolver.ResolveFromXml(xml));
    }
}
