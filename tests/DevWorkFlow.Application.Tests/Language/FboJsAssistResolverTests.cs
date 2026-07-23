using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class FboJsAssistResolverTests
{
    private static readonly FboJsCatalog Catalog = FboJsCatalog.FromData(
        FboJsCatalogParser.ParseXml("""
            <fboJsCatalog version="1">
              <type id="form" aliases="f,parentForm">
                <summary>Form chứng từ.</summary>
                <member name="getItemValue" kind="method" signature="getItemValue(field)"
                        summary="Đọc giá trị field." effect="Trả về giá trị hiện tại.">
                  <param name="field" summary="Tên field XML." />
                </member>
                <member name="getRow" kind="method" signature="getRow(index)" summary="Lấy dòng.">
                  <param name="index" summary="Chỉ số dòng." />
                </member>
                <member name="setItemValue" kind="method" signature="setItemValue(field, value)"
                        summary="Gán giá trị field.">
                  <param name="field" summary="Tên field." />
                  <param name="value" summary="Giá trị mới." />
                </member>
                <member name="request" kind="method" signature="request(action, context, fields)"
                        summary="Gửi yêu cầu lên server.">
                  <param name="action" summary="Action id." />
                  <param name="context" summary="Case context." />
                  <param name="fields" summary="Mảng field." />
                </member>
                <member name="_action" kind="property" summary="Trạng thái form." />
              </type>
              <globals>
                <member name="alertBox" kind="function" signature="alertBox(message)"
                        summary="Hiện hộp thoại.">
                  <param name="message" summary="Nội dung." />
                </member>
              </globals>
            </fboJsCatalog>
            """));

    private const string Script = """
        <form>
        <script><![CDATA[
        function foo() {
          var x = f.get
        }
        ]]></script>
        <field name="ma_kh"/>
        </form>
        """;

    private static int OffsetAfter(string needle, string text = Script) =>
        text.IndexOf(needle, StringComparison.Ordinal) + needle.Length;

    // ── Completion ──────────────────────────────────────────────────────────

    [Fact]
    public void Complete_after_receiver_dot_filters_by_prefix()
    {
        var list = FboJsAssistResolver.Complete(
            Script, OffsetAfter("f.get"), EditorAssistMode.Source, Catalog);

        Assert.Contains(list.Items, i => i.Label == "getItemValue");
        Assert.Contains(list.Items, i => i.Label == "getRow");
        Assert.DoesNotContain(list.Items, i => i.Label == "request");
        Assert.DoesNotContain(list.Items, i => i.Label == "_action");
    }

    [Fact]
    public void Complete_right_after_dot_returns_all_members()
    {
        const string text = "<script><![CDATA[ f. ]]></script>";
        var list = FboJsAssistResolver.Complete(
            text, OffsetAfter("f.", text), EditorAssistMode.Source, Catalog);

        Assert.Contains(list.Items, i => i.Label == "getItemValue");
        Assert.Contains(list.Items, i => i.Label == "_action");
    }

    [Fact]
    public void Complete_maps_member_kind_and_detail()
    {
        const string text = "<script><![CDATA[ f. ]]></script>";
        var list = FboJsAssistResolver.Complete(
            text, OffsetAfter("f.", text), EditorAssistMode.Source, Catalog);

        var method = list.Items.Single(i => i.Label == "getItemValue");
        Assert.Equal("method", method.Kind);
        Assert.Equal("getItemValue(field)", method.Detail);

        Assert.Equal("property", list.Items.Single(i => i.Label == "_action").Kind);
    }

    [Fact]
    public void Complete_bare_prefix_offers_aliases_and_globals()
    {
        const string text = "<script><![CDATA[ al ]]></script>";
        var list = FboJsAssistResolver.Complete(
            text, OffsetAfter("al", text), EditorAssistMode.Source, Catalog);

        Assert.Contains(list.Items, i => i.Label == "alertBox");

        const string text2 = "<script><![CDATA[ pa ]]></script>";
        var list2 = FboJsAssistResolver.Complete(
            text2, OffsetAfter("pa", text2), EditorAssistMode.Source, Catalog);
        Assert.Contains(list2.Items, i => i.Label == "parentForm" && i.Kind == "variable");
    }

    [Fact]
    public void Complete_unknown_receiver_returns_empty()
    {
        const string text = "<script><![CDATA[ zzz.ge ]]></script>";
        var list = FboJsAssistResolver.Complete(
            text, OffsetAfter("zzz.ge", text), EditorAssistMode.Source, Catalog);

        Assert.Empty(list.Items);
    }

    [Fact]
    public void Complete_outside_island_is_empty()
    {
        var offset = Script.IndexOf("<field name=", StringComparison.Ordinal) + 3;
        var list = FboJsAssistResolver.Complete(
            Script, offset, EditorAssistMode.Source, Catalog);

        Assert.Empty(list.Items);
    }

    [Fact]
    public void Complete_in_insight_mode_is_empty()
    {
        var list = FboJsAssistResolver.Complete(
            Script, OffsetAfter("f.get"), EditorAssistMode.Insight, Catalog);

        Assert.Empty(list.Items);
    }

    // ── Hover ───────────────────────────────────────────────────────────────

    [Fact]
    public void Hover_on_member_returns_summary_and_effect()
    {
        const string text = "<script><![CDATA[ f.getItemValue('a') ]]></script>";
        var offset = text.IndexOf("getItemValue", StringComparison.Ordinal) + 3;

        var hover = FboJsAssistResolver.Hover(text, offset, EditorAssistMode.Source, Catalog);

        Assert.NotNull(hover);
        Assert.Contains("Đọc giá trị field", hover!.Body, StringComparison.Ordinal);
        Assert.Contains("Trả về giá trị hiện tại", hover.Body, StringComparison.Ordinal);
    }

    [Fact]
    public void Hover_works_in_insight_mode()
    {
        const string text = "<script><![CDATA[ f.getItemValue('a') ]]></script>";
        var offset = text.IndexOf("getItemValue", StringComparison.Ordinal) + 3;

        Assert.NotNull(FboJsAssistResolver.Hover(text, offset, EditorAssistMode.Insight, Catalog));
    }

    [Fact]
    public void Hover_does_not_fuzzy_match_typo()
    {
        const string text = "<script><![CDATA[ f.getItemValu('a') ]]></script>";
        var offset = text.IndexOf("getItemValu", StringComparison.Ordinal) + 3;

        Assert.Null(FboJsAssistResolver.Hover(text, offset, EditorAssistMode.Source, Catalog));
    }

    [Fact]
    public void Hover_on_alias_returns_type_summary()
    {
        const string text = "<script><![CDATA[ var q = f; ]]></script>";
        var offset = text.IndexOf("= f;", StringComparison.Ordinal) + 2;

        var hover = FboJsAssistResolver.Hover(text, offset, EditorAssistMode.Source, Catalog);

        Assert.NotNull(hover);
        Assert.Contains("Form chứng từ", hover!.Body, StringComparison.Ordinal);
    }

    [Fact]
    public void Hover_outside_island_is_null()
    {
        var offset = Script.IndexOf("ma_kh", StringComparison.Ordinal);
        Assert.Null(FboJsAssistResolver.Hover(Script, offset, EditorAssistMode.Source, Catalog));
    }

    // ── Signature ───────────────────────────────────────────────────────────

    [Fact]
    public void Signature_reports_first_parameter_active()
    {
        const string text = "<script><![CDATA[ f.request( ]]></script>";
        var offset = OffsetAfter("f.request(", text);

        var help = FboJsAssistResolver.Signature(text, offset, EditorAssistMode.Source, Catalog);

        Assert.NotNull(help);
        Assert.Equal("request(action, context, fields)", help!.Label);
        Assert.Equal(3, help.Parameters.Count);
        Assert.Equal(0, help.ActiveParameter);
    }

    [Fact]
    public void Signature_advances_active_parameter_after_comma()
    {
        const string text = "<script><![CDATA[ f.request('A', ]]></script>";
        var offset = OffsetAfter("f.request('A', ", text);

        var help = FboJsAssistResolver.Signature(text, offset, EditorAssistMode.Source, Catalog);

        Assert.NotNull(help);
        Assert.Equal(1, help!.ActiveParameter);
    }

    [Fact]
    public void Signature_ignores_commas_inside_nested_brackets_and_strings()
    {
        const string text = "<script><![CDATA[ f.request('A', ['x', 'y'], ]]></script>";
        var offset = OffsetAfter("f.request('A', ['x', 'y'], ", text);

        var help = FboJsAssistResolver.Signature(text, offset, EditorAssistMode.Source, Catalog);

        Assert.NotNull(help);
        Assert.Equal(2, help!.ActiveParameter);
    }

    [Fact]
    public void Signature_in_insight_mode_is_null()
    {
        const string text = "<script><![CDATA[ f.request( ]]></script>";
        var offset = OffsetAfter("f.request(", text);

        Assert.Null(FboJsAssistResolver.Signature(text, offset, EditorAssistMode.Insight, Catalog));
    }

    [Fact]
    public void Signature_outside_island_is_null()
    {
        const string text = "<form><field name=\"a\"/> f.request( </form>";
        var offset = OffsetAfter("f.request(", text);

        Assert.Null(FboJsAssistResolver.Signature(text, offset, EditorAssistMode.Source, Catalog));
    }

    [Fact]
    public void Signature_for_unknown_member_is_null()
    {
        const string text = "<script><![CDATA[ f.khongCo( ]]></script>";
        var offset = OffsetAfter("f.khongCo(", text);

        Assert.Null(FboJsAssistResolver.Signature(text, offset, EditorAssistMode.Source, Catalog));
    }

    [Fact]
    public void Empty_catalog_yields_nothing()
    {
        var offset = OffsetAfter("f.get");

        Assert.Empty(FboJsAssistResolver
            .Complete(Script, offset, EditorAssistMode.Source, FboJsCatalog.Empty).Items);
        Assert.Null(FboJsAssistResolver
            .Hover(Script, offset, EditorAssistMode.Source, FboJsCatalog.Empty));
    }
}
