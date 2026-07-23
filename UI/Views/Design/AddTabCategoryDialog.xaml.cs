using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace UI.Views.Design;

/// <summary>Kết quả dialog thêm tab category (Task 4).</summary>
public sealed record AddTabCategoryResult(string TabKind, string HeaderV, string HeaderE, string? Controller);

/// <summary>
/// Dialog nhập thuộc tính tab trước khi <c>AddTabCategory</c>. Header V/E bắt buộc; Grid/Post/List thêm
/// Controller (tuỳ chọn). Không tự parse XML — chỉ thu thập input rồi trả cho VM.
/// </summary>
public partial class AddTabCategoryDialog : Window
{
    public AddTabCategoryResult? Result { get; private set; }

    public AddTabCategoryDialog(string? initial_kind = null)
    {
        InitializeComponent();
        Loaded += (_, _) =>
        {
            if (initial_kind is { Length: > 0 })
                SelectKind(initial_kind);
            UpdateControllerVisibility();
            HeaderVBox.Focus();
        };
    }

    private void SelectKind(string kind)
    {
        foreach (var item in KindCombo.Items)
            if (item is ComboBoxItem cbi
                && string.Equals(cbi.Tag as string, kind, StringComparison.OrdinalIgnoreCase))
            {
                KindCombo.SelectedItem = cbi;
                return;
            }
    }

    private string SelectedKind =>
        (KindCombo.SelectedItem as ComboBoxItem)?.Tag as string ?? "Normal";

    private void KindCombo_SelectionChanged(object sender, SelectionChangedEventArgs e) =>
        UpdateControllerVisibility();

    private void UpdateControllerVisibility()
    {
        // Controller chỉ có ý nghĩa với Grid/Post/List (seed items@controller).
        var show = !string.Equals(SelectedKind, "Normal", StringComparison.OrdinalIgnoreCase);
        var vis = show ? Visibility.Visible : Visibility.Collapsed;
        if (ControllerLabel is not null) ControllerLabel.Visibility = vis;
        if (ControllerBox is not null) ControllerBox.Visibility = vis;
    }

    private void Ok_Click(object sender, RoutedEventArgs e)
    {
        var header_v = HeaderVBox.Text?.Trim() ?? string.Empty;
        var header_e = HeaderEBox.Text?.Trim() ?? string.Empty;
        if (header_v.Length == 0 && header_e.Length == 0)
        {
            ErrorText.Text = "Nhập ít nhất một Header (V hoặc E).";
            ErrorText.Visibility = Visibility.Visible;
            return;
        }

        // E trống → dùng V (và ngược lại) để tab luôn có nhãn ở cả hai ngôn ngữ.
        if (header_v.Length == 0) header_v = header_e;
        if (header_e.Length == 0) header_e = header_v;

        var controller = string.Equals(SelectedKind, "Normal", StringComparison.OrdinalIgnoreCase)
            ? null
            : ControllerBox.Text?.Trim();

        Result = new AddTabCategoryResult(
            SelectedKind, header_v, header_e,
            string.IsNullOrWhiteSpace(controller) ? null : controller);
        DialogResult = true;
    }

    private void Window_KeyDown(object sender, KeyEventArgs e)
    {
        if (e.Key == Key.Escape) DialogResult = false;
    }
}
