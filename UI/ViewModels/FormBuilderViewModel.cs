using System.Collections.ObjectModel;
using System.IO;
using System.Threading;
using System.Windows;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Design;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models.Fbo;
using DevWorkFlow.Domain.Models.Sql;
using DevWorkFlow.Editor;
using UI.Services;
using UI.ViewModels.Base;
using UI.ViewModels.Design;

namespace UI.ViewModels;

/// <summary>Form Builder: Semantic Model → Design (Form/Grid/Lookup) + Code.</summary>
public class FormBuilderViewModel : ViewModelBase
{
    private readonly FboXmlWriter _xml_writer = new();
    private readonly FboOptionsCatalog _options = new();
    private readonly IProgramSession? _program_session;
    private readonly SqlStudioNavigator? _sql_navigator;
    private readonly IErpLanguageService? _language_service;
    private readonly FormDocumentNavigator? _form_navigator;
    private readonly IDesignDocumentService? _design_document_service;
    private readonly string? _design_config_root;
    private CancellationTokenSource? _design_render_cts;
    private DesignDocument? _generated_design_document;
    private bool _is_design_rendering;
    private string? _design_render_error;
    private DevWorkFlow.Editor.IEditorPlatform? _platform;

    /// <summary>
    /// Editor Platform (ADR-0002/ADR-0005) cho Document đang mở trong ViewModel này —
    /// điểm truy cập được khuyến nghị cho consumer mới thay vì tham chiếu trực tiếp
    /// FormBuilderViewModel. Xem docs/specs/editor/insight-editor-surface.md.
    /// </summary>
    public DevWorkFlow.Editor.IEditorPlatform Platform =>
        _platform ??= new FormBuilderEditorPlatform(this);

    private FboControllerDocument? _document;
    private IErpDocument? _erp_document;
    private IErpSemanticModel? _semantic_model;
    private DesignSurfaceVm? _design;
    private string _xml_source = string.Empty;
    private string _status_message = string.Empty;
    private bool _is_busy;
    private string _loaded_file_path = string.Empty;
    private string _loaded_title = "Design";
    private bool _is_vietnamese = true;
    private DesignCellVm? _selected_cell;
    private ErpEditorMode _active_editor_mode = ErpEditorMode.Insight;
    private bool _is_code_only_view;
    private string _editor_language = "xml";
    private IReadOnlyList<InsightItem> _insights = [];
    private IReadOnlyList<DevWorkFlow.Editor.Bridge.EditorMarker> _editor_markers = [];
    private IReadOnlyList<ClearTextSegment> _clear_text_segments = [];
    private ClearTextOffsetMap _clear_text_offsets = ClearTextOffsetMap.Identity;
    private InsightEditorLineVm? _selected_insight_line;
    private int _caret_column = 1;
    private bool _in_reparse;
    private System.Windows.Threading.DispatcherTimer? _reparse_timer;

    public FormBuilderViewModel(
        IProgramSession? program_session = null,
        SqlStudioNavigator? sql_navigator = null,
        IErpLanguageService? language_service = null,
        FormDocumentNavigator? form_navigator = null,
        IDesignDocumentService? design_document_service = null,
        string? design_config_root = null)
    {
        _program_session = program_session;
        _form_navigator = form_navigator;
        _sql_navigator = sql_navigator;
        _language_service = language_service;
        _design_document_service = design_document_service;
        _design_config_root = design_config_root;
        RelatedFiles = [];
        FieldProperties = [];
        InsightEditorLines = [];
        ParseCommand = new RelayCommand(ParseXml, () => !string.IsNullOrWhiteSpace(XmlSource));
        SaveCommand = new AsyncRelayCommand(SaveAsync, () => !string.IsNullOrWhiteSpace(LoadedFilePath) && !IsBusy);
        ClearCommand = new RelayCommand(Clear);
        LoadTemplateCommand = new RelayCommand<string>(_ => { });
        ToggleLanguageCommand = new RelayCommand(ToggleLanguage, () => Design is not null);
        SelectCellCommand = new RelayCommand<DesignCellVm>(c => SelectCell(c));
        UpdateEntityValueCommand = new RelayCommand<EntityValueEdit>(
            UpdateEntityInline,
            edit => edit is not null
                    && ErpDocument is not null
                    && _language_service is not null);
        SetEditorModeCommand = new RelayCommand<ErpEditorMode>(SetEditorMode);
        ToggleInsightCommand = new RelayCommand(ToggleInsightMode);
        OpenSqlFromFormCommand = new RelayCommand(OpenSqlFromForm,
            () => _sql_navigator is not null && !string.IsNullOrWhiteSpace(XmlSource));

        SyncDpi();
        FboDesignMapper.SetOptions(_options);
        if (_program_session is not null)
            _program_session.ProgramChanged += (_, _) =>
            {
                ReloadOptions();
                _ = RefreshGeneratedDesignAsync();
            };

        // Timer debounce reparse khi user gõ XML — 800ms sau lần cuối thay đổi.
        _reparse_timer = new System.Windows.Threading.DispatcherTimer(
            System.Windows.Threading.DispatcherPriority.Background)
        {
            Interval = TimeSpan.FromMilliseconds(800)
        };
        _reparse_timer.Tick += (_, _) =>
        {
            _reparse_timer.Stop();
            if (!_in_reparse) ParseXml();
        };
    }

    public ObservableCollection<string> RelatedFiles { get; }
    public ObservableCollection<DesignFieldPropertyVm> FieldProperties { get; }
    public ObservableCollection<DesignCellVm> SelectedCells { get; } = [];

    public DesignCellVm? SelectedCell
    {
        get => _selected_cell;
        private set => SetProperty(ref _selected_cell, value);
    }

    public bool HasSelectedCell => SelectedCell is not null;

    private int _caret_line;

    /// <summary>Dòng field trong code XML (1-based) — set khi chọn cell để editor cuộn tới.</summary>
    public int CaretLine
    {
        get => _caret_line;
        private set { _caret_line = value; OnPropertyChanged(); }
    }

    public FboControllerDocument? Document
    {
        get => _document;
        private set => SetProperty(ref _document, value);
    }

    /// <summary>Document thống nhất của Source/ClearText/Semantic view.</summary>
    public IErpDocument? ErpDocument
    {
        get => _erp_document;
        private set => SetProperty(ref _erp_document, value);
    }

    /// <summary>ERP Semantic Model từ Language Service (Outline / Design nguồn).</summary>
    public IErpSemanticModel? SemanticModel
    {
        get => _semantic_model;
        private set => SetProperty(ref _semantic_model, value);
    }

    /// <summary>HTML Design đã sinh từ XML→Semantic (tab Design bind vào). Null khi chưa có document/service.</summary>
    public DesignDocument? GeneratedDesignDocument
    {
        get => _generated_design_document;
        private set => SetProperty(ref _generated_design_document, value);
    }

    /// <summary>Đang dựng HTML Design (async) — hiện overlay "đang dựng…".</summary>
    public bool IsDesignRendering
    {
        get => _is_design_rendering;
        private set => SetProperty(ref _is_design_rendering, value);
    }

    /// <summary>Lỗi khi dựng Design (null nếu không lỗi).</summary>
    public string? DesignRenderError
    {
        get => _design_render_error;
        private set => SetProperty(ref _design_render_error, value);
    }

    /// <summary>Program root để DesignWebViewHost map virtual host <c>devworkflow.program</c> (nạp CSS/JS/
    /// image tĩnh mà URL trong HTML sinh đã trỏ tới). Null nếu chưa mở Program.</summary>
    public string? DesignProgramRoot => _program_session?.Current?.ProgramPath;

