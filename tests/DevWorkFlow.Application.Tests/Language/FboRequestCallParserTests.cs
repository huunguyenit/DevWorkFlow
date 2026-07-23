using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class FboRequestCallParserTests
{
    [Fact]
    public void Form_request_positional_action_context()
    {
        const string script = "o.parentForm.request('Customer', 'Customer', {});";
        var action_offset = script.IndexOf("'Customer'", StringComparison.Ordinal) + 1;

        var hit = FboRequestCallParser.TryFindEnclosing(script, action_offset);

        Assert.NotNull(hit);
        Assert.Equal("Customer", hit!.ActionName);
        Assert.Equal("Customer", hit.ContextName);
    }

    [Fact]
    public void Grid_request_first_arg_not_string_skips_to_next_two_literals()
    {
        const string script = "o.grid.request(o, 'Item', 'Item', {});";
        var context_literal_offset = script.LastIndexOf("'Item'", StringComparison.Ordinal) + 1;

        var hit = FboRequestCallParser.TryFindEnclosing(script, context_literal_offset);

        Assert.NotNull(hit);
        Assert.Equal("Item", hit!.ActionName);
        Assert.Equal("Item", hit.ContextName);
    }

    [Fact]
    public void Distinct_action_and_context_names_resolve_to_correct_offsets()
    {
        const string script = "o.grid.request(sender, 'Voucher', 'VoucherDetail');";
        var offset = script.IndexOf("VoucherDetail", StringComparison.Ordinal);

        var hit = FboRequestCallParser.TryFindEnclosing(script, offset);

        Assert.NotNull(hit);
        Assert.Equal("Voucher", hit!.ActionName);
        Assert.Equal("VoucherDetail", hit.ContextName);
        Assert.Equal(
            script.IndexOf("VoucherDetail", StringComparison.Ordinal),
            hit.ContextLiteralOffset);
    }

    [Fact]
    public void Request_with_dollar_suffix_still_resolves()
    {
        // FBO cho phép hậu tố $Something ngay sau tên method (cùng quy ước với showForm$Voucher).
        const string script = "o.parentForm.request$Voucher('Customer', 'Customer', {});";
        var offset = script.IndexOf("'Customer'", StringComparison.Ordinal) + 1;

        var hit = FboRequestCallParser.TryFindEnclosing(script, offset);

        Assert.NotNull(hit);
        Assert.Equal("Customer", hit!.ActionName);
    }

    [Fact]
    public void Offset_outside_any_request_call_returns_null()
    {
        const string script = "o.parentForm.request('Customer', 'Customer');";
        Assert.Null(FboRequestCallParser.TryFindEnclosing(script, 0));
    }

    [Fact]
    public void Request_with_fewer_than_two_string_literals_returns_null()
    {
        const string script = "o.parentForm.request('Customer');";
        var offset = script.IndexOf("'Customer'", StringComparison.Ordinal) + 1;

        Assert.Null(FboRequestCallParser.TryFindEnclosing(script, offset));
    }
}

public sealed class ResponseCompleteCaseFinderTests
{
    private const string Script = """
        function on$Voucher$ResponseComplete(response, context) {
            switch (context) {
                case 'Customer':
                    doSomething();
                    break;
                case 'Item':
                    doOther();
                    break;
            }
        }
        """;

    [Fact]
    public void Exact_case_match_returns_offset()
    {
        var offset = ResponseCompleteCaseFinder.FindCaseOffset(Script, "Customer");

        Assert.NotNull(offset);
        Assert.True(offset >= 0);
        Assert.Equal(
            Script.IndexOf("Customer", StringComparison.Ordinal),
            offset);
    }

    [Fact]
    public void Second_case_also_resolves()
    {
        var offset = ResponseCompleteCaseFinder.FindCaseOffset(Script, "Item");

        Assert.NotNull(offset);
        Assert.Equal(Script.IndexOf("'Item'", StringComparison.Ordinal) + 1, offset);
    }

    [Fact]
    public void Typo_context_returns_null_no_fuzzy_fix()
    {
        var offset = ResponseCompleteCaseFinder.FindCaseOffset(Script, "Cusomter");

        Assert.Null(offset);
    }

    [Fact]
    public void No_response_complete_function_returns_null()
    {
        Assert.Null(ResponseCompleteCaseFinder.FindCaseOffset("g.doSomething();", "Customer"));
    }
}
