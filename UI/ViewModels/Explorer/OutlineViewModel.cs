using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows;
using System.Windows.Media;
using System.Windows.Threading;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>Payload Outline — chỉ NodeId (+ metadata hiển thị). Không offset/search.</summary>
public sealed class OutlineNavTag
{
    public required NodeId NodeId { get; init; }
    public required string NodeType { get; init; }
    public string? SymbolId { get; init; }
    public required string DisplayName { get; init; }
}

/// <summary>
/// Outline — đọc Document Model / Navigation Map từ ERP Language Service.
/// Click → NodeId → Navigation Service → NavigationTarget → Editor.ScrollTo.
/// Không parse XML.
/// </summary>
public sealed class OutlineViewModel : ViewModelBase, IExplorerTreeSource, IDisposable
{
    private static readonly Brush IconBrush = FreezeBrush("#6B6B6B");

    private FormBuilderViewModel? _form_builder_vm;
    private readonly IErpLanguageService _language_service;
    private readonly DispatcherTimer _rebuild_timer;
    private readonly DebouncedTreeFilter _filter;
    private string _header = "Outline";
    private string _empty_message = "Mở một form XML để xem cấu trúc.";
    private string _filter_text = string.Empty;
    private string _status_text = string.Empty;
    private bool _suppress_activation;
    private bool _is_navigating;
    private List<ExplorerTreeFilterEngine.FilterIndexItem> _filter_index = [];

    public OutlineViewModel(
        FormBuilderViewModel? form_builder_vm,
        IErpLanguageService language_service)
    {
        _language_service = language_service;
        TreeRoots = [];
        RefreshCommand = new RelayCommand(RebuildNow);

        _rebuild_timer = new DispatcherTimer(DispatcherPriority.Background)
        {
            Interval = TimeSpan.FromMilliseconds(350)
        };
        _rebuild_timer.Tick += (_, _) =>
        {
            _rebuild_timer.Stop();
            RebuildNow();
        };

        _filter = new DebouncedTreeFilter(250, ApplyFilterAsync);
        BindTo(form_builder_vm);
    }

    public ObservableCollection<ExplorerTreeNodeVm> TreeRoots { get; }

    public string Header
    {
        get => _header;
        private set => SetProperty(ref _header, value);
    }

    public string EmptyMessage
    {
        get => _empty_message;
        private set => SetProperty(ref _empty_message, value);
    }

    public string FilterText
    {
        get => _filter_text;
        set
        {
            if (!SetProperty(ref _filter_text, value)) return;
            _filter.Schedule(value);
        }
    }

    public string StatusText
    {
        get => _status_text;
        private set => SetProperty(ref _status_text, value);
    }

    public int ActivationDelayMs => 100;

    public bool HasNodes => TreeRoots.Count > 0;
    public bool IsEmpty => TreeRoots.Count == 0;

    public RelayCommand RefreshCommand { get; }

    public void BindTo(FormBuilderViewModel? form_builder_vm)
    {
        if (ReferenceEquals(_form_builder_vm, form_builder_vm)) return;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnFormBuilderChanged;
        _form_builder_vm = form_builder_vm;
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged += OnFormBuilderChanged;
        RebuildNow();
    }

    public void OnTreeNodeActivated(ExplorerTreeNodeVm node, bool is_double_click)
    {
        _ = is_double_click;
        if (_suppress_activation || _is_navigating) return;
        if (node.Tag is not OutlineNavTag tag || _form_builder_vm is null) return;

        var form = _form_builder_vm;
        var captured = tag;
        Application.Current?.Dispatcher.BeginInvoke(
            DispatcherPriority.Input,
            () => NavigateByNodeId(form, captured));
    }

    public void Refresh() => RebuildNow();

    public void Dispose()
    {
        _filter.Dispose();
        _rebuild_timer.Stop();
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnFormBuilderChanged;
    }

