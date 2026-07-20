using System.IO;
using System.Windows.Controls;
using System.Windows.Input;
using UI.ViewModels;
using UI.ViewModels.Bottom;

namespace UI.Views.Bottom;

public partial class ProblemsPanel : UserControl
{
    public ProblemsPanel()
    {
        InitializeComponent();
    }

    private void ProblemsList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
    {
        if (sender is not ListBox list
            || list.SelectedItem is not ProblemItemVm problem
            || DataContext is not IdeDiagnosticsViewModel)
            return;

        var window = System.Windows.Window.GetWindow(this);
        if (window?.DataContext is not MainViewModel main_vm)
            return;

        var form = main_vm.FormBuilderVm;

        // Lỗi nằm trong file entity ngoài (ERP3001/ERP3005 SYSTEM) → mở file đó ra tab.
        if (!string.IsNullOrWhiteSpace(problem.RelatedPath) && File.Exists(problem.RelatedPath))
        {
            form.OpenEntityFile(problem.RelatedPath);
            return;
        }

        // Cùng buffer: ưu tiên offset (chính xác hơn Line — ví dụ &zzzz; giữa dòng),
        // fallback Line khi diagnostic không có offset.
        if (problem.StartOffset > 0)
            form.NavigateToOffset(problem.StartOffset, problem.Line);
        else if (problem.Line > 0)
            form.NavigateToLine(problem.Line);
    }
}
