using System.Windows;
using System.Windows.Threading;
using UI.Views.Dialogs;

namespace UI.Services;

/// <summary>
/// Message box dùng chung DevWorkFlow — 3 loại: Info / Warning / Danger.
/// Luôn marshal về UI thread; nếu dialog tùy chỉnh lỗi thì fallback MessageBox hệ thống.
/// </summary>
public static class IdeMessage
{
    public static void Info(string message, string? title = null) =>
        Show(IdeMessageKind.Info, message, title);

    public static void Warning(string message, string? title = null) =>
        Show(IdeMessageKind.Warning, message, title);

    public static void Danger(string message, string? title = null) =>
        Show(IdeMessageKind.Danger, message, title);

    public static void Show(IdeMessageKind kind, string message, string? title = null)
    {
        var safe_title = title ?? DefaultTitle(kind);
        var safe_message = message ?? string.Empty;

        try
        {
            var dispatcher = Application.Current?.Dispatcher;
            if (dispatcher is null)
            {
                FallbackSystemMessageBox(kind, safe_title, safe_message);
                return;
            }

            if (dispatcher.CheckAccess())
                ShowCore(kind, safe_title, safe_message);
            else
                dispatcher.Invoke(() => ShowCore(kind, safe_title, safe_message), DispatcherPriority.Normal);
        }
        catch
        {
            try
            {
                FallbackSystemMessageBox(kind, safe_title, safe_message);
            }
            catch
            {
                // last resort — không crash app vì message
            }
        }
    }

    private static void ShowCore(IdeMessageKind kind, string title, string message)
    {
        try
        {
            var owner = ResolveOwner();
            var window = new IdeMessageBoxWindow(kind, title, message);
            if (owner is not null && !ReferenceEquals(owner, window))
            {
                try
                {
                    window.Owner = owner;
                    window.WindowStartupLocation = WindowStartupLocation.CenterOwner;
                }
                catch
                {
                    window.Owner = null;
                    window.WindowStartupLocation = WindowStartupLocation.CenterScreen;
                }
            }
            else
            {
                window.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            }

            window.ShowDialog();
        }
        catch
        {
            FallbackSystemMessageBox(kind, title, message);
        }
    }

    private static void FallbackSystemMessageBox(IdeMessageKind kind, string title, string message)
    {
        var image = kind switch
        {
            IdeMessageKind.Warning => MessageBoxImage.Warning,
            IdeMessageKind.Danger => MessageBoxImage.Error,
            _ => MessageBoxImage.Information
        };
        MessageBox.Show(message, title, MessageBoxButton.OK, image);
    }

    /// <summary>Phân loại exception DB / kết nối để hiện Danger rõ ràng.</summary>
    public static void ShowException(
        Exception ex,
        string context,
        IdeMessageKind fallback_kind = IdeMessageKind.Danger)
    {
        try
        {
            var kind = IsConnectionFailure(ex) ? IdeMessageKind.Danger : fallback_kind;
            var title = IsConnectionFailure(ex) ? "Không kết nối được database" : DefaultTitle(kind);
            var detail = FormatExceptionMessage(ex);
            var body = string.IsNullOrWhiteSpace(context)
                ? detail
                : $"{context}\n\n{detail}";
            Show(kind, body, title);
        }
        catch
        {
            FallbackSystemMessageBox(
                IdeMessageKind.Danger,
                "Lỗi",
                ex.Message);
        }
    }

    public static bool IsConnectionFailure(Exception? ex)
    {
        for (var current = ex; current is not null; current = current.InnerException)
        {
            var type_name = current.GetType().FullName ?? current.GetType().Name;
            if (type_name.Contains("SqlException", StringComparison.OrdinalIgnoreCase)
                || type_name.Contains("SqlConnection", StringComparison.OrdinalIgnoreCase)
                || type_name.Contains("TimeoutException", StringComparison.OrdinalIgnoreCase))
                return true;

            var msg = current.Message ?? string.Empty;
            if (msg.Contains("network-related", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("server was not found", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("could not open a connection", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("timeout", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("login failed", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("Cannot open database", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("A network-related", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("error: 40", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("error: 26", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("Named Pipes Provider", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("TCP Provider", StringComparison.OrdinalIgnoreCase)
                || msg.Contains("connection", StringComparison.OrdinalIgnoreCase)
                   && msg.Contains("fail", StringComparison.OrdinalIgnoreCase))
                return true;
        }

        return false;
    }

    public static string FormatExceptionMessage(Exception ex)
    {
        if (IsConnectionFailure(ex))
        {
            var root = GetRootMessage(ex);
            return "Không kết nối được tới database.\n"
                   + "Kiểm tra chuỗi kết nối trong Web.config, SQL Server đang chạy, "
                   + "và quyền đăng nhập.\n\n"
                   + $"Chi tiết: {root}";
        }

        return GetRootMessage(ex);
    }

    private static string GetRootMessage(Exception ex)
    {
        var current = ex;
        while (current.InnerException is not null)
            current = current.InnerException;
        return string.IsNullOrWhiteSpace(current.Message) ? ex.ToString() : current.Message.Trim();
    }

    private static string DefaultTitle(IdeMessageKind kind) => kind switch
    {
        IdeMessageKind.Info => "Thông báo",
        IdeMessageKind.Warning => "Cảnh báo",
        IdeMessageKind.Danger => "Lỗi",
        _ => "DevWorkFlow"
    };

    private static Window? ResolveOwner()
    {
        try
        {
            if (Application.Current?.MainWindow is { IsLoaded: true, IsVisible: true } main)
                return main;

            return Application.Current?.Windows.OfType<Window>()
                       .FirstOrDefault(w => w.IsActive && w.IsVisible)
                   ?? Application.Current?.Windows.OfType<Window>()
                       .FirstOrDefault(w => w.IsVisible && w.IsLoaded);
        }
        catch
        {
            return null;
        }
    }
}
