using System.IO;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Editor.Bridge;
using Microsoft.Web.WebView2.Core;

namespace UI.Views.Controls;

/// <summary>
/// Adapter Monaco cho Editor Platform (ADR-0002/ADR-0005) — thay thế BindableXmlEditor/
/// BindableSqlEditor (AvalonEdit). Expose CÙNG property/method surface với các control cũ
/// (BoundText/IsReadOnly/ShowInsights/Insights/InsightEditCommand/ScrollToLine/
/// ScrollToOffset/OpenSearch/OpenReplace/TryGoToDefinition) để View/ViewModel không cần đổi
/// — chỉ đổi tên tag XAML (Adapter Pattern, xem ADR-0002 §Replaceable).
///
/// Không chứa Business Logic ERP: chỉ Render + relay Command/Event qua Message Bridge tới
/// bridge.js (DevWorkFlow.Editor.Bridge chứa phần logic bridge thuần, dùng chung ở đây).
/// </summary>
public partial class MonacoEditorHost : UserControl
{
    private readonly EditorRequestCorrelator _correlator = new();
    private readonly List<Action> _pending_before_ready = [];
    private bool _is_ready;
    private bool _is_internal_text_change;

    // Cache trạng thái selection mới nhất do JS báo về — dùng cho TryGoToDefinition() đồng
    // bộ (không round-trip JS mỗi lần gọi), tương đương CaretOffset/SelectedText của
    // AvalonEdit vốn đọc trực tiếp từ control in-process.
    private int _last_caret_offset = -1;
    private int _last_caret_line = -1;
    private string? _last_selected_text;

    /// <summary>Caret line/column đổi (1-based) — thay cho TextArea.Caret.PositionChanged của AvalonEdit.</summary>
    public event Action<int, int>? CaretPositionChanged;

    /// <summary>Double-click entity SYSTEM trong editor — yêu cầu mở file entity ra tab mới.</summary>
    public event Action<string>? OpenFileRequested;

    /// <summary>
    /// Theme dùng chung cho mọi instance (màu token XML, font, Insight Block) — đọc từ
    /// UI/Config/json/editor-theme.json qua AppConfigStore, gán một lần tại App startup.
    /// Static vì control được tạo từ XAML không qua DI; null → JS dùng mặc định built-in
    /// (giá trị mặc định trong bridge.js trùng với editor-theme.json mặc định).
    /// </summary>
    public static UI.Services.EditorThemeOptions? SharedTheme { get; set; }