    /// <summary>Config root để map virtual host <c>devworkflow.config</c> (ảnh toolbar/CSS pack).</summary>
    public string? DesignConfigRoot => _design_config_root;

    /// <summary>Map field.Name → định danh DOM ổn định (SymbolId + NodeId) cho overlay. Dùng indexer (không
    /// ToDictionary) vì field có thể trùng tên (đã có diagnostic riêng), tránh ném khi build.</summary>
    private IReadOnlyDictionary<string, DesignElementIdentity> BuildFieldIdentities()
    {
        var result = new Dictionary<string, DesignElementIdentity>(StringComparer.OrdinalIgnoreCase);
        if (ErpDocument is null || SemanticModel is null) return result;

        var map = ErpDocument.NavigationMap;
        foreach (var field in SemanticModel.GetFields())
        {
            var node_id = map?.GetNodeBySymbolId(field.Id)?.Id.ToString();
            result[field.Name] = new DesignElementIdentity(field.Id, node_id);
        }
        return result;
    }

    /// <summary>Dựng lại HTML Design (hủy lần trước). Fire-and-observe — KHÔNG chặn parse/UI thread.</summary>
    private async Task RefreshGeneratedDesignAsync()
    {
        _design_render_cts?.Cancel();
        _design_render_cts?.Dispose();
        _design_render_cts = new CancellationTokenSource();
        var ct = _design_render_cts.Token;

        if (_design_document_service is null || Document is null)
        {
            GeneratedDesignDocument = null;
            return;
        }

        IsDesignRendering = true;
        DesignRenderError = null;
        try
        {
            var build_request = new DesignBuildRequest(
                Document,
                IsVietnamese,
                _program_session?.Current,
                BuildFieldIdentities());
            var generated = await _design_document_service.BuildAsync(build_request, ct);
            if (!ct.IsCancellationRequested)
                GeneratedDesignDocument = generated;
        }
        catch (OperationCanceledException) when (ct.IsCancellationRequested)
        {
        }
        catch (Exception ex)
        {
            if (!ct.IsCancellationRequested)
                DesignRenderError = ex.Message;
        }
        finally
        {
            if (!ct.IsCancellationRequested)
                IsDesignRendering = false;
        }
    }

    public DesignSurfaceVm? Design
    {
        get => _design;
        private set
        {
            if (!SetProperty(ref _design, value)) return;
            OnPropertyChanged(nameof(ShowDesignSurface));
        }
    }

    public string XmlSource
    {
        get => _xml_source;
        set
        {
            if (!SetProperty(ref _xml_source, value)) return;
            OnPropertyChanged(nameof(EditorText));
            OnPropertyChanged(nameof(HasDocument));
            // Reparse debounced: Navigation Map phải phản ánh nội dung mới
            // trước khi Outline click — tránh stale offset.
            if (!_in_reparse && _reparse_timer is not null)
            {
                _reparse_timer.Stop();
                _reparse_timer.Start();
            }
        }
    }

    /// <summary>
    /// Text hiển thị trong Editor theo mode:
    ///   - Source/Designer: XML storage nguyên bản (tham chiếu &amp;X; giữ nguyên).
    ///   - Insight: ClearText projection — toàn bộ document đã expand entity thành nội dung
    ///     thật, kèm <see cref="ClearTextSegments"/> để tô nguồn gốc.
    /// Cả hai chỉ là bản CHIẾU của cùng một storage: ClearText không bao giờ được ghi ngược
    /// (Insight mode read-only — xem <see cref="IsEditorReadOnly"/>), nên setter chỉ nhận
    /// thay đổi khi editor đang hiển thị Source.
    /// </summary>
    public string EditorText
    {
        get => IsInsightMode ? ExpandedXml : XmlSource;
        set
        {
            if (IsInsightMode) return;
            XmlSource = value;
        }
    }

    /// <summary>
    /// Ngôn ngữ tô màu Monaco cho editor ("xml" → tokenizer FBO erp-xml có nhúng SQL/JS,
    /// "javascript" cho file .js, "sql" khi người dùng đổi ở StatusBar). Mặc định suy ra từ
    /// đuôi file lúc load; StatusBar có thể ghi đè runtime — xem <see cref="DetectEditorLanguage"/>.
    /// </summary>
    public string EditorLanguage
    {
        get => _editor_language;
        set => SetProperty(ref _editor_language, string.IsNullOrWhiteSpace(value) ? "xml" : value);
    }

    private bool _has_blocking_syntax_errors;

    /// <summary>
    /// Document đang có lỗi cấu trúc XML (ERP1002 — tag lệch/thiếu đóng). Khi true: Designer bị
    /// khóa (Design = null) và editor bị giữ ở Source mode cho tới khi sửa xong — Insight/Designer
    /// dựng trên cây syntax không đáng tin sẽ gây hiểu nhầm và serialize sai.
    /// </summary>
    public bool HasBlockingSyntaxErrors
    {
        get => _has_blocking_syntax_errors;
        private set => SetProperty(ref _has_blocking_syntax_errors, value);
    }

    /// <summary>
    /// Marker chẩn đoán (squiggle) cho editor — chỉ Source mode (offset trên XmlSource khớp
    /// buffer). Insight mode buffer là ClearText nên xoá marker (sửa lỗi làm ở Source).
    /// </summary>
    public IReadOnlyList<DevWorkFlow.Editor.Bridge.EditorMarker> EditorMarkers
    {
        get => _editor_markers;
        private set => SetProperty(ref _editor_markers, value);
    }

    /// <summary>Tính lại marker từ Diagnostics của document — lọc theo buffer đang hiển thị.</summary>
    private void RefreshEditorMarkers()
    {
        var doc = ErpDocument;
        if (doc is null || !IsSourceMode)
        {
            EditorMarkers = [];
            return;
        }

        var source_len = XmlSource?.Length ?? 0;
        var list = new List<DevWorkFlow.Editor.Bridge.EditorMarker>();
        foreach (var d in doc.Diagnostics)
        {
            if (d.Severity == ErpDiagnosticSeverity.Hidden) continue;

            // Chỉ marker cho lỗi nằm TRONG buffer đang mở (offset trên XmlSource). Lỗi nằm ở file
            // entity ngoài (Location.Path khác) hiện tại chỉ hiện ở Problems, không squiggle ở đây.
            var path = d.Location.Path;
            var same_buffer = string.IsNullOrEmpty(path)
                              || path.StartsWith("buffer:", StringComparison.OrdinalIgnoreCase)
                              || (!string.IsNullOrEmpty(LoadedFilePath) && PathsEqual(path, LoadedFilePath));
            if (!same_buffer) continue;

            var start = d.Location.Span.StartOffset;
            if (start < 0 || start > source_len) continue;
            var len = d.Location.Span.Length <= 0 ? 1 : d.Location.Span.Length;
            if (start + len > source_len) len = Math.Max(1, source_len - start);

            list.Add(new DevWorkFlow.Editor.Bridge.EditorMarker
            {
                StartOffset = start,
                Length = len,
                Message = $"[{d.Id}] {d.Message}",
                Severity = d.Severity switch
                {
                    ErpDiagnosticSeverity.Error => "error",
                    ErpDiagnosticSeverity.Warning => "warning",
                    ErpDiagnosticSeverity.Info => "info",
                    _ => "hint"
                },
                Code = d.Id
            });
        }

        EditorMarkers = list;
    }

