using DevWorkFlow.Application.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class InformationSqlBuilderTests
{
    private static string? Build(string information, string? key = null, string? check = null) =>
        InformationSqlBuilder.Build(new InformationSqlRequest
        {
            Information = information,
            Key = key,
            Check = check
        });

    [Fact]
    public void Locale_suffix_emits_both_locale_columns()
    {
        var sql = Build("tk$dmtk.ten_tk%l", key: "status = '1'");

        Assert.NotNull(sql);
        Assert.Contains("SELECT tk, ten_tk, ten_tk2", sql, StringComparison.Ordinal);
        Assert.Contains("FROM dmtk", sql, StringComparison.Ordinal);
        Assert.Contains("WHERE status = '1'", sql, StringComparison.Ordinal);
    }

    [Fact]
    public void Without_locale_suffix_emits_two_columns()
    {
        var sql = Build("ma_kh$dmkh.ten_kh");

        Assert.NotNull(sql);
        Assert.Contains("SELECT ma_kh, ten_kh", sql, StringComparison.Ordinal);
        Assert.DoesNotContain("ten_kh2", sql, StringComparison.Ordinal);
    }

    [Fact]
    public void Display_already_ending_with_two_is_not_doubled()
    {
        var sql = Build("ma_nh$dmnhkh2.ten_nh2%l");

        Assert.NotNull(sql);
        Assert.Contains("SELECT ma_nh, ten_nh2", sql, StringComparison.Ordinal);
        Assert.DoesNotContain("ten_nh22", sql, StringComparison.Ordinal);
    }

    [Fact]
    public void Omits_where_when_key_missing()
    {
        var sql = Build("ma_nt$dmnt.ten_nt%l");

        Assert.NotNull(sql);
        Assert.DoesNotContain("WHERE", sql, StringComparison.Ordinal);
    }

    [Fact]
    public void Check_is_comment_only_and_never_enters_where()
    {
        var sql = Build("ma_kh$dmkh.ten_kh%l", key: "status = '1'", check: "kh_yn = 1");

        Assert.NotNull(sql);
        Assert.Contains("-- check: kh_yn = 1", sql, StringComparison.Ordinal);
        Assert.Contains("WHERE status = '1'", sql, StringComparison.Ordinal);
        Assert.DoesNotContain("WHERE kh_yn = 1", sql, StringComparison.Ordinal);
        Assert.DoesNotContain("and kh_yn = 1", sql, StringComparison.Ordinal);
    }

    [Fact]
    public void Original_information_is_echoed_as_comment()
    {
        var sql = Build("ma_vt$dmvt.ten_vt%l");

        Assert.NotNull(sql);
        Assert.StartsWith("-- information=ma_vt$dmvt.ten_vt%l", sql, StringComparison.Ordinal);
    }

    // Corpus thật: ma_dvcs$dmdvcs.ten_dvcs%l$client_code=@@unit — có đuôi $điều-kiện SAU %l.
    // Thuật toán "kết thúc bằng %l" đơn thuần sẽ hiểu sai cột hiển thị.
    [Fact]
    public void Trailing_extra_condition_after_locale_is_parsed_out()
    {
        var sql = Build("ma_dvcs$dmdvcs.ten_dvcs%l$client_code=@@unit");

        Assert.NotNull(sql);
        Assert.Contains("SELECT ma_dvcs, ten_dvcs, ten_dvcs2", sql, StringComparison.Ordinal);
        Assert.Contains("FROM dmdvcs", sql, StringComparison.Ordinal);
        // Điều kiện phụ chứa biến runtime (@@unit) → chỉ comment, không đẩy vào WHERE.
        Assert.Contains("client_code=@@unit", sql, StringComparison.Ordinal);
        Assert.DoesNotContain("WHERE client_code", sql, StringComparison.Ordinal);
    }

    [Theory]
    [InlineData("&TableDetail;")]                 // entity ref chưa expand
    [InlineData("&Tiny.External.Lookup.Dep;")]
    [InlineData("")]
    [InlineData("   ")]
    [InlineData("khong_co_dollar")]
    [InlineData("thieu$dau_cham")]
    [InlineData("$dmtk.ten_tk")]                  // thiếu code
    public void Unparseable_information_returns_null(string information)
        => Assert.Null(Build(information));

    [Fact]
    public void Null_request_returns_null()
        => Assert.Null(InformationSqlBuilder.Build(null!));
}
