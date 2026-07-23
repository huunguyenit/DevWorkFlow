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
    }
}
