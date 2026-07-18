namespace DevWorkFlow.Domain.Language.Syntax;

/// <summary>
/// Node cú pháp. Lá là token; nội dung serialize = nối FullText các lá theo thứ tự.
/// </summary>
public sealed class SyntaxNode
{
    private readonly List<SyntaxNode> _children = [];
    private readonly List<SyntaxToken> _tokens = [];

    public SyntaxNode(SyntaxKind kind, string? name = null)
    {
        Kind = kind;
        Name = name ?? string.Empty;
    }

    public SyntaxKind Kind { get; }

    /// <summary>Tên element (local) hoặc rỗng.</summary>
    public string Name { get; set; }

    /// <summary>Qualifier gợi ý (name/id/event attribute) — không ảnh hưởng serialize.</summary>
    public string? Qualifier { get; set; }

    public SourceSpan Span { get; private set; }

    public int StartLine { get; private set; } = 1;

    public int EndLine { get; private set; } = 1;

    public IReadOnlyList<SyntaxNode> Children => _children;

    /// <summary>Token trực tiếp thuộc node (thường Start/End tag); con element giữ token riêng.</summary>
    public IReadOnlyList<SyntaxToken> DirectTokens => _tokens;

    public void AddChild(SyntaxNode child) => _children.Add(child);

    public void AddToken(SyntaxToken token) => _tokens.Add(token);

    public void Seal(SourceSpan span, int start_line, int end_line)
    {
        Span = span;
        StartLine = start_line;
        EndLine = end_line;
    }

    /// <summary>Nối toàn bộ text lá (lossless).</summary>
    public string GetFullText()
    {
        var sb = new System.Text.StringBuilder(Math.Max(16, Span.Length));
        AppendFullText(sb);
        return sb.ToString();
    }

    internal void AppendFullText(System.Text.StringBuilder sb)
    {
        // Document/Element: tokens và children xen kẽ theo offset.
        var parts = new List<(int Offset, Action Append)>();
        foreach (var t in _tokens)
            parts.Add((t.Span.StartOffset, () => sb.Append(t.Text)));
        foreach (var c in _children)
            parts.Add((c.Span.StartOffset, () => c.AppendFullText(sb)));

        foreach (var part in parts.OrderBy(p => p.Offset))
            part.Append();
    }
}
