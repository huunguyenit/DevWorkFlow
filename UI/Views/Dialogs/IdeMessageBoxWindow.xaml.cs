using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using MaterialDesignThemes.Wpf;
using UI.Services;

namespace UI.Views.Dialogs;

public partial class IdeMessageBoxWindow : Window
{
    private readonly bool _is_confirm;

    public IdeMessageBoxWindow(
        IdeMessageKind kind,
        string title,
        string message,
        IdeMessageButtons buttons = IdeMessageButtons.Ok)
    {
        InitializeComponent();
        _is_confirm = buttons == IdeMessageButtons.YesNo;
        DataContext = new IdeMessageBoxVm(kind, title, message, buttons);
    }

    /// <summary>true = OK / Yes; false = No / đóng không đồng ý.</summary>
    public bool Confirmed { get; private set; }

    private void Ok_Click(object sender, RoutedEventArgs e)
    {
        Confirmed = true;
        DialogResult = true;
    }

    private void Yes_Click(object sender, RoutedEventArgs e)
    {
        Confirmed = true;
        DialogResult = true;
    }

    private void No_Click(object sender, RoutedEventArgs e)
    {
        Confirmed = false;
        DialogResult = false;
    }

    private void Window_KeyDown(object sender, KeyEventArgs e)
    {
        if (_is_confirm)
        {
            if (e.Key is Key.Y)
            {
                Confirmed = true;
                DialogResult = true;
                e.Handled = true;
                return;
            }

            if (e.Key is Key.N or Key.Escape)
            {
                Confirmed = false;
                DialogResult = false;
                e.Handled = true;
                return;
            }

            return;
        }

        if (e.Key is Key.Escape or Key.Enter or Key.Return)
        {
            Confirmed = true;
            DialogResult = true;
            e.Handled = true;
        }
    }
}

internal sealed class IdeMessageBoxVm
{
    public IdeMessageBoxVm(
        IdeMessageKind kind,
        string title,
        string message,
        IdeMessageButtons buttons)
    {
        TitleText = title;
        MessageText = message;
        IsConfirm = buttons == IdeMessageButtons.YesNo;
        IsOkOnly = !IsConfirm;
        (IconKind, AccentBrush, HeaderBrush) = kind switch
        {
            IdeMessageKind.Warning => (
                PackIconKind.AlertOutline,
                BrushFrom("#E65100"),
                BrushFrom("#FFF3E0")),
            IdeMessageKind.Danger => (
                PackIconKind.AlertCircleOutline,
                BrushFrom("#C62828"),
                BrushFrom("#FFEBEE")),
            _ => (
                PackIconKind.InformationOutline,
                BrushFrom("#1565C0"),
                BrushFrom("#E3F2FD"))
        };
    }

    public string TitleText { get; }
    public string MessageText { get; }
    public bool IsConfirm { get; }
    public bool IsOkOnly { get; }
    public PackIconKind IconKind { get; }
    public Brush AccentBrush { get; }
    public Brush HeaderBrush { get; }

    private static Brush BrushFrom(string hex)
    {
        var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
        brush.Freeze();
        return brush;
    }
}
