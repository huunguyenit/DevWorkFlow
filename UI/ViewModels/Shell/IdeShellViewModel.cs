using System.Collections.ObjectModel;
using System.Windows.Input;
using UI.Docking;
using UI.ViewModels.Base;

namespace UI.ViewModels.Shell;

/// <summary>
/// Shell IDE: documents, dock panes, lệnh ribbon/menu.
/// Không chứa business Form/SQL — chỉ điều phối UI chrome.
/// </summary>
public sealed class IdeShellViewModel : ViewModelBase
{
    private readonly IDockService _dock;
    private DocumentItemVm? _active_document;
    private bool _is_left_dock_open = true;
    private bool _is_right_dock_open = true;
    private bool _is_bottom_dock_open = true;
    private ToolPaneVm? _selected_left_pane;
    private ToolPaneVm? _selected_right_pane;
    private ToolPaneVm? _selected_bottom_pane;
    private string _status_ready = "Ready";

    public IdeShellViewModel(IDockService dock)
    {
        _dock = dock;
        _dock.LayoutChanged += (_, _) => SyncDockFlags();

        Documents = [];
        LeftPanes = [];
        RightPanes = [];
        BottomPanes = [];

        SeedPlaceholderPanes();

        ActivateDocumentCommand = new RelayCommand<DocumentItemVm>(ActivateDocument);
        CloseDocumentCommand = new RelayCommand<DocumentItemVm>(CloseDocument);
        SelectLeftPaneCommand = new RelayCommand<ToolPaneVm>(p => SelectedLeftPane = p);
        SelectRightPaneCommand = new RelayCommand<ToolPaneVm>(p => SelectedRightPane = p);
        SelectBottomPaneCommand = new RelayCommand<ToolPaneVm>(p => SelectedBottomPane = p);

        ToggleLeftDockCommand = new RelayCommand(() => ToggleDock(DockRegion.Left));
        ToggleRightDockCommand = new RelayCommand(() => ToggleDock(DockRegion.Right));
        ToggleBottomDockCommand = new RelayCommand(() => ToggleDock(DockRegion.Bottom));
    }

    public ObservableCollection<DocumentItemVm> Documents { get; }
    public ObservableCollection<ToolPaneVm> LeftPanes { get; }
    public ObservableCollection<ToolPaneVm> RightPanes { get; }
    public ObservableCollection<ToolPaneVm> BottomPanes { get; }

    public DocumentItemVm? ActiveDocument
    {
        get => _active_document;
        private set
        {
            if (!SetProperty(ref _active_document, value)) return;
            OnPropertyChanged(nameof(HasActiveDocument));
            OnPropertyChanged(nameof(ActiveContent));
            CommandManager.InvalidateRequerySuggested();
        }
    }

    public bool HasActiveDocument => ActiveDocument is not null;
    public ViewModelBase? ActiveContent => ActiveDocument?.ContentVm;

    public ToolPaneVm? SelectedLeftPane
    {
        get => _selected_left_pane;
        set
        {
            if (_selected_left_pane is not null) _selected_left_pane.IsSelected = false;
            if (!SetProperty(ref _selected_left_pane, value)) return;
            if (_selected_left_pane is not null) _selected_left_pane.IsSelected = true;
            OnPropertyChanged(nameof(IsExplorerSelected));
            OnPropertyChanged(nameof(IsOutlineSelected));
            OnPropertyChanged(nameof(IsLeftPlaceholderSelected));
        }
    }

    /// <summary>true khi Left pane Explorer được chọn — hiện Project Explorer.</summary>
    public bool IsExplorerSelected => SelectedLeftPane?.Kind == ToolPaneKind.Explorer;

    /// <summary>true khi Left pane Outline được chọn.</summary>
    public bool IsOutlineSelected => SelectedLeftPane?.Kind == ToolPaneKind.Outline;

