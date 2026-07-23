using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class ViewRowPatternBuilderTests
{
    [Fact]
    public void Rebuild_WritesOneAndZerosForSpan()
    {
        var row = new FormViewRow
        {
            Cells =
            [
                new FormViewCell
                {
                    Kind = FormViewCellKind.Label,
                    FieldName = "ma_kh",
                    Suffix = ".Label",
                    ColumnIndex = 0,
                    ColumnSpan = 2
                },
                new FormViewCell
                {
                    Kind = FormViewCellKind.Input,
                    FieldName = "ma_kh",
                    Suffix = "",
                    ColumnIndex = 2,
                    ColumnSpan = 1
                },
                new FormViewCell
                {
                    Kind = FormViewCellKind.Empty,
                    ColumnIndex = 3,
                    ColumnSpan = 1
                }
            ]
        };

        ViewRowPatternBuilder.Rebuild(row, column_count: 4);

        // Label span2 → 10; Input → 1; Empty span1 → -
        Assert.Equal("101-", row.Pattern);
    }

    [Fact]
    public void Rebuild_EmptySpanningMultipleColumns_UsesOneAndZeros()
    {
        var row = new FormViewRow
        {
            Cells =
            [
                new FormViewCell { Kind = FormViewCellKind.Empty, ColumnIndex = 0, ColumnSpan = 2 },
                new FormViewCell { Kind = FormViewCellKind.Empty, ColumnIndex = 2, ColumnSpan = 1 }
            ]
        };

        ViewRowPatternBuilder.Rebuild(row, column_count: 3);

        Assert.Equal("10-", row.Pattern);
    }

    [Fact]
    public void Rebuild_UncoveredColumns_StayUnused()
    {
        var row = new FormViewRow
        {
            Cells =
            [
                new FormViewCell
                {
                    Kind = FormViewCellKind.Input,
                    FieldName = "a",
                    ColumnIndex = 0,
                    ColumnSpan = 1
                }
            ]
        };

        ViewRowPatternBuilder.Rebuild(row, column_count: 4);

        Assert.Equal("1---", row.Pattern);
    }

    [Fact]
    public void Rebuild_ZeroColumns_ClearsPattern()
    {
        var row = new FormViewRow { Pattern = "111" };

        ViewRowPatternBuilder.Rebuild(row, column_count: 0);

        Assert.Equal(string.Empty, row.Pattern);
    }
}
