using System.Collections.Specialized;
using System.ComponentModel;
using System.IO;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Infrastructure.Services;
using UI.Docking;
using UI.Services;
using UI.ViewModels.Base;
using UI.ViewModels.Bottom;
using UI.ViewModels.Explorer;
using UI.ViewModels.Insight;
using UI.ViewModels.Properties;
using UI.ViewModels.Shell;
using UI.ViewModels.Toolbox;

namespace UI.ViewModels;

public enum LeftExplorerTab
{
    Tree = 0,
    Menu = 1,
    Database = 2
}

/// <summary>
/// Root ViewModel – gắn với MainWindow (DevWorkFlow shell).
/// </summary>
public class MainViewModel : ViewModelBase
{
    private readonly INavigationService _nav;
    private readonly IProgramSession _program_session;
    private readonly ISqlScriptRunner _sql_runner;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly FormDocumentNavigator _form_navigator;
    private readonly IErpLanguageService _language_service;
    private readonly Func<FormBuilderViewModel> _create_form;
    // Giữ reference để bridge không bị GC.
    private readonly FormBuilderDiagnosticsBridge _diagnostics_bridge;
    private ViewModelBase? _currentWorkspace;
    private string _currentPageTitle = "Form";
    private string _appStatus = "Chưa chọn Program – bấm \"Chọn Program\" trên Explorer";
    private string _window_title = "DevWorkFlow";
    private string _status_encoding = "UTF-8";
    private string _status_language = "XML";
    private string _status_caret = "Ln 1, Col 1";
    private string _status_editor_mode = "Insight Mode";
    private int _status_error_count;
    private int _status_warning_count;
    private int _status_hint_count;
    private bool _is_insight_mode_active = true;
    private LeftExplorerTab _selected_left_explorer_tab = LeftExplorerTab.Tree;
    private FormBuilderViewModel _active_form;

    private FormBuilderViewModel? _status_form;