    /// <summary>Pane left chưa có view thật — hiện placeholder DockPanelHost.</summary>
    public bool IsLeftPlaceholderSelected =>
        SelectedLeftPane is not null
        && SelectedLeftPane.Kind is not (ToolPaneKind.Explorer or ToolPaneKind.Outline);

    public bool IsPropertiesSelected => SelectedRightPane?.Kind == ToolPaneKind.Properties;
    public bool IsToolboxSelected => SelectedRightPane?.Kind == ToolPaneKind.Toolbox;
    public bool IsInsightSelected => SelectedRightPane?.Kind == ToolPaneKind.Insight;
    public bool IsSymbolInfoSelected => SelectedRightPane?.Kind == ToolPaneKind.SymbolInfo;
    public bool IsRightPlaceholderSelected =>
        SelectedRightPane is not null
        && SelectedRightPane.Kind is not (
            ToolPaneKind.Properties or ToolPaneKind.Toolbox
            or ToolPaneKind.Insight or ToolPaneKind.SymbolInfo);

    public bool IsXmlBottomSelected => SelectedBottomPane?.Kind == ToolPaneKind.Xml;
    public bool IsOutputSelected => SelectedBottomPane?.Kind == ToolPaneKind.Output;
    public bool IsProblemsSelected => SelectedBottomPane?.Kind == ToolPaneKind.Problems;
    public bool IsErrorListSelected => SelectedBottomPane?.Kind == ToolPaneKind.ErrorList;
    public bool IsReferencesSelected => SelectedBottomPane?.Kind == ToolPaneKind.References;
    public bool IsLogSelected => SelectedBottomPane?.Kind == ToolPaneKind.Log;
    public bool IsBottomPlaceholderSelected =>
        SelectedBottomPane is not null
        && SelectedBottomPane.Kind is not (
            ToolPaneKind.Xml or ToolPaneKind.Output or ToolPaneKind.Problems
            or ToolPaneKind.ErrorList or ToolPaneKind.References or ToolPaneKind.Log);

    public ToolPaneVm? SelectedRightPane
    {
        get => _selected_right_pane;
        set
        {
            if (_selected_right_pane is not null) _selected_right_pane.IsSelected = false;
            if (!SetProperty(ref _selected_right_pane, value)) return;
            if (_selected_right_pane is not null) _selected_right_pane.IsSelected = true;
            OnPropertyChanged(nameof(IsPropertiesSelected));
            OnPropertyChanged(nameof(IsToolboxSelected));
            OnPropertyChanged(nameof(IsInsightSelected));
            OnPropertyChanged(nameof(IsSymbolInfoSelected));
            OnPropertyChanged(nameof(IsRightPlaceholderSelected));
        }
    }

    public ToolPaneVm? SelectedBottomPane
    {
        get => _selected_bottom_pane;
        set
        {
            if (_selected_bottom_pane is not null) _selected_bottom_pane.IsSelected = false;
            if (!SetProperty(ref _selected_bottom_pane, value)) return;
            if (_selected_bottom_pane is not null) _selected_bottom_pane.IsSelected = true;
            OnPropertyChanged(nameof(IsXmlBottomSelected));
            OnPropertyChanged(nameof(IsOutputSelected));
            OnPropertyChanged(nameof(IsProblemsSelected));
            OnPropertyChanged(nameof(IsErrorListSelected));
            OnPropertyChanged(nameof(IsReferencesSelected));
            OnPropertyChanged(nameof(IsLogSelected));
            OnPropertyChanged(nameof(IsBottomPlaceholderSelected));
        }
    }

    public bool IsLeftDockOpen
    {
        get => _is_left_dock_open;
        private set => SetProperty(ref _is_left_dock_open, value);
    }

    public bool IsRightDockOpen
    {
        get => _is_right_dock_open;
        private set => SetProperty(ref _is_right_dock_open, value);
    }

    public bool IsBottomDockOpen
    {
        get => _is_bottom_dock_open;
        private set => SetProperty(ref _is_bottom_dock_open, value);
    }

    public string StatusReady
    {
        get => _status_ready;
        set => SetProperty(ref _status_ready, value);
    }