    /// <summary>Ngôn ngữ mặc định theo đuôi file: .js → javascript, còn lại → xml (form/controller).</summary>
    public static string DetectEditorLanguage(string? file_path)
    {
        var ext = Path.GetExtension(file_path ?? string.Empty);
        return ext.Equals(".js", StringComparison.OrdinalIgnoreCase) ? "javascript" : "xml";
    }

    public ObservableCollection<InsightEditorLineVm> InsightEditorLines { get; }

    public InsightEditorLineVm? SelectedInsightLine
    {
        get => _selected_insight_line;
        set => SetProperty(ref _selected_insight_line, value);
    }

    public ErpEditorMode ActiveEditorMode
    {
        get => _active_editor_mode;
        private set
        {
            if (!SetProperty(ref _active_editor_mode, value)) return;
            OnPropertyChanged(nameof(EditorModeText));
            OnPropertyChanged(nameof(EditorModeButtonText));
            OnPropertyChanged(nameof(EditorSurfaceHeader));
            OnPropertyChanged(nameof(IsEditorReadOnly));
            OnPropertyChanged(nameof(ShowInsights));

            // EditorText TRƯỚC ClearTextSegments: span của segment tính trên ClearText, nên
            // buffer phải đổi xong rồi mới tô. Ngược lại thì tô một nhịp lên text cũ.
            OnPropertyChanged(nameof(EditorText));
            OnPropertyChanged(nameof(ClearTextSegments));

            OnPropertyChanged(nameof(ShowInsightColumns));
            OnPropertyChanged(nameof(IsSourceMode));
            OnPropertyChanged(nameof(IsInsightMode));
            OnPropertyChanged(nameof(IsDesignerMode));
            OnPropertyChanged(nameof(ShowEditorSurface));
            OnPropertyChanged(nameof(ShowDesignerModeSurface));
            OnPropertyChanged(nameof(ShowDesignerTab));

            // Source ↔ Insight đổi buffer → marker chỉ hợp lệ ở Source (offset theo XmlSource).
            RefreshEditorMarkers();
        }
    }

    public bool IsSourceMode => ActiveEditorMode == ErpEditorMode.Source;

    public bool IsInsightMode => ActiveEditorMode == ErpEditorMode.Insight;

    public bool IsDesignerMode => ActiveEditorMode == ErpEditorMode.Designer;

    public bool ShowInsightColumns => ActiveEditorMode == ErpEditorMode.Insight;

    public bool ShowEditorSurface =>
        ActiveEditorMode is ErpEditorMode.Source or ErpEditorMode.Insight;

    public bool ShowDesignerModeSurface =>
        ActiveEditorMode == ErpEditorMode.Designer && ShowDesignSurface;

    public bool ShowDesignerTab => ShowDesignSurface;

    public bool ShowInsights => ActiveEditorMode == ErpEditorMode.Insight;

    public IReadOnlyList<InsightItem> Insights => _insights;

    /// <summary>
    /// Provenance entity của <see cref="ExpandedXml"/> — chỉ có nghĩa ở Insight mode, nơi
    /// Editor hiển thị ClearText. Ở Source/Designer trả rỗng để editor không tô nhầm span
    /// (span tính trên ClearText, không khớp source XML).
    /// </summary>
    public IReadOnlyList<ClearTextSegment> ClearTextSegments =>
        IsInsightMode ? _clear_text_segments : [];

    /// <summary>
    /// Insight mode là read-only: buffer đang là ClearText (entity đã expand), không ánh xạ
    /// ngược được về XML — sửa ở đây sẽ khiến storage và màn hình lệch nhau. Mọi chỉnh sửa
    /// thực hiện ở Source mode; entity sửa qua Ctrl+Click mở đúng nơi khai báo.
    /// </summary>
    public bool IsEditorReadOnly => IsInsightMode;

    /// <summary>Nhãn cột editor — phải nói đúng nội dung đang hiển thị, không cố định "Source".</summary>
    public string EditorSurfaceHeader =>
        IsInsightMode ? "Clear text (read-only)" : "Source";

    public string EditorModeText => ActiveEditorMode switch
    {
        ErpEditorMode.Source => "Source Mode — storage XML lossless",
        ErpEditorMode.Insight => "Insight Mode — virtual semantic layers",
        ErpEditorMode.Designer => "Designer Mode — semantic design",
        _ => string.Empty
    };

    public string EditorModeButtonText =>
        ActiveEditorMode == ErpEditorMode.Source ? "Insight" : "Source";

    /// <summary>Report / Include / Template / Main — chỉ code, không Design Surface.</summary>
    public bool IsCodeOnlyView
    {
        get => _is_code_only_view;
        private set
        {
            if (!SetProperty(ref _is_code_only_view, value)) return;
            OnPropertyChanged(nameof(ShowDesignSurface));
            OnPropertyChanged(nameof(ShowDesignerTab));
            OnPropertyChanged(nameof(ShowDesignerModeSurface));
            if (value && ActiveEditorMode == ErpEditorMode.Designer)
                ActiveEditorMode = ErpEditorMode.Insight;
        }
    }

    public bool ShowDesignSurface => !IsCodeOnlyView && Design is not null;

    public bool HasDocument => !string.IsNullOrWhiteSpace(_xml_source);

    public string StatusMessage
    {
        get => _status_message;
        set => SetProperty(ref _status_message, value);
    }

    public bool IsBusy
    {
        get => _is_busy;
        private set => SetProperty(ref _is_busy, value);
    }

    public string LoadedFilePath
    {
        get => _loaded_file_path;
        private set => SetProperty(ref _loaded_file_path, value);
    }

    public string LoadedTitle
    {
        get => _loaded_title;
        private set => SetProperty(ref _loaded_title, value);
    }

    /// <summary>true = tiếng Việt (v), false = English (e).</summary>
    public bool IsVietnamese
    {
        get => _is_vietnamese;
        set
        {
            if (!SetProperty(ref _is_vietnamese, value)) return;
            OnPropertyChanged(nameof(LanguageCode));
            OnPropertyChanged(nameof(LanguageTooltip));
            Design?.ApplyLanguage(value);
            if (Design is not null)
                LoadedTitle = Design.Title;
            _ = RefreshGeneratedDesignAsync();
        }
    }

    public string LanguageCode => IsVietnamese ? "V" : "E";
    public string LanguageTooltip => IsVietnamese
        ? "Đang hiển thị tiếng Việt (v) — bấm để chuyển English (e)"
        : "Showing English (e) — click to switch Vietnamese (v)";

    public RelayCommand ParseCommand { get; }
    public AsyncRelayCommand SaveCommand { get; }
    public RelayCommand ClearCommand { get; }
    public RelayCommand<string> LoadTemplateCommand { get; }
    public RelayCommand ToggleLanguageCommand { get; }
    public RelayCommand<DesignCellVm> SelectCellCommand { get; }

    // ── Insight actions ───────────────────────────────────────────────
    public RelayCommand<EntityValueEdit> UpdateEntityValueCommand { get; }
    public RelayCommand<ErpEditorMode> SetEditorModeCommand { get; }
    public RelayCommand ToggleInsightCommand { get; }
    public RelayCommand OpenSqlFromFormCommand { get; }

