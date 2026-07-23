using System.Text.RegularExpressions;
using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Engine;

/// <summary>Loại node trong cây tóm tắt XML controller.</summary>
public enum XmlStructureKind
{
    Element,
    ScriptFunction,
    Text
}

/// <summary>Một node cây cấu trúc XML (kèm số dòng 1-based để nhảy editor).</summary>
public sealed class XmlStructureNode
{
    public string Name { get; set; } = string.Empty;
    public string? Qualifier { get; set; }
    public XmlStructureKind Kind { get; set; }
    public int StartLine { get; set; }
    public int StartOffset { get; set; }
    public int EndLine { get; set; }
    public List<XmlStructureNode> Children { get; } = [];

    public string Display =>
        Kind == XmlStructureKind.ScriptFunction
            ? $"function {Name}()"
            : string.IsNullOrWhiteSpace(Qualifier)
                ? Name
                : $"{Name}  ·  {Qualifier}";
}

/// <summary>
/// Structure Tree — projection từ lossless <see cref="ISyntaxTree"/> (Phase 2).
/// F12 helpers vẫn đọc source text (Phase 5 sẽ dùng symbol index).
/// </summary>
public static class XmlStructureParser
{
    public static XmlStructureNode? Parse(string? xml)
    {
        if (string.IsNullOrWhiteSpace(xml))
            return null;

        var tree = FboSyntaxParser.Parse(xml);
        return SyntaxStructureProjector.Project(tree);
    }

    /// <summary>Parse trực tiếp từ syntax tree đã có.</summary>
    public static XmlStructureNode? Parse(ISyntaxTree? tree) =>
        SyntaxStructureProjector.Project(tree);

    /// <summary>Tìm định nghĩa function trong toàn bộ XML (F12).</summary>
    public static (int Line, int Offset)? FindFunctionDefinition(string xml, string function_name)
    {
        if (string.IsNullOrWhiteSpace(xml) || string.IsNullOrWhiteSpace(function_name))
            return null;

        // (?![\w$]) thay cho \b: tên hàm FBO hay kết thúc bằng '$' và có nhiều hàm cùng tiền tố
        // (onChange$GridVoucherDetail$Item/UOM/…) → \b khớp nhầm hàm dài hơn.
        var pattern = new Regex(
            $@"function\s+{Regex.Escape(function_name)}(?![\w$])",
            RegexOptions.Compiled);
        var m = pattern.Match(xml);
        if (!m.Success) return null;

        var line = 1;
        for (var i = 0; i < m.Index; i++)
        {
            if (xml[i] == '\n') line++;
        }

        return (line, m.Index);
    }

    /// <summary>Lấy identifier dưới caret (function name / word).</summary>
    public static string? ExtractIdentifierAt(string text, int offset)
    {
        if (string.IsNullOrEmpty(text) || offset < 0 || offset > text.Length)
            return null;

        var start = Math.Min(offset, text.Length - 1);
        if (start < 0) return null;

        while (start > 0 && IsIdentChar(text[start - 1]))
            start--;

        var end = start;
        while (end < text.Length && IsIdentChar(text[end]))
            end++;

        if (end <= start) return null;
        return text[start..end];
    }

    private static bool IsIdentChar(char c) =>
        char.IsLetterOrDigit(c) || c is '_' or '$';
}