    public MainViewModel(
        INavigationService nav,
        IProgramSession program_session,
        IDockManager dock_manager,
        ISqlScriptRunner sql_runner,
        SqlStudioNavigator sql_navigator,
        FormDocumentNavigator form_navigator,
        IErpLanguageService language_service,
        Func<FormBuilderViewModel> create_form,
        NavigationViewModel navigationVm,
        FormBuilderViewModel seedFormBuilderVm,
        ProjectExplorerViewModel explorerVm,
        DatabaseExplorerViewModel databaseExplorerVm,
        OutlineViewModel outlineVm,
        PropertyGridViewModel propertyGridVm,
        ToolboxViewModel toolboxVm,
        InsightPanelViewModel insightPanelVm,
        SymbolInfoViewModel symbolInfoVm,
        XmlBottomViewModel xmlBottomVm,
        IdeDiagnosticsViewModel diagnosticsVm,
        FormBuilderDiagnosticsBridge diagnosticsBridge,
        TemplateManagerViewModel catalogVm,
        TemplateManagerViewModel documentVm,
        TemplateManagerViewModel reportVm,
        TemplateManagerViewModel storedVm,
        UI.ViewModels.Skin.ProjectSkinViewModel projectSkinVm)
    {
        _nav = nav;
        _program_session = program_session;
        _sql_runner = sql_runner;
        _sql_navigator = sql_navigator;
        _form_navigator = form_navigator;
        _language_service = language_service;
        _create_form = create_form;
        _diagnostics_bridge = diagnosticsBridge;
        _active_form = seedFormBuilderVm;

        NavigationVm = navigationVm;
        ExplorerVm = explorerVm;
        DatabaseExplorerVm = databaseExplorerVm;
        OutlineVm = outlineVm;
        PropertyGridVm = propertyGridVm;
        ToolboxVm = toolboxVm;
        InsightPanelVm = insightPanelVm;
        SymbolInfoVm = symbolInfoVm;
        XmlBottomVm = xmlBottomVm;
        DiagnosticsVm = diagnosticsVm;
        CatalogVm = catalogVm;
        DocumentVm = documentVm;
        ReportVm = reportVm;
        StoredVm = storedVm;
        ProjectSkinVm = projectSkinVm;

        DiagnosticsVm.SetItemActivator(ActivateBottomListItem);
        DiagnosticsVm.PropertyChanged += (_, e) =>
        {
            if (e.PropertyName is nameof(IdeDiagnosticsViewModel.ErrorCount)
                or nameof(IdeDiagnosticsViewModel.WarningCount)
                or nameof(IdeDiagnosticsViewModel.HintCount))
                SyncStatusFromForm(_active_form);
        };

        Shell = new IdeShellViewModel(dock_manager);
        CurrentWorkspace = seedFormBuilderVm;

        _form_navigator.Attach(OpenFormDocument);
        sql_navigator.Attach(request => OpenSqlDocument(request));
        sql_navigator.AttachInlineRunner(request => RunSqlInline(request));

        _nav.PageChanged += OnPageChanged;
        _program_session.ProgramChanged += OnProgramChanged;
        if (_program_session.Current is not null)
            _language_service.SetProgramPath(_program_session.Current.ProgramPath);
        UpdateWindowTitle();

        Shell.Documents.CollectionChanged += OnShellDocumentsChanged;

        Shell.PropertyChanged += (_, e) =>
        {
            if (e.PropertyName == nameof(IdeShellViewModel.IsLeftDockOpen))
                OnPropertyChanged(nameof(IsSidebarOpen));
            if (e.PropertyName == nameof(IdeShellViewModel.ActiveDocument)
                || e.PropertyName == nameof(IdeShellViewModel.ActiveContent))
            {
                SyncStatusFromActiveDocument();
                BindToolsToActiveForm();
            }
        };

        ToggleSidebarCommand = new RelayCommand(() => Shell.ToggleLeftDockCommand.Execute(null));
        SelectLeftExplorerTabCommand = new RelayCommand<LeftExplorerTab>(tab =>
        {
            if (tab is { } value)
                SelectedLeftExplorerTab = value;
        });
        HideCommand = new RelayCommand(HideWindow);
        ExitCommand = new RelayCommand(() => System.Windows.Application.Current.Shutdown());
    }

    /// <summary>ERP Language Service (Phase 1 contracts).</summary>
    public IErpLanguageService LanguageService => _language_service;

    public IdeShellViewModel Shell { get; }
    public NavigationViewModel NavigationVm { get; }

    /// <summary>FormBuilder của tab đang active (ribbon / command).</summary>
    public FormBuilderViewModel FormBuilderVm => _active_form;

    public ProjectExplorerViewModel ExplorerVm { get; }
    public DatabaseExplorerViewModel DatabaseExplorerVm { get; }
    public OutlineViewModel OutlineVm { get; }

    public LeftExplorerTab SelectedLeftExplorerTab
    {
        get => _selected_left_explorer_tab;
        set
        {
            if (!SetProperty(ref _selected_left_explorer_tab, value)) return;
            OnPropertyChanged(nameof(IsTreeExplorerSelected));
            OnPropertyChanged(nameof(IsMenuExplorerSelected));
            OnPropertyChanged(nameof(IsDatabaseExplorerSelected));
        }
    }

    public bool IsTreeExplorerSelected => SelectedLeftExplorerTab == LeftExplorerTab.Tree;
    public bool IsMenuExplorerSelected => SelectedLeftExplorerTab == LeftExplorerTab.Menu;
    public bool IsDatabaseExplorerSelected => SelectedLeftExplorerTab == LeftExplorerTab.Database;
    public PropertyGridViewModel PropertyGridVm { get; }
    public ToolboxViewModel ToolboxVm { get; }
    public InsightPanelViewModel InsightPanelVm { get; }
    public SymbolInfoViewModel SymbolInfoVm { get; }
    public XmlBottomViewModel XmlBottomVm { get; }
    public IdeDiagnosticsViewModel DiagnosticsVm { get; }
    public TemplateManagerViewModel CatalogVm { get; }
    public TemplateManagerViewModel DocumentVm { get; }
    public TemplateManagerViewModel ReportVm { get; }
    public TemplateManagerViewModel StoredVm { get; }
    public UI.ViewModels.Skin.ProjectSkinViewModel ProjectSkinVm { get; }

