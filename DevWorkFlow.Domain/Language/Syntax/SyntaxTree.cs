namespace DevWorkFlow.Domain.Language.Syntax;

/// <summary>Lossless syntax tree của một storage snapshot.</summary>
public interface ISyntaxTree
{
    /// <summary>Source gốc đã parse.</summary>
    string SourceText { get; }

    SyntaxNode Root { get; }

    LineMap LineMap { get; }

    IReadOnlyList<SyntaxToken> Tokens { get; }

    IReadOnlyList<ErpDiagnostic> Diagnostics { get; }

    /// <summary>Serialize lossless từ cây (nối token lá).</summary>
    string Serialize();
}

/// <summary>Implementation mặc định.</summary>
public sealed class SyntaxTree : ISyntaxTree
{
    public SyntaxTree(
        string source_text,
        SyntaxNode root,
        LineMap line_map,
        IReadOnlyList<SyntaxToken> tokens,
        IReadOnlyList<ErpDiagnostic>? diagnostics = null)
    {
        SourceText = source_text;
        Root = root;
        LineMap = line_map;
        Tokens = tokens;
        Diagnostics = diagnostics ?? [];
    }

    public string SourceText { get; }

    public SyntaxNode Root { get; }

    public LineMap LineMap { get; }

    public IReadOnlyList<SyntaxToken> Tokens { get; }

    public IReadOnlyList<ErpDiagnostic> Diagnostics { get; }

    public string Serialize()
    {
        // Ưu tiên nối token phẳng (đảm bảo phủ toàn bộ source).
        if (Tokens.Count > 0)
        {
            var sb = new System.Text.StringBuilder(SourceText.Length);
            foreach (var t in Tokens)
            {
                if (t.Kind == SyntaxKind.EndOfFile) continue;
                sb.Append(t.Text);
            }
            return sb.ToString();
        }

        return Root.GetFullText();
    }
}
