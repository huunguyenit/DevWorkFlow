using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public class DiagnosticGridMapperTests
{
    [Fact]
    public void MapProblems_skips_hidden_and_maps_severity_badges()
    {
        var rows = DiagnosticGridMapper.MapProblems(
        [
            new ErpDiagnostic
            {
                Severity = ErpDiagnosticSeverity.Error,
                Message = "Missing entity",
                Location = new SourceLocation { Path = "a.xml", Line = 3, Column = 5 }
            },
            new ErpDiagnostic
            {
                Severity = ErpDiagnosticSeverity.Warning,
                Message = "Deprecated attr",
                Location = new SourceLocation { Line = 10 }
            },
            new ErpDiagnostic
            {
                Severity = ErpDiagnosticSeverity.Hidden,
                Message = "hidden"
            }
        ],
        "fallback.xml");

        Assert.Equal(2, rows.Count);
        Assert.Equal("E", rows[0].SeverityBadge);
        Assert.Equal("a.xml", rows[0].File);
        Assert.Equal(3, rows[0].Line);
        Assert.Equal(5, rows[0].Column);
        Assert.Equal("W", rows[1].SeverityBadge);
        Assert.Equal("fallback.xml", rows[1].File);
    }

    [Fact]
    public void CountBySeverity_aggregates_error_warning_hint()
    {
        var counts = DiagnosticGridMapper.CountBySeverity(
        [
            new ErpDiagnostic { Severity = ErpDiagnosticSeverity.Error },
            new ErpDiagnostic { Severity = ErpDiagnosticSeverity.Warning },
            new ErpDiagnostic { Severity = ErpDiagnosticSeverity.Info },
            new ErpDiagnostic { Severity = ErpDiagnosticSeverity.Hidden }
        ]);

        Assert.Equal(1, counts.Errors);
        Assert.Equal(1, counts.Warnings);
        Assert.Equal(1, counts.Hints);
    }
}
