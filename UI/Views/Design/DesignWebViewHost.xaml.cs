using System.ComponentModel;
using System.IO;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using DevWorkFlow.Application.Design;
using Microsoft.Web.WebView2.Core;
using UI.Services;
using UI.ViewModels;

namespace UI.Views.Design;

/// <summary>
/// Host WebView2 cho tab Design: render <see cref="FormBuilderViewModel.GeneratedDesignDocument"/> (HTML sinh
/// từ XML→Semantic), kèm 2 thước px đồng bộ zoom/scroll. Map một virtual host <c>devworkflow.program</c> →
/// Program root để nạp CSS/JS/image tĩnh (URL trong HTML đã rewrite). Bridge scroll/zoom riêng của Design,
/// tách <c>DevWorkFlow.Editor.Bridge</c> (Monaco). Thay <c>SkinDesignerView</c> (đã gỡ).
/// </summary>
public partial class DesignWebViewHost : UserControl
{
    private const string ProgramVirtualHost = DesignHtmlGenerator.ProgramVirtualHost;
    private const string ConfigVirtualHost = DesignHtmlGenerator.ConfigVirtualHost;

    // Script tiêm: (1) đo gốc bảng main FormTable → post 'designViewport' cho WPF chỉnh Offset thước;
    // (2) vẽ crosshair + nhãn px (toạ độ so với gốc bảng) hoàn toàn trong document — không post mỗi mousemove.
    private const string DesignViewportScript = """
        (function () {
          var origin = { x: 0, y: 0 };
          function mainTable() {
            return document.querySelector('[data-dwf-region="main"] table.FormTable');
          }
          function originOf(el) {
            if (!el) return { x: 0, y: 0 };
            var r = el.getBoundingClientRect();
            return { x: r.left + window.scrollX, y: r.top + window.scrollY };
          }
          function post() {
            origin = originOf(mainTable());
            if (window.chrome && window.chrome.webview) {
              window.chrome.webview.postMessage(JSON.stringify({
                type: 'designViewport',
                scrollX: window.scrollX,
                scrollY: window.scrollY,
                originX: origin.x,
                originY: origin.y
              }));
            }
          }
          function ensureOverlay() {
            if (document.getElementById('dwf-crosshair-x')) return;
            var css = document.createElement('style');
            css.textContent = [
              '#dwf-crosshair-x,#dwf-crosshair-y{position:fixed;pointer-events:none;z-index:2147483647;background:#c62828;opacity:.85;}',
              '#dwf-crosshair-x{left:0;right:0;height:1px;}',
              '#dwf-crosshair-y{top:0;bottom:0;width:1px;}',
              '#dwf-crosshair-label{position:fixed;pointer-events:none;z-index:2147483647;background:rgba(255,255,255,.9);border:1px solid #c62828;color:#202020;font:11px Consolas,monospace;padding:1px 4px;}'
            ].join('');
            document.documentElement.appendChild(css);
            ['dwf-crosshair-x','dwf-crosshair-y','dwf-crosshair-label'].forEach(function (id) {
              var el = document.createElement('div');
              el.id = id;
              el.style.display = 'none';
              document.documentElement.appendChild(el);
            });
          }
          function onMove(e) {
            ensureOverlay();
            var hx = document.getElementById('dwf-crosshair-x');
            var hy = document.getElementById('dwf-crosshair-y');
            var lab = document.getElementById('dwf-crosshair-label');
            hx.style.display = hy.style.display = lab.style.display = 'block';
            hx.style.top = e.clientY + 'px';
            hy.style.left = e.clientX + 'px';
            var x = e.clientX + window.scrollX - origin.x;
            var y = e.clientY + window.scrollY - origin.y;
            lab.style.left = (e.clientX + 12) + 'px';
            lab.style.top = (e.clientY + 12) + 'px';
            lab.textContent = Math.round(x) + ', ' + Math.round(y);
          }
          function hideOverlay() {
            var ids = ['dwf-crosshair-x','dwf-crosshair-y','dwf-crosshair-label'];
            for (var i = 0; i < ids.length; i++) {
              var el = document.getElementById(ids[i]);
              if (el) el.style.display = 'none';
            }
          }
          window.addEventListener('scroll', post, { passive: true });
          window.addEventListener('resize', post, { passive: true });
          document.addEventListener('DOMContentLoaded', post);
          document.addEventListener('mousemove', onMove, { passive: true });
          document.addEventListener('mouseleave', hideOverlay, true);
          document.addEventListener('click', function (e) {
            if (e.target && e.target.closest && e.target.closest('.DwfTabButton'))
              setTimeout(post, 0);
          }, true);
          setTimeout(post, 0);
        })();
        """;

    private FormBuilderViewModel? _vm;
    private Task? _init_task;
    private string? _last_html;
    private string? _mapped_program_root;
    private string? _mapped_config_root;

    public DesignWebViewHost()
    {
        InitializeComponent();
        Loaded += OnLoaded;
        Unloaded += OnUnloaded;
        DataContextChanged += (_, _) => AttachViewModel();
    }

    private async void OnLoaded(object sender, RoutedEventArgs e)
    {
        AttachViewModel();
        await EnsureInitializedAsync();
        RenderCurrent();
    }

    private void OnUnloaded(object sender, RoutedEventArgs e)
    {
        if (_vm is not null)
            _vm.PropertyChanged -= OnVmPropertyChanged;
    }

    private void AttachViewModel()
    {
        if (DataContext is not FormBuilderViewModel vm || ReferenceEquals(vm, _vm))
            return;

        if (_vm is not null) _vm.PropertyChanged -= OnVmPropertyChanged;
        _vm = vm;
        _vm.PropertyChanged += OnVmPropertyChanged;
        Dispatcher.InvokeAsync(RenderCurrent);
    }

