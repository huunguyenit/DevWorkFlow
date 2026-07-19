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
        IDockService dock,
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
        TemplateManagerViewModel storedVm)
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

        DiagnosticsVm.PropertyChanged += (_, e) =>
        {
            if (e.PropertyName is nameof(IdeDiagnosticsViewModel.ErrorCount)
                or nameof(IdeDiagnosticsViewModel.WarningCount)
                or nameof(IdeDiagnosticsViewModel.HintCount))
                SyncStatusFromForm(_active_form);
        };

        Shell = new IdeShellViewModel(dock);
        CurrentWorkspace = seedFormBuilderVm;

        _form_navigator.Attach(OpenFormDocument);
        sql_navigator.Attach((id, title, text, path, target_id) =>
            OpenSqlDocument(id, title, text, path, target_id));

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
        private set => SetProperty(ref _status_language, value);
    }

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
        bool code_only)
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
            StatusLanguage = "XML";
            AppStatus = existing_vm.LoadedFilePath;
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
        StatusLanguage = "XML";
        AppStatus = form_vm.LoadedFilePath;
        Shell.StatusReady = "Ready";
        _nav.NavigateTo(Pages.FormBuilder);
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
        string? preferred_target_id = null)
    {
        // Buffer (script từ Database): cập nhật tab SQL đang active — không mở nhiều tab.
        if (string.IsNullOrWhiteSpace(file_path)
            && Shell.ActiveDocument?.ContentVm is SqlDocumentViewModel active_sql)
        {
            active_sql.ReplaceScript(title, text);
            active_sql.TrySelectTarget(preferred_target_id);
            Shell.ActiveDocument.Title = title;
            CurrentWorkspace = active_sql;
            CurrentPageTitle = title;
            StatusLanguage = "SQL";
            AppStatus = id;
            Shell.StatusReady = "Ready";
            return active_sql;
        }

        var existing = Shell.Documents.FirstOrDefault(d =>
            string.Equals(d.Id, id, StringComparison.OrdinalIgnoreCase));
        if (existing?.ContentVm is SqlDocumentViewModel existing_vm)
        {
            existing_vm.ReplaceScript(title, text);
            existing_vm.TrySelectTarget(preferred_target_id);
            existing.Title = title;
            if (!string.IsNullOrWhiteSpace(file_path))
                existing.FilePath = file_path;
            Shell.ActivateDocument(existing);
            CurrentWorkspace = existing_vm;
            CurrentPageTitle = existing.Title;
            StatusLanguage = "SQL";
            AppStatus = file_path ?? id;
            Shell.StatusReady = "Ready";
            return existing_vm;
        }

        var sql_vm = new SqlDocumentViewModel(_sql_runner, _program_session);
        sql_vm.Initialize(title, text, file_path);
        sql_vm.TrySelectTarget(preferred_target_id);
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
            _status_form.PropertyChanged -= OnActiveFormStatusChanged;
        _status_form = form;
        if (_status_form is not null)
            _status_form.PropertyChanged += OnActiveFormStatusChanged;

        OutlineVm.BindTo(form);
        PropertyGridVm.BindTo(form);
        InsightPanelVm.BindTo(form);
        SymbolInfoVm.BindTo(form);
        XmlBottomVm.BindTo(form);
        _diagnostics_bridge.BindTo(form);
        SyncStatusFromForm(form);
        OnPropertyChanged(nameof(FormBuilderVm));
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
        }
        else if (Shell.ActiveContent is FormBuilderViewModel fb)
        {
            CurrentWorkspace = fb;
            CurrentPageTitle = fb.LoadedTitle;
            StatusLanguage = "XML";
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
