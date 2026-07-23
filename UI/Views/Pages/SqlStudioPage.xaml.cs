using UI.ViewModels;
using UI.Views.Controls;

namespace UI.Views.Pages;

public partial class SqlStudioPage
{
    public SqlStudioPage()
    {
        InitializeComponent();

        // Tab SQL không có Form VM phía sau nên mẫu snippet lấy qua hook dùng chung (App gán từ
        // Language Service) — cùng một nguồn với editor Source của Form.
        SqlEditor.OptionsSnippetRequested += (_, line_text) =>
            MonacoEditorHost.SharedSnippetExpander?.Invoke(line_text);

        // Hover hàm SQL: cùng widget với hover entity/JS bên Form, nội dung từ sql-functions.xml.
        SqlEditor.EntityHoverRequested += (offset, _, _) =>
        {
            var hover = DataContext is SqlDocumentViewModel vm
                ? MonacoEditorHost.SharedSqlHover?.Invoke(vm.ScriptText, offset)
                : null;

            if (hover is null)
                SqlEditor.HideEntityHover(offset);
            else
                SqlEditor.ShowEntityHover(offset, hover.Title, hover.Body, is_error: false, kind: "SQL");
        };

        // Ctrl+Space: Monaco chỉ tô màu sql chứ không có completion provider — nguồn gợi ý là
        // catalog hàm/từ khoá trong sql-functions.xml, qua Language Service.
        SqlEditor.SqlCompleteRequested += offset =>
        {
            if (DataContext is not SqlDocumentViewModel vm) return null;
            var list = MonacoEditorHost.SharedSqlCompletion?.Invoke(vm.ScriptText, offset);
            return SqlCompletionMapper.ToBridgeItems(list);
        };
    }
}