    public static readonly DependencyProperty BoundTextProperty =
        DependencyProperty.Register(
            nameof(BoundText),
            typeof(string),
            typeof(MonacoEditorHost),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault,
                OnBoundTextChanged));

    public static readonly DependencyProperty IsReadOnlyProperty =
        DependencyProperty.Register(
            nameof(IsReadOnly),
            typeof(bool),
            typeof(MonacoEditorHost),
            new PropertyMetadata(false, OnIsReadOnlyChanged));

    public static readonly DependencyProperty ScrollToLineProperty =
        DependencyProperty.Register(
            nameof(ScrollToLine),
            typeof(int),
            typeof(MonacoEditorHost),
            new FrameworkPropertyMetadata(0, OnScrollToLineChanged));

    public static readonly DependencyProperty ScrollToOffsetProperty =
        DependencyProperty.Register(
            nameof(ScrollToOffset),
            typeof(int),
            typeof(MonacoEditorHost),
            new FrameworkPropertyMetadata(-1, OnScrollToOffsetChanged));

    public static readonly DependencyProperty ShowInsightsProperty =
        DependencyProperty.Register(
            nameof(ShowInsights),
            typeof(bool),
            typeof(MonacoEditorHost),
            new PropertyMetadata(true, OnInsightsChanged));

    public static readonly DependencyProperty InsightsProperty =
        DependencyProperty.Register(
            nameof(Insights),
            typeof(IReadOnlyList<InsightItem>),
            typeof(MonacoEditorHost),
            new PropertyMetadata(null, OnInsightsChanged));

    /// <summary>Nội dung vùng chọn hiện tại — rỗng nếu không bôi đen. Dùng bởi SQL Studio (Run Selection).</summary>
    public static readonly DependencyProperty SelectedScriptProperty =
        DependencyProperty.Register(
            nameof(SelectedScript),
            typeof(string),
            typeof(MonacoEditorHost),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    public static readonly DependencyProperty InsightEditCommandProperty =
        DependencyProperty.Register(
            nameof(InsightEditCommand),
            typeof(ICommand),
            typeof(MonacoEditorHost),
            new PropertyMetadata(null));

    /// <summary>
    /// Ngôn ngữ Monaco cho instance này ("xml" mặc định, "sql" cho SQL Studio) — cố định lúc
    /// tạo, không đổi runtime. Đặt tên EditorLanguage (không phải "Language") để không đụng
    /// FrameworkElement.Language (XmlLanguage/culture) đã có sẵn trên mọi WPF control.
    /// </summary>
    public static readonly DependencyProperty EditorLanguageProperty =
        DependencyProperty.Register(
            nameof(EditorLanguage),
            typeof(string),
            typeof(MonacoEditorHost),
            new PropertyMetadata("xml"));

    public string BoundText
    {
        get => (string)GetValue(BoundTextProperty);
        set => SetValue(BoundTextProperty, value);
    }

    public bool IsReadOnly
    {
        get => (bool)GetValue(IsReadOnlyProperty);
        set => SetValue(IsReadOnlyProperty, value);
    }

    public int ScrollToLine
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

    public string SelectedScript
    {
        get => (string)GetValue(SelectedScriptProperty);
        set => SetValue(SelectedScriptProperty, value);
    }

    public string EditorLanguage
    {
        get => (string)GetValue(EditorLanguageProperty);
        set => SetValue(EditorLanguageProperty, value);
    }

    public MonacoEditorHost()
    {
        InitializeComponent();
        Loaded += OnLoaded;
    }

    private async void OnLoaded(object sender, RoutedEventArgs e)
    {
        if (MonacoWebView.CoreWebView2 is not null) return; // đã init (Loaded có thể bắn lại)

        try
        {
            var user_data_folder = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                "DevWorkFlow", "WebView2UserData");
            var environment = await CoreWebView2Environment.CreateAsync(userDataFolder: user_data_folder);
            await MonacoWebView.EnsureCoreWebView2Async(environment);

            if (MonacoWebView.CoreWebView2 is not { } core)
                return;

            var assets_root = Path.Combine(AppContext.BaseDirectory, "Assets");
            core.SetVirtualHostNameToFolderMapping(
                "devworkflow.editor", assets_root, CoreWebView2HostResourceAccessKind.Allow);

            core.WebMessageReceived += OnWebMessageReceived;

            core.Navigate(
                $"https://devworkflow.editor/EditorHost/index.html?lang={Uri.EscapeDataString(EditorLanguage)}");
        }
        catch (Exception ex)
        {
            // WebView2 Runtime chưa cài / lỗi khởi tạo — không crash IDE, để trống Editor.
            System.Diagnostics.Debug.WriteLine($"MonacoEditorHost init lỗi: {ex}");
        }
    }

    private void OnWebMessageReceived(object? sender, CoreWebView2WebMessageReceivedEventArgs e)
    {
        var json = e.WebMessageAsJson;
        // WebMessageAsJson bọc chuỗi JSON của bridge.js (postMessage(JSON.stringify(...)))
        // thành một JSON string literal — giải mã 1 lớp trước khi parse envelope thật.
        string payload_json;
        try
        {
            payload_json = JsonSerializer.Deserialize<string>(json) ?? json;
        }
        catch (JsonException)
        {
            payload_json = json;
        }

        if (!EditorHostMessage.TryParseIncoming(payload_json, out var response, out var evt))
            return;

        if (response is not null)
        {
            _correlator.TryComplete(response);
            return;
        }

        if (evt is not null)
            HandleEvent(evt);
    }

    private void HandleEvent(EditorHostEvent evt)
    {
        switch (evt.Event)
        {
            case EditorHostEvents.Ready:
                _is_ready = true;
                FlushPendingBeforeReady();
                break;

            case EditorHostEvents.ContentChanged:
                if (evt.Payload?.TryGetProperty("text", out var text_prop) == true)
                {
                    var new_text = text_prop.GetString() ?? string.Empty;
                    _is_internal_text_change = true;
                    try { SetCurrentValue(BoundTextProperty, new_text); }
                    finally { _is_internal_text_change = false; }
                }
                break;

            case EditorHostEvents.SelectionChanged:
                if (evt.Payload is { } selection_payload)
                {
                    if (selection_payload.TryGetProperty("offset", out var offset_prop))
                        _last_caret_offset = offset_prop.GetInt32();
                    _last_selected_text = selection_payload.TryGetProperty("selectedText", out var sel_prop)
                        && sel_prop.ValueKind == JsonValueKind.String
                        ? sel_prop.GetString()
                        : null;
                    SetCurrentValue(SelectedScriptProperty, _last_selected_text ?? string.Empty);

                    if (selection_payload.TryGetProperty("line", out var line_prop)
                        && selection_payload.TryGetProperty("column", out var column_prop))
                    {
                        _last_caret_line = line_prop.GetInt32();
                        CaretPositionChanged?.Invoke(_last_caret_line, column_prop.GetInt32());
                    }
                }
                break;

            case EditorHostEvents.OpenFileRequested:
                if (evt.Payload?.TryGetProperty("path", out var path_prop) == true
                    && path_prop.ValueKind == JsonValueKind.String
                    && path_prop.GetString() is { Length: > 0 } file_path)
                    OpenFileRequested?.Invoke(file_path);
                break;

            case EditorHostEvents.EntityValueCommitted:
                if (evt.Payload?.TryGetProperty("entityName", out var name_prop) == true
                    && evt.Payload.Value.TryGetProperty("newValue", out var value_prop))
                {
                    var edit = new EntityValueEdit
                    {
                        EntityName = name_prop.GetString() ?? string.Empty,
                        NewValue = value_prop.GetString() ?? string.Empty
                    };
                    if (InsightEditCommand?.CanExecute(edit) == true)
                        InsightEditCommand.Execute(edit);
                }
                break;
        }
    }

    private void FlushPendingBeforeReady()
    {
        var actions = _pending_before_ready.ToArray();
        _pending_before_ready.Clear();
        foreach (var action in actions)
            action();

        // Đồng bộ lại toàn bộ state hiện tại — property setter có thể đã chạy trước khi
        // WebView2/JS sẵn sàng (ví dụ Binding áp dụng ngay khi control khởi tạo).
        // Theme gửi trước để văn bản không "nháy" từ màu mặc định sang màu config.
        if (SharedTheme is not null)
            SendCommandFireAndForget(EditorHostCommands.ApplyTheme, SharedTheme);
        SendCommandFireAndForget(EditorHostCommands.SetValue, new { text = BoundText });
        SendCommandFireAndForget(EditorHostCommands.SetReadOnly, new { value = IsReadOnly });
        SendInsights();
    }

    private void RunOrQueue(Action action)
    {
        if (_is_ready) action();
        else _pending_before_ready.Add(action);
    }

    /// <summary>Gửi Command, không chờ Response (đủ cho mọi Command hiện có — không cái nào cần giá trị trả về đồng bộ).</summary>
    private void SendCommandFireAndForget(string command, object? payload)
    {
        if (MonacoWebView.CoreWebView2 is null) return;

        var id = Guid.NewGuid().ToString("N");
        var pending = _correlator.RegisterAsync(id);
        _ = pending.ContinueWith(
            t => System.Diagnostics.Debug.WriteLine($"MonacoEditorHost command '{command}' lỗi: {t.Exception}"),
            TaskContinuationOptions.OnlyOnFaulted | TaskContinuationOptions.ExecuteSynchronously);

        MonacoWebView.CoreWebView2.PostWebMessageAsJson(
            EditorHostMessage.BuildRequestJson(id, command, payload));
    }

    private void SendInsights() =>
        SendCommandFireAndForget(EditorHostCommands.SetInsights,
            new { items = (IReadOnlyList<InsightItem>?)Insights ?? [], show = ShowInsights });

    /// <summary>Mở Find (Ctrl+F).</summary>
    public void OpenSearch() =>
        RunOrQueue(() => SendCommandFireAndForget(EditorHostCommands.OpenFind, null));

    /// <summary>Mở Replace (Ctrl+H).</summary>
    public void OpenReplace() =>
        RunOrQueue(() => SendCommandFireAndForget(EditorHostCommands.OpenReplace, null));

    /// <summary>F12 — Go to Definition function trong cùng document (đồng bộ, dùng state selection đã cache).</summary>
    public bool TryGoToDefinition()
    {
        var text = BoundText;
        var name = !string.IsNullOrWhiteSpace(_last_selected_text)
            ? _last_selected_text.Trim()
            : XmlStructureParser.ExtractIdentifierAt(text, _last_caret_offset);

        if (string.IsNullOrWhiteSpace(name))
            return false;

        var found = XmlStructureParser.FindFunctionDefinition(text, name);
        if (found is null)
            return false;

        var select_length = ("function " + name).Length;
        RunOrQueue(() => SendCommandFireAndForget(
            EditorHostCommands.SelectRange, new { offset = found.Value.Offset, length = select_length }));
        return true;
    }

    private static void OnBoundTextChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        if (host._is_internal_text_change) return;

        var new_text = e.NewValue as string ?? string.Empty;
        host.SetCurrentValue(SelectedScriptProperty, string.Empty);
        host.RunOrQueue(() => host.SendCommandFireAndForget(EditorHostCommands.SetValue, new { text = new_text }));
    }

    private static void OnIsReadOnlyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        var value = (bool)e.NewValue;
        host.RunOrQueue(() => host.SendCommandFireAndForget(EditorHostCommands.SetReadOnly, new { value }));
    }

    private static void OnScrollToLineChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        if (e.NewValue is not int line || line < 1) return;

        // Guard chống vòng lặp: ScrollToLine thường được bind từ CaretLine của ViewModel,
        // vốn được VM cập nhật CHÍNH TỪ CaretPositionChanged mà control này vừa phát ra khi
        // người dùng tự click/gõ trong Monaco (xem HandleEvent/SelectionChanged). Với
        // AvalonEdit (đồng bộ, in-process) cú "echo" này vô hình vì TextArea tự sửa lại
        // caret đúng vị trí trong cùng khung hình; với Monaco (round-trip WebView2 bất đồng
        // bộ) nó gây hiện tượng thấy được: caret nhảy về đầu dòng rồi mới về đúng chỗ, kèm
        // revealLineInCenter cuộn màn hình — đây chính là lỗi người dùng báo cáo. Nếu dòng
        // đích đã khớp dòng caret hiện tại (tức đây là echo, không phải điều hướng thật từ
        // Outline/Go-To-Definition/Search), bỏ qua, không gửi lệnh revealLine.
        if (line == host._last_caret_line) return;

        host.RunOrQueue(() => host.SendCommandFireAndForget(EditorHostCommands.RevealLine, new { line }));
    }

    private static void OnScrollToOffsetChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        if (e.NewValue is not int offset || offset < 0) return;

        // Cùng guard chống vòng lặp như OnScrollToLineChanged — xem chú thích ở đó.
        if (offset == host._last_caret_offset) return;

        host.RunOrQueue(() => host.SendCommandFireAndForget(EditorHostCommands.RevealOffset, new { offset }));
    }

    private static void OnInsightsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        host.RunOrQueue(host.SendInsights);
    }
}