    public ViewModelBase? CurrentWorkspace
    {
        get => _currentWorkspace;
        private set => SetProperty(ref _currentWorkspace, value);
    }

    public string CurrentPageTitle
    {
        get => _currentPageTitle;
        private set => SetProperty(ref _currentPageTitle, value);
    }

    public bool IsSidebarOpen => Shell.IsLeftDockOpen;

    public string AppStatus
    {
        get => _appStatus;
        set => SetProperty(ref _appStatus, value);
    }

    public string WindowTitle
    {
        get => _window_title;
        private set => SetProperty(ref _window_title, value);
    }

    public string StatusEncoding
    {
        get => _status_encoding;
        private set => SetProperty(ref _status_encoding, value);
    }

    public string StatusLanguage
    {
        get => _status_language;
        private set
        {
            if (!SetProperty(ref _status_language, value)) return;
            // StatusBar dropdown phản chiếu ngôn ngữ hiện tại — đồng bộ khi ngữ cảnh đổi
            // (mở tài liệu, chuyển tab) mà không kích hoạt lại ApplyEditorLanguage.
            OnPropertyChanged(nameof(SelectedEditorLanguage));
        }
    }

    /// <summary>Các định dạng cho phép đổi ở StatusBar (nhãn hiển thị).</summary>
    public IReadOnlyList<string> EditorLanguages { get; } = ["XML", "JavaScript", "SQL"];

    /// <summary>
    /// Ngôn ngữ editor đang chọn ở StatusBar. Get phản chiếu <see cref="StatusLanguage"/>; set do
    /// người dùng chọn → đổi ngôn ngữ tô màu của editor tài liệu đang active (form/controller).
    /// Với tab SQL Studio, editor là surface riêng nên chỉ cập nhật nhãn.
    /// </summary>
    public string SelectedEditorLanguage
    {
        get => _status_language;
        set
        {
            if (string.IsNullOrWhiteSpace(value)
                || string.Equals(_status_language, value, StringComparison.OrdinalIgnoreCase))
                return;

            // Chỉ editor form/controller (erp-xml) mới đổi được tô màu tại chỗ. Tab SQL Studio là
            // surface riêng — bỏ qua và hoàn tác lựa chọn để nhãn không lệch với editor thật.
            if (Shell.ActiveContent is not FormBuilderViewModel fb)
            {
                OnPropertyChanged(nameof(SelectedEditorLanguage));
                return;
            }

            StatusLanguage = value;
            fb.EditorLanguage = value switch
            {
                "JavaScript" => "javascript",
                "SQL" => "sql",
                _ => "xml"
            };
        }
    }

    /// <summary>id ngôn ngữ Monaco → nhãn StatusBar (khớp <see cref="EditorLanguages"/>).</summary>
    private static string LanguageDisplay(string? monaco_id) => monaco_id switch
    {
        "javascript" => "JavaScript",
        "sql" => "SQL",
        _ => "XML"
    };

    public string StatusCaret
    {
        get => _status_caret;
        private set => SetProperty(ref _status_caret, value);
    }

    public string StatusEditorMode
    {
        get => _status_editor_mode;
        private set => SetProperty(ref _status_editor_mode, value);
    }

    public int StatusErrorCount
    {
        get => _status_error_count;
        private set => SetProperty(ref _status_error_count, value);
    }

