namespace DevWorkFlow.Domain.Language.Syntax;

/// <summary>Ánh xạ offset ↔ (line, column) 1-based.</summary>
public sealed class LineMap
{
    private readonly int[] _line_starts;

    public LineMap(string text)
    {
        var starts = new List<int> { 0 };
        for (var i = 0; i < text.Length; i++)
        {
            if (text[i] == '\n')
                starts.Add(i + 1);
        }
        _line_starts = starts.ToArray();
        TextLength = text.Length;
    }

    public int TextLength { get; }

    public int LineCount => _line_starts.Length;

    public (int Line, int Column) GetLineColumn(int offset)
    {
        if (offset < 0) offset = 0;
        if (offset > TextLength) offset = TextLength;

        var line_idx = Array.BinarySearch(_line_starts, offset);
        if (line_idx < 0)
            line_idx = ~line_idx - 1;
        if (line_idx < 0) line_idx = 0;

        var line = line_idx + 1;
        var column = offset - _line_starts[line_idx] + 1;
        return (line, column);
    }

    public int GetOffset(int line, int column)
    {
        if (line < 1) line = 1;
        if (line > _line_starts.Length) line = _line_starts.Length;
        var start = _line_starts[line - 1];
        return Math.Min(TextLength, start + Math.Max(0, column - 1));
    }
}
