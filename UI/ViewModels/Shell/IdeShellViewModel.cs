using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Windows;
using System.Windows.Input;
using DevWorkFlow.Application.Shell;
using UI.Docking;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels.Shell;

/// <summary>
/// Shell IDE — điều phối chrome. Dock UX qua IDockManager; không tham chiếu AvalonDock.
/// </summary>
public sealed class IdeShellViewModel : ViewModelBase
{
    private DocumentItemVm? _active_document;
    private bool _is_left_top_open = true;
    private bool _is_left_bottom_open = true;
    private bool _is_center_bottom_open = true;
    private bool _is_right_top_open = true;
    private bool _is_right_bottom_open = true;
    private GridLength _bottom_band_height = new(180);
    private ToolPaneVm? _selected_left_pane;
    private ToolPaneVm? _selected_right_pane;
    private ToolPaneVm? _selected_bottom_pane;
    private string _status_ready = "Ready";

    public IdeShellViewModel(IDockManager dock_manager)
    {
        DockManager = dock_manager;
        DockManager.DockLayoutChanged += (_, _) => SyncDockFlags();
        DockManager.PanelPinned += (_, _) => SyncDockFlags();
        DockManager.PanelAutoHidden += (_, _) => SyncDockFlags();
        DockManager.PanelFloating += (_, _) => SyncDockFlags();
        DockManager.PanelClosed += (_, _) => SyncDockFlags();

        Documents = [];
        LeftPanes = [];
        RightPanes = [];
        BottomPanes = [];

        SeedPlaceholderPanes();

        ActivateDocumentCommand = new RelayCommand<DocumentItemVm>(ActivateDocument);
        CloseDocumentCommand = new RelayCommand<DocumentItemVm>(CloseDocument);
        TogglePinDocumentCommand = new RelayCommand<DocumentItemVm>(TogglePinDocument);
        CopyDocumentPathCommand = new RelayCommand<DocumentItemVm>(
            CopyDocumentPath,
            doc => doc is not null && DocumentTabPathHelper.CanCopyFullPath(doc.FilePath));
        RevealDocumentInExplorerCommand = new RelayCommand<DocumentItemVm>(
            RevealDocumentInExplorer,
            doc => doc is not null && DocumentTabPathHelper.CanRevealInExplorer(doc.FilePath));
        SelectLeftPaneCommand = new RelayCommand<ToolPaneVm>(p => SelectedLeftPane = p);
        SelectRightPaneCommand = new RelayCommand<ToolPaneVm>(p => SelectedRightPane = p);
        SelectBottomPaneCommand = new RelayCommand<ToolPaneVm>(p => SelectedBottomPane = p);

        ToggleLeftDockCommand = new RelayCommand(ToggleLeftColumn);
        ToggleRightDockCommand = new RelayCommand(ToggleRightColumn);
        ToggleBottomDockCommand = new RelayCommand(() => DockManager.TogglePin(DockPanelId.CenterBottom));

        SyncDockFlags();
    }

    public IDockManager DockManager { get; }

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

    public bool IsExplorerSelected => SelectedLeftPane?.Kind == ToolPaneKind.Explorer;
    public bool IsOutlineSelected => SelectedLeftPane?.Kind == ToolPaneKind.Outline;
    public bool IsLeftPlaceholderSelected =>
        SelectedLeftPane is not null
        && SelectedLeftPane.Kind is not (ToolPaneKind.Explorer or ToolPaneKind.Outline);

    public bool IsToolboxSelected => SelectedRightPane?.Kind == ToolPaneKind.Toolbox;
    public bool IsInsightSelected => SelectedRightPane?.Kind == ToolPaneKind.Insight;
    public bool IsSymbolInfoSelected => SelectedRightPane?.Kind == ToolPaneKind.SymbolInfo;
    public bool IsRightPlaceholderSelected =>
        SelectedRightPane is not null
        && SelectedRightPane.Kind is not (
            ToolPaneKind.Toolbox or ToolPaneKind.Insight or ToolPaneKind.SymbolInfo);