    public void LoadControllerXml(
        string xml,
        string file_path,
        string title,
        IEnumerable<string>? related_files = null,
        bool code_only = false)
    {
        SyncDpi();
        ReloadOptions();

        LoadedFilePath = file_path ?? string.Empty;
        LoadedTitle = string.IsNullOrWhiteSpace(title)
            ? (string.IsNullOrWhiteSpace(file_path) ? "Untitled" : Path.GetFileName(file_path))
            : title;
        XmlSource = xml ?? string.Empty;
        IsCodeOnlyView = code_only || IsCodeOnlyPath(file_path);
        EditorLanguage = DetectEditorLanguage(file_path);

        RelatedFiles.Clear();
        if (related_files is not null)
        {
            foreach (var related in related_files)
                RelatedFiles.Add(related);
        }

        ParseXml();
        if (IsCodeOnlyView)
        {
            Document = null;
            Design = null;
            StatusMessage = $"Code only: {Path.GetFileName(file_path)}";
        }

        OnPropertyChanged(nameof(ExpandedXml));
        OnPropertyChanged(nameof(EditorText));

        // File mở ra đã lỗi cấu trúc → vào thẳng Source để sửa (Insight bị gate trong ParseXml).
        ActiveEditorMode = HasBlockingSyntaxErrors
            ? ErpEditorMode.Source
            : ErpEditorMode.Insight;
    }

    /// <summary>XML đã giải mã toàn bộ &amp;Entity; (DTD + ExpandDeep).</summary>
    public string ExpandedXml { get; private set; } = string.Empty;

    public static bool IsCodeOnlyPath(string? file_path)
    {
        if (string.IsNullOrWhiteSpace(file_path)) return false;
        var normalized = file_path.Replace('\\', '/');
        return normalized.Contains("/Report/", StringComparison.OrdinalIgnoreCase)
               || normalized.Contains("/Include/", StringComparison.OrdinalIgnoreCase)
               || normalized.Contains("/Template/", StringComparison.OrdinalIgnoreCase)
               || normalized.Contains("/Templates/", StringComparison.OrdinalIgnoreCase)
               || normalized.Contains("/Main/", StringComparison.OrdinalIgnoreCase);
    }

    // ── Entity symbols / projections / semantic edit ─────────────────

    private void RefreshEntitiesFromSemantic()
    {
        _insights = ErpDocument?.Insights ?? [];

        var clear_text = ErpDocument?.GetProjection(ErpProjectionKind.ClearText);
        ExpandedXml = clear_text?.Text ?? XmlSource;
        _clear_text_segments = clear_text?.ClearTextSegments ?? [];
        _clear_text_offsets = clear_text?.OffsetMap ?? ClearTextOffsetMap.Identity;

        OnPropertyChanged(nameof(EditorText));
        OnPropertyChanged(nameof(Insights));
        OnPropertyChanged(nameof(ExpandedXml));
        OnPropertyChanged(nameof(ClearTextSegments));
        RefreshInsightEditorLines();
    }

    private void ToggleInsightMode()
    {
        if (string.IsNullOrWhiteSpace(_xml_source))
        {
            StatusMessage = "Chưa có XML.";
            return;
        }

        // XML đang lỗi cấu trúc → ClearText không đáng tin, giữ ở Source cho tới khi sửa xong.
        if (HasBlockingSyntaxErrors && ActiveEditorMode == ErpEditorMode.Source)
        {
            StatusMessage = "✘ Sửa lỗi XML trước — Insight khóa khi tag lệch/thiếu đóng.";
            return;
        }

        // Architecture Freeze: bật/tắt Insight chỉ redraw, không parse/reload/clone XML.
        ActiveEditorMode = ActiveEditorMode == ErpEditorMode.Source
            ? ErpEditorMode.Insight
            : ErpEditorMode.Source;
        StatusMessage = EditorModeText;
    }

    /// <summary>Trích command/query từ XML → mở SQL Studio (buffer, không ghi đè XML).</summary>
    private void OpenSqlFromForm()
    {
        if (_sql_navigator is null) return;
        if (string.IsNullOrWhiteSpace(XmlSource))
        {
            StatusMessage = "Chưa có XML để trích SQL.";
            return;
        }

        var source_xml = ErpDocument?
            .GetProjection(ErpProjectionKind.ClearText)
            .Text ?? XmlSource;
        var fragments = FboSqlFragmentExtractor.Extract(source_xml);
        if (fragments.Count == 0)
        {
            StatusMessage = "Không tìm thấy command/query trong XML.";
            MessageBox.Show(
                "Không tìm thấy thẻ <command> hoặc <query> trong XML hiện tại.",
                "SQL Studio",
                MessageBoxButton.OK,
                MessageBoxImage.Information);
            return;
        }

        var source_name = string.IsNullOrWhiteSpace(LoadedFilePath)
            ? LoadedTitle
            : Path.GetFileName(LoadedFilePath);
        var script = FboSqlFragmentExtractor.BuildCombinedScript(fragments, source_name);
        var id = string.IsNullOrWhiteSpace(LoadedFilePath)
            ? $"sql://form/{Guid.NewGuid():N}"
            : $"sql://{LoadedFilePath}";
        var title = $"SQL: {source_name}";
        _sql_navigator.OpenBuffer(id, title, script);
        StatusMessage = $"Đã mở SQL Studio — {fragments.Count} fragment(s), entity đã giải mã.";
    }

    private void UpdateEntityInline(EntityValueEdit? edit)
    {
        if (edit is null || ErpDocument is null || _language_service is null)
            return;

        var edit_result = _language_service.UpdateEntityValue(
            ErpDocument.Id,
            edit.EntityName,
            edit.NewValue);
        if (!edit_result.Success || edit_result.Document is null)
        {
            StatusMessage = $"✖ Lỗi cập nhật entity {edit.EntityName}: {edit_result.Error}";
            return;
        }

        ApplyLanguageDocument(edit_result.Document);
        StatusMessage = $"✔ Đã cập nhật EntitySymbol {edit.EntityName}; source vẫn giữ reference.";
    }

