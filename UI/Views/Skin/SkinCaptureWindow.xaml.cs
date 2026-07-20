using System.Windows;
using System.Windows.Input;
using UI.Services;

namespace UI.Views.Skin;

/// <summary>
/// Cửa sổ capture skin: user nhập base_url → login thủ công trong WebView2 riêng → bấm "Dùng trang này"
/// để lấy outerHTML. Chỉ điều phối UI; toàn bộ normalize/lưu do ProjectSkinService (Infrastructure) làm.
/// </summary>
public partial class SkinCaptureWindow : Window
{
    /// <summary>HTML thô đã capture (chỉ có giá trị khi DialogResult == true).</summary>
    public string CapturedHtml { get; private set; } = string.Empty;

    /// <summary>Base URL user đã nhập.</summary>
    public string CapturedBaseUrl { get; private set; } = string.Empty;

    /// <summary>URL thực tế của trang lúc capture.</summary>
    public string CapturedFromUrl { get; private set; } = string.Empty;

    public SkinCaptureWindow(string? prefill_url = null)
    {
        InitializeComponent();
        UrlBox.Text = prefill_url ?? string.Empty;
        CaptureHost.NavigationCompleted += _ => Dispatcher.Invoke(() => UsePageButton.IsEnabled = true);
        Loaded += async (_, _) =>
        {
            if (!string.IsNullOrWhiteSpace(UrlBox.Text))
                await NavigateAsync();
        };
    }

    private async void OpenButton_Click(object sender, RoutedEventArgs e) => await NavigateAsync();

    private async void UrlBox_KeyDown(object sender, KeyEventArgs e)
    {
        if (e.Key == Key.Enter) await NavigateAsync();
    }

    private async Task NavigateAsync()
    {
        var url = NormalizeUrl(UrlBox.Text);
        if (string.IsNullOrWhiteSpace(url))
        {
            IdeMessage.Warning("Nhập base URL của site ERP trước.", "Lấy skin");
            return;
        }

        UrlBox.Text = url;
        try
        {
            await CaptureHost.NavigateAsync(url);
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Không mở được WebView2 (kiểm tra WebView2 Runtime đã cài).");
        }
    }

    private async void UsePageButton_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            var html = await CaptureHost.GetOuterHtmlAsync();
            if (string.IsNullOrWhiteSpace(html))
            {
                IdeMessage.Warning("Chưa lấy được HTML của trang. Đợi trang tải xong rồi thử lại.", "Lấy skin");
                return;
            }

            CapturedHtml = html;
            CapturedBaseUrl = NormalizeUrl(UrlBox.Text);
            CapturedFromUrl = CaptureHost.CurrentUrl;
            DialogResult = true;
            Close();
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Lỗi khi capture HTML shell.");
        }
    }

    private void CancelButton_Click(object sender, RoutedEventArgs e)
    {
        DialogResult = false;
        Close();
    }

    private static string NormalizeUrl(string? raw)
    {
        var url = (raw ?? string.Empty).Trim();
        if (string.IsNullOrEmpty(url)) return string.Empty;
        if (!url.Contains("://", StringComparison.Ordinal))
            url = "https://" + url;
        return url;
    }
}