    public bool IsOutputSelected => SelectedBottomPane?.Kind == ToolPaneKind.Output;
    public bool IsProblemsSelected => SelectedBottomPane?.Kind == ToolPaneKind.Problems;
    public bool IsLogSelected => SelectedBottomPane?.Kind == ToolPaneKind.Log;
    public bool IsSearchResultSelected => SelectedBottomPane?.Kind == ToolPaneKind.SearchResult;
    public bool IsSqlResultSelected => SelectedBottomPane?.Kind == ToolPaneKind.SqlResult;
    public bool IsSqlMessageSelected => SelectedBottomPane?.Kind == ToolPaneKind.SqlMessage;
    public bool IsBottomPlaceholderSelected =>
        SelectedBottomPane is not null
        && SelectedBottomPane.Kind is not (
            ToolPaneKind.Problems
            or ToolPaneKind.SearchResult
            or ToolPaneKind.SqlResult or ToolPaneKind.SqlMessage);

    public ToolPaneVm? SelectedRightPane
    {
        get => _selected_right_pane;
        set
        {
            if (_selected_right_pane is not null) _selected_right_pane.IsSelected = false;
            if (!SetProperty(ref _selected_right_pane, value)) return;
            if (_selected_right_pane is not null) _selected_right_pane.IsSelected = true;
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
            OnPropertyChanged(nameof(IsOutputSelected));
            OnPropertyChanged(nameof(IsProblemsSelected));
            OnPropertyChanged(nameof(IsLogSelected));
            OnPropertyChanged(nameof(IsSearchResultSelected));
            OnPropertyChanged(nameof(IsSqlResultSelected));
            OnPropertyChanged(nameof(IsSqlMessageSelected));
            OnPropertyChanged(nameof(IsBottomPlaceholderSelected));
        }
    }

    public bool IsLeftTopOpen
    {
        get => _is_left_top_open;
        private set => SetProperty(ref _is_left_top_open, value);
    }

    public bool IsLeftBottomOpen
    {
        get => _is_left_bottom_open;
        private set => SetProperty(ref _is_left_bottom_open, value);
    }

    public bool IsCenterBottomOpen
    {
        get => _is_center_bottom_open;
        private set => SetProperty(ref _is_center_bottom_open, value);
    }

    public bool IsRightTopOpen
    {
        get => _is_right_top_open;
        private set => SetProperty(ref _is_right_top_open, value);
    }

    public bool IsRightBottomOpen
    {
        get => _is_right_bottom_open;
        private set => SetProperty(ref _is_right_bottom_open, value);
    }

    public bool IsLeftDockOpen =>
        DockManager.GetState(DockPanelId.LeftTop) != DockState.Hidden
        || DockManager.GetState(DockPanelId.LeftBottom) != DockState.Hidden;

    public bool IsRightDockOpen =>
        DockManager.GetState(DockPanelId.RightTop) != DockState.Hidden
        || DockManager.GetState(DockPanelId.RightBottom) != DockState.Hidden;

    public bool IsBottomDockOpen =>
        DockManager.GetState(DockPanelId.CenterBottom) != DockState.Hidden;

    public GridLength BottomBandHeight
    {
        get => _bottom_band_height;
        set => SetProperty(ref _bottom_band_height, value);
    }

    public string StatusReady
    {
        get => _status_ready;
        set => SetProperty(ref _status_ready, value);
    }

    public RelayCommand<DocumentItemVm> ActivateDocumentCommand { get; }
    public RelayCommand<DocumentItemVm> CloseDocumentCommand { get; }
    public RelayCommand<DocumentItemVm> TogglePinDocumentCommand { get; }
    public RelayCommand<DocumentItemVm> CopyDocumentPathCommand { get; }
    public RelayCommand<DocumentItemVm> RevealDocumentInExplorerCommand { get; }
    public RelayCommand<ToolPaneVm> SelectLeftPaneCommand { get; }
    public RelayCommand<ToolPaneVm> SelectRightPaneCommand { get; }
    public RelayCommand<ToolPaneVm> SelectBottomPaneCommand { get; }
    public RelayCommand ToggleLeftDockCommand { get; }
    public RelayCommand ToggleRightDockCommand { get; }
    public RelayCommand ToggleBottomDockCommand { get; }

    public DockState GetPanelState(DockPanelId panel_id) => DockManager.GetState(panel_id);

    public void ShowPanel(DockPanelId panel_id) => DockManager.Show(panel_id);

    public void AdjustBottomBandHeight(double delta) => DockManager.AdjustBottomBandHeight(delta);

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

    private static void TogglePinDocument(DocumentItemVm? doc)
    {
        if (doc is null) return;
        doc.IsPinned = !doc.IsPinned;
    }

