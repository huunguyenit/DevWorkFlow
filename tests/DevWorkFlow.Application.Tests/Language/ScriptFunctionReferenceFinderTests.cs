using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class ScriptFunctionReferenceFinderTests
{
    [Fact]
    public void One_definition_two_calls_returns_two_spans()
    {
        const string script = """
            function onChange(sender) {
                doSomething();
            }
            function onInit() {
                onChange(this);
                onChange(null);
            }
            """;
        var definition_offset = script.IndexOf("function onChange", StringComparison.Ordinal);

        var spans = ScriptFunctionReferenceFinder.FindCallSites(script, "onChange", definition_offset);

        Assert.Equal(2, spans.Count);
    }

    [Fact]
    public void Definition_itself_is_excluded()
    {
        const string script = "function onChange(sender) { }";
        var definition_offset = script.IndexOf("function onChange", StringComparison.Ordinal);

        var spans = ScriptFunctionReferenceFinder.FindCallSites(script, "onChange", definition_offset);

        Assert.Empty(spans);
    }

    // Tên hàm FBO thật: nhiều hàm CÙNG TIỀN TỐ, và tên có thể KẾT THÚC bằng '$'.
    private const string SimilarNames = """
        function onChange$GridVoucherDetail$(o) { base$(o); }
        function onChange$GridVoucherDetail$GoodsType(o) {o.grid.request(o, 'GoodsType', 'GoodsType');}
        function onChange$GridVoucherDetail$Item(o) {o.grid.request(o, 'Item', 'Item');}
        function onChange$GridVoucherDetail$UOM(o) {o.grid.request(o, 'UOM', 'UOM');}
        function caller(o) {
            onChange$GridVoucherDetail$(o);
            onChange$GridVoucherDetail$Item(o);
            onChange$GridVoucherDetail$Item(o);
        }
        """;

    [Fact]
    public void Prefix_name_does_not_match_longer_sibling_functions()
    {
        const string name = "onChange$GridVoucherDetail$";
        var definition = SimilarNames.IndexOf($"function {name}(", StringComparison.Ordinal);

        var spans = ScriptFunctionReferenceFinder.FindCallSites(SimilarNames, name, definition);

        // Chỉ 1 lời gọi đúng tên; KHÔNG được tính các hàm cùng tiền tố ($GoodsType/$Item/$UOM).
        Assert.Single(spans);
    }

    [Fact]
    public void Longer_name_does_not_pick_up_prefix_sibling_calls()
    {
        const string name = "onChange$GridVoucherDetail$Item";
        var definition = SimilarNames.IndexOf($"function {name}(", StringComparison.Ordinal);

        var spans = ScriptFunctionReferenceFinder.FindCallSites(SimilarNames, name, definition);

        Assert.Equal(2, spans.Count);
    }

    [Fact]
    public void No_calls_returns_empty()
    {
        const string script = "function onChange(sender) { doSomethingElse(); }";
        var definition_offset = script.IndexOf("function onChange", StringComparison.Ordinal);

        var spans = ScriptFunctionReferenceFinder.FindCallSites(script, "onChange", definition_offset);

        Assert.Empty(spans);
    }
}
