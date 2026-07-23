using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class DollarAIndexTests
{
    private const string Script = """
        g.$a = {
            gia2: '[gia2]:=[gia_nt2]*[$ty_gia]',
            gia_sl: '[gia]:=[gia_nt]*[$ty_gia]'
        };
        g.executeExpression(o, [g.$a.gia2, g.$a.gia_sl]);
        """;

    [Fact]
    public void FindByName_returns_value_text_containing_expression()
    {
        var index = DollarAIndex.Build(Script);

        var property = index.FindByName("gia2");

        Assert.NotNull(property);
        Assert.Contains("ty_gia", property!.ValueText, StringComparison.Ordinal);
    }

    [Fact]
    public void FindByName_second_property_resolves_independently()
    {
        var index = DollarAIndex.Build(Script);

        var property = index.FindByName("gia_sl");

        Assert.NotNull(property);
        Assert.Contains("[gia]", property!.ValueText, StringComparison.Ordinal);
    }

    [Fact]
    public void FindByName_unknown_property_returns_null()
    {
        var index = DollarAIndex.Build(Script);

        Assert.Null(index.FindByName("khong_ton_tai"));
    }

    [Fact]
    public void FindPropertyAtOffset_on_key_in_object_literal_maps_to_property()
    {
        var index = DollarAIndex.Build(Script);
        // Offset giữa tên "gia2" trong chính object literal g.$a = { gia2: ... }
        var key_offset = Script.IndexOf("gia2:", StringComparison.Ordinal) + 1;

        var property = index.FindPropertyAtOffset(key_offset);

        Assert.NotNull(property);
        Assert.Equal("gia2", property!.Name);
    }

    [Fact]
    public void Build_without_dollar_a_assignment_returns_empty_index()
    {
        var index = DollarAIndex.Build("g.executeExpression(o, []);");

        Assert.Empty(index.Properties);
    }

    [Fact]
    public void Bare_entity_ref_between_properties_does_not_abort_scan()
    {
        // Thực tế FBO: entity ref (&Name;) dùng làm placeholder cho nhiều key:value, chèn
        // trực tiếp giữa các property — không phải property hợp lệ. Trước fix, gặp '&' làm
        // scanner dừng hẳn, mất mọi property phía sau (ở đây: t_so_luong).
        const string script = """
            g.$a = {
                gia2: '[gia2]:=[gia_nt2]*[$ty_gia]',
                ck_tl: '[ck]:=[tien2]*[tl_ck]/100',

                &VoucherGoodsTypeFomulaGrid;
                &DetailTaxFomula;

                t_so_luong: ['t_so_luong', 'so_luong']
            };
            """;

        var index = DollarAIndex.Build(script);

        Assert.NotNull(index.FindByName("gia2"));
        Assert.NotNull(index.FindByName("ck_tl"));
        var after_entities = index.FindByName("t_so_luong");
        Assert.NotNull(after_entities);
        Assert.Contains("so_luong", after_entities!.ValueText, StringComparison.Ordinal);
    }

    [Fact]
    public void CData_marker_between_properties_does_not_abort_scan()
    {
        // Runtime FBO serialize entity NGOÀI CDATA → raw source có "]]>...<![CDATA[" xen giữa
        // hai property khi giữa chúng là một entity ref.
        const string script = """
            g.$a = {
                gia2: '[gia2]:=[gia_nt2]*[$ty_gia]',
            ]]>&VoucherGoodsTypeFomulaGrid;<![CDATA[
                t_so_luong: ['t_so_luong', 'so_luong']
            };
            """;

        var index = DollarAIndex.Build(script);

        Assert.NotNull(index.FindByName("gia2"));
        Assert.NotNull(index.FindByName("t_so_luong"));
    }

    [Fact]
    public void Build_supports_quoted_property_names()
    {
        const string script = """
            g.$a = {
                'gia2': '[gia2]:=[gia_nt2]'
            };
            """;

        var index = DollarAIndex.Build(script);

        var property = index.FindByName("gia2");
        Assert.NotNull(property);
        Assert.Contains("gia_nt2", property!.ValueText, StringComparison.Ordinal);
    }
}
