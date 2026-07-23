using DevWorkFlow.Domain.Language;

namespace UI.Views.Controls;

/// <summary>
/// Đổi <see cref="SqlCompletionList"/> sang payload bridge (camelCase) mà bridge.js đang chờ —
/// cùng shape với item Completion JS để phía JS chỉ có một hàm map duy nhất.
/// Dùng chung cho tab SQL và vùng SQL trong Form Source.
/// </summary>
internal static class SqlCompletionMapper
{
    public static object[] ToBridgeItems(SqlCompletionList? list)
    {
        if (list is null || list.Items.Count == 0) return [];

        return [.. list.Items.Select(item => (object)new
        {
            label = item.Label,
            insertText = item.InsertText,
            kind = item.Kind switch
            {
                SqlCompletionKind.Keyword => "keyword",
                SqlCompletionKind.Procedure => "procedure",
                _ => "function"
            },
            detail = item.Detail,
            documentation = item.Documentation
        })];
    }
}
