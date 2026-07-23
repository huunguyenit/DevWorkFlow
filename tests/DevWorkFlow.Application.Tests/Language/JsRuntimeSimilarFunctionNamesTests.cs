using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

/// <summary>
/// Tên hàm FBO: nhiều hàm cùng tiền tố và tên có thể KẾT THÚC bằng <c>$</c>. Matching phải EXACT
/// — <c>\b</c> không đủ (sau <c>$</c> chỉ có word boundary khi ký tự kế là word-char, nên vừa
/// trượt chính nó vừa khớp nhầm hàm dài hơn).
/// </summary>
public sealed class JsRuntimeSimilarFunctionNamesTests
{
    private const string Xml = """
        <dir table="t" code="a">
          <script>
          <![CDATA[
          function onChange$GridVoucherDetail$(o) { doBase(o); }
          function onChange$GridVoucherDetail$GoodsType(o) {o.grid.request(o, 'GoodsType', 'GoodsType');}
          function onChange$GridVoucherDetail$Item(o) {o.grid.request(o, 'Item', 'Item');}
          function onChange$GridVoucherDetail$UOM(o) {o.grid.request(o, 'UOM', 'UOM');}
          function caller(o) {
              onChange$GridVoucherDetail$(o);
              onChange$GridVoucherDetail$Item(o);
              onChange$GridVoucherDetail$Item(o);
          }
          ]]>
          </script>
        </dir>
        """;

    private static (ErpLanguageService Service, IErpDocument Doc) Open()
    {
        var service = new ErpLanguageService();
        return (service, service.OpenDocumentFromText("buffer:similar-fn.xml", Xml));
    }

    [Fact]
    public void Name_ending_with_dollar_resolves_to_itself_not_longer_sibling()
    {
        var (service, doc) = Open();
        const string name = "onChange$GridVoucherDetail$";
        var definition = Xml.IndexOf($"function {name}(", StringComparison.Ordinal);

        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, definition + "function ".Length + 2, null);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.ScriptFunctionRefs, hit!.Kind);
        Assert.Equal($"script:{name}", hit.SymbolId);

        // Điểm mấu chốt: relation "định nghĩa" phải trỏ vào CHÍNH hàm này, không phải hàm cùng
        // tiền tố đứng sau ($GoodsType). Đây là chỗ \b khớp sai trước đây.
        var definition_relation = Assert.Single(
            hit.Relations, r => r.Role == JsRuntimeRelationRole.FunctionDefinition);
        Assert.Equal(definition, definition_relation.TargetOffset);
    }

    [Fact]
    public void Call_site_of_prefix_name_resolves_to_prefix_function()
    {
        var (service, doc) = Open();
        const string name = "onChange$GridVoucherDetail$";
        var call = Xml.IndexOf($"    {name}(o);", StringComparison.Ordinal);
        Assert.True(call > 0);

        var hit = service.ResolveJsRuntimeAtOffset(doc.Id, call + 6, null);

        Assert.NotNull(hit);
        Assert.Equal($"script:{name}", hit!.SymbolId);
    }

    [Fact]
    public void Sibling_with_suffix_resolves_to_its_own_symbol()
    {
        var (service, doc) = Open();
        const string name = "onChange$GridVoucherDetail$Item";
        var definition = Xml.IndexOf($"function {name}(", StringComparison.Ordinal);

        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, definition + "function ".Length + 2, null);

        Assert.NotNull(hit);
        Assert.Equal($"script:{name}", hit!.SymbolId);
        // 1 definition + 2 call site — không lẫn lời gọi của hàm tiền tố.
        Assert.Equal(3, hit.References.Count);
    }
}
