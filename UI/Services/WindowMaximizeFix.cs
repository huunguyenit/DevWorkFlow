using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Interop;

namespace UI.Services;

/// <summary>
/// Giới hạn cửa sổ Maximized trong work area (tránh tràn taskbar / cắt status bar)
/// khi dùng WindowStyle=None + WindowChrome.
/// </summary>
internal static class WindowMaximizeFix
{
    private const int WmGetMinMaxInfo = 0x0024;
    private const uint MonitorDefaultToNearest = 0x00000002;

    public static void Attach(Window window)
    {
        var hwnd = new WindowInteropHelper(window).Handle;
        if (hwnd == IntPtr.Zero) return;

        var source = HwndSource.FromHwnd(hwnd);
        source?.AddHook(WndProc);
    }

    private static IntPtr WndProc(IntPtr hwnd, int msg, IntPtr w_param, IntPtr l_param, ref bool handled)
    {
        if (msg == WmGetMinMaxInfo)
        {
            ApplyWorkArea(hwnd, l_param);
            handled = true;
        }

        return IntPtr.Zero;
    }

    private static void ApplyWorkArea(IntPtr hwnd, IntPtr l_param)
    {
        var monitor = MonitorFromWindow(hwnd, MonitorDefaultToNearest);
        if (monitor == IntPtr.Zero) return;

        var monitor_info = new MonitorInfo { cbSize = (uint)Marshal.SizeOf<MonitorInfo>() };
        if (!GetMonitorInfo(monitor, ref monitor_info)) return;

        var mmi = Marshal.PtrToStructure<MinMaxInfo>(l_param);
        var work = monitor_info.rcWork;
        var monitor_rect = monitor_info.rcMonitor;

        mmi.ptMaxPosition.X = Math.Abs(work.Left - monitor_rect.Left);
        mmi.ptMaxPosition.Y = Math.Abs(work.Top - monitor_rect.Top);
        mmi.ptMaxSize.X = Math.Abs(work.Right - work.Left);
        mmi.ptMaxSize.Y = Math.Abs(work.Bottom - work.Top);

        Marshal.StructureToPtr(mmi, l_param, true);
    }

    [DllImport("user32.dll")]
    private static extern IntPtr MonitorFromWindow(IntPtr hwnd, uint flags);

    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    private static extern bool GetMonitorInfo(IntPtr h_monitor, ref MonitorInfo lpmi);

    [StructLayout(LayoutKind.Sequential)]
    private struct Point
    {
        public int X;
        public int Y;
    }

    [StructLayout(LayoutKind.Sequential)]
    private struct MinMaxInfo
    {
        public Point ptReserved;
        public Point ptMaxSize;
        public Point ptMaxPosition;
        public Point ptMinTrackSize;
        public Point ptMaxTrackSize;
    }

    [StructLayout(LayoutKind.Sequential)]
    private struct Rect
    {
        public int Left;
        public int Top;
        public int Right;
        public int Bottom;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
    private struct MonitorInfo
    {
        public uint cbSize;
        public Rect rcMonitor;
        public Rect rcWork;
        public uint dwFlags;
    }
}