    private static void CopyDocumentPath(DocumentItemVm? doc)
    {
        if (doc is null || !DocumentTabPathHelper.CanCopyFullPath(doc.FilePath)) return;
        Clipboard.SetText(doc.FilePath!);
    }

    private static void RevealDocumentInExplorer(DocumentItemVm? doc)
    {
        if (doc is null || !DocumentTabPathHelper.CanRevealInExplorer(doc.FilePath)) return;
        var path = doc.FilePath!;
        try
        {
            if (File.Exists(path))
            {
                Process.Start(new ProcessStartInfo
                {
                    FileName = "explorer.exe",
                    Arguments = DocumentTabPathHelper.BuildExplorerSelectArguments(path),
                    UseShellExecute = true
                });
            }
            else if (Directory.Exists(path))
            {
                Process.Start(new ProcessStartInfo
                {
                    FileName = "explorer.exe",
                    Arguments = path,
                    UseShellExecute = true
                });
            }
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Không mở được File Explorer.");
        }
    }

    public void SaveDockLayout() => DockManager.SaveLayout();

    private void SeedPlaceholderPanes()
    {
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Explorer", ToolPaneKind.Explorer, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Snippet", ToolPaneKind.Snippet, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Recent", ToolPaneKind.RecentFiles, 2));
        LeftPanes.Add(ToolPaneVm.CreatePlaceholder("Favorites", ToolPaneKind.Favorites, 2));
        LeftPanes[0].PlaceholderMessage = string.Empty;
        SelectedLeftPane = LeftPanes[0];

        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Insight", ToolPaneKind.Insight, 3));
        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Symbol Info", ToolPaneKind.SymbolInfo, 3));
        RightPanes.Add(ToolPaneVm.CreatePlaceholder("Toolbox", ToolPaneKind.Toolbox, 3));
        SelectedRightPane = RightPanes[0];
        foreach (var pane in RightPanes.Take(3))
            pane.PlaceholderMessage = string.Empty;

        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Problems", ToolPaneKind.Problems, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Result", ToolPaneKind.SqlResult, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Message", ToolPaneKind.SqlMessage, 4));
        BottomPanes.Add(ToolPaneVm.CreatePlaceholder("Search", ToolPaneKind.SearchResult, 4));
        foreach (var p in BottomPanes)
            p.PlaceholderMessage = string.Empty;
        SelectedBottomPane = BottomPanes[0];
    }

    private void ToggleLeftColumn()
    {
        var any_docked = IsExpanded(DockPanelId.LeftTop) || IsExpanded(DockPanelId.LeftBottom);
        if (any_docked)
        {
            DockManager.SetState(DockPanelId.LeftTop, DockState.AutoHide);
            DockManager.SetState(DockPanelId.LeftBottom, DockState.AutoHide);
        }
        else
        {
            DockManager.SetState(DockPanelId.LeftTop, DockState.Docked);
            DockManager.SetState(DockPanelId.LeftBottom, DockState.Docked);
        }
    }

    private void ToggleRightColumn()
    {
        var any_docked = IsExpanded(DockPanelId.RightTop) || IsExpanded(DockPanelId.RightBottom);
        if (any_docked)
        {
            DockManager.SetState(DockPanelId.RightTop, DockState.AutoHide);
            DockManager.SetState(DockPanelId.RightBottom, DockState.AutoHide);
        }
        else
        {
            DockManager.SetState(DockPanelId.RightTop, DockState.Docked);
            DockManager.SetState(DockPanelId.RightBottom, DockState.Docked);
        }
    }

    private void SyncDockFlags()
    {
        IsLeftTopOpen = IsExpanded(DockPanelId.LeftTop);
        IsLeftBottomOpen = IsExpanded(DockPanelId.LeftBottom);
        IsCenterBottomOpen = IsExpanded(DockPanelId.CenterBottom);
        IsRightTopOpen = IsExpanded(DockPanelId.RightTop);
        IsRightBottomOpen = IsExpanded(DockPanelId.RightBottom);
        BottomBandHeight = new GridLength(DockManager.BottomBandHeight);
        OnPropertyChanged(nameof(IsLeftDockOpen));
        OnPropertyChanged(nameof(IsRightDockOpen));
        OnPropertyChanged(nameof(IsBottomDockOpen));
    }

    private bool IsExpanded(DockPanelId panel_id) =>
        DockManager.GetState(panel_id) is DockState.Docked or DockState.Floating;
}
