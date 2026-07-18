using System.Windows.Controls;
using System.Windows.Input;

namespace UI.Views.Shell;

public partial class DocumentTabBar : UserControl
{
    public DocumentTabBar() => InitializeComponent();

    /// <summary>Chặn bubble lên RadioButton — chỉ đóng tab, không kích hoạt sai.</summary>
    private void CloseButton_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        if (sender is Button { Command: { } cmd } btn && cmd.CanExecute(btn.CommandParameter))
            cmd.Execute(btn.CommandParameter);
        e.Handled = true;
    }
}
