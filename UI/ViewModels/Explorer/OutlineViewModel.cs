using System.ComponentModel;
using System.Windows;
using System.Windows.Threading;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Infrastructure.Tree;
using DevWorkFlow.Tree;
using UI.Tree;
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
/// Outline — chỉ qua DevWorkFlow.Tree + XmlSemanticDataSource (không dual TreeRoots).
/// </summary>
public sealed class OutlineViewModel : ViewModelBase, IDisposable
{
    private FormBuilderViewModel? _form_builder_vm;
    private readonly IErpLanguageService _language_service;
    private readonly DispatcherTimer _rebuild_timer;
    private readonly XmlSemanticDataSource _xml_source = new();
    private readonly TreeFrameworkHost _tree_host;
    private string _header = "Outline";
    private string _empty_message = "Mở một form XML để xem cấu trúc.";
    private string _filter_text = string.Empty;
    private string _status_text = string.Empty;
    private bool _suppress_activation;
    private bool _is_navigating;
    private bool _has_nodes;

    public OutlineViewModel(
        FormBuilderViewModel? form_builder_vm,
        IErpLanguageService language_service)
    {
        _language_service = language_service;
        RefreshCommand = new RelayCommand(RebuildNow);
        _tree_host = new TreeFrameworkHost(250, ApplyTreeFilterAsync);

        _rebuild_timer = new DispatcherTimer(DispatcherPriority.Background)
        {
            Interval = TimeSpan.FromMilliseconds(350)
        };
        _rebuild_timer.Tick += (_, _) =>
        {
            _rebuild_timer.Stop();
            RebuildNow();
        };

        BindTo(form_builder_vm);
    }

    public TreeRenderingEngine? TreeRendering => _tree_host.Rendering;

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
            _tree_host.FilterText = value;
        }
    }

    public string StatusText
    {
        get => _status_text;
        private set
        {
            if (!SetProperty(ref _status_text, value)) return;
            _tree_host.StatusText = value;
        }
    }

    public int ActivationDelayMs => 100;

    public bool HasNodes
    {
        get => _has_nodes;
        private set
        {
            if (!SetProperty(ref _has_nodes, value)) return;
            OnPropertyChanged(nameof(IsEmpty));
        }
    }

    public bool IsEmpty => !_has_nodes;

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

    public void OnTreeNodeActivated(TreeNode node, bool is_double_click)
    {
        _ = is_double_click;
        if (_suppress_activation || _is_navigating) return;
        if (node.Metadata is not OutlineNavTag tag || _form_builder_vm is null) return;

        var form = _form_builder_vm;
        var captured = tag;
        Application.Current?.Dispatcher.BeginInvoke(
            DispatcherPriority.Input,
            () => NavigateByNodeId(form, captured));
    }

    public void Refresh() => RebuildNow();

    public void Dispose()
    {
        _rebuild_timer.Stop();
        if (_form_builder_vm is not null)
            _form_builder_vm.PropertyChanged -= OnFormBuilderChanged;
        _ = _tree_host.DisposeAsync().AsTask();
    }

    private void OnFormBuilderChanged(object? sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName is nameof(FormBuilderViewModel.ErpDocument)
            or nameof(FormBuilderViewModel.LoadedTitle)
            or nameof(FormBuilderViewModel.LoadedFilePath)
            or nameof(FormBuilderViewModel.HasDocument)
            or nameof(FormBuilderViewModel.XmlSource)
            or nameof(FormBuilderViewModel.ExpandedXml)
            // Đổi Source ↔ Insight phải dựng lại Outline theo map tương ứng (source vs ClearText).
            or nameof(FormBuilderViewModel.ActiveEditorMode)
            or nameof(FormBuilderViewModel.ShowInsights))
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
            var erp_doc = _form_builder_vm?.ErpDocument;
            if (erp_doc is null)
            {
                Header = "Outline";
                EmptyMessage = "Mở một form XML để xem cấu trúc.";
                StatusText = EmptyMessage;
                HasNodes = false;
                _ = _tree_host.DetachAsync();
                OnPropertyChanged(nameof(TreeRendering));
                return;
            }

            // Insight mode: Outline dựng trên ClearText (entity đã expand) — cây khớp buffer đang
            // hiển thị và điều hướng vào đúng field/command bên trong entity. Source mode: cây XML gốc.
            var is_insight = _form_builder_vm?.ShowInsights == true;
            var map = is_insight
                ? _language_service.Navigation.GetInsightMap(erp_doc.Id)
                : erp_doc.NavigationMap ?? _language_service.Navigation.GetMap(erp_doc.Id);
            if (map is null)
            {
                Header = "Outline";
                EmptyMessage = "Chưa có Navigation Map.";
                StatusText = EmptyMessage;
                HasNodes = false;
                _ = _tree_host.DetachAsync();
                OnPropertyChanged(nameof(TreeRendering));
                return;
            }

            Header = string.IsNullOrWhiteSpace(_form_builder_vm?.LoadedTitle)
                ? $"Outline · {map.Document.Root.DisplayName}"
                : $"Outline: {_form_builder_vm!.LoadedTitle}";

            var roots = map.GetOutlineRoots();
            TreeNodeAdapters.FillXmlSemanticFromDocumentNodes(_xml_source, roots);
            _ = SyncXmlTreeAsync(roots.Count);

            if (!string.IsNullOrWhiteSpace(_filter_text))
                _ = ApplyTreeFilterAsync(_filter_text, CancellationToken.None);
        }
        finally
        {
            _suppress_activation = false;
        }
    }

    private async Task SyncXmlTreeAsync(int root_count)
    {
        await _tree_host.AttachAsync(_xml_source, Application.Current?.Dispatcher)
            .ConfigureAwait(true);
        OnPropertyChanged(nameof(TreeRendering));
        HasNodes = root_count > 0;
        EmptyMessage = HasNodes ? string.Empty : "Semantic Model chưa có symbol.";
        StatusText = HasNodes
            ? $"{_tree_host.Rendering?.Rows.Count ?? 0} mục (Navigation Map)"
            : EmptyMessage;
    }

    private async Task ApplyTreeFilterAsync(string raw, CancellationToken ct)
    {
        var engine = _tree_host.Engine;
        if (engine is null) return;
        var keyword = raw.Trim();
        if (string.IsNullOrEmpty(keyword))
        {
            engine.ClearSearchFilter();
            return;
        }

        var hits = await _xml_source.SearchAsync(keyword, ct).ConfigureAwait(true);
        await engine.ApplySearchMatchesAsync(hits, ct).ConfigureAwait(true);
        StatusText = $"Lọc \"{keyword}\" · {hits.Count} mục";
    }

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
}