    public RelayCommand<DocumentItemVm> ActivateDocumentCommand { get; }
    public RelayCommand<DocumentItemVm> CloseDocumentCommand { get; }
    public RelayCommand<ToolPaneVm> SelectLeftPaneCommand { get; }
    public RelayCommand<ToolPaneVm> SelectRightPaneCommand { get; }
    public RelayCommand<ToolPaneVm> SelectBottomPaneCommand { get; }
    public RelayCommand ToggleLeftDockCommand { get; }
    public RelayCommand ToggleRightDockCommand { get; }
    public RelayCommand ToggleBottomDockCommand { get; }

    /// <summary>Mở hoặc kích hoạt document theo Id (thường = file path).</summary>
    public DocumentItemVm OpenOrActivate(string id, string title, ViewModelBase content, string? file_path = null)
    {
        var existing = Documents.FirstOrDefault(d =>
            string.Equals(d.Id, id, StringComparison.OrdinalIgnoreCase));
        if (existing is not null)
        {
            existing.Title = title;
            existing.FilePath = file_path ?? existing.FilePath;
            ActivateDocument(existing);
            return existing;
        }

        var doc = new DocumentItemVm
        {
            Id = id,
            Title = title,
            ContentVm = content,
            FilePath = file_path
        };
        Documents.Add(doc);
        ActivateDocument(doc);
        return doc;
    }

    public void ActivateDocument(DocumentItemVm? doc)
    {
        if (doc is null) return;
        foreach (var d in Documents)
            d.IsActive = d == doc;
        ActiveDocument = doc;
    }

    public void CloseDocument(DocumentItemVm? doc)
    {
        if (doc is null) return;
        var idx = Documents.IndexOf(doc);
        if (idx < 0) return;
        Documents.RemoveAt(idx);
        if (ActiveDocument == doc)
        {
            ActiveDocument = Documents.Count == 0
                ? null
                : Documents[Math.Clamp(idx, 0, Documents.Count - 1)];
            if (ActiveDocument is not null)
                ActivateDocument(ActiveDocument);
        }
    }

    private void SeedPlaceholderPanes()
    {
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Explorer", ToolPaneKind.Explorer, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Outline", ToolPaneKind.Outline, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Snippet", ToolPaneKind.Snippet, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Recent", ToolPaneKind.RecentFiles, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Favorites", ToolPaneKind.Favorites, 2));
        LeftPanes[0].PlaceholderMessage = string.Empty;
        LeftPanes[1].PlaceholderMessage = string.Empty;
        SelectedLeftPane = LeftPanes[0];

        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Insight", ToolPaneKind.Insight, 3));
        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Symbol Info", ToolPaneKind.SymbolInfo, 3));
        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Properties", ToolPaneKind.Properties, 3));
        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Toolbox", ToolPaneKind.Toolbox, 3));
        SelectedRightPane = RightPanes[0];
        foreach (var pane in RightPanes.Take(4))
            pane.PlaceholderMessage = string.Empty;

        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Problems", ToolPaneKind.Problems, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Output", ToolPaneKind.Output, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("References", ToolPaneKind.References, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Log", ToolPaneKind.Log, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("XML", ToolPaneKind.Xml, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Search", ToolPaneKind.SearchResult, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("AI", ToolPaneKind.Ai, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Git", ToolPaneKind.Git, 4));
        foreach (var p in BottomPanes.Take(4))
            p.PlaceholderMessage = string.Empty;
        SelectedBottomPane = BottomPanes[0];
    }

    private void ToggleDock(DockRegion region)
    {
        _dock.Toggle(region);
        SyncDockFlags();
    }

    private void SyncDockFlags()
    {
        IsLeftDockOpen = _dock.IsVisible(DockRegion.Left);
        IsRightDockOpen = _dock.IsVisible(DockRegion.Right);
        IsBottomDockOpen = _dock.IsVisible(DockRegion.Bottom);
    }
}
