using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Gắn số dòng + dòng code xem trước cho reference/relation. Panel References cần "file : line :
/// đoạn code" mà consumer KHÔNG được tự đọc file (R1 — UI không chạm storage), nên việc này nằm
/// ở Application. Nội dung file được cache theo lần enrich (một symbol thường trỏ vào vài file).
/// </summary>
internal sealed class ReferencePreviewEnricher
{
    private readonly Dictionary<string, string?> _text_by_path = new(StringComparer.OrdinalIgnoreCase);
    private readonly Func<string, string?> _open_document_text;

    public ReferencePreviewEnricher(Func<string, string?> open_document_text)
    {
        _open_document_text = open_document_text;
    }

    public NavigationTarget Enrich(NavigationTarget target)
    {
        var text = GetText(target.DocumentUri);
        if (text is null) return target;

        var offset = target.TextRange.StartOffset;
        if (offset < 0 || offset > text.Length) return target;

        return new NavigationTarget
        {
            NodeId = target.NodeId,
            DocumentUri = target.DocumentUri,
            TextRange = target.TextRange,
            NodeType = target.NodeType,
            SymbolId = target.SymbolId,
            Symbol = target.Symbol,
            StartLine = target.StartLine > 0 ? target.StartLine : LineOf(text, offset),
            EndLine = target.EndLine,
            PreferCaretOnly = target.PreferCaretOnly,
            UsesClearTextOffsets = target.UsesClearTextOffsets,
            Preview = string.IsNullOrEmpty(target.Preview) ? LineTextAt(text, offset) : target.Preview
        };
    }

    public JsRuntimeRelation Enrich(JsRuntimeRelation relation)
    {
        if (relation.TargetOffset < 0) return relation;
        var text = GetText(relation.TargetPath);
        if (text is null || relation.TargetOffset > text.Length) return relation;

        return new JsRuntimeRelation
        {
            Role = relation.Role,
            Label = relation.Label,
            TargetPath = relation.TargetPath,
            TargetOffset = relation.TargetOffset,
            Line = LineOf(text, relation.TargetOffset)
        };
    }

    private string? GetText(string path)
    {
        if (string.IsNullOrWhiteSpace(path)) return null;
        if (_text_by_path.TryGetValue(path, out var cached)) return cached;

        string? text = null;
        try
        {
            // Ưu tiên buffer đang mở (có thể đã sửa, chưa lưu) rồi mới tới đĩa.
            text = _open_document_text(path) ?? (File.Exists(path) ? File.ReadAllText(path) : null);
        }
        catch
        {
            // File bị khoá/đã xoá → không có preview, không làm hỏng điều hướng.
        }

        _text_by_path[path] = text;
        return text;
    }

    private static int LineOf(string text, int offset)
    {
        var line = 1;
        var limit = Math.Min(offset, text.Length);
        for (var i = 0; i < limit; i++)
            if (text[i] == '\n') line++;
        return line;
    }

    private static string LineTextAt(string text, int offset)
    {
        if (offset >= text.Length) offset = Math.Max(0, text.Length - 1);
        var start = offset;
        while (start > 0 && text[start - 1] != '\n') start--;
        var end = offset;
        while (end < text.Length && text[end] != '\n') end++;
        return text[start..end].Trim();
    }
}
