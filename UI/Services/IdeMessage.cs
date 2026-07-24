using System.Windows;
using System.Windows.Threading;
using UI.Views.Dialogs;

namespace UI.Services;

/// <summary>
/// Message box dùng chung DevWorkFlow — mọi thông báo/xác nhận qua
/// <see cref="IdeMessageBoxWindow"/> (OK hoặc Y/N). Không gọi MessageBox Win32 trực tiếp từ feature code.
/// </summary>
public static class IdeMessage
{
    public static void Info(string message, string? title = null) =>
        Show(IdeMessageKind.Info, message, title);

    public static void Warning(string message, string? title = null) =>
        Show(IdeMessageKind.Warning, message, title);

    public static void Danger(string message, string? title = null) =>
        Show(IdeMessageKind.Danger, message, title);

    /// <summary>Thông báo — nút OK.</summary>
    public static void Show(IdeMessageKind kind, string message, string? title = null) =>
        ShowInternal(kind, message, title, IdeMessageButtons.Ok);

    /// <summary>Xác nhận — nút Y / N. Trả <c>true</c> khi chọn Y.</summary>
    public static bool Confirm(
        string message,
        string? title = null,
        IdeMessageKind kind = IdeMessageKind.Warning) =>
        ShowInternal(kind, message, title ?? "Xác nhận", IdeMessageButtons.YesNo);

    private static bool ShowInternal(
        IdeMessageKind kind,
        string message,
        string? title,
        IdeMessageButtons buttons)
    {
        var safe_title = title ?? DefaultTitle(kind);
        var safe_message = message ?? string.Empty;

        try
        {
            var dispatcher = Application.Current?.Dispatcher;
            if (dispatcher is null)
                return FallbackSystemMessageBox(kind, safe_title, safe_message, buttons);

            if (dispatcher.CheckAccess())
                return ShowCore(kind, safe_title, safe_message, buttons);

            return dispatcher.Invoke(
                () => ShowCore(kind, safe_title, safe_message, buttons),
                DispatcherPriority.Normal);
        }
        catch
        {
            try
            {
                return FallbackSystemMessageBox(kind, safe_title, safe_message, buttons);
            }
            catch
            {
                return false;
            }
        }
    }

    private static bool ShowCore(
        IdeMessageKind kind,
        string title,
        string message,
        IdeMessageButtons buttons)
    {
        try
        {
            var owner = ResolveOwner();
            var window = new IdeMessageBoxWindow(kind, title, message, buttons);
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

            var result = window.ShowDialog();
            if (buttons == IdeMessageButtons.YesNo)
                return window.Confirmed || result == true;
            return true;
        }
        catch
        {
            return FallbackSystemMessageBox(kind, title, message, buttons);
        }
    }

    private static bool FallbackSystemMessageBox(
        IdeMessageKind kind,
        string title,
        string message,
        IdeMessageButtons buttons)
    {
        var image = kind switch
        {
            IdeMessageKind.Warning => MessageBoxImage.Warning,
            IdeMessageKind.Danger => MessageBoxImage.Error,
            _ => MessageBoxImage.Information
        };

        if (buttons == IdeMessageButtons.YesNo)
        {
            var answer = MessageBox.Show(message, title, MessageBoxButton.YesNo, image);
            return answer == MessageBoxResult.Yes;
        }

        MessageBox.Show(message, title, MessageBoxButton.OK, image);
        return true;
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
#if DEBUG
            body += $"\n\n--- Stack trace (DEBUG) ---\n{ex}";
#endif
            Show(kind, body, title);
        }
        catch
        {
            FallbackSystemMessageBox(
                IdeMessageKind.Danger,
                "Lỗi",
                ex.Message,
                IdeMessageButtons.Ok);
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
