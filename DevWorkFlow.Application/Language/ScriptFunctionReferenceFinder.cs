using System.Text.RegularExpressions;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Tìm call site của một hàm JS trong document hiện tại (Phase 3 #12 — FindRefs). Không
/// parse full JS AST: quét tên hàm đứng ngay trước <c>(</c>, loại trừ chính vị trí định nghĩa
/// <c>function name(…)</c>.
///
/// Ranh giới tên KHÔNG dùng <c>\b</c>: tên hàm FBO hay kết thúc bằng <c>$</c>
/// (<c>load$GridVoucherDetail$</c>) và có nhiều hàm cùng tiền tố
/// (<c>onChange$GridVoucherDetail$Item/UOM/Site…</c>) → <c>\b</c> vừa trượt đúng tên của chính
/// nó vừa khớp nhầm hàm dài hơn. Dùng lookaround "không còn ký tự identifier".
/// </summary>
public static class ScriptFunctionReferenceFinder
{
    public static IReadOnlyList<SourceSpan> FindCallSites(
        string script_or_doc, string function_name, int definition_offset)
    {
        if (string.IsNullOrEmpty(script_or_doc) || string.IsNullOrWhiteSpace(function_name))
            return [];

        var definition_span = ResolveDefinitionSpan(script_or_doc, function_name, definition_offset);
        var escaped = Regex.Escape(function_name);
        var call_regex = new Regex(
            $"{JsRuntimeAtOffsetResolver.IdentifierStart}{escaped}" +
            $"{JsRuntimeAtOffsetResolver.IdentifierEnd}\\s*\\(");

        var result = new List<SourceSpan>();
        foreach (Match m in call_regex.Matches(script_or_doc))
        {
            if (definition_span is { } def && m.Index >= def.StartOffset && m.Index < def.EndOffset)
                continue;
            result.Add(new SourceSpan(m.Index, function_name.Length));
        }

        return result;
    }

    private static SourceSpan? ResolveDefinitionSpan(string text, string name, int definition_offset)
    {
        if (definition_offset < 0 || definition_offset >= text.Length) return null;

        var def_regex = new Regex(
            $@"\Gfunction\s+{Regex.Escape(name)}{JsRuntimeAtOffsetResolver.IdentifierEnd}");
        var m = def_regex.Match(text, definition_offset);
        return m.Success ? new SourceSpan(definition_offset, m.Length) : null;
    }
}