    private void OnFormBuilderChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName is nameof(FormBuilderViewModel.ErpDocument)
            or nameof(FormBuilderViewModel.LoadedTitle)
            or nameof(FormBuilderViewModel.LoadedFilePath)
            or nameof(FormBuilderViewModel.HasDocument)
            or nameof(FormBuilderViewModel.XmlSource)
            or nameof(FormBuilderViewModel.ExpandedXml))
        {
            _rebuild_timer.Stop();
            _rebuild_timer.Start();
        }
    }

    private void RebuildNow()
    {
        _suppress_activation = true;
        try
        {
            TreeRoots.Clear();
            _filter_index = [];

            var erp_doc = _form_builder_vm?.ErpDocument;
            if (erp_doc is null)
            {
                Header = "Outline";
                EmptyMessage = "Mở một form XML để xem cấu trúc.";
                StatusText = EmptyMessage;
                OnPropertyChanged(nameof(HasNodes));
                OnPropertyChanged(nameof(IsEmpty));
                return;
            }

            // Đảm bảo Navigation Map sẵn sàng từ Language Service.
            var map = erp_doc.NavigationMap
                      ?? _language_service.Navigation.GetMap(erp_doc.Id);
            if (map is null)
            {
                Header = "Outline";
                EmptyMessage = "Chưa có Navigation Map.";
                StatusText = EmptyMessage;
                OnPropertyChanged(nameof(HasNodes));
                OnPropertyChanged(nameof(IsEmpty));
                return;
            }

            Header = string.IsNullOrWhiteSpace(_form_builder_vm?.LoadedTitle)
                ? $"Outline · {map.Document.Root.DisplayName}"
                : $"Outline: {_form_builder_vm!.LoadedTitle}";

            foreach (var root in map.GetOutlineRoots())
                TreeRoots.Add(ToTreeNode(root, expand: true));

            _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);
            EmptyMessage = TreeRoots.Count == 0
                ? "Semantic Model chưa có symbol."
                : string.Empty;
            StatusText = $"{_filter_index.Count} mục (Navigation Map)";
            OnPropertyChanged(nameof(HasNodes));
            OnPropertyChanged(nameof(IsEmpty));

            if (!string.IsNullOrWhiteSpace(_filter_text))
                _ = _filter.FlushAsync();
        }
        finally
        {
            _suppress_activation = false;
        }
    }

    private static ExplorerTreeNodeVm ToTreeNode(DocumentNode node, bool expand)
    {
        var display = string.IsNullOrWhiteSpace(node.DisplayName)
            ? node.NodeType
            : node.DisplayName;

        var vm = new ExplorerTreeNodeVm
        {
            Name = node.SymbolId ?? node.Id.ToString(),
            DisplayText = display,
            IconKind = IconFor(node.NodeType),
            IconForeground = IconBrush,
            Tooltip = $"{node.NodeType} · {display}",
            SearchKey = $"{node.NodeType} {display} {node.SymbolId}",
            Tag = new OutlineNavTag
            {
                NodeId = node.Id,
                NodeType = node.NodeType,
                SymbolId = node.SymbolId,
                DisplayName = display
            },
            ChildrenLoaded = true,
            IsExpanded = expand || IsPrimarySection(node.NodeType)
        };

        foreach (var child in node.Children)
            vm.Children.Add(ToTreeNode(child, expand: false));

        return vm;
    }

    // Container element (theo schema) — mở sẵn để thấy con.
    private static readonly HashSet<string> ContainerTypes = new(StringComparer.OrdinalIgnoreCase)
    {
        "dir", "grid", "lookup", "report", "notify", "controller",
        "fields", "views", "commands", "response", "script", "entities", "partition"
    };

    private static bool IsPrimarySection(string node_type) =>
        ContainerTypes.Contains(node_type);

    private static string IconFor(string node_type) =>
        node_type.ToLowerInvariant() switch
        {
            // Leaf / định danh
            "field" => "FormTextbox",
            "view" => "ViewDashboard",
            "command" or "query" => "Database",
            "action" or "response" or "responseaction" or "entityref" => "Reply",
            "function" or "scriptfunction" => "CodeBraces",
            "entity" => "Variable",
            "title" => "FormatTitle",
            "css" => "LanguageCss3",
            "item" or "category" => "TableColumn",
            // Container / section
            "dir" or "grid" or "lookup" or "report" or "notify" or "controller" => "FileDocumentOutline",
            "fields" => "FormTextbox",
            "views" => "ViewDashboard",
            "commands" => "Database",
            "script" => "LanguageJavascript",
            "entities" => "Variable",
            _ => "CodeTags"
        };

    private void NavigateByNodeId(FormBuilderViewModel form, OutlineNavTag tag)
    {
        if (_is_navigating) return;
        _is_navigating = true;
        try
        {
            var erp_doc = form.ErpDocument;
            if (erp_doc is null)
            {
                StatusText = "Chưa có ErpDocument.";
                return;
            }

            var target = _language_service.Navigation.GoToNode(erp_doc.Id, tag.NodeId);
            if (target is null)
            {
                StatusText = $"Không resolve NodeId {tag.NodeId}.";
                return;
            }

            form.NavigateToTarget(target);
            StatusText = $"→ {tag.DisplayName} ({tag.NodeType})";
        }
        catch (Exception ex)
        {
            StatusText = $"Outline navigate: {ex.Message}";
        }
        finally
        {
            _is_navigating = false;
        }
    }

    private async Task ApplyFilterAsync(string raw, CancellationToken ct)
    {
        var keyword = (raw ?? string.Empty).Trim();
        if (_filter_index.Count == 0 && TreeRoots.Count > 0)
            _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);

        var visible = await Task.Run(
            () => ExplorerTreeFilterEngine.CalculateVisibility(_filter_index, keyword, ct),
            ct).ConfigureAwait(true);

        ct.ThrowIfCancellationRequested();
        await ExplorerTreeFilterEngine.ApplyVisibilityAsync(
            _filter_index,
            visible,
            keyword,
            batch_size: 80,
            expand_matches: !string.IsNullOrEmpty(keyword),
            ct).ConfigureAwait(true);

        var match_count = visible.Count(v => v);
        StatusText = string.IsNullOrEmpty(keyword)
            ? $"{_filter_index.Count} mục (Navigation Map)"
            : $"{match_count}/{_filter_index.Count} khớp \"{keyword}\"";
    }

    private static Brush FreezeBrush(string hex)
    {
        var brush = (Brush)new BrushConverter().ConvertFromString(hex)!;
        if (brush.CanFreeze) brush.Freeze();
        return brush;
    }
}