    private void OnVmPropertyChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == nameof(FormBuilderViewModel.GeneratedDesignDocument))
            Dispatcher.InvokeAsync(RenderCurrent);
    }

    private void RenderCurrent()
    {
        if (_vm?.GeneratedDesignDocument is not { } document)
            return;
        if (document.Html == _last_html)
            return;
        _last_html = document.Html;
        _ = NavigateAsync(document);
    }

    /// <summary>Khởi tạo WebView2 đúng MỘT lần (cache Task). Các trigger (Loaded, đổi document) có thể gọi
    /// đồng thời khi init chưa xong — nếu không serialize, mỗi lần tạo một CoreWebView2Environment mới rồi
    /// EnsureCoreWebView2Async trên cùng control → "already initialized with a different environment".</summary>
    private Task EnsureInitializedAsync() => _init_task ??= InitializeCoreAsync();

    private async Task InitializeCoreAsync()
    {
        try
        {
            var user_data_folder = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "DevWorkFlow", "WebView2Design");
            var environment = await CoreWebView2Environment.CreateAsync(userDataFolder: user_data_folder);
            await DesignWebView.EnsureCoreWebView2Async(environment);

            if (DesignWebView.CoreWebView2 is { } core)
            {
                await core.AddScriptToExecuteOnDocumentCreatedAsync(DesignViewportScript);
                core.WebMessageReceived += OnWebMessageReceived;
                DesignWebView.ZoomFactorChanged += (_, _) => UpdateZoom();
                UpdateZoom();
            }
        }
        catch (Exception ex)
        {
            _init_task = null; // cho phép thử lại lần sau (không khóa vĩnh viễn khi lỗi tạm thời)
            IdeMessage.ShowException(ex, "Không mở được WebView2 cho Design (kiểm tra WebView2 Runtime).");
        }
    }

    private async Task NavigateAsync(DesignDocument document)
    {
        await EnsureInitializedAsync();
        if (DesignWebView.CoreWebView2 is not { } core)
            return;

        var program_root = _vm?.DesignProgramRoot;
        if (!string.IsNullOrWhiteSpace(program_root) && Directory.Exists(program_root)
            && !string.Equals(program_root, _mapped_program_root, StringComparison.OrdinalIgnoreCase))
        {
            if (_mapped_program_root is not null)
            {
                try { core.ClearVirtualHostNameToFolderMapping(ProgramVirtualHost); }
                catch { /* chưa map thì bỏ qua */ }
            }
            core.SetVirtualHostNameToFolderMapping(
                ProgramVirtualHost, program_root, CoreWebView2HostResourceAccessKind.Allow);
            _mapped_program_root = program_root;
        }

        var config_root = _vm?.DesignConfigRoot;
        if (!string.IsNullOrWhiteSpace(config_root) && Directory.Exists(config_root)
            && !string.Equals(config_root, _mapped_config_root, StringComparison.OrdinalIgnoreCase))
        {
            if (_mapped_config_root is not null)
            {
                try { core.ClearVirtualHostNameToFolderMapping(ConfigVirtualHost); }
                catch { /* chưa map thì bỏ qua */ }
            }
            core.SetVirtualHostNameToFolderMapping(
                ConfigVirtualHost, config_root, CoreWebView2HostResourceAccessKind.Allow);
            _mapped_config_root = config_root;
        }

        core.NavigateToString(document.Html);
    }

    private void UpdateZoom()
    {
        RulerX.Zoom = DesignWebView.ZoomFactor;
        RulerY.Zoom = DesignWebView.ZoomFactor;
    }

    /// <summary>Nhận 'designViewport' {scrollX,scrollY,originX,originY} từ script tiêm; Offset thước =
    /// (scroll − gốc bảng main) × zoom để tick 0 trùng mép bảng FormTable. Vẫn nhận {x,y} cũ (scroll thuần).</summary>
    private void OnWebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
    {
        string? raw;
        try
        {
            raw = e.TryGetWebMessageAsString();
        }
        catch (InvalidCastException)
        {
            return;
        }

        if (string.IsNullOrEmpty(raw)) return;

        try
        {
            using var doc = JsonDocument.Parse(raw);
            var root = doc.RootElement;

            if (root.TryGetProperty("type", out var type_prop)
                && type_prop.GetString() is { } msg_type
                && !string.Equals(msg_type, "designViewport", StringComparison.Ordinal))
                return;

            if (!root.TryGetProperty("scrollX", out var sx)
                || !root.TryGetProperty("scrollY", out var sy)
                || !root.TryGetProperty("originX", out var ox)
                || !root.TryGetProperty("originY", out var oy))
            {
                // Tương thích ngược: message {x,y} scroll thuần.
                if (root.TryGetProperty("x", out var x_prop) && root.TryGetProperty("y", out var y_prop))
                {
                    var z0 = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
                    Dispatcher.Invoke(() =>
                    {
                        RulerX.Offset = x_prop.GetDouble() * z0;
                        RulerY.Offset = y_prop.GetDouble() * z0;
                    });
                }
                return;
            }

            var zoom = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
            Dispatcher.Invoke(() =>
            {
                RulerX.Offset = (sx.GetDouble() - ox.GetDouble()) * zoom;
                RulerY.Offset = (sy.GetDouble() - oy.GetDouble()) * zoom;
            });
        }
        catch (JsonException)
        {
            // Message không đúng format — bỏ qua.
        }
    }
}
