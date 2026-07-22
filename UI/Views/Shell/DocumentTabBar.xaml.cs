using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DevWorkFlow.Application.Shell;
using UI.ViewModels.Shell;

namespace UI.Views.Shell;

public partial class DocumentTabBar : UserControl
{
    public DocumentTabBar() => InitializeComponent();

    private IdeShellViewModel? Shell => DataContext as IdeShellViewModel;

    /// <summary>Chặn bubble lên RadioButton — chỉ đóng tab, không kích hoạt sai.</summary>
    private void CloseButton_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        if (sender is Button { Command: { } cmd } btn && cmd.CanExecute(btn.CommandParameter))
            cmd.Execute(btn.CommandParameter);
        e.Handled = true;
    }

    /// <summary>
    /// Right-click tab: activate tab được click, cập nhật header Pin/Unpin và enable/disable
    /// Copy/Reveal theo path. ContextMenu nằm ở visual tree riêng (popup) nên command binding
    /// theo AncestorType không chạm được UserControl → xử lý qua Click trong code-behind.
    /// </summary>
    private void Tab_ContextMenuOpening(object sender, ContextMenuEventArgs e)
    {
        if (sender is not FrameworkElement { DataContext: DocumentItemVm doc, ContextMenu: { } menu })
            return;

        Shell?.ActivateDocument(doc);

        if (menu.Items.Count > 0 && menu.Items[0] is MenuItem pin_item)
            pin_item.Header = doc.IsPinned ? "Unpin" : "Pin";

        SetMenuItemEnabled(menu, "Copy Full Path", DocumentTabPathHelper.CanCopyFullPath(doc.FilePath));
        SetMenuItemEnabled(menu, "Open in File Explorer", DocumentTabPathHelper.CanRevealInExplorer(doc.FilePath));
    }

    private static void SetMenuItemEnabled(ContextMenu menu, string header, bool enabled)
    {
        foreach (var item in menu.Items)
        {
            if (item is MenuItem menu_item && header.Equals(menu_item.Header as string, StringComparison.Ordinal))
            {
                menu_item.IsEnabled = enabled;
                return;
            }
        }
    }

    private void PinMenuItem_Click(object sender, RoutedEventArgs e)
    {
        if (sender is MenuItem { DataContext: DocumentItemVm doc })
            Shell?.TogglePinDocumentCommand.Execute(doc);
    }

    private void CopyPathMenuItem_Click(object sender, RoutedEventArgs e)
    {
        if (sender is MenuItem { DataContext: DocumentItemVm doc })
            Shell?.CopyDocumentPathCommand.Execute(doc);
    }

    private void RevealMenuItem_Click(object sender, RoutedEventArgs e)
    {
        if (sender is MenuItem { DataContext: DocumentItemVm doc })
            Shell?.RevealDocumentInExplorerCommand.Execute(doc);
    }
}
