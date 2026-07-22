using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class ClientScriptFunctionNameTests
{
    private static readonly Dictionary<string, string> NoEntities =
        new(StringComparer.OrdinalIgnoreCase);

    [Fact]
    public void Plain_handler_name_inside_cdata()
    {
        var xml =
            """<field name="x"><clientScript><![CDATA[onchange="onChange$Voucher$x(this);"]]></clientScript></field>""";
        var offset = xml.IndexOf("onChange$Voucher$x", StringComparison.Ordinal) + 3;

        Assert.Equal("onChange$Voucher$x", ClientScriptFunctionName.TryExtract(xml, offset, NoEntities));
    }

    [Fact]
    public void Entity_split_name_is_joined()
    {
        // Nguồn FBO: phần chữ trong CDATA, &Account; nằm NGOÀI CDATA (để expand) → nối lại
        // thành onChangeCurrencyAccount.
        var xml =
            """<field name="a"><clientScript><![CDATA[onchange="onChangeCurrency]]>&Account;<![CDATA[(this);"]]></clientScript></field>""";
        var offset = xml.IndexOf("onChangeCurrency", StringComparison.Ordinal) + 4;
        var values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            ["Account"] = "Account"
        };

        Assert.Equal("onChangeCurrencyAccount",
            ClientScriptFunctionName.TryExtract(xml, offset, values));
    }

    [Fact]
    public void Click_on_entity_ref_returns_joined_name()
    {
        var xml =
            """<field name="a"><clientScript><![CDATA[onChangeCurrency]]>&Account;<![CDATA[(this)]]></clientScript></field>""";
        var offset = xml.IndexOf("&Account;", StringComparison.Ordinal) + 2; // trong &Account;
        var values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            ["Account"] = "Account"
        };

        Assert.Equal("onChangeCurrencyAccount",
            ClientScriptFunctionName.TryExtract(xml, offset, values));
    }

    [Fact]
    public void Offset_outside_clientscript_returns_null()
    {
        var xml =
            """<field name="x"><clientScript><![CDATA[foo(this);]]></clientScript></field>""";
        var offset = xml.IndexOf("name=\"x\"", StringComparison.Ordinal);

        Assert.Null(ClientScriptFunctionName.TryExtract(xml, offset, NoEntities));
    }
}
