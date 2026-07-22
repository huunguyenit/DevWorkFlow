using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace UI.Converters;

/// <summary>Trả về Collapsed khi giá trị là null, Visible khi không null (có thể đảo ngược).</summary>
[ValueConversion(typeof(object), typeof(Visibility))]
public class NullToVisibilityConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        bool isNull    = value is null;
        bool inverse   = parameter?.ToString() == "Inverse";
        bool visible   = inverse ? isNull : !isNull;
        return visible ? Visibility.Visible : Visibility.Collapsed;
    }

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        => Binding.DoNothing;
}

/// <summary>Trả về Collapsed khi string null hoặc rỗng.</summary>
[ValueConversion(typeof(string), typeof(Visibility))]
public class NullOrEmptyToVisibilityConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        => string.IsNullOrEmpty(value as string) ? Visibility.Collapsed : Visibility.Visible;

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        => Binding.DoNothing;
}

/// <summary>Đảo bool — dùng cho IsReadOnly khi bind CanEdit.</summary>
[ValueConversion(typeof(bool), typeof(bool))]
public class InverseBoolConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        => value is bool flag && !flag;

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        => value is bool flag && !flag;
}

/// <summary>true → Collapsed, false → Visible — dùng cho empty-state ngược với nội dung chính.</summary>
[ValueConversion(typeof(bool), typeof(Visibility))]
public class InverseBoolToVisibilityConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        => value is bool flag && flag ? Visibility.Collapsed : Visibility.Visible;

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        => Binding.DoNothing;
}

/// <summary>
/// Chiều cao form: double &gt; 0 → DIP; null/NaN/≤0 → Auto (Double.NaN).
/// </summary>
[ValueConversion(typeof(double?), typeof(double))]
public class FormHeightConverter : IValueConverter
{
    public object Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (value is double d && !double.IsNaN(d) && d > 0)
            return d;
        if (value is int i && i > 0)
            return (double)i;
        return double.NaN;
    }

    public object ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
        => Binding.DoNothing;
}