    private void ParseXml()
    {
        _in_reparse = true;
        try
        {
            // Phase 3: bind qua Language Service — ViewModel không gọi FboXmlParser.
            var path = string.IsNullOrWhiteSpace(LoadedFilePath)
                ? $"buffer:{Guid.NewGuid():N}"
                : LoadedFilePath;

            IErpDocument erp_doc;
            if (_language_service is not null)
            {
                // Luôn reparse để Navigation Map có offset đúng với XmlSource hiện tại.
                // OpenDocumentFromText gọi OpenCore: nếu document đã tồn tại thì gọi
                // ReplaceContent + _navigation.Rebuild → map mới; không dùng GetDocument
                // shortcut vì shortcut đó bỏ qua Rebuild và trả map cũ (stale offsets).
                erp_doc = _language_service.OpenDocumentFromText(path, XmlSource);
            }
            else
            {
                // Fallback test / design-time
                var ls = new ErpLanguageService();
                erp_doc = ls.OpenDocumentFromText(path, XmlSource);
            }

            ErpDocument = erp_doc;
            SemanticModel = erp_doc.SemanticModel;
            ExpandedXml = erp_doc.GetProjection(ErpProjectionKind.ClearText).Text;

            // ── Gate theo lỗi cấu trúc XML (ERP1002) ──────────────────────────
            // "Ưu tiên validate": tag lệch/thiếu đóng làm cây syntax không đáng tin →
            // không refresh Designer từ cấu trúc sai (tránh vẽ form méo rồi serialize đè).
            // Diagnostics/markers/Problems VẪN cập nhật để người dùng thấy và focus lỗi;
            // Insight (ClearText) cũng không tin được → ép về Source để sửa.
            HasBlockingSyntaxErrors = erp_doc.Diagnostics.Any(d => d.Id == "ERP1002");
            if (HasBlockingSyntaxErrors)
            {
                Document = null;
                Design = null;
                GeneratedDesignDocument = null;
                RefreshEntitiesFromSemantic();
                RefreshEditorMarkers();

                var first = erp_doc.Diagnostics.First(d => d.Id == "ERP1002");
                StatusMessage = first.Location.Line > 0
                    ? $"✘ XML lỗi cấu trúc (Ln {first.Location.Line}): {first.Message}"
                    : $"✘ XML lỗi cấu trúc: {first.Message}";

                if (ActiveEditorMode != ErpEditorMode.Source)
                    ActiveEditorMode = ErpEditorMode.Source;

                ToggleLanguageCommand.RaiseCanExecuteChanged();
                return;
            }

            var legacy = (erp_doc.SemanticModel as ErpSemanticModel)?.LegacyDocument;
            if (legacy is null)
            {
                Document = null;
                Design = null;
                GeneratedDesignDocument = null;
                RefreshEntitiesFromSemantic();
                RefreshEditorMarkers();
                StatusMessage = SemanticModel.Diagnostics.FirstOrDefault()?.Message
                                ?? "✘ Không bind được Semantic Model.";
                ToggleLanguageCommand.RaiseCanExecuteChanged();
                return;
            }

            Document = legacy;
            var controllers_path = _program_session?.Current?.ControllersPath;
            Design = FboDesignMapper.Map(Document, IsVietnamese, controllers_path);
            foreach (var s in SelectedCells) s.IsSelected = false;
            SelectedCells.Clear();
            SelectedCell = null;
            FieldProperties.Clear();
            OnPropertyChanged(nameof(HasSelectedCell));
            LoadedTitle = Design.Title;
            ToggleLanguageCommand.RaiseCanExecuteChanged();

            var field_count = SemanticModel.GetFields().Count;
            var kind = SemanticModel.Controller?.FolderKind ?? Document.DisplayKind.ToString();

            StatusMessage =
                $"✔ {kind} | {Path.GetFileName(LoadedFilePath)} | {field_count} field(s)" +
                $" | table={Design.FormTableWidthPx}px→{Design.FormTableWidthDip:0}dip" +
                $" | {Design.LayoutBadge}";
            RefreshEntitiesFromSemantic();
            RefreshEditorMarkers();
            _ = RefreshGeneratedDesignAsync();
        }
        catch (Exception ex)
        {
            Document = null;
            ErpDocument = null;
            SemanticModel = null;
            Design = null;
            EditorMarkers = [];
            GeneratedDesignDocument = null;
            StatusMessage = $"✘ Parse lỗi: {ex.Message}";
            ToggleLanguageCommand.RaiseCanExecuteChanged();
        }
        finally
        {
            _in_reparse = false;
        }
    }

    private void ApplyLanguageDocument(IErpDocument erp_document)
    {
        ErpDocument = erp_document;
        SemanticModel = erp_document.SemanticModel;
        XmlSource = erp_document.GetProjection(ErpProjectionKind.Source).Text;
        ExpandedXml = erp_document.GetProjection(ErpProjectionKind.ClearText).Text;
        Document = (erp_document.SemanticModel as ErpSemanticModel)?.LegacyDocument;

        if (!IsCodeOnlyView && Document is not null)
        {
            var controllers_path = _program_session?.Current?.ControllersPath;
            Design = FboDesignMapper.Map(Document, IsVietnamese, controllers_path);
        }

        RefreshEntitiesFromSemantic();
        OnPropertyChanged(nameof(ExpandedXml));
        OnPropertyChanged(nameof(EditorText));
        _ = RefreshGeneratedDesignAsync();
    }

    private void ToggleLanguage() => IsVietnamese = !IsVietnamese;

    public void SelectCell(DesignCellVm? cell, bool additive = false)
    {
        var selectable = cell is { } c && (c.IsInput || c.IsLabel);

        if (!additive)
        {
            foreach (var s in SelectedCells)
                s.IsSelected = false;
            SelectedCells.Clear();
        }

        if (!selectable)
        {
            SelectedCell = SelectedCells.LastOrDefault();
            if (SelectedCell is not null)
                SelectedCell.IsSelected = true;
            FinishSelectionChange();
            return;
        }

        if (additive && SelectedCells.Contains(cell!))
        {
            cell!.IsSelected = false;
            SelectedCells.Remove(cell);
            SelectedCell = SelectedCells.LastOrDefault();
        }
        else
        {
            if (!SelectedCells.Contains(cell!))
                SelectedCells.Add(cell!);
            cell!.IsSelected = true;
            SelectedCell = cell;
        }

        FinishSelectionChange();
    }

    private void FinishSelectionChange()
    {
        OnPropertyChanged(nameof(HasSelectedCell));
        BuildFieldProperties();
        JumpCodeToField(SelectedCell?.FieldName);
    }

    /// <summary>Outline / external: chọn field theo name → Navigation Service → editor.</summary>
    public void SelectFieldByName(string? field_name)
    {
        if (string.IsNullOrWhiteSpace(field_name)) return;

        if (ErpDocument is not null && _language_service is not null)
        {
            var symbol_id = $"field:{field_name}";
            var target = _language_service.Navigation.GoToDefinition(ErpDocument.Id, symbol_id);
            if (target is not null)
            {
                NavigateToTarget(target);
                return;
            }
        }

        var cell = EnumerateAllCells()
            .FirstOrDefault(c => c.IsInput
                && string.Equals(c.FieldName, field_name, StringComparison.OrdinalIgnoreCase))
            ?? EnumerateAllCells()
                .FirstOrDefault(c => c.IsLabel
                    && string.Equals(c.FieldName, field_name, StringComparison.OrdinalIgnoreCase));
        if (cell is not null)
            SelectCell(cell);
        else
            JumpCodeToField(field_name);
    }

    /// <summary>Cuộn editor XML tới dòng khai báo &lt;field name="..."&gt;.</summary>
    private void JumpCodeToField(string? field_name)
    {
        if (string.IsNullOrWhiteSpace(field_name)) return;
        var line = FindFieldLine(field_name);
        if (line <= 0) return;
        NavigateToLine(line);
    }

    /// <summary>Structure outline / F12 — nhảy tới dòng (1-based) tính trên source XML.</summary>
    public void NavigateToLine(int line)
    {
        if (line <= 0) return;

        // Insight mode: buffer là ClearText, số dòng đã lệch so với source vì entity expand
        // có thể chứa xuống dòng. Đổi sang offset để đi qua bảng ánh xạ.
        if (IsInsightMode)
        {
            var source_offset = SourceOffsetOfLine(line);
            if (source_offset >= 0)
            {
                ApplyCaretOffset(source_offset, defer: false);
                return;
            }
        }

        CaretLine = 0;
        CaretLine = line;
    }

    /// <summary>Offset đầu dòng (1-based) trong <see cref="XmlSource"/>; -1 nếu không có.</summary>
    private int SourceOffsetOfLine(int line)
    {
        var text = XmlSource;
        if (string.IsNullOrEmpty(text)) return -1;

        var offset = 0;
        for (var current = 1; current < line; current++)
        {
            var next = text.IndexOf('\n', offset);
            if (next < 0) return -1;
            offset = next + 1;
        }

        return offset;
    }

