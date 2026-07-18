using System.Data;
using System.Globalization;
using System.Text.RegularExpressions;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Đổi pixel FBO ↔ WPF DIP. Ruler vẫn hiển thị px gốc.
/// Công thức: dip = px * (96 / DpiX).
/// </summary>
public static class FboLayoutUnits
{
    /// <summary>DPI màn hình (fallback 96).</summary>
    public static double DpiX { get; set; } = 96;

    public static double PxToDip(double px) => px * (96.0 / DpiX);

    public static double DipToPx(double dip) => dip * (DpiX / 96.0);

    public static int PxToDipInt(int px) => (int)Math.Round(PxToDip(px));

    /// <summary>
    /// Parse chiều cao view: số nguyên hoặc biểu thức (+ - * /).
    /// Ví dụ: "250", "200+50", "100*2+20".
    /// </summary>
    public static int? EvaluateHeightExpression(string? expression)
    {
        if (string.IsNullOrWhiteSpace(expression)) return null;

        var expr = expression.Trim();
        if (int.TryParse(expr, NumberStyles.Integer, CultureInfo.InvariantCulture, out var simple))
            return simple;

        // Chỉ cho phép số và + - * / ( ) khoảng trắng
        if (!Regex.IsMatch(expr, @"^[\d\s\+\-\*\/\(\)\.]+$"))
            return null;

        try
        {
            var value = new DataTable().Compute(expr, null);
            return Convert.ToInt32(Convert.ToDouble(value, CultureInfo.InvariantCulture));
        }
        catch
        {
            return null;
        }
    }
}