    public int StatusWarningCount
    {
        get => _status_warning_count;
        private set => SetProperty(ref _status_warning_count, value);
    }

    public int StatusHintCount
    {
        get => _status_hint_count;
        private set => SetProperty(ref _status_hint_count, value);
    }

    public bool IsInsightModeActive
    {
        get => _is_insight_mode_active;
        private set => SetProperty(ref _is_insight_mode_active, value);
    }

    public RelayCommand ToggleSidebarCommand { get; }
    public RelayCommand<LeftExplorerTab> SelectLeftExplorerTabCommand { get; }
    public RelayCommand HideCommand { get; }
    public RelayCommand ExitCommand { get; }

    /// <summary>Mở form XML thành document tab riêng (mỗi file 1 FormBuilderViewModel).</summary>
    public void OpenFormDocument(
        string file_path,
        string title,
        string raw_xml,
        IEnumerable<string>? related_files,
        bool code_only,
        int target_offset = -1)
    {
        if (string.IsNullOrWhiteSpace(file_path))
            file_path = $"form://{Guid.NewGuid():N}";

        var id = file_path;
        var existing = Shell.Documents.FirstOrDefault(d =>
            string.Equals(d.Id, id, StringComparison.OrdinalIgnoreCase));
        if (existing?.ContentVm is FormBuilderViewModel existing_vm)
        {
            Shell.ActivateDocument(existing);
            SetActiveForm(existing_vm);
            CurrentWorkspace = existing_vm;
            CurrentPageTitle = existing.Title;
            StatusLanguage = LanguageDisplay(existing_vm.EditorLanguage);
            AppStatus = existing_vm.LoadedFilePath;
            NavigateAfterOpen(existing_vm, target_offset);
            return;
        }

        // Phase 1: mở qua Language Service (snapshot + semantic stub), UI vẫn LoadControllerXml.
        var erp_doc = OpenViaLanguageService(file_path, raw_xml);
        var xml_for_ui = !string.IsNullOrEmpty(erp_doc.Snapshot.RawText)
            ? erp_doc.Snapshot.RawText
            : raw_xml;

        var form_vm = _create_form();
        form_vm.LoadControllerXml(xml_for_ui, file_path, title, related_files, code_only);

        var tab_title = string.IsNullOrWhiteSpace(title)
            ? Path.GetFileName(file_path)
            : Path.GetFileName(title.Contains(':') ? file_path : title);
        if (string.IsNullOrWhiteSpace(tab_title))
            tab_title = form_vm.LoadedTitle;

        var doc = Shell.OpenOrActivate(id, tab_title, form_vm, file_path);
        form_vm.PropertyChanged += (_, e) =>
        {
            if (e.PropertyName == nameof(FormBuilderViewModel.LoadedTitle))
                doc.Title = Path.GetFileName(form_vm.LoadedFilePath) is { Length: > 0 } n
                    ? n
                    : form_vm.LoadedTitle;
        };

        SetActiveForm(form_vm);
        CurrentWorkspace = form_vm;
        CurrentPageTitle = doc.Title;
        StatusLanguage = LanguageDisplay(form_vm.EditorLanguage);
        AppStatus = form_vm.LoadedFilePath;
        Shell.StatusReady = "Ready";
        _nav.NavigateTo(Pages.FormBuilder);
        NavigateAfterOpen(form_vm, target_offset);
    }

    /// <summary>
    /// Điều hướng tới offset sau khi tab đã mở. Defer đến DispatcherPriority.Loaded để editor
    /// (WebView2) của tab mới kịp tạo + bind ScrollToOffset trước khi đặt caret — nếu gọi ngay,
    /// tab mới rơi về caret mặc định (cuối file).
    /// </summary>
    private static void NavigateAfterOpen(FormBuilderViewModel form, int target_offset)
    {
        if (target_offset < 0) return;
        System.Windows.Application.Current?.Dispatcher.BeginInvoke(
            System.Windows.Threading.DispatcherPriority.Loaded,
            () => form.NavigateToOffset(target_offset));
    }