    /// <summary>
    /// Điều hướng từ ERP Navigation Service — Editor chỉ Scroll/Select theo TextRange.
    /// </summary>
    public void NavigateToTarget(NavigationTarget? target)
    {
        if (target is null) return;

        // Node từ Insight map mang offset trên ClearText — chỉ có nghĩa trong buffer Insight.
        var need_clear_text = target.UsesClearTextOffsets;

        // Khi đang ở Designer mode, chuyển sang Insight trước khi scroll. Tương tự, target offset
        // ClearText mà editor đang Source thì cũng phải sang Insight thì offset mới khớp buffer.
        // ShowEditorSurface thay đổi → WPF queue layout pass → editor chưa sẵn sàng ngay.
        // Phải defer việc set CaretOffset đến sau khi layout hoàn tất.
        var mode_switched = ActiveEditorMode == ErpEditorMode.Designer
            || (need_clear_text && !IsInsightMode);
        if (ActiveEditorMode == ErpEditorMode.Designer)
            ActiveEditorMode = ErpEditorMode.Insight;
        else if (need_clear_text && !IsInsightMode)
            ActiveEditorMode = ErpEditorMode.Insight;

        // Designer sync: chọn field theo Symbol nếu có.
        if (target.Symbol is FieldSymbol field)
            SelectFieldByNameQuiet(field.Name);

        var offset = target.TextRange.StartOffset;
        if (!need_clear_text)
        {
            // Offset source: kẹp theo độ dài source (offset ClearText kẹp trong ApplyCaretOffset).
            var source_len = XmlSource?.Length ?? 0;
            if (source_len > 0 && offset > source_len)
                offset = source_len;
        }

        // Fragment thuộc file entity ngoài: không áp offset file đó vào XmlSource hiện tại.
        // Insight target luôn cùng document (offset ClearText) nên bỏ qua nhánh này.
        if (!need_clear_text
            && !string.IsNullOrWhiteSpace(target.DocumentUri)
            && !string.IsNullOrWhiteSpace(LoadedFilePath)
            && !PathsEqual(target.DocumentUri, LoadedFilePath))
        {
            if (!string.IsNullOrWhiteSpace(target.SymbolId)
                && _language_service is not null
                && ErpDocument is not null)
            {
                var fallback = _language_service.Navigation.GoToDefinition(
                    ErpDocument.Id, target.SymbolId);
                if (fallback is not null
                    && (string.IsNullOrWhiteSpace(fallback.DocumentUri)
                        || PathsEqual(fallback.DocumentUri, LoadedFilePath)))
                    offset = fallback.TextRange.StartOffset;
                else if (target.Symbol is EntitySymbol entity)
                    offset = entity.Definition.Span.StartOffset;
            }
            else if (target.StartLine > 0)
            {
                NavigateToLine(target.StartLine);
                return;
            }
        }

        if (offset >= 0)
        {
            ApplyCaretOffset(offset, mode_switched, need_clear_text);
            return;
        }

        if (target.StartLine > 0)
            NavigateToLine(target.StartLine);
    }

    /// <summary>
    /// Set CaretOffset để trigger ScrollToOffset binding trên editor.
    /// Nếu vừa switch mode (editor cần layout pass), defer đến DispatcherPriority.Loaded
    /// để BringCaretToView chạy sau khi editor đã hiển thị đầy đủ.
    /// <paramref name="offset"/> luôn tính trên source XML — hàm này chịu trách nhiệm đổi
    /// sang offset của buffer đang hiển thị.
    /// </summary>
    private void ApplyCaretOffset(int offset, bool defer, bool already_clear_text = false)
    {
        // already_clear_text: offset đã tính trên buffer ClearText (Insight map) → chỉ kẹp theo
        // độ dài buffer, KHÔNG map lại qua ToEditorOffset (map đó dành cho offset source).
        if (already_clear_text)
        {
            var buffer_len = ExpandedXml?.Length ?? 0;
            if (offset > buffer_len) offset = buffer_len;
        }
        else
        {
            offset = ToEditorOffset(offset);
        }

        if (defer)
        {
            var captured = offset;
            System.Windows.Application.Current?.Dispatcher.BeginInvoke(
                System.Windows.Threading.DispatcherPriority.Loaded,
                () =>
                {
                    CaretOffset = -1;
                    CaretOffset = captured;
                });
        }
        else
        {
            CaretOffset = -1;
            CaretOffset = offset;
        }
    }

    /// <summary>
    /// Offset trên source XML → offset trên buffer editor đang hiển thị.
    /// Source mode: giữ nguyên. Insight mode: buffer là ClearText (entity đã expand thành nội
    /// dung thật) nên mọi offset sau tham chiếu entity đầu tiên đều lệch — phải đi qua bảng
    /// ánh xạ, nếu không Outline/F12 nhảy sai chỗ.
    /// </summary>
    private int ToEditorOffset(int source_offset)
    {
        if (!IsInsightMode || source_offset < 0) return source_offset;

        var mapped = _clear_text_offsets.ToClearText(source_offset);
        var buffer_len = ExpandedXml?.Length ?? 0;
        return mapped > buffer_len ? buffer_len : mapped;
    }

    private static bool PathsEqual(string a, string b)
    {
        try
        {
            return string.Equals(
                Path.GetFullPath(a),
                Path.GetFullPath(b),
                StringComparison.OrdinalIgnoreCase);
        }
        catch
        {
            return string.Equals(a, b, StringComparison.OrdinalIgnoreCase);
        }
    }

    /// <summary>Chọn cell Design không JumpCode (nav đã do NavigationTarget).</summary>
    private void SelectFieldByNameQuiet(string? field_name)
    {
        if (string.IsNullOrWhiteSpace(field_name) || Design is null) return;
        var cell = EnumerateAllCells()
            .FirstOrDefault(c => c.IsInput
                && string.Equals(c.FieldName, field_name, StringComparison.OrdinalIgnoreCase))
            ?? EnumerateAllCells()
                .FirstOrDefault(c => c.IsLabel
                    && string.Equals(c.FieldName, field_name, StringComparison.OrdinalIgnoreCase));
        if (cell is null) return;

        // SelectCell gọi JumpCodeToField — tạm set selection nhẹ.
        foreach (var s in SelectedCells)
            s.IsSelected = false;
        SelectedCells.Clear();
        SelectedCells.Add(cell);
        cell.IsSelected = true;
        SelectedCell = cell;
        OnPropertyChanged(nameof(HasSelectedCell));
        BuildFieldProperties();
    }

    /// <summary>Nhảy tới offset trong document (ưu tiên offset). Prefer NavigateToTarget.</summary>
    public void NavigateToOffset(int offset, int line_hint = 0)
    {
        // Outline/F12 cần thấy editor code — thoát Designer nếu đang mở.
        if (ActiveEditorMode == ErpEditorMode.Designer)
            ActiveEditorMode = ErpEditorMode.Insight;

        var source_len = XmlSource?.Length ?? 0;
        if (offset >= 0)
        {
            if (offset > source_len)
                offset = source_len;

            ApplyCaretOffset(offset, defer: false);
            return;
        }

        if (line_hint > 0)
            NavigateToLine(line_hint);
    }

    /// <summary>Cột caret (1-based) cho status bar.</summary>
    public int CaretColumn
    {
        get => _caret_column;
        private set => SetProperty(ref _caret_column, value);
    }

