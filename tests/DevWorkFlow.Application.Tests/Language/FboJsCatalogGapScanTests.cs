using DevWorkFlow.Application.Language;
using Xunit;
using Xunit.Abstractions;

namespace DevWorkFlow.Application.Tests.Language;

public sealed class FboJsCatalogGapScanTests
{
    private readonly ITestOutputHelper _output;

    public FboJsCatalogGapScanTests(ITestOutputHelper output) => _output = output;

    private static FboJsCatalog SeedCatalog() =>
        FboJsCatalog.FromData(
            FboJsCatalogParser.ParseFile(FboJsCatalogParserTests.FindSeedCatalog()!));

    [Fact]
    public void Reports_member_missing_from_catalog()
    {
        const string code = "f.getItemValue('a'); f.khongCoTrongCatalog(1); f.khongCoTrongCatalog(2);";

        var gaps = FboJsCatalogGapScanner.FindMissingMembers(code, SeedCatalog());

        var gap = Assert.Single(gaps, g => g.Member == "khongCoTrongCatalog");
        Assert.Equal("f", gap.Receiver);
        Assert.Equal(2, gap.Occurrences);
    }

    [Fact]
    public void Known_members_are_not_reported()
    {
        const string code = "f.getItemValue('a'); g.showForm('X');";

        var gaps = FboJsCatalogGapScanner.FindMissingMembers(code, SeedCatalog());

        Assert.DoesNotContain(gaps, g => g.Member == "getItemValue");
        Assert.DoesNotContain(gaps, g => g.Member == "showForm");
    }

    [Fact]
    public void Unknown_receiver_is_ignored_to_avoid_noise()
    {
        // `abc` không phải alias FBO → mọi `abc.xyz` là JS thường, không phải gap catalog.
        const string code = "abc.xyz(); someObject.method();";

        Assert.Empty(FboJsCatalogGapScanner.FindMissingMembers(code, SeedCatalog()));
    }

    /// <summary>
    /// Dev report trên corpus thật — KHÔNG assert số lượng (corpus luôn có API chưa mô tả hết,
    /// fail CI vì điều đó là vô nghĩa). Chỉ in ra để biết nên bổ sung gì vào catalog.
    /// </summary>
    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Report_gaps_for_real_corpus_file()
    {
        var path = FboProgramCorpus.TryFind("Grid", "SVDetail.xml")!;
        var gaps = FboJsCatalogGapScanner.FindMissingMembers(File.ReadAllText(path), SeedCatalog());

        _output.WriteLine($"Thiếu trong catalog ({gaps.Count}) — {Path.GetFileName(path)}:");
        foreach (var gap in gaps.Take(40))
            _output.WriteLine("  " + gap.Display);

        Assert.True(true, "Báo cáo dev — không gate CI theo độ phủ catalog.");
    }
}
