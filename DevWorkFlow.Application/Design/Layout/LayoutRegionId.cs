namespace DevWorkFlow.Application.Design.Layout;

/// <summary>Vùng layout của Form: main (view), category tab (index &gt; 0), footer (category index -1).</summary>
public enum LayoutRegionKind
{
    Main,
    Category,
    Footer
}

/// <summary>
/// Định danh Region — không dùng offset. Chuỗi hoá khớp <c>data-dwf-slot</c> của Blueprint:
/// <c>main</c> | <c>footer</c> | <c>cat:{index}</c>.
/// </summary>
public readonly record struct LayoutRegionId(LayoutRegionKind Kind, int CategoryIndex = 0)
{
    public static LayoutRegionId Main { get; } = new(LayoutRegionKind.Main);
    public static LayoutRegionId Footer { get; } = new(LayoutRegionKind.Footer);
    public static LayoutRegionId Category(int index) => new(LayoutRegionKind.Category, index);

    public override string ToString() => Kind switch
    {
        LayoutRegionKind.Main => "main",
        LayoutRegionKind.Footer => "footer",
        _ => $"cat:{CategoryIndex}"
    };

    /// <summary>Parse <c>main</c> | <c>footer</c> | <c>cat:{n}</c> (n &gt; 0).</summary>
    public static bool TryParse(string? raw, out LayoutRegionId id)
    {
        id = default;
        if (string.IsNullOrWhiteSpace(raw))
            return false;

        var text = raw.Trim();
        if (text.Equals("main", StringComparison.OrdinalIgnoreCase))
        {
            id = Main;
            return true;
        }

        if (text.Equals("footer", StringComparison.OrdinalIgnoreCase))
        {
            id = Footer;
            return true;
        }

        const string cat_prefix = "cat:";
        if (text.StartsWith(cat_prefix, StringComparison.OrdinalIgnoreCase)
            && int.TryParse(text.AsSpan(cat_prefix.Length), out var index)
            && index > 0)
        {
            id = Category(index);
            return true;
        }

        return false;
    }

    /// <summary>
    /// Parse <c>data-dwf-slot</c> = <c>{region}:{row}:{col}:{span}</c> với region có thể chứa
    /// dấu <c>:</c> (<c>cat:1:0:2:2</c> → region=cat:1, row=0, col=2, span=2).
    /// </summary>
    public static bool TryParseSlotAttr(
        string? raw,
        out LayoutRegionId region,
        out int row_index,
        out int column_index,
        out int column_span)
    {
        region = default;
        row_index = 0;
        column_index = 0;
        column_span = 0;
        if (string.IsNullOrWhiteSpace(raw))
            return false;

        var parts = raw.Trim().Split(':');
        if (parts.Length < 4)
            return false;

        if (!int.TryParse(parts[^1], out column_span) || column_span < 1)
            return false;
        if (!int.TryParse(parts[^2], out column_index) || column_index < 0)
            return false;
        if (!int.TryParse(parts[^3], out row_index) || row_index < 0)
            return false;

        var region_raw = string.Join(':', parts[..^3]);
        return TryParse(region_raw, out region);
    }
}

/// <summary>ColumnIndex = chỉ số cột bắt đầu của slot (0-based), khớp <c>FormViewCell.ColumnIndex</c>.</summary>
public readonly record struct LayoutSlotId(LayoutRegionId Region, int RowIndex, int ColumnIndex);