    /// <summary>
    /// Mở file entity SYSTEM ra tab mới (double-click reference trong editor).
    /// .sql → SQL Studio; còn lại (.ent/.txt/.xml/...) → Form document tab, code-only
    /// trừ khi là form source thật (.xml/.f).
    /// </summary>
    public void OpenEntityFile(string path, int target_offset = -1)
    {
        if (string.IsNullOrWhiteSpace(path) || !File.Exists(path))
        {
            StatusMessage = $"Không tìm thấy file entity: {path}";
            return;
        }

        try
        {
            var ext = Path.GetExtension(path);
            if (ext.Equals(".sql", StringComparison.OrdinalIgnoreCase))
            {
                _sql_navigator?.OpenFile(path);
                StatusMessage = path;
                return;
            }

            if (_form_navigator is null)
            {
                StatusMessage = "Chưa gắn FormDocumentNavigator — không mở được tab mới.";
                return;
            }

            var is_form_source = ext.Equals(".xml", StringComparison.OrdinalIgnoreCase)
                                 || ext.Equals(".f", StringComparison.OrdinalIgnoreCase);
            var code_only = !is_form_source || IsCodeOnlyPath(path);
            _form_navigator.Open(
                path,
                $"Entity: {Path.GetFileName(path)}",
                raw_xml: null,
                related_files: null,
                code_only,
                target_offset);
            StatusMessage = path;
        }
        catch (Exception ex)
        {
            StatusMessage = $"Lỗi mở file entity: {ex.Message}";
        }
    }

    /// <summary>
    /// Ctrl+Click một vùng entity trong Insight mode (ClearText). Xem
    /// <see cref="EntityNavigationRequest"/> cho thứ tự quyết định.
    ///
    /// Hai nhánh "mở tab mới" KHÔNG đụng tới caret/scroll của tab hiện tại — đó chính là
    /// điểm khác so với Go-To-Definition cũ: quay lại tab này vẫn thấy đúng chỗ vừa click,
    /// không phải cuộn tìm lại đoạn text đang đọc.
    /// </summary>
    /// <summary>
    /// Hover entity (đồng bộ, in-process): trả value cho Content Widget. Source dùng offset→LS;
    /// Insight dùng tên entity từ segment → SemanticModel. Null nghĩa là không có entity để hover.
    /// </summary>
    public EntityHoverView? ResolveEntityHover(int offset, bool insight, string? entity_name)
    {
        if (ErpDocument is null) return null;

        if (insight)
        {
            if (string.IsNullOrEmpty(entity_name)) return null;
            var entity = ErpDocument.SemanticModel.FindEntity(entity_name);
            if (entity is null) return null;
            var value = !string.IsNullOrEmpty(entity.DisplayText)
                ? entity.DisplayText
                : entity.RawValue ?? string.Empty;
            var is_error = !entity.IsResolved
                           && entity.DeclarationKind == EntityDeclarationKind.ExternalSystem;
            return new EntityHoverView($"&{entity.Name};", value, is_error);
        }

        if (_language_service is null) return null;
        var hit = _language_service.ResolveEntityAtOffset(ErpDocument.Id, offset);
        return hit is null
            ? null
            : new EntityHoverView($"&{hit.EntityName};", hit.DisplayText, hit.IsError);
    }

    /// <summary>
    /// Ctrl+Click ở Source mode: bridge gửi offset nguồn → tra Language Service
    /// (<c>ResolveEntityAtOffset</c>) → tái dùng <see cref="NavigateToEntity"/>. Editor không parse.
    /// </summary>
    public void OnEntityOffsetActivated(int offset)
    {
        if (ErpDocument is null || _language_service is null) return;

        var hit = _language_service.ResolveEntityAtOffset(ErpDocument.Id, offset);
        if (hit is null)
        {
            StatusMessage = "Không có entity tại vị trí này.";
            return;
        }

        NavigateToEntity(new EntityNavigationRequest
        {
            EntityName = hit.EntityName,
            SymbolId = hit.SymbolId,
            DefinitionPath = hit.DefinitionPath,
            DefinitionOffset = hit.DefinitionOffset,
            OpenPath = hit.OpenPath
        });
    }

    public void NavigateToEntity(EntityNavigationRequest request)
    {
        // Entity SYSTEM — nội dung nằm ở file khác. Đuôi file là bất kỳ (.ent/.xml/.txt/...),
        // OpenEntityFile tự phân loại; không được giả định .ent. File nội dung KHÔNG chứa khai
        // báo <!ENTITY> (nó chính là value) → focus đầu file (offset 0), không dùng DefinitionOffset
        // (offset đó thuộc document đang xem, không phải file nội dung).
        if (!string.IsNullOrWhiteSpace(request.OpenPath))
        {
            OpenEntityFile(request.OpenPath, target_offset: 0);
            return;
        }

        if (string.IsNullOrWhiteSpace(request.DefinitionPath))
        {
            StatusMessage = $"Không xác định được nơi khai báo entity {request.EntityName}.";
            return;
        }

        // Khai báo nằm ở file include khác (ví dụ Unit.ent) → mở tab mới và focus tới <!ENTITY…>.
        // DefinitionOffset là offset TRONG file khai báo (binder gán theo file đó), đúng để điều
        // hướng sau khi mở include.
        if (string.IsNullOrWhiteSpace(LoadedFilePath)
            || !PathsEqual(request.DefinitionPath, LoadedFilePath))
        {
            OpenEntityFile(request.DefinitionPath, target_offset: request.DefinitionOffset);
            return;
        }

        // Entity inline khai báo trong chính document đang mở → nhảy tới <!ENTITY ...>.
        // Offset là offset SOURCE, dùng được cả khi buffer đang là ClearText: expand entity
        // chỉ xảy ra trong body, sau DOCTYPE, nên vùng khai báo không bị dịch chuyển.
        if (request.DefinitionOffset >= 0)
        {
            NavigateToOffset(request.DefinitionOffset, line_hint: 0);
            StatusMessage = $"Khai báo entity {request.EntityName}";
            return;
        }

        StatusMessage = $"Không có vị trí khai báo cho entity {request.EntityName}.";
    }

    public void UpdateCaretPosition(int line, int column)
    {
        if (line > 0 && line != _caret_line)
        {
            _caret_line = line;
            OnPropertyChanged(nameof(CaretLine));
        }
        if (column > 0)
            CaretColumn = column;
    }

    public void CommitEntityValue(string entity_name, string new_value)
    {
        UpdateEntityInline(new EntityValueEdit
        {
            EntityName = entity_name,
            NewValue = new_value
        });
    }

    private void SetEditorMode(ErpEditorMode mode)
    {
        if (mode == ErpEditorMode.Designer && !ShowDesignSurface)
            return;
        // XML lỗi cấu trúc → chỉ Source được phép (Insight/Designer dựng trên cây sai).
        if (HasBlockingSyntaxErrors && mode != ErpEditorMode.Source)
        {
            StatusMessage = "✘ Sửa lỗi XML trước — Insight/Designer khóa khi tag lệch/thiếu đóng.";
            return;
        }
        ActiveEditorMode = mode;
        StatusMessage = EditorModeText;

        // Vào Designer mà chưa có HTML sinh → dựng ngay (các trigger khác lo cập nhật khi doc đổi).
        if (mode == ErpEditorMode.Designer && GeneratedDesignDocument is null)
            _ = RefreshGeneratedDesignAsync();
    }

    private void RefreshInsightEditorLines()
    {
        InsightEditorLines.Clear();
        var lines = new List<InsightEditorLineVm>();

        foreach (var insight in _insights)
            lines.Add(InsightEditorLineVm.FromInsight(insight));

        if (SemanticModel is not null)
        {
            foreach (var field in SemanticModel.GetFields())
            {
                if (field.Definition.Span.IsEmpty) continue;
                if (lines.Any(line => line.LineNumber == field.Definition.Line
                                      && line.KindBadge == "Field"))
                    continue;
                lines.Add(InsightEditorLineVm.FromField(field));
            }
        }

        foreach (var line in lines.OrderBy(item => item.LineNumber))
            InsightEditorLines.Add(line);
    }

