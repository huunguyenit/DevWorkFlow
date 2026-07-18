namespace DevWorkFlow.Domain.Language.Syntax;

/// <summary>
/// Token lossless — <see cref="Text"/> là substring gốc, không chuẩn hóa.
/// </summary>
public sealed class SyntaxToken
{
    public SyntaxToken(SyntaxKind kind, string text, SourceSpan span, int line, int column)
    {
        Kind = kind;
        Text = text;
        Span = span;
        Line = line;
        Column = column;
    }

    public SyntaxKind Kind { get; }

    /// <summary>Nội dung đúng như trong source.</summary>
    public string Text { get; }

    public SourceSpan Span { get; }

    /// <summary>Dòng 1-based tại StartOffset.</summary>
    public int Line { get; }

    /// <summary>Cột 1-based tại StartOffset.</summary>
    public int Column { get; }

    public bool IsTrivia =>
        Kind is SyntaxKind.Whitespace or SyntaxKind.Comment;

    public override string ToString() => Text;
}
