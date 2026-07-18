using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;
using ICSharpCode.AvalonEdit;
using ICSharpCode.AvalonEdit.Highlighting;
using ICSharpCode.AvalonEdit.Highlighting.Xshd;
using ICSharpCode.AvalonEdit.Search;

namespace UI.Views.Controls;

/// <summary>
/// Editor XML AvalonEdit: Document luôn là Reference (&amp;Entity;).
/// Insight Mode dùng Rendering Engine (InlineObject), không đổi text gốc.
/// Ctrl+F / Ctrl+H Search-Replace; F12 Go to Definition function.
/// </summary>
public class BindableXmlEditor : TextEditor
{
    private bool _is_internal_change;
    private readonly InsightElementGenerator _insight_generator = new();
    private SearchPanel? _search_panel;

    public static readonly DependencyProperty BoundTextProperty =
        DependencyProperty.Register(
            nameof(BoundText),
            typeof(string),
            typeof(BindableXmlEditor),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                OnBoundTextChanged));

    public static readonly DependencyProperty ScrollToLineProperty =
        DependencyProperty.Register(
            nameof(ScrollToLine),
            typeof(int),
            typeof(BindableXmlEditor),
            new FrameworkPropertyMetadata(0, OnScrollToLineChanged));

    public static readonly DependencyProperty ScrollToOffsetProperty =
        DependencyProperty.Register(
            nameof(ScrollToOffset),
            typeof(int),
            typeof(BindableXmlEditor),
            new FrameworkPropertyMetadata(-1, OnScrollToOffsetChanged));

    public static readonly DependencyProperty ShowInsightsProperty =
        DependencyProperty.Register(
            nameof(ShowInsights),
            typeof(bool),
            typeof(BindableXmlEditor),
            new PropertyMetadata(true, OnInsightVisualChanged));

    public static readonly DependencyProperty InsightsProperty =
        DependencyProperty.Register(
            nameof(Insights),
            typeof(IReadOnlyList<InsightItem>),
            typeof(BindableXmlEditor),
            new PropertyMetadata(null, OnInsightVisualChanged));

    public static readonly DependencyProperty InsightEditCommandProperty =
        DependencyProperty.Register(
            nameof(InsightEditCommand),
            typeof(ICommand),
            typeof(BindableXmlEditor),
            new PropertyMetadata(null, OnInsightVisualChanged));

    public string BoundText
    {
        get => (string)GetValue(BoundTextProperty);
        set => SetValue(BoundTextProperty, value);
    }

    public new int ScrollToLine
    {
        get => (int)GetValue(ScrollToLineProperty);
        set => SetValue(ScrollToLineProperty, value);
    }

    public int ScrollToOffset
    {
        get => (int)GetValue(ScrollToOffsetProperty);
        set => SetValue(ScrollToOffsetProperty, value);
    }

    public bool ShowInsights
    {
        get => (bool)GetValue(ShowInsightsProperty);
        set => SetValue(ShowInsightsProperty, value);
    }

    public IReadOnlyList<InsightItem>? Insights
    {
        get => (IReadOnlyList<InsightItem>?)GetValue(InsightsProperty);
        set => SetValue(InsightsProperty, value);
    }

    public ICommand? InsightEditCommand
    {
        get => (ICommand?)GetValue(InsightEditCommandProperty);
        set => SetValue(InsightEditCommandProperty, value);
    }

    public BindableXmlEditor()
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
        Options.IndentationSize = 2;

        SyntaxHighlighting = HighlightingManager.Instance.GetDefinition("XML")
                             ?? LoadBuiltinXmlHighlighting();

        TextArea.TextView.LinkTextForegroundBrush =
            new SolidColorBrush(Color.FromRgb(0x00, 0x66, 0xCC));

        TextArea.TextView.ElementGenerators.Add(_insight_generator);

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

        Loaded += OnLoaded;
        PreviewKeyDown += OnPreviewKeyDown;
    }

    private void OnLoaded(object sender, RoutedEventArgs e)
    {
        if (_search_panel is not null) return;
        _search_panel = SearchPanel.Install(this);
    }

    /// <summary>Mở Find (Ctrl+F).</summary>
    public void OpenSearch()
    {
        _search_panel ??= SearchPanel.Install(this);
        _search_panel.Open();
        if (!string.IsNullOrEmpty(SelectedText))
            _search_panel.SearchPattern = SelectedText;
    }

    /// <summary>Mở Replace (Ctrl+H) — AvalonEdit SearchPanel có Replace mode.</summary>
    public void OpenReplace()
    {
        OpenSearch();
        // AvalonEdit SearchPanel: mở rồi focus; Replace hiện khi bấm mũi tên mở rộng
        // Gọi lại Open đủ để user thấy panel; một số bản hỗ trợ IsReplaceMode
        try
        {
            var prop = typeof(SearchPanel).GetProperty("IsReplaceMode");
            prop?.SetValue(_search_panel, true);
        }
        catch
        {
            // ignore — Find vẫn dùng được
        }
    }

    /// <summary>F12 — Go to Definition function trong cùng document.</summary>
    public bool TryGoToDefinition()
    {
        var text = Document.Text;
        var offset = CaretOffset;
        var name = !string.IsNullOrWhiteSpace(SelectedText)
            ? SelectedText.Trim()
            : XmlStructureParser.ExtractIdentifierAt(text, offset);

        if (string.IsNullOrWhiteSpace(name))
            return false;

        var found = XmlStructureParser.FindFunctionDefinition(text, name);
        if (found is null)
            return false;

        JumpToOffset(found.Value.Offset, select_length: ("function " + name).Length);
        return true;
    }

    private void OnPreviewKeyDown(object sender, KeyEventArgs e)
    {
        // Khi đang gõ resolved value, đừng xử lý shortcut của AvalonEdit.
        if (IsFocusInsideInsight())
            return;

        if (e.Key == Key.F12)
        {
            if (TryGoToDefinition())
                e.Handled = true;
            return;
        }

        if (e.Key == Key.F && Keyboard.Modifiers == ModifierKeys.Control)
        {
            OpenSearch();
            e.Handled = true;
            return;
        }

        if (e.Key == Key.H && Keyboard.Modifiers == ModifierKeys.Control)
        {
            OpenReplace();
            e.Handled = true;
        }
    }

    private static bool IsFocusInsideInsight()
    {
        var focused = Keyboard.FocusedElement as DependencyObject;
        while (focused is not null)
        {
            if (focused is EntityInsightBlock)
                return true;
            focused = focused is System.Windows.Media.Visual or System.Windows.Media.Media3D.Visual3D
                ? System.Windows.Media.VisualTreeHelper.GetParent(focused)
                : System.Windows.LogicalTreeHelper.GetParent(focused);
        }

        return false;
    }

    public void JumpToOffset(int offset, int select_length = 0, bool steal_focus = false)
    {
        if (Document.TextLength <= 0) return;
        if (offset < 0) return;
        if (offset > Document.TextLength)
            offset = Document.TextLength;

        var line = Document.GetLineByOffset(offset);
        // Dòng CDATA/script cực dài: Select / BringCaretToView dễ treo UI.
        const int max_safe_line_length = 512;
        if (line.Length > max_safe_line_length)
        {
            CaretOffset = line.Offset;
            Select(line.Offset, 0);
            ScrollToLine(line.LineNumber);
            if (steal_focus)
                Focus();
            return;
        }

        CaretOffset = offset;

        // select_length == 0 → chỉ caret (Outline / Navigation Service).
        // select_length  > 0 → highlight đúng độ dài (F12).
        if (select_length > 0)
        {
            var len = Math.Min(select_length, Document.TextLength - offset);
            Select(offset, Math.Max(0, len));
        }
        else
        {
            Select(offset, 0);
        }

        TextArea.Caret.BringCaretToView();
        if (steal_focus)
            Focus();
    }

    private static void OnScrollToLineChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not BindableXmlEditor editor) return;
        if (e.NewValue is not int line || line < 1) return;
        if (line > editor.Document.LineCount) return;

        var doc_line = editor.Document.GetLineByNumber(line);
        // Scroll theo dòng: caret đầu dòng, không Select (tránh treo).
        editor.JumpToOffset(doc_line.Offset, select_length: 0, steal_focus: false);
        editor.ScrollToLine(line);
    }

    private static void OnScrollToOffsetChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not BindableXmlEditor editor) return;
        if (e.NewValue is not int offset || offset < 0) return;
        editor.JumpToOffset(offset, select_length: 0, steal_focus: false);
    }

    private static void OnBoundTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not BindableXmlEditor editor) return;
        if (editor._is_internal_change) return;

        var new_text = e.NewValue as string ?? string.Empty;
        if (editor.Document.Text == new_text) return;

        editor._is_internal_change = true;
        try
        {
            var caret = editor.CaretOffset;
            editor.Document.Text = new_text;
            editor.CaretOffset = Math.Min(caret, new_text.Length);
        }
        finally
        {
            editor._is_internal_change = false;
        }
    }

    private static void OnInsightVisualChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not BindableXmlEditor editor) return;
        editor.ApplyInsightRenderer();
    }

    private void ApplyInsightRenderer()
    {
        _insight_generator.IsEnabled = ShowInsights;
        _insight_generator.Insights = Insights ?? [];
        _insight_generator.EditCommand = InsightEditCommand;

        TextArea.TextView.Redraw();
    }

    private static IHighlightingDefinition? LoadBuiltinXmlHighlighting()
    {
        try
        {
            using var stream = typeof(HighlightingManager).Assembly
                .GetManifestResourceStream("ICSharpCode.AvalonEdit.Highlighting.Resources.XML-Mode.xshd");
            if (stream is null) return null;
            using var reader = new System.Xml.XmlTextReader(stream);
            return HighlightingLoader.Load(reader, HighlightingManager.Instance);
        }
        catch
        {
            return null;
        }
    }
}
