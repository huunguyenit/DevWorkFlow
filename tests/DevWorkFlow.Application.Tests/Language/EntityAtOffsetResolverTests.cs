using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class EntityAtOffsetResolverTests : IDisposable
{
    private readonly string _temp_directory =
        Path.Combine(Path.GetTempPath(), $"fbo-hit-{Guid.NewGuid():N}");

    public EntityAtOffsetResolverTests() => Directory.CreateDirectory(_temp_directory);

    private const string InlineXml = """
        <!DOCTYPE dir [
          <!ENTITY Hello "hi">
        ]>
        <dir xmlns="urn:schemas-fast-com:data-dir">&Hello;</dir>
        """;

    [Fact]
    public void Resolve_hits_reference_amp_entity()
    {
        var (service, document) = Open(InlineXml);
        var offset = InlineXml.IndexOf("&Hello;", StringComparison.Ordinal) + 3; // giữa &Hello;

        var hit = service.ResolveEntityAtOffset(document.Id, offset);

        Assert.NotNull(hit);
        Assert.Equal("Hello", hit!.EntityName);
        Assert.Equal(EntityHitKind.Reference, hit.HitKind);
        Assert.Contains("hi", hit.DisplayText);
        Assert.False(hit.IsError);
    }

    [Fact]
    public void Resolve_hits_declaration_name()
    {
        var (service, document) = Open(InlineXml);
        var offset = InlineXml.IndexOf("<!ENTITY Hello", StringComparison.Ordinal)
                     + "<!ENTITY He".Length; // trên tên trong khai báo

        var hit = service.ResolveEntityAtOffset(document.Id, offset);

        Assert.NotNull(hit);
        Assert.Equal("Hello", hit!.EntityName);
        Assert.Equal(EntityHitKind.Declaration, hit.HitKind);
    }

    [Fact]
    public void Resolve_miss_returns_null()
    {
        var (service, document) = Open(InlineXml);
        var offset = InlineXml.IndexOf("xmlns", StringComparison.Ordinal); // text thường

        Assert.Null(service.ResolveEntityAtOffset(document.Id, offset));
    }

    [Fact]
    public void Resolve_negative_offset_returns_null()
    {
        var (service, document) = Open(InlineXml);
        Assert.Null(service.ResolveEntityAtOffset(document.Id, -1));
    }

    [Fact]
    public void Resolve_system_entity_reference_sets_open_path()
    {
        var external_path = Path.Combine(_temp_directory, "ext.ent");
        File.WriteAllText(external_path, "external-content");
        var xml = """
            <!DOCTYPE dir [
              <!ENTITY Ext SYSTEM "ext.ent">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Ext;</dir>
            """;
        var (service, document) = Open(xml);
        var offset = xml.IndexOf("&Ext;", StringComparison.Ordinal) + 2;

        var hit = service.ResolveEntityAtOffset(document.Id, offset);

        Assert.NotNull(hit);
        Assert.Equal("Ext", hit!.EntityName);
        Assert.Equal(EntityHitKind.Reference, hit.HitKind);
        Assert.False(string.IsNullOrEmpty(hit.OpenPath));
        Assert.True(File.Exists(hit.OpenPath));
        Assert.Equal(
            Path.GetFullPath(external_path),
            Path.GetFullPath(hit.OpenPath));
    }

    [Fact]
    public void Resolve_system_literal_in_declaration_is_system_literal_kind()
    {
        var external_path = Path.Combine(_temp_directory, "ext.ent");
        File.WriteAllText(external_path, "external-content");
        var xml = """
            <!DOCTYPE dir [
              <!ENTITY Ext SYSTEM "ext.ent">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Ext;</dir>
            """;
        var (service, document) = Open(xml);
        var offset = xml.IndexOf("ext.ent", StringComparison.Ordinal) + 2; // trong chuỗi SYSTEM

        var hit = service.ResolveEntityAtOffset(document.Id, offset);

        Assert.NotNull(hit);
        Assert.Equal(EntityHitKind.SystemLiteral, hit!.HitKind);
        Assert.True(File.Exists(hit.OpenPath));
    }

    [Fact]
    public void Resolve_ignores_reference_from_include_file()
    {
        // Reference nằm TRONG file include mang offset theo file đó (base_offset=0, Path=include).
        // Hover offset của document chính trùng số với span include KHÔNG được match (bug: hover
        // dòng trắng trong Account.xml hiện entity khai báo ở include).
        var include_path = Path.Combine(_temp_directory, "inc.ent");
        File.WriteAllText(include_path, "<!ENTITY Zzz \"zzz-value\">\n&Zzz;\n");
        var xml = """
            <!DOCTYPE dir [
              <!ENTITY % Inc SYSTEM "inc.ent">
              %Inc;
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Zzz;</dir>
            """;
        var (service, document) = Open(xml);

        var zzz = document.SemanticModel.FindEntity("Zzz");
        Assert.NotNull(zzz);
        // Zzz khai báo trong include → Definition.Path = include, Span theo toạ độ include.
        Assert.Equal("inc.ent", Path.GetFileName(zzz!.Definition.Path));
        Assert.False(zzz.Definition.Span.IsEmpty);

        // Offset của span khai báo (hệ toạ độ include) hit-test trên document chính KHÔNG được
        // trả Zzz (bug cũ: span include trùng số với offset document → match nhầm).
        var hit = service.ResolveEntityAtOffset(document.Id, zzz.Definition.Span.StartOffset);
        Assert.NotEqual("Zzz", hit?.EntityName);
    }

    private (ErpLanguageService Service, IErpDocument Document) Open(string xml)
    {
        var service = new ErpLanguageService();
        var document = service.OpenDocumentFromText(
            Path.Combine(_temp_directory, "Controller.xml"), xml);
        return (service, document);
    }

    public void Dispose()
    {
        try
        {
            Directory.Delete(_temp_directory, recursive: true);
        }
        catch
        {
            // Temp cleanup không che kết quả test.
        }
    }
}
