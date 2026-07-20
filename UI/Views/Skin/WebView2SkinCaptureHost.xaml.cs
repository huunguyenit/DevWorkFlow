using System.IO;
using System.Text.Json;
using System.Windows.Controls;
using Microsoft.Web.WebView2.Core;

namespace UI.Views.Skin;

/// <summary>
/// WebView2 DÀNH RIÊNG cho capture skin ERP — TÁCH hoàn toàn khỏi Monaco Editor (MonacoEditorHost) và
/// Designer WebView2 tương lai: user-data folder riêng, instance riêng. Chỉ làm hai việc: điều hướng tới
/// site để user login thủ công, và lấy document.documentElement.outerHTML khi được yêu cầu. KHÔNG normalize
/// / scrape / parse trong control này — chuỗi HTML thô được trả về cho ProjectSkinService xử lý.
/// </summary>
public partial class WebView2SkinCaptureHost : UserControl
{
    private readonly TaskCompletionSource _ready = new(TaskCreationOptions.RunContinuationsAsynchronously);
    private bool _init_started;

    /// <summary>Bắn khi một lần điều hướng hoàn tất — Window bật nút "Dùng trang này".</summary>
    public event Action<string>? NavigationCompleted;

    public WebView2SkinCaptureHost()
    {
        InitializeComponent();
        Loaded += async (_, _) => await EnsureInitializedAsync();
    }

    /// <summary>URL hiện tại của trang (dùng làm captured_from_url).</summary>
    public string CurrentUrl => CaptureWebView.CoreWebView2?.Source ?? string.Empty;

    private async Task EnsureInitializedAsync()
    {
        if (_init_started) { await _ready.Task; return; }
        _init_started = true;

        try
        {
            // User-data folder RIÊNG (không đụng "WebView2UserData" của Monaco).
            var user_data_folder = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "DevWorkFlow", "WebView2SkinCapture");
            var environment = await CoreWebView2Environment.CreateAsync(userDataFolder: user_data_folder);
            await CaptureWebView.EnsureCoreWebView2Async(environment);

            if (CaptureWebView.CoreWebView2 is { } core)
            {
                core.NavigationCompleted += (_, _) => NavigationCompleted?.Invoke(CurrentUrl);
#if DEBUG
                core.Settings.AreDevToolsEnabled = true;
#endif
            }

            _ready.TrySetResult();
        }
        catch (Exception ex)
        {
            _ready.TrySetException(ex);
        }
    }

    /// <summary>Điều hướng tới URL (đảm bảo WebView2 đã init). Ném nếu WebView2 Runtime chưa cài.</summary>
    public async Task NavigateAsync(string url)
    {
        await EnsureInitializedAsync();
        if (CaptureWebView.CoreWebView2 is { } core && !string.IsNullOrWhiteSpace(url))
            core.Navigate(url);
    }

    /// <summary>
    /// Lấy document.documentElement.outerHTML của trang hiện tại. Trả chuỗi HTML thô đã decode
    /// (ExecuteScriptAsync trả về JSON string literal → decode 1 lớp). null nếu chưa sẵn sàng.
    /// </summary>
    public async Task<string?> GetOuterHtmlAsync()
    {
        await EnsureInitializedAsync();
        if (CaptureWebView.CoreWebView2 is not { } core)
            return null;

        var json = await core.ExecuteScriptAsync("document.documentElement.outerHTML");
        if (string.IsNullOrEmpty(json) || json == "null")
            return null;

        try
        {
            return JsonSerializer.Deserialize<string>(json);
        }
        catch (JsonException)
        {
            return json;
        }
    }
}