    private IErpDocument OpenViaLanguageService(string file_path, string raw_xml)
    {
        var document_id = ErpDocumentId.FromPath(file_path);
        var cached = _language_service.GetDocument(document_id);
        if (cached is not null && string.IsNullOrEmpty(raw_xml))
            return cached;

        try
        {
            if (File.Exists(file_path) && string.IsNullOrEmpty(raw_xml))
                return _language_service.OpenDocument(file_path);

            return _language_service.OpenDocumentFromText(file_path, raw_xml ?? string.Empty);
        }
        catch
        {
            return _language_service.OpenDocumentFromText(file_path, raw_xml ?? string.Empty);
        }
    }

    private void OnShellDocumentsChanged(object? sender, NotifyCollectionChangedEventArgs e)
    {
        if (e.Action != NotifyCollectionChangedAction.Remove || e.OldItems is null)
            return;

        foreach (var item in e.OldItems)
        {
            if (item is not DocumentItemVm doc) continue;
            var path = doc.FilePath ?? doc.Id;
            if (string.IsNullOrWhiteSpace(path)) continue;
            _language_service.CloseDocument(ErpDocumentId.FromPath(path));
        }
    }

    public SqlDocumentViewModel OpenSqlDocument(
        string id,
        string title,
        string text,
        string? file_path,
        string? preferred_target_id = null) =>
        OpenSqlDocument(new SqlOpenRequest
        {
            Id = id,
            Title = title,
            Text = text,
            FilePath = file_path,
            PreferredTargetId = preferred_target_id
        });

    public SqlDocumentViewModel OpenSqlDocument(SqlOpenRequest request)
    {
        var id = request.Id;
        var title = request.Title;
        var text = request.Text;
        var file_path = request.FilePath;
        var preferred_target_id = request.PreferredTargetId;

        // Chọn connection: Id cụ thể thắng; không có thì theo loại CSDL của controller.
        void ApplyTarget(SqlDocumentViewModel vm)
        {
            vm.TrySelectTarget(preferred_target_id);
            if (string.IsNullOrWhiteSpace(preferred_target_id) && request.PreferredKind is { } kind)
                vm.TrySelectTargetKind(kind);
        }

        // Buffer (script từ Database): cập nhật tab SQL đang active — không mở nhiều tab.
        if (string.IsNullOrWhiteSpace(file_path)
            && Shell.ActiveDocument?.ContentVm is SqlDocumentViewModel active_sql)
        {
            active_sql.ReplaceScript(title, text);
            ApplyTarget(active_sql);
            TrackSqlDocument(active_sql);
            Shell.ActiveDocument.Title = title;
            CurrentWorkspace = active_sql;
            CurrentPageTitle = title;
            StatusLanguage = "SQL";
            AppStatus = id;
            Shell.StatusReady = "Ready";
            if (request.ExecuteAfterOpen) active_sql.ExecuteAfterOpen();
            return active_sql;
        }

        var existing = Shell.Documents.FirstOrDefault(d =>
            string.Equals(d.Id, id, StringComparison.OrdinalIgnoreCase));
        if (existing?.ContentVm is SqlDocumentViewModel existing_vm)
        {
            existing_vm.ReplaceScript(title, text);
            ApplyTarget(existing_vm);
            TrackSqlDocument(existing_vm);
            existing.Title = title;
            if (!string.IsNullOrWhiteSpace(file_path))
                existing.FilePath = file_path;
            Shell.ActivateDocument(existing);
            CurrentWorkspace = existing_vm;
            CurrentPageTitle = existing.Title;
            StatusLanguage = "SQL";
            AppStatus = file_path ?? id;
            Shell.StatusReady = "Ready";
            if (request.ExecuteAfterOpen) existing_vm.ExecuteAfterOpen();
            return existing_vm;
        }

        var sql_vm = new SqlDocumentViewModel(_sql_runner, _program_session);
        sql_vm.Initialize(title, text, file_path);
        ApplyTarget(sql_vm);
        TrackSqlDocument(sql_vm);
        var doc = Shell.OpenOrActivate(id, title, sql_vm, file_path);
        sql_vm.PropertyChanged += OnSqlDocumentPropertyChanged;

        void OnSqlDocumentPropertyChanged(object? sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(SqlDocumentViewModel.IsDirty))
                doc.IsDirty = sql_vm.IsDirty;
            if (e.PropertyName == nameof(SqlDocumentViewModel.Title))
                doc.Title = sql_vm.Title;
        }

