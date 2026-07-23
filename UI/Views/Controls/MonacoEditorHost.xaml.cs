using System.IO;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Editor;
using DevWorkFlow.Editor.Bridge;
using Microsoft.Web.WebView2.Core;

namespace UI.Views.Controls;

/// <summary>
/// Adapter Monaco cho Editor Platform (ADR-0002/ADR-0005) — thay thế BindableXmlEditor/
/// BindableSqlEditor (AvalonEdit). Expose CÙNG property/method surface với các control cũ
/// (BoundText/IsReadOnly/ShowInsights/ScrollToLine/ScrollToOffset/OpenSearch/OpenReplace/
/// TryGoToDefinition) để View/ViewModel không cần đổi — chỉ đổi tên tag XAML
/// (Adapter Pattern, xem ADR-0002 §Replaceable).
///
/// Insight mode (ShowInsights = true): BoundText là ClearText projection — text đã expand
/// entity — và ClearTextSegments cho biết đoạn nào đến từ entity nào để tô màu. Không còn
/// render InsightItem (chèn giá trị resolve sau &amp;X;) như thiết kế trước; xem
/// docs/specs/editor/insight-editor-surface.md.
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

    /// <summary>
    /// Ctrl+Click một vùng entity trong Insight mode (ClearText). Host quyết định điều hướng
    /// — xem <see cref="EntityNavigationRequest"/>.
    /// </summary>
    public event Action<EntityNavigationRequest>? OpenEntityRequested;

    /// <summary>
    /// Ctrl+Click — mang offset của buffer đang hiển thị và cờ cho biết đó là buffer nào
    /// (true = ClearText/Insight, false = source XML); host tra Language Service để điều hướng.
    /// </summary>
    public event Action<int, bool>? EntityOffsetActivated;

    /// <summary>
    /// Hover entity (debounced): offset nguồn, mode Insight?, tên entity (Insight). Host tra giá
    /// trị rồi gọi <see cref="ShowEntityHover"/> / <see cref="HideEntityHover"/>.
    /// </summary>
    public event Action<int, bool, string?>? EntityHoverRequested;

    /// <summary>
    /// Monaco xin Completion trong island JS (Phase 4) — host trả danh sách để bridge resolve
    /// Promise. Trả về null/rỗng nghĩa là không gợi ý.
    /// </summary>
    public event Func<int, bool, object?>? FboJsCompleteRequested;

    /// <summary>Monaco xin Signature Help; trả null nếu không có.</summary>
    public event Func<int, bool, object?>? FboJsSignatureRequested;

    /// <summary>
    /// Tab trong vùng SQL: host quyết định dòng có expand được không (offset, lineText) → chuỗi
    /// thay thế, hoặc null để Tab giữ hành vi mặc định.
    /// </summary>
    public event Func<int, string, string?>? OptionsSnippetRequested;

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
            new PropertyMetadata(true, OnClearTextSegmentsChanged));

    /// <summary>
    /// Insight mode: provenance entity của text đang hiển thị (ClearText). Chỉ có nghĩa khi
    /// BoundText chính là ClearText projection — span tính trên text đó, không phải source XML.
    /// </summary>
    public static readonly DependencyProperty ClearTextSegmentsProperty =
        DependencyProperty.Register(
            nameof(ClearTextSegments),
            typeof(IReadOnlyList<ClearTextSegment>),
            typeof(MonacoEditorHost),
            new PropertyMetadata(null, OnClearTextSegmentsChanged));

    /// <summary>Nội dung vùng chọn hiện tại — rỗng nếu không bôi đen. Dùng bởi SQL Studio (Run Selection).</summary>
    public static readonly DependencyProperty SelectedScriptProperty =
        DependencyProperty.Register(
            nameof(SelectedScript),
            typeof(string),
            typeof(MonacoEditorHost),
            new FrameworkPropertyMetadata(
                string.Empty,
                FrameworkPropertyMetadataOptions.BindsTwoWayByDefault));

    /// <summary>
    /// Ngôn ngữ Monaco cho instance này ("xml" mặc định → tokenizer FBO erp-xml, "sql" cho SQL
    /// Studio, "javascript" cho file .js). Giá trị ban đầu quyết định model lúc tạo (qua ?lang=);
    /// đổi runtime (StatusBar) sẽ gửi lệnh setLanguage đổi tô màu tại chỗ. Đặt tên EditorLanguage
    /// (không phải "Language") để không đụng FrameworkElement.Language (XmlLanguage/culture).
    /// </summary>
    public static readonly DependencyProperty EditorLanguageProperty =
        DependencyProperty.Register(
            nameof(EditorLanguage),
            typeof(string),
            typeof(MonacoEditorHost),
            new PropertyMetadata("xml", OnEditorLanguageChanged));

    /// <summary>
    /// Marker chẩn đoán (squiggle) trên buffer đang hiển thị — offset theo buffer hiện tại. VM
    /// gửi danh sách rỗng để xoá (vd khi sang Insight mode). Editor chỉ render, không hiểu ERP.
    /// </summary>
    public static readonly DependencyProperty EditorMarkersProperty =
        DependencyProperty.Register(
            nameof(EditorMarkers),
            typeof(IReadOnlyList<EditorMarker>),
            typeof(MonacoEditorHost),
            new PropertyMetadata(null, OnEditorMarkersChanged));

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

    public IReadOnlyList<ClearTextSegment>? ClearTextSegments
    {
        get => (IReadOnlyList<ClearTextSegment>?)GetValue(ClearTextSegmentsProperty);
        set => SetValue(ClearTextSegmentsProperty, value);
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

    public IReadOnlyList<EditorMarker>? EditorMarkers
    {
        get => (IReadOnlyList<EditorMarker>?)GetValue(EditorMarkersProperty);
        set => SetValue(EditorMarkersProperty, value);
    }

    public MonacoEditorHost()
    {
        InitializeComponent();
        Loaded += OnLoaded;

        // Bắt phím điều hướng ở cấp control (không phải cấp WebView2 lá): WebView2 là airspace
        // island nên phím Home/End do browser bắn ra bubble lên và AvalonDock document pane
        // (TabControl/Selector) xử lý Home/End = focus tab đầu/cuối → cướp focus khỏi editor.
        // Handler ở lá WebView2 bắn quá muộn/không nằm trên đường route; gắn ở chính UserControl
        // (tunnel tới đây trước khi tới WebView2) + handledEventsToo để vẫn nhận kể cả khi tổ
        // tiên đã đánh dấu Handled. Xem OnHostPreviewKeyDown.
        AddHandler(PreviewKeyDownEvent, new KeyEventHandler(OnHostPreviewKeyDown), handledEventsToo: true);
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

#if DEBUG
    core.Settings.AreDevToolsEnabled = true;
    //Tuỳ chọn: mở sẵn cửa sổ DevTools
    //core.OpenDevToolsWindow();
#endif
        }
        catch (Exception ex)
        {
            // WebView2 Runtime chưa cài / lỗi khởi tạo — không crash IDE, để trống Editor.
            System.Diagnostics.Debug.WriteLine($"MonacoEditorHost init lỗi: {ex}");
        }
    }

    /// <summary>
    /// Chặn phím điều hướng ở cấp UserControl rồi CHỦ ĐỘNG gọi lệnh con trỏ Monaco qua bridge —
    /// không lệ thuộc native forwarding của airspace. Chỉ xử lý khi focus thật sự nằm trong
    /// WebView2 (đang gõ Monaco), để không cướp Home/End khi người dùng đang ở control WPF khác.
    /// </summary>
    private void OnHostPreviewKeyDown(object sender, KeyEventArgs e)
    {
        // Bỏ qua khi có Ctrl/Alt (Ctrl+Home/End… để routing khác xử lý); chỉ nhận thuần hoặc +Shift.
        if ((Keyboard.Modifiers & (ModifierKeys.Control | ModifierKeys.Alt)) != 0)
            return;

        // Handler gắn ở chính UserControl nên chỉ nhận PreviewKeyDown khi route đi qua subtree
        // này — tức focus đang nằm trong editor. Không cần kiểm tra IsKeyboardFocusWithin (cờ này
        // có thể sai với airspace WebView2 và sẽ khiến handler no-op).
        var has_shift = (Keyboard.Modifiers & ModifierKeys.Shift) != 0;
        var action_id = e.Key switch
        {
            Key.Home => has_shift ? "cursorHomeSelect" : "cursorHome",
            Key.End => has_shift ? "cursorEndSelect" : "cursorEnd",
            Key.PageUp => has_shift ? "cursorPageUpSelect" : "cursorPageUp",
            Key.PageDown => has_shift ? "cursorPageDownSelect" : "cursorPageDown",
            _ => null
        };

        if (action_id is null) return;

        e.Handled = true;
        RunOrQueue(() => SendCommandFireAndForget(
            EditorHostCommands.RunAction, new { actionId = action_id }));
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

            case EditorHostEvents.OpenEntityRequested:
                if (evt.Payload is { } entity_payload)
                    OpenEntityRequested?.Invoke(new EntityNavigationRequest
                    {
                        EntityName = ReadString(entity_payload, "entityName"),
                        SymbolId = ReadString(entity_payload, "symbolId"),
                        DefinitionPath = ReadString(entity_payload, "definitionPath"),
                        DefinitionOffset = entity_payload.TryGetProperty("definitionOffset", out var def_offset)
                            && def_offset.ValueKind == JsonValueKind.Number
                                ? def_offset.GetInt32()
                                : -1,
                        OpenPath = ReadString(entity_payload, "openPath")
                    });
                break;

            case EditorHostEvents.EntityOffsetActivated:
                if (evt.Payload is { } offset_payload
                    && offset_payload.TryGetProperty("offset", out var offset_prop2)
                    && offset_prop2.ValueKind == JsonValueKind.Number)
                {
                    var activated_insight =
                        offset_payload.TryGetProperty("insight", out var activated_insight_prop)
                        && activated_insight_prop.ValueKind is JsonValueKind.True;
                    EntityOffsetActivated?.Invoke(offset_prop2.GetInt32(), activated_insight);
                }
                break;

            case EditorHostEvents.EntityHoverRequested:
                if (evt.Payload is { } hover_payload
                    && hover_payload.TryGetProperty("offset", out var hover_offset_prop)
                    && hover_offset_prop.ValueKind == JsonValueKind.Number)
                {
                    var insight = hover_payload.TryGetProperty("insight", out var insight_prop)
                                  && insight_prop.ValueKind is JsonValueKind.True;
                    var entity_name = hover_payload.TryGetProperty("entityName", out var name_prop)
                                      && name_prop.ValueKind == JsonValueKind.String
                        ? name_prop.GetString()
                        : null;
                    EntityHoverRequested?.Invoke(hover_offset_prop.GetInt32(), insight, entity_name);
                }
                break;

            case EditorHostEvents.FboJsCompleteRequested:
                if (TryReadAssistRequest(evt.Payload, out var complete_id, out var complete_offset,
                        out var complete_insight))
                {
                    var items = FboJsCompleteRequested?.Invoke(complete_offset, complete_insight)
                                ?? Array.Empty<object>();
                    SendCommandFireAndForget(
                        EditorHostCommands.FboJsCompleteResult,
                        new { id = complete_id, items });
                }
                break;

            case EditorHostEvents.OptionsSnippetRequested:
                if (evt.Payload is { } snippet_payload
                    && snippet_payload.TryGetProperty("id", out var snippet_id_prop)
                    && snippet_id_prop.ValueKind == JsonValueKind.String)
                {
                    var expanded = OptionsSnippetRequested?.Invoke(
                        snippet_payload.TryGetProperty("offset", out var snippet_offset)
                        && snippet_offset.ValueKind == JsonValueKind.Number
                            ? snippet_offset.GetInt32()
                            : -1,
                        ReadString(snippet_payload, "lineText"));

                    SendCommandFireAndForget(
                        EditorHostCommands.OptionsSnippetResult,
                        new { id = snippet_id_prop.GetString(), expanded });
                }
                break;

            case EditorHostEvents.FboJsSignatureRequested:
                if (TryReadAssistRequest(evt.Payload, out var signature_id, out var signature_offset,
                        out var signature_insight))
                {
                    var help = FboJsSignatureRequested?.Invoke(signature_offset, signature_insight);
                    SendCommandFireAndForget(
                        EditorHostCommands.FboJsSignatureResult,
                        new { id = signature_id, help });
                }
                break;
        }
    }

    /// <summary>Payload assist chung: <c>{ id, offset, insight }</c>.</summary>
    private static bool TryReadAssistRequest(
        JsonElement? payload, out string id, out int offset, out bool insight)
    {
        id = string.Empty;
        offset = 0;
        insight = false;

        if (payload is not { } element) return false;
        if (!element.TryGetProperty("offset", out var offset_prop)
            || offset_prop.ValueKind != JsonValueKind.Number) return false;

        id = ReadString(element, "id");
        if (string.IsNullOrEmpty(id)) return false;

        offset = offset_prop.GetInt32();
        insight = element.TryGetProperty("insight", out var insight_prop)
                  && insight_prop.ValueKind is JsonValueKind.True;
        return true;
    }

    /// <summary>
    /// Hiện hover virtual view của entity (value + Copy + scroll). <paramref name="offset"/> là
    /// offset đã hit-test — JS echo lại để bỏ qua response trễ không khớp hover mới nhất.
    /// </summary>
    public void ShowEntityHover(int offset, string name, string value, bool is_error) =>
        RunOrQueue(() => SendCommandFireAndForget(
            EditorHostCommands.ShowEntityHover, new { offset, name, value, isError = is_error }));

    /// <summary>Ẩn hover virtual view của entity (kèm offset để JS lọc response trễ).</summary>
    public void HideEntityHover(int offset) =>
        RunOrQueue(() => SendCommandFireAndForget(
            EditorHostCommands.HideEntityHover, new { offset }));

    private static string ReadString(JsonElement payload, string name) =>
        payload.TryGetProperty(name, out var prop) && prop.ValueKind == JsonValueKind.String
            ? prop.GetString() ?? string.Empty
            : string.Empty;

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
        SendClearTextSegments();
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

    private void SendClearTextSegments() =>
        SendCommandFireAndForget(EditorHostCommands.SetClearTextSegments,
            new { segments = (IReadOnlyList<ClearTextSegment>?)ClearTextSegments ?? [], show = ShowInsights });

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

    private static void OnEditorMarkersChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        var markers = e.NewValue as IReadOnlyList<EditorMarker> ?? [];
        host.RunOrQueue(() => host.SendCommandFireAndForget(
            EditorHostCommands.SetMarkers, new { markers }));
    }

    private static void OnEditorLanguageChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        var language = e.NewValue as string;
        if (string.IsNullOrWhiteSpace(language)) return;
        // Model đã tồn tại → đổi ngôn ngữ tô màu tại chỗ (giữ nội dung/caret). Nếu editor chưa
        // ready, RunOrQueue giữ lệnh; model được tạo ban đầu theo ?lang= của giá trị lúc đó.
        host.RunOrQueue(() => host.SendCommandFireAndForget(
            EditorHostCommands.SetLanguage, new { language }));
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

    private static void OnClearTextSegmentsChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
    {
        if (d is not MonacoEditorHost host) return;
        host.RunOrQueue(host.SendClearTextSegments);
    }
}
