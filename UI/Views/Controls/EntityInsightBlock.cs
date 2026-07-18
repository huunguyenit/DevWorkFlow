using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using DevWorkFlow.Domain.Language;

namespace UI.Views.Controls;

/// <summary>
/// Render Entity insight: reference read-only + resolved value editable + nested tree.
/// Không chứa resolve/validation/XML business logic.
/// </summary>
public sealed class EntityInsightBlock : Border
{
    private readonly InsightItem _insight;
    private readonly ICommand? _edit_command;
    private readonly TextBox _value_editor;
    private string _original_value;

    public EntityInsightBlock(InsightItem insight, ICommand? edit_command, int depth = 0)
    {
        _insight = insight;
        _edit_command = edit_command;
        _original_value = insight.ResolvedValue;

        BorderBrush = new SolidColorBrush(Color.FromRgb(0xCE, 0x93, 0xD8));
        BorderThickness = new Thickness(1);
        Background = depth == 0
            ? new SolidColorBrush(Color.FromRgb(0xF8, 0xF0, 0xFA))
            : new SolidColorBrush(Color.FromRgb(0xFC, 0xF8, 0xFD));
        CornerRadius = new CornerRadius(3);
        Padding = new Thickness(5, 3, 5, 3);
        Margin = new Thickness(depth * 10, 1, 0, 1);
        MinWidth = 180;
        MaxWidth = 760;

        var panel = new StackPanel();
        var row = new DockPanel { LastChildFill = true };
        var reference = new TextBlock
        {
            Text = insight.ReferenceText,
            FontFamily = new FontFamily("Cascadia Code, Consolas"),
            FontSize = 12,
            FontStyle = FontStyles.Italic,
            Foreground = new SolidColorBrush(Color.FromRgb(0x75, 0x75, 0x75)),
            VerticalAlignment = VerticalAlignment.Center,
            Margin = new Thickness(0, 0, 7, 0)
        };
        DockPanel.SetDock(reference, Dock.Left);
        row.Children.Add(reference);

        var separator = new TextBlock
        {
            Text = "│",
            Foreground = new SolidColorBrush(Color.FromRgb(0xAB, 0x47, 0xBC)),
            VerticalAlignment = VerticalAlignment.Center,
            Margin = new Thickness(0, 0, 7, 0)
        };
        DockPanel.SetDock(separator, Dock.Left);
        row.Children.Add(separator);

        _value_editor = new TextBox
        {
            Text = _original_value,
            FontFamily = new FontFamily("Cascadia Code, Consolas"),
            FontSize = 12,
            IsReadOnly = !insight.CanEditResolvedValue,
            AcceptsReturn = true,
            AcceptsTab = true,
            MinWidth = 100,
            MinHeight = 24,
            MaxHeight = 160,
            Padding = new Thickness(3, 1, 3, 1),
            BorderThickness = new Thickness(0),
            Background = insight.CanEditResolvedValue ? Brushes.White : Brushes.Transparent,
            Foreground = new SolidColorBrush(Color.FromRgb(0x2D, 0x2D, 0x2D)),
            TextWrapping = TextWrapping.Wrap,
            VerticalScrollBarVisibility = ScrollBarVisibility.Auto
        };
        _value_editor.LostKeyboardFocus += (_, _) => Commit();
        _value_editor.PreviewKeyDown += (_, event_args) =>
        {
            if (event_args.Key == Key.Enter
                && Keyboard.Modifiers.HasFlag(ModifierKeys.Control))
            {
                Commit();
                event_args.Handled = true;
            }
            else if (event_args.Key == Key.Escape)
            {
                _value_editor.Text = _original_value;
                event_args.Handled = true;
            }
        };
        row.Children.Add(_value_editor);
        panel.Children.Add(row);

        foreach (var child in insight.Children)
            panel.Children.Add(new EntityInsightBlock(child, edit_command, depth + 1));

        Child = panel;
    }

    private void Commit()
    {
        if (_value_editor.IsReadOnly
            || string.Equals(_value_editor.Text, _original_value, StringComparison.Ordinal))
            return;

        var edit_action = _insight.Actions.FirstOrDefault(
            action => action.Id.Equals("entity.edit", StringComparison.OrdinalIgnoreCase));
        if (edit_action is null
            || !edit_action.Metadata.TryGetValue("entity_name", out var entity_name))
            return;

        var edit = new EntityValueEdit
        {
            EntityName = entity_name,
            NewValue = _value_editor.Text
        };
        if (_edit_command?.CanExecute(edit) != true)
            return;

        _edit_command.Execute(edit);
        _original_value = _value_editor.Text;
    }
}
