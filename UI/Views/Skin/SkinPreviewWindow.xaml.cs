using System.IO;
using System.Windows;
using Microsoft.Web.WebView2.Core;
using UI.Services;

namespace UI.Views.Skin;

/// <summary>
/// Xem "skin trống": map virtual host tới thư mục skin cục bộ rồi Navigate shell.html. WebView2 RIÊNG
/// (user-data + instance) — không dùng chung Monaco/Capture. Tái dùng pattern virtual-host của
/// MonacoEditorHost (SetVirtualHostNameToFolderMapping) để assets/… relative resolve được.
/// </summary>
public partial class SkinPreviewWindow : Window
{
    private const string VirtualHost = "devworkflow.skin";

    private readonly string _skin_directory;
    private readonly string _entry_relative;

    public SkinPreviewWindow(string skin_directory, string shell_path)
    {
        InitializeComponent();
        _skin_directory = skin_directory;
        _entry_relative = Path.GetFileName(shell_path);
        Loaded += async (_, _) => await InitAsync();
    }

    private async Task InitAsync()
    {
        try
        {
            var user_data_folder = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "DevWorkFlow", "WebView2SkinPreview");
            var environment = await CoreWebView2Environment.CreateAsync(userDataFolder: user_data_folder);
            await PreviewWebView.EnsureCoreWebView2Async(environment);

            if (PreviewWebView.CoreWebView2 is not { } core)
                return;

            core.SetVirtualHostNameToFolderMapping(
                VirtualHost, _skin_directory, CoreWebView2HostResourceAccessKind.Allow);
            core.Navigate($"https://{VirtualHost}/{_entry_relative}");
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Không mở được WebView2 để xem skin (kiểm tra WebView2 Runtime).");
        }
    }
}