    private int _caret_offset = -1;

    /// <summary>Offset caret (AvalonEdit) — -1 = không đổi; set lại để ép jump.</summary>
    public int CaretOffset
    {
        get => _caret_offset;
        private set => SetProperty(ref _caret_offset, value);
    }

    private int FindFieldLine(string field_name)
    {
        if (string.IsNullOrEmpty(XmlSource) || string.IsNullOrWhiteSpace(field_name))
            return 0;

        // IndexOf thay Regex — tránh treo trên XML lớn.
        var open = "<field";
        var start = 0;
        while (true)
        {
            var idx = XmlSource.IndexOf(open, start, StringComparison.OrdinalIgnoreCase);
            if (idx < 0) return 0;

            var tag_end = XmlSource.IndexOf('>', idx);
            if (tag_end < 0) return 0;

            var slice = XmlSource.AsSpan(idx, tag_end - idx + 1);
            if (SliceHasNameAttribute(slice, field_name))
            {
                var line = 1;
                for (var i = 0; i < idx && i < XmlSource.Length; i++)
                    if (XmlSource[i] == '\n') line++;
                return line;
            }

            start = idx + open.Length;
        }
    }

    private static bool SliceHasNameAttribute(ReadOnlySpan<char> tag_slice, string field_name)
    {
        const string name_key = "name=";
        for (var i = 0; i <= tag_slice.Length - name_key.Length; i++)
        {
            var match = true;
            for (var j = 0; j < name_key.Length; j++)
            {
                if (char.ToLowerInvariant(tag_slice[i + j]) != name_key[j])
                {
                    match = false;
                    break;
                }
            }
            if (!match) continue;

            var q = i + name_key.Length;
            if (q >= tag_slice.Length) return false;
            var quote = tag_slice[q];
            if (quote is not ('"' or '\'')) continue;
            q++;
            var end = q;
            while (end < tag_slice.Length && tag_slice[end] != quote)
                end++;
            if (end >= tag_slice.Length) continue;
            return tag_slice[q..end].Equals(field_name, StringComparison.OrdinalIgnoreCase);
        }

        return false;
    }

    public void UpdateFieldProperty(DesignFieldPropertyVm prop)
    {
        if (SelectedCell is null || Document?.Form is null || prop.IsReadOnly)
            return;

        var field_name = SelectedCell.FieldName;
        var fbo_field = Document.Form.FindField(field_name);
        if (fbo_field is null) return;

        FieldPropertySchema.ApplyToField(fbo_field, prop.Name, prop.Value);
        XmlSource = _xml_writer.ApplyFieldProperty(XmlSource, field_name, prop.Name, prop.Value);

        // Đồng bộ cờ hiển thị trên MỌI cell của field (label + input + description)
        var is_required = !fbo_field.AllowNulls || fbo_field.IsPrimaryKey;
        var is_read_only = fbo_field.Inactivate || fbo_field.ReadOnly;
        var show_border = !fbo_field.Hidden;
        var header_changed = prop.Name is "header.v" or "header.e";

        foreach (var cell in EnumerateAllCells())
        {
            if (!string.Equals(cell.FieldName, field_name, StringComparison.OrdinalIgnoreCase))
                continue;

            cell.IsRequired = is_required;
            if (cell.IsLabel)
                cell.IsPrimaryKey = fbo_field.IsPrimaryKey;
            if (cell.IsInput)
            {
                cell.IsReadOnly = is_read_only;
                cell.ShowInputBorder = show_border;
            }

            if (header_changed && cell.IsLabel)
            {
                cell.TextV = fbo_field.GetDisplayLabel(true);
                cell.TextE = fbo_field.GetDisplayLabel(false);
                cell.ApplyLanguage(IsVietnamese);
            }
        }

        StatusMessage = $"✔ Đã cập nhật {field_name}.{prop.Name}";
    }

    private IEnumerable<DesignCellVm> EnumerateAllCells()
    {
        if (Design is null) yield break;
        foreach (var row in Design.FormRows)
            foreach (var cell in row.Cells) yield return cell;
        foreach (var tab in Design.CategoryTabs)
            foreach (var row in tab.Rows)
                foreach (var cell in row.Cells) yield return cell;
        foreach (var row in Design.BottomRows)
            foreach (var cell in row.Cells) yield return cell;
    }


    private void SyncLayoutToDocument()
    {
        if (Document?.Form?.Layout is null || Design is null) return;
        FboXmlWriter.UpdateColumnWidths(Document.Form, Design.ColumnWidthsPx);
        XmlSource = _xml_writer.ApplyLayout(XmlSource, Document.Form);
    }

    private void BuildFieldProperties()
    {
        foreach (var old in FieldProperties)
            old.PropertyChanged -= OnFieldPropertyChanged;

        FieldProperties.Clear();
        if (SelectedCell is null) return;

        var fbo_field = Document?.Form?.FindField(SelectedCell.FieldName);
        foreach (var prop in FieldPropertySchema.BuildEditable(fbo_field, SelectedCell))
        {
            prop.PropertyChanged += OnFieldPropertyChanged;
            FieldProperties.Add(prop);
        }
    }

    private void OnFieldPropertyChanged(object? sender, System.ComponentModel.PropertyChangedEventArgs e)
    {
        if (sender is not DesignFieldPropertyVm prop) return;
        if (e.PropertyName is not (nameof(DesignFieldPropertyVm.Value) or nameof(DesignFieldPropertyVm.BoolValue)))
            return;
        UpdateFieldProperty(prop);
    }

    private async Task SaveAsync()
    {
        if (string.IsNullOrWhiteSpace(LoadedFilePath) || string.IsNullOrWhiteSpace(XmlSource))
            return;

        IsBusy = true;
        try
        {
            SyncLayoutToDocument();
            await File.WriteAllTextAsync(LoadedFilePath, XmlSource);
            StatusMessage = $"✔ Đã lưu: {LoadedFilePath}";
        }
        catch (Exception ex)
        {
            StatusMessage = $"✘ Lưu lỗi: {ex.Message}";
        }
        finally
        {
            IsBusy = false;
        }
    }

    private void Clear()
    {
        XmlSource = string.Empty;
        Document = null;
        ErpDocument = null;
        SemanticModel = null;
        Design = null;
        foreach (var s in SelectedCells) s.IsSelected = false;
        SelectedCells.Clear();
        SelectedCell = null;
        FieldProperties.Clear();
        OnPropertyChanged(nameof(HasSelectedCell));
        RelatedFiles.Clear();
        LoadedFilePath = string.Empty;
        LoadedTitle = "Design";
        StatusMessage = string.Empty;
        ActiveEditorMode = ErpEditorMode.Insight;
        _insights = [];
        OnPropertyChanged(nameof(Insights));
    }

    private void ReloadOptions()
    {
        var program = _program_session?.Current;
        if (program is null) return;
        var path = FboOptionsCatalog.FindOptionsPath(program.ProgramPath);
        if (!string.IsNullOrEmpty(path))
            _options.LoadFromFile(path);
        FboDesignMapper.SetOptions(_options);
    }

    private static void SyncDpi()
    {
        try
        {
            var window = Application.Current?.MainWindow;
            if (window is null) return;
            var src = PresentationSource.FromVisual(window);
            if (src?.CompositionTarget is not null)
                FboLayoutUnits.DpiX = 96.0 * src.CompositionTarget.TransformToDevice.M11;
        }
        catch
        {
            FboLayoutUnits.DpiX = 96;
        }
    }
}
