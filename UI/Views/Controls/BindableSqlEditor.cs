using System.Windows;
using System.Windows.Media;
using ICSharpCode.AvalonEdit;
using ICSharpCode.AvalonEdit.Highlighting;

namespace UI.Views.Controls;

/// <summary>Editor T-SQL (AvalonEdit) bind BoundText + SelectedScript (vùng bôi đen).</summary>
public class BindableSqlEditor : TextEditor
{
    private bool _is_internal_change;

    public static readonly DependencyProperty BoundTextProperty =
        DependencyProperty.Register(
            nameof(BoundText),
            typeof(string),
            typeof(BindableSqlEditor),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                OnBoundTextChanged));

    public static readonly DependencyProperty SelectedScriptProperty =
        DependencyProperty.Register(
            nameof(SelectedScript),
            typeof(string),
            typeof(BindableSqlEditor),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public string BoundText
    {
        get => (string)GetValue(BoundTextProperty);
        set => SetValue(BoundTextProperty, value);
    }

    /// <summary>Nội dung vùng chọn — rỗng nếu không bôi đen.</summary>
    public string SelectedScript
    {
        get => (string)GetValue(SelectedScriptProperty);
        set => SetValue(SelectedScriptProperty, value);
    }

    public BindableSqlEditor()
    {
        FontFamily = new FontFamily("Cascadia Code, Consolas, Courier New");
        FontSize = 13;
        ShowLineNumbers = true;
        WordWrap = false;
        HorizontalScrollBarVisibility = System.Windows.Controls.ScrollBarVisibility.Auto;
        VerticalScrollBarVisibility = System.Windows.Controls.ScrollBarVisibility.Auto;
        Padding = new Thickness(4, 2, 4, 2);
        Background = new SolidColorBrush(Color.FromRgb(0xFF, 0xFF, 0xFF));
        Foreground = new SolidColorBrush(Color.FromRgb(0x1E, 0x1E, 0x1E));
        LineNumbersForeground = new SolidColorBrush(Color.FromRgb(0x85, 0x85, 0x85));
        Options.EnableHyperlinks = false;
        Options.EnableEmailHyperlinks = false;
        Options.AllowScrollBelowDocument = false;
        Options.ConvertTabsToSpaces = true;
        Options.IndentationSize = 4;

        SyntaxHighlighting = HighlightingManager.Instance.GetDefinition("TSQL")
                             ?? HighlightingManager.Instance.GetDefinition("SQL");

        Document.TextChanged += (_, _) =>
        {
            if (_is_internal_change) return;
            _is_internal_change = true;
            try
            {
                BoundText = Document.Text;
            }
            finally
            {
                _is_internal_change = false;
            }
        };

        TextArea.SelectionChanged += (_, _) => SyncSelectedScript();
    }

    private void SyncSelectedScript()
    {
        if (_is_internal_change) return;
        var text = TextArea.Selection.IsEmpty
            ? string.Empty
            : TextArea.Selection.GetText();
        if (!string.Equals(SelectedScript, text, StringComparison.Ordinal))
            SelectedScript = text;
    }

    private static void OnBoundTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not BindableSqlEditor editor) return;
        if (editor._is_internal_change) return;

        var new_text = e.NewValue as string ?? string.Empty;
        if (editor.Document.Text == new_text) return;

        editor._is_internal_change = true;
        try
        {
            var caret = editor.CaretOffset;
            editor.Document.Text = new_text;
            editor.CaretOffset = Math.Min(caret, new_text.Length);
            editor.SelectedScript = string.Empty;
        }
        finally
        {
            editor._is_internal_change = false;
        }
    }
}
