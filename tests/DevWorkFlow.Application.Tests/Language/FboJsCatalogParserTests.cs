using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class FboJsCatalogParserTests
{
    private const string Xml = """
        <fboJsCatalog version="1">
          <type id="form" aliases="f,parentForm">
            <summary>Form chứng từ.</summary>
            <member name="getItemValue" kind="method"
                    signature="getItemValue(field)"
                    summary="Đọc giá trị field." effect="Trả về giá trị hiện tại.">
              <param name="field" summary="Tên field XML." />
            </member>
            <member name="_action" kind="property" summary="Trạng thái form." />
          </type>
          <globals>
            <member name="alert" kind="function" signature="alert(message)" summary="Hiện thông báo.">
              <param name="message" summary="Nội dung." />
            </member>
          </globals>
        </fboJsCatalog>
        """;

    [Fact]
    public void ParseXml_resolves_alias_to_type_and_member()
    {
        var catalog = FboJsCatalog.FromData(FboJsCatalogParser.ParseXml(Xml));

        var type = catalog.ResolveTypeByAlias("f");
        Assert.NotNull(type);
        Assert.Equal("form", type!.Id);

        var member = catalog.FindMember("form", "getItemValue");
        Assert.NotNull(member);
        Assert.Equal(FboJsMemberKind.Method, member!.Kind);
        Assert.Contains("field", member.Params.Select(p => p.Name));
        Assert.Equal("getItemValue(field)", member.Signature);
        Assert.False(string.IsNullOrWhiteSpace(member.Effect));
    }

    [Fact]
    public void Every_alias_of_a_type_resolves_to_same_type()
    {
        var catalog = FboJsCatalog.FromData(FboJsCatalogParser.ParseXml(Xml));

        Assert.Equal("form", catalog.ResolveTypeByAlias("f")?.Id);
        Assert.Equal("form", catalog.ResolveTypeByAlias("parentForm")?.Id);
    }

    [Fact]
    public void Alias_lookup_is_case_sensitive_like_javascript()
    {
        var catalog = FboJsCatalog.FromData(FboJsCatalogParser.ParseXml(Xml));

        Assert.NotNull(catalog.ResolveTypeByAlias("f"));
        Assert.Null(catalog.ResolveTypeByAlias("F"));
    }

    [Fact]
    public void Property_kind_and_globals_are_parsed()
    {
        var catalog = FboJsCatalog.FromData(FboJsCatalogParser.ParseXml(Xml));

        Assert.Equal(FboJsMemberKind.Property, catalog.FindMember("form", "_action")!.Kind);

        var global = catalog.FindGlobal("alert");
        Assert.NotNull(global);
        Assert.Equal(FboJsMemberKind.Function, global!.Kind);
    }

    [Fact]
    public void Invalid_xml_returns_empty_catalog_without_throwing()
    {
        var data = FboJsCatalogParser.ParseXml("<not-valid");

        Assert.Empty(data.Types);
        Assert.Equal(0, data.Version);
    }

    [Fact]
    public void Missing_file_returns_empty_catalog()
    {
        var data = FboJsCatalogParser.ParseFile(
            Path.Combine(Path.GetTempPath(), $"khong-ton-tai-{Guid.NewGuid():N}.xml"));

        Assert.Empty(data.Types);
    }

    [Fact]
    public void Unknown_kind_falls_back_instead_of_throwing()
    {
        var data = FboJsCatalogParser.ParseXml(
            """<fboJsCatalog version="1"><type id="t" aliases="t"><member name="m" kind="banana"/></type></fboJsCatalog>""");

        var catalog = FboJsCatalog.FromData(data);
        Assert.Equal(FboJsMemberKind.Method, catalog.FindMember("t", "m")!.Kind);
    }

    // Seed thật phải parse được — nếu ai sửa hỏng XML, test này đỏ chứ không im lặng rỗng.
    [Fact]
    public void Shipped_seed_catalog_parses_and_has_core_types()
    {
        var path = FindSeedCatalog();
        Assert.True(path is not null, "Không tìm thấy UI/Config/xml/fbo-js.catalog.xml");

        var catalog = FboJsCatalog.FromData(FboJsCatalogParser.ParseFile(path!));

        Assert.Equal("form", catalog.ResolveTypeByAlias("f")?.Id);
        Assert.Equal("grid", catalog.ResolveTypeByAlias("g")?.Id);
        Assert.Equal("sender", catalog.ResolveTypeByAlias("o")?.Id);
        Assert.NotNull(catalog.FindMember("form", "getItemValue"));
        Assert.NotNull(catalog.FindMember("grid", "request"));
    }

    internal static string? FindSeedCatalog()
    {
        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            var candidate = Path.Combine(dir.FullName, "UI", "Config", "xml", "fbo-js.catalog.xml");
            if (File.Exists(candidate)) return candidate;
            dir = dir.Parent;
        }
        return null;
    }
}