        CurrentWorkspace = sql_vm;
        CurrentPageTitle = title;
        StatusLanguage = "SQL";
        AppStatus = file_path ?? id;
        Shell.StatusReady = "Ready";
        // Execute SAU khi tab đã activate để kết quả hiện đúng chỗ người dùng đang nhìn.
        if (request.ExecuteAfterOpen) sql_vm.ExecuteAfterOpen();
        return sql_vm;
    }

    /// <summary>
    /// Chạy SQL mà KHÔNG mở tab (F5 ở Form Source): dùng một document SQL ẩn, kết quả đi ra panel
    /// Result/Message dùng chung ở dock dưới. Người dùng ở lại đúng tab XML đang sửa.
    /// </summary>
    public SqlDocumentViewModel RunSqlInline(SqlOpenRequest request)
    {
        var sql_vm = _inline_sql_document ??= new SqlDocumentViewModel(_sql_runner, _program_session);
        sql_vm.Initialize(request.Title, request.Text, null);

        sql_vm.TrySelectTarget(request.PreferredTargetId);
        if (string.IsNullOrWhiteSpace(request.PreferredTargetId) && request.PreferredKind is { } kind)
            sql_vm.TrySelectTargetKind(kind);

        TrackSqlDocument(sql_vm);

        // Mở panel TRƯỚC khi chạy để thấy trạng thái "Running…"; chạy xong ExecutionCompleted sẽ
        // chuyển sang Result hoặc Message tuỳ kết quả.
        Shell.ShowPanel(DockPanelId.CenterBottom);
        SelectBottomPane(ToolPaneKind.SqlResult);

        sql_vm.ExecuteAfterOpen();
        return sql_vm;
    }

    private void SetActiveForm(FormBuilderViewModel form_vm)
    {
        if (ReferenceEquals(_active_form, form_vm))
        {
            BindToolsToActiveForm();
            return;
        }

        _active_form = form_vm;
        OnPropertyChanged(nameof(FormBuilderVm));
        BindToolsToActiveForm();
    }

    private void BindToolsToActiveForm()
    {
        var form = Shell.ActiveContent as FormBuilderViewModel ?? _active_form;
        if (Shell.ActiveContent is FormBuilderViewModel active)
            _active_form = active;

        if (_status_form is not null)
        {
            _status_form.PropertyChanged -= OnActiveFormStatusChanged;
            _status_form.ReferencesRequested -= OnReferencesRequested;
        }
        _status_form = form;
        if (_status_form is not null)
        {
            _status_form.PropertyChanged += OnActiveFormStatusChanged;
            _status_form.ReferencesRequested += OnReferencesRequested;
        }

        OutlineVm.BindTo(form);
        PropertyGridVm.BindTo(form);
        InsightPanelVm.BindTo(form);
        SymbolInfoVm.BindTo(form);
        XmlBottomVm.BindTo(form);
        _diagnostics_bridge.BindTo(form);
        SyncStatusFromForm(form);
        OnPropertyChanged(nameof(FormBuilderVm));
    }

    /// <summary>
    /// Find References (Ctrl+Click định nghĩa function) chỉ hữu ích khi người dùng THẤY danh
    /// sách — SymbolInfoVm tự nhận qua event của nó, ở đây lo phần hiện panel Symbol Info ra
    /// trước (right dock có thể đang đóng hoặc đang chọn tab khác).
    /// </summary>
    private SqlDocumentViewModel? _active_sql_document;

    /// <summary>
    /// Document SQL ẩn cho các lần chạy inline (F5 ở Form Source) — không nằm trong Shell.Documents,
    /// dùng lại giữa các lần chạy để không rò connection/handler.
    /// </summary>
    private SqlDocumentViewModel? _inline_sql_document;

    /// <summary>
    /// Nguồn SQL vừa chạy (tab SQL hoặc lần chạy inline) — panel Result/Message ở dock dưới bind
    /// vào đây. Đây là NƠI DUY NHẤT hiển thị kết quả; tab SQL không còn output riêng.
    /// </summary>
    public SqlDocumentViewModel? ActiveSqlDocument
    {
        get => _active_sql_document;
        private set => SetProperty(ref _active_sql_document, value);
    }

    /// <summary>
    /// Theo dõi một tab SQL để cập nhật panel dưới; huỷ đăng ký tab cũ tránh nhiều tab cùng bắn.
    /// </summary>
    private void TrackSqlDocument(SqlDocumentViewModel sql_vm)
    {
        if (ReferenceEquals(ActiveSqlDocument, sql_vm)) return;

        if (ActiveSqlDocument is not null)
            ActiveSqlDocument.ExecutionCompleted -= OnSqlExecutionCompleted;
        ActiveSqlDocument = sql_vm;
        sql_vm.ExecutionCompleted += OnSqlExecutionCompleted;
    }

    /// <summary>Chạy xong: mở dock dưới và focus Result (thành công) hoặc Message (lỗi).</summary>
    private void OnSqlExecutionCompleted(object? sender, bool succeeded)
    {
        Shell.ShowPanel(DockPanelId.CenterBottom);
        SelectBottomPane(succeeded ? ToolPaneKind.SqlResult : ToolPaneKind.SqlMessage);
    }

    private void SelectBottomPane(ToolPaneKind kind)
    {
        var pane = Shell.BottomPanes.FirstOrDefault(p => p.Kind == kind);
        if (pane is not null)
            Shell.SelectBottomPaneCommand.Execute(pane);
    }

    private void OnReferencesRequested(JsRuntimeNavHit hit)
    {
        // Cùng trình tự với Shift+F12 (MainWindow.OnFindReferences) — đường đã chạy được:
        // mở panel TRƯỚC rồi mới chọn tab. KHÔNG gọi SymbolInfoVm.Refresh() ở đây vì Refresh
        // dựng lại theo symbol tại caret và sẽ xoá đúng danh sách vừa được ShowReferences ghim.
        Shell.ShowPanel(DockPanelId.RightTop);
        var pane = Shell.RightPanes.FirstOrDefault(p => p.Kind == ToolPaneKind.SymbolInfo);
        if (pane is not null)
            Shell.SelectRightPaneCommand.Execute(pane);
    }

    private void OnActiveFormStatusChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (sender is not FormBuilderViewModel form) return;
        if (e.PropertyName is nameof(FormBuilderViewModel.CaretLine)
            or nameof(FormBuilderViewModel.CaretColumn)
            or nameof(FormBuilderViewModel.ActiveEditorMode)
            or nameof(FormBuilderViewModel.EditorModeText))
            SyncStatusFromForm(form);
    }

    private void SyncStatusFromForm(FormBuilderViewModel form)
    {
        StatusCaret = form.CaretLine > 0
            ? $"Ln {form.CaretLine}, Col {form.CaretColumn}"
            : "Ln 1, Col 1";
        StatusEditorMode = form.EditorModeText;
        IsInsightModeActive = form.IsInsightMode;
        StatusErrorCount = DiagnosticsVm.ErrorCount;
        StatusWarningCount = DiagnosticsVm.WarningCount;
        StatusHintCount = DiagnosticsVm.HintCount;
    }

    private void ActivateBottomListItem(IBottomListItem item)
    {
        var target = item.NavigateTarget;
        if (target is null) return;

        var form = FormBuilderVm;

        if (!string.IsNullOrWhiteSpace(target.Path) && File.Exists(target.Path))
        {
            form.OpenEntityFile(target.Path);
            if (target.Line > 0)
                form.NavigateToLine(target.Line);
            return;
        }

        if (target.Offset > 0)
            form.NavigateToOffset(target.Offset, target.Line);
        else if (target.Line > 0)
            form.NavigateToLine(target.Line);
    }

    private static void HideWindow()
    {
        if (System.Windows.Application.Current.MainWindow is { } window)
            window.WindowState = System.Windows.WindowState.Minimized;
    }

    private void OnProgramChanged(object? sender, EventArgs e)
    {
        var program = _program_session.Current;
        _language_service.SetProgramPath(program?.ProgramPath);
        AppStatus = program is null
            ? "Chưa chọn Program"
            : $"Program: {program.DisplayTitle} | {program.ProgramPath}";
        UpdateWindowTitle();
    }

    private void UpdateWindowTitle()
    {
        var program = _program_session.Current;
        WindowTitle = program is null || string.IsNullOrWhiteSpace(program.DisplayTitle)
            ? "DevWorkFlow"
            : $"DevWorkFlow — {program.DisplayTitle}";
    }

    private void SyncStatusFromActiveDocument()
    {
        if (Shell.ActiveContent is SqlDocumentViewModel sql)
        {
            CurrentWorkspace = sql;
            CurrentPageTitle = sql.Title;
            StatusLanguage = "SQL";
            if (!string.IsNullOrWhiteSpace(sql.FilePath))
                AppStatus = sql.FilePath!;
            // Panel dưới là output chung: chuyển tab SQL thì nó phải theo tab đang xem.
            TrackSqlDocument(sql);
        }
        else if (Shell.ActiveContent is FormBuilderViewModel fb)
        {
            CurrentWorkspace = fb;
            CurrentPageTitle = fb.LoadedTitle;
            StatusLanguage = LanguageDisplay(fb.EditorLanguage);
            if (!string.IsNullOrWhiteSpace(fb.LoadedFilePath))
                AppStatus = fb.LoadedFilePath;
            SetActiveForm(fb);
        }
    }

    private void OnPageChanged(object? sender, string page)
    {
        (CurrentWorkspace, CurrentPageTitle) = page switch
        {
            Pages.FormBuilder => (FormBuilderVm as ViewModelBase, FormBuilderVm.LoadedTitle),
            Pages.CatalogManager => (CatalogVm, "Danh mục"),
            Pages.DocumentManager => (DocumentVm, "Chứng từ"),
            Pages.ReportManager => (ReportVm, "Báo cáo"),
            Pages.StoredManager => (StoredVm, "Stored"),
            Pages.SqlStudio => (Shell.ActiveContent as ViewModelBase ?? CurrentWorkspace, "SQL"),
            _ => (FormBuilderVm, "Form")
        };

        if (page == Pages.FormBuilder)
        {
            // Document tab đã mở trong OpenFormDocument — chỉ sync status
            if (!string.IsNullOrWhiteSpace(FormBuilderVm.LoadedFilePath))
                AppStatus = FormBuilderVm.LoadedFilePath;
            StatusLanguage = "XML";
            BindToolsToActiveForm();
        }
        else if (page == Pages.SqlStudio)
        {
            StatusLanguage = "SQL";
        }
        else if (_program_session.Current is not null)
        {
            AppStatus = $"Program: {_program_session.Current.DisplayTitle}";
        }

        Shell.StatusReady = "Ready";
    }
}
