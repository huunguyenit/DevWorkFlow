using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using MaterialDesignThemes.Wpf;
using UI.Services;

namespace UI.Views.Dialogs;

public partial class IdeMessageBoxWindow : Window
{
    public IdeMessageBoxWindow(IdeMessageKind kind, string title, string message)
    {
        InitializeComponent();
        DataContext = new IdeMessageBoxVm(kind, title, message);
    }

    private void Ok_Click(object sender, RoutedEventArgs e) => DialogResult = true;

    private void Window_KeyDown(object sender, KeyEventArgs e)
    {
        if (e.Key is Key.Escape or Key.Enter or Key.Return)
        {
            DialogResult = true;
            e.Handled = true;
        }
    }
}

internal sealed class IdeMessageBoxVm
{
    public IdeMessageBoxVm(IdeMessageKind kind, string title, string message)
    {
        TitleText = title;
        MessageText = message;
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
