using System.Collections.ObjectModel;
using System.IO;
using System.Windows;
using System.Windows.Threading;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Services;
using Microsoft.Win32;
using UI.Services;
using UI.ViewModels.Base;
using UI.ViewModels.Explorer;

namespace UI.ViewModels;

/// <summary>
/// Sidebar: chọn Program → load wcommand → click menu (link) → hiện phân cấp file từ aspx/Controller.
/// </summary>
public class NavigationViewModel : ViewModelBase, IExplorerTreeSource
{
    private readonly INavigationService _nav;
    private readonly IWebConfigReader _web_config_reader;
    private readonly IMenuService _menu_service;
    private readonly IProgramSession _program_session;
    private readonly IEntityRepository _entity_repo;
    private readonly FormDocumentNavigator _form_navigator;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly IErpLanguageService _language_service;
    private readonly DispatcherTimer _filter_timer;
    private readonly UserSettingsStore _settings_store;
    private readonly int _filter_batch_size;
    private readonly int _activation_delay_ms;
    private CancellationTokenSource? _filter_cts;
    private IReadOnlyList<FilterIndexItem> _filter_index = [];
    private int _filter_version;

    private readonly Dictionary<MenuNodeViewModel, ExplorerTreeNodeVm> _menu_tree_map = new();
    private readonly HashSet<MenuNodeViewModel> _loading_menu_nodes = new();

    private MenuNodeViewModel? _selected_node;
    private bool _is_expanded = true;
    private bool _is_busy;
    private string _status_text = "Chưa chọn Program";
    private string _program_name = "(chưa chọn)";
    private string _filter_text = string.Empty;
    private string _pending_filter = string.Empty;

    public NavigationViewModel(
        INavigationService nav,
        IWebConfigReader web_config_reader,
        IMenuService menu_service,
        IProgramSession program_session,
        IEntityRepository entity_repo,
        FormDocumentNavigator form_navigator,
        UserSettingsStore settings_store,
        SqlStudioNavigator sql_navigator,
        IErpLanguageService language_service,
        AppConfigStore config)
    {
        _nav = nav;
        _web_config_reader = web_config_reader;
        _menu_service = menu_service;
        _program_session = program_session;
        _entity_repo = entity_repo;
        _form_navigator = form_navigator;
        _settings_store = settings_store;
        _sql_navigator = sql_navigator;
        _language_service = language_service;
        _filter_batch_size = Math.Max(40, config.Menu.FilterBatchSize);
        _activation_delay_ms = config.Explorer.ActivationDelayMs;

        MenuRoots = [];
        TreeRoots = [];

        _filter_timer = new DispatcherTimer(DispatcherPriority.Background)
        {
            Interval = TimeSpan.FromMilliseconds(Math.Max(50, config.Menu.FilterDebounceMs))
        };
        _filter_timer.Tick += FilterTimer_Tick;

        SelectProgramCommand = new AsyncRelayCommand(SelectProgramAsync, () => !IsBusy);
        RefreshMenuCommand = new AsyncRelayCommand(RefreshMenuAsync, () => !IsBusy && _program_session.Current is not null);
        OpenNodeCommand = new RelayCommand<MenuNodeViewModel>(OpenNode);
        OpenSqlFileCommand = new RelayCommand(OpenSqlFileDialog);
        ToggleSidebarCommand = new RelayCommand(() => IsExpanded = !IsExpanded);
    }

    /// <summary>Khôi phục Program lần cuối — gọi sau khi LeftExplorerLoadCoordinator đã gắn.</summary>
    public Task TryRestoreLastProgramAsync()
    {
        var last = _settings_store.Data.LastProgramPath;
        if (string.IsNullOrWhiteSpace(last) || !Directory.Exists(last))
            return Task.CompletedTask;
        return LoadProgramAsync(last);
    }

    public ObservableCollection<MenuNodeViewModel> MenuRoots { get; }
    public ObservableCollection<ExplorerTreeNodeVm> TreeRoots { get; }

    public void OnTreeNodeActivated(ExplorerTreeNodeVm node, bool is_double_click)
    {
        if (node.Tag is not MenuNodeViewModel menu_node) return;
        if (menu_node.IsSeparator) return;

        _selected_node = menu_node;
        OnPropertyChanged(nameof(SelectedNode));

        // File: chỉ mở khi double-click.
        if (menu_node.IsFileNode)
        {
            if (is_double_click)
                OpenNode(menu_node);
            return;
        }

        // Menu có link: load resource async — không rebuild cả cây.
        if (menu_node.IsMenuNode && menu_node.HasLink)
            _ = LoadMenuResourcesAsync(menu_node);
    }

    public MenuNodeViewModel? SelectedNode
    {
        get => _selected_node;
        set => SetProperty(ref _selected_node, value);
    }

    public bool IsExpanded
    {
        get => _is_expanded;
        set => SetProperty(ref _is_expanded, value);
    }

    public bool IsBusy
    {
        get => _is_busy;
        private set => SetProperty(ref _is_busy, value);
    }

    public string StatusText
    {
        get => _status_text;
        private set => SetProperty(ref _status_text, value);
    }

    public int ActivationDelayMs => _activation_delay_ms;

    public string ProgramName
    {
        get => _program_name;
        private set => SetProperty(ref _program_name, value);
    }

    public string FilterText
    {
        get => _filter_text;
        set
        {
            if (!SetProperty(ref _filter_text, value)) return;
            _pending_filter = value ?? string.Empty;
            _filter_cts?.Cancel();
            _filter_timer.Stop();
            _filter_timer.Start();
        }
    }

    public AsyncRelayCommand SelectProgramCommand { get; }
    public AsyncRelayCommand RefreshMenuCommand { get; }
    public RelayCommand<MenuNodeViewModel> OpenNodeCommand { get; }
    public RelayCommand OpenSqlFileCommand { get; }
    public RelayCommand ToggleSidebarCommand { get; }

    private async void FilterTimer_Tick(object? sender, EventArgs e)
    {
        _filter_timer.Stop();
        await ApplyFilterAsync(_pending_filter);
    }

    private async Task SelectProgramAsync()
    {
        var dialog = new OpenFolderDialog
        {
            Title = "Chọn thư mục Program FBO (thường chứa Web.config)"
        };
        if (Application.Current?.MainWindow is Window owner)
        {
            if (dialog.ShowDialog(owner) != true) return;
        }
        else if (dialog.ShowDialog() != true)
        {
            return;
        }

        var path = dialog.FolderName;
        if (string.IsNullOrWhiteSpace(path) || !Directory.Exists(path))
        {
            StatusText = "Không lấy được đường dẫn folder.";
            return;
        }

        await LoadProgramAsync(Path.GetFullPath(path));
    }

    public async Task LoadProgramAsync(string program_path)
    {
        if (string.IsNullOrWhiteSpace(program_path))
        {
            StatusText = "Đường dẫn Program trống.";
            return;
        }

        program_path = Path.GetFullPath(program_path);
        if (!Directory.Exists(program_path))
        {
            StatusText = $"Không tìm thấy thư mục: {program_path}";
            MessageBox.Show(StatusText, "FBO Studio", MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        IsBusy = true;
        StatusText = "Đang đọc Program...";
        try
        {
            ProgramContext program;
            try
            {
                program = _web_config_reader.Read(program_path);
            }
            catch (Exception web_ex)
            {
                // Vẫn mở folder để Explorer hiện cây FS — menu/SQL có thể không dùng được.
                program = new ProgramContext
                {
                    ProgramPath = program_path,
                    ProgramName = new DirectoryInfo(program_path).Name,
                    DisplayTitle = new DirectoryInfo(program_path).Name,
                    SysConnectionString = string.Empty,
                    AppConnectionString = string.Empty
                };
                StatusText = $"Đã mở folder (web.config: {web_ex.Message})";
            }

            // SetProgram → Explorer RebuildTree ngay (không chờ SQL menu).
            _program_session.SetProgram(program);
            _settings_store.AddRecentProgram(program.ProgramPath);
            ProgramName = string.IsNullOrWhiteSpace(program.DisplayTitle)
                ? program.ProgramName
                : program.DisplayTitle;

            if (string.IsNullOrWhiteSpace(program.SysConnectionString))
            {
                MenuRoots.Clear();
                StatusText = $"Program: {ProgramName} | Chưa có sysConnectionString — chỉ xem Explorer.";
                return;
            }

            // Resolve %Database từ sys.entity.cdata (1 sys — nhiều app)
            try
            {
                var apps = await _entity_repo.GetAppDatabasesAsync(program.SysConnectionString);
                AppConnectionResolver.ApplyAppDatabase(program, apps);
                _program_session.UpdateProgram(program);
                if (!string.IsNullOrWhiteSpace(program.AppDatabaseName))
                    StatusText = $"Program: {ProgramName} | App DB: {program.AppDatabaseName}";
            }
            catch (Exception ent_ex)
            {
                StatusText = $"Program: {ProgramName} | entity.cdata: {ent_ex.Message}";
            }

            StatusText = "Đang load menu wcommand...";
            try
            {
                var roots = await _menu_service.LoadMenuTreeAsync(program);

                _filter_timer.Stop();
                _filter_text = string.Empty;
                _pending_filter = string.Empty;
                OnPropertyChanged(nameof(FilterText));

                MenuRoots.Clear();
                foreach (var root in roots)
                    MenuRoots.Add(new MenuNodeViewModel(root));
                RebuildFilterIndex();
                RebuildTreeRoots();

                var app_info = string.IsNullOrWhiteSpace(program.AppDatabaseName)
                    ? ""
                    : $" | App: {program.AppDatabaseName}";
                StatusText = $"Program: {ProgramName}{app_info} | Menu: {CountNodes(MenuRoots)} mục";
            }
            catch (Exception menu_ex)
            {
                MenuRoots.Clear();
                TreeRoots.Clear();
                _menu_tree_map.Clear();
                StatusText = $"Program: {ProgramName} | Menu lỗi: {menu_ex.Message}";
                // Không MessageBox chặn — Explorer đã có cây; menu là phụ.
            }
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi: {ex.Message}";
            MessageBox.Show(
                $"Không mở được Program:\n{ex.Message}",
                "FBO Studio",
                MessageBoxButton.OK,
                MessageBoxImage.Error);
        }
        finally
        {
            IsBusy = false;
        }
    }

    private async Task RefreshMenuAsync()
    {
        var program = _program_session.Current;
        if (program is null || string.IsNullOrWhiteSpace(program.SysConnectionString))
            return;

        IsBusy = true;
        StatusText = "Đang refresh menu…";
        try
        {
            var roots = await _menu_service.LoadMenuTreeAsync(program);

            _filter_timer.Stop();
            _filter_text = string.Empty;
            _pending_filter = string.Empty;
            OnPropertyChanged(nameof(FilterText));

            MenuRoots.Clear();
            foreach (var root in roots)
                MenuRoots.Add(new MenuNodeViewModel(root));
            RebuildFilterIndex();
            RebuildTreeRoots();

            StatusText = $"Program: {ProgramName} | Menu: {CountNodes(MenuRoots)} mục";
        }
        catch (Exception ex)
        {
            StatusText = $"Menu lỗi: {ex.Message}";
        }
        finally
        {
            IsBusy = false;
        }
    }

    private void OpenNode(MenuNodeViewModel? node)
    {
        if (node is null || node.IsSeparator) return;

        if (node.IsFileNode && node.FileItem is not null)
        {
            OpenFile(node.FileItem);
            return;
        }

        if (node.IsMenuNode && node.HasLink && node.Node is not null)
            _ = LoadMenuResourcesAsync(node);
    }

    private async Task LoadMenuResourcesAsync(MenuNodeViewModel menu_node)
    {
        var program = _program_session.Current;
        if (program is null)
        {
            StatusText = "Chưa chọn Program.";
            return;
        }

        if (menu_node.ResourcesLoaded && menu_node.Children.Any(c => c.IsFileNode))
        {
            menu_node.IsExpanded = true;
            if (_menu_tree_map.TryGetValue(menu_node, out var existing))
                existing.IsExpanded = true;
            return;
        }

        if (!_loading_menu_nodes.Add(menu_node))
            return;

        StatusText = "Đang load file controller…";
        try
        {
            var menu_tree_node = menu_node.Node!;
            var bundle = await Task.Run(() => _menu_service.ResolveFromMenu(program, menu_tree_node))
                .ConfigureAwait(true);

            if (!string.IsNullOrWhiteSpace(bundle.ErrorMessage) && bundle.Files.Count == 0)
            {
                StatusText = bundle.ErrorMessage;
                MessageBox.Show(bundle.ErrorMessage, "DevWorkFlow", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            menu_node.AttachResourceFiles(bundle.Files);
            RebuildFilterIndex();
            SyncTreeNodeChildren(menu_node);

            var controller_label = string.IsNullOrWhiteSpace(bundle.ControllerName)
                ? "(không có Controller)"
                : bundle.ControllerName;

            StatusText = string.IsNullOrWhiteSpace(bundle.ErrorMessage)
                ? $"Controller: {controller_label} | {bundle.Files.Count} file(s)"
                : $"{bundle.ErrorMessage} | {bundle.Files.Count} file(s)";
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi load menu: {ex.Message}";
        }
        finally
        {
            _loading_menu_nodes.Remove(menu_node);
        }
    }

    /// <summary>Cập nhật children trên TreeRoots — không rebuild toàn bộ (tránh treo).</summary>
    private void SyncTreeNodeChildren(MenuNodeViewModel menu_node)
    {
        if (!_menu_tree_map.TryGetValue(menu_node, out var tree_node))
        {
            RebuildTreeRoots();
            return;
        }

        tree_node.Children.Clear();
        foreach (var child_menu in menu_node.Children)
        {
            if (child_menu.IsMenuNode
                && _menu_tree_map.TryGetValue(child_menu, out var existing))
            {
                tree_node.Children.Add(existing);
                continue;
            }

            var created = ExplorerTreeNodeMapper.FromMenuNode(child_menu);
            RegisterTreeMap(child_menu, created);
            tree_node.Children.Add(created);
        }

        tree_node.IsExpanded = true;
        menu_node.IsExpanded = true;
    }

    private void OpenFile(ControllerFileItem file_item)
    {
        // main.aspx không render design
        if (file_item.Kind == ControllerFileKind.Aspx
            && file_item.DisplayName.Equals("main.aspx", StringComparison.OrdinalIgnoreCase))
        {
            StatusText = $"Bỏ qua design: {file_item.RelativePath}";
            return;
        }

        if (file_item.Kind == ControllerFileKind.Aspx)
        {
            StatusText = $"ASPX không hỗ trợ design: {file_item.DisplayName}";
            return;
        }

        var ext = Path.GetExtension(file_item.FullPath);
        if (ext.Equals(".sql", StringComparison.OrdinalIgnoreCase))
        {
            try
            {
                _sql_navigator.OpenFile(file_item.FullPath);
                StatusText = file_item.RelativePath;
            }
            catch (Exception ex)
            {
                StatusText = $"Lỗi đọc SQL: {ex.Message}";
                MessageBox.Show(ex.Message, "SQL Studio", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return;
        }

        try
        {
            // Related files lấy từ ClearText projection của Language Service.
            var related = ResolveRelatedPaths(file_item).ToList();
            var title = $"{file_item.KindLabel}: {file_item.DisplayName}";
            var code_only = file_item.Kind is ControllerFileKind.Report
                                or ControllerFileKind.TemplateUpload
                                or ControllerFileKind.TemplateExcel
                                or ControllerFileKind.TemplateRpt
                            || FormBuilderViewModel.IsCodeOnlyPath(file_item.FullPath);

            _form_navigator.Open(file_item.FullPath, title, raw_xml: null, related, code_only);
            StatusText = file_item.RelativePath;
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi đọc file: {ex.Message}";
            MessageBox.Show(ex.Message, "DevWorkFlow", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    /// <summary>
    /// Sibling dưới cùng menu đã load + Grid/Filter suy ra từ XML hiện tại.
    /// </summary>
    private IEnumerable<string> ResolveRelatedPaths(ControllerFileItem file_item)
    {
        var paths = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        if (SelectedNode?.IsFileNode == true)
        {
            // Parent menu node chứa danh sách file
            var parent = FindParentMenu(SelectedNode);
            if (parent is not null)
            {
                foreach (var child in parent.Children.Where(c => c.IsFileNode && c.FileItem is not null))
                {
                    if (string.Equals(child.FileItem!.FullPath, file_item.FullPath, StringComparison.OrdinalIgnoreCase))
                        continue;
                    paths.Add(child.FileItem.FullPath);
                }
            }
        }

        // Bổ sung từ nội dung XML (Grid / showForm→Filter) nếu chưa có trong tree
        try
        {
            var program = _program_session.Current;
            if (program is null) return paths;

            var controllers_root = MenuService.ResolveControllersRoot(program.ProgramPath);
            if (controllers_root is null) return paths;

            var document_id = ErpDocumentId.FromPath(file_item.FullPath);
            var document = _language_service.GetDocument(document_id);
            document ??= _language_service.OpenDocument(file_item.FullPath);
            foreach (var related in ControllerRelatedFileResolver.FindRelated(document))
            {
                var folder = related.Kind == ControllerRelatedFileResolver.RelatedKind.Grid
                    ? "Grid"
                    : "Filter";
                var path = MenuService.FindControllerFile(controllers_root, folder, related.ControllerName);
                if (path is not null
                    && !string.Equals(path, file_item.FullPath, StringComparison.OrdinalIgnoreCase))
                    paths.Add(path);
            }
        }
        catch
        {
            // ignore parse errors
        }

        return paths;
    }

    private MenuNodeViewModel? FindParentMenu(MenuNodeViewModel file_node)
    {
        foreach (var root in MenuRoots)
        {
            var found = FindParentMenuRecursive(root, file_node);
            if (found is not null) return found;
        }
        return null;
    }

    private static MenuNodeViewModel? FindParentMenuRecursive(
        MenuNodeViewModel current,
        MenuNodeViewModel target)
    {
        if (current.Children.Contains(target))
            return current.IsMenuNode ? current : null;

        foreach (var child in current.Children)
        {
            var found = FindParentMenuRecursive(child, target);
            if (found is not null) return found;
        }

        return null;
    }

    private void OpenSqlFileDialog()
    {
        var program = _program_session.Current;
        var dialog = new OpenFileDialog
        {
            Title = "Open SQL File",
            Filter = "SQL files (*.sql)|*.sql|All files (*.*)|*.*",
            CheckFileExists = true
        };
        if (program is not null && Directory.Exists(program.ProgramPath))
            dialog.InitialDirectory = program.ProgramPath;

        if (dialog.ShowDialog() != true) return;

        try
        {
            _sql_navigator.OpenFile(dialog.FileName);
            StatusText = dialog.FileName;
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi đọc SQL: {ex.Message}";
            MessageBox.Show(ex.Message, "SQL Studio", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private async Task ApplyFilterAsync(string raw_keyword)
    {
        var keyword = raw_keyword?.Trim() ?? string.Empty;
        var version = ++_filter_version;

        _filter_cts?.Cancel();
        _filter_cts?.Dispose();
        _filter_cts = new CancellationTokenSource();
        var ct = _filter_cts.Token;

        // Snapshot chỉ chứa chuỗi cache; bước search không chạm WPF/ObservableCollection.
        var index = _filter_index;
        bool[] visible;
        try
        {
            visible = await Task.Run(
                () => CalculateFilterVisibility(index, keyword, ct),
                ct);
        }
        catch (OperationCanceledException)
        {
            return;
        }

        if (ct.IsCancellationRequested || version != _filter_version)
            return;

        // Cập nhật từng lô để Dispatcher xử lý phím mới giữa các lô.
        var batch_size = _filter_batch_size;
        for (var i = 0; i < index.Count; i++)
        {
            if (ct.IsCancellationRequested || version != _filter_version)
                return;

            var item = index[i];
            if (item.Node.IsVisible != visible[i])
                item.Node.IsVisible = visible[i];

            if (_menu_tree_map.TryGetValue(item.Node, out var tree_node))
            {
                if (tree_node.IsVisible != visible[i])
                    tree_node.IsVisible = visible[i];
            }

            if (string.IsNullOrEmpty(keyword) && item.Node.IsMenuNode)
            {
                var should_expand = item.Node.Node?.Level <= 1
                                    && !item.Node.IsSeparator;
                if (item.Node.IsExpanded != should_expand)
                    item.Node.IsExpanded = should_expand;
                if (_menu_tree_map.TryGetValue(item.Node, out tree_node)
                    && tree_node.IsExpanded != should_expand)
                    tree_node.IsExpanded = should_expand;
            }
            else if (!string.IsNullOrEmpty(keyword)
                     && visible[i]
                     && item.Node.IsMenuNode
                     && item.Node.Children.Count > 0
                     && !item.Node.IsExpanded)
            {
                item.Node.IsExpanded = true;
                if (_menu_tree_map.TryGetValue(item.Node, out tree_node))
                    tree_node.IsExpanded = true;
            }

            if ((i + 1) % batch_size == 0)
                await Dispatcher.Yield(DispatcherPriority.Background);
        }
    }

    private void RebuildFilterIndex()
    {
        var result = new List<FilterIndexItem>();
        foreach (var root in MenuRoots)
            AddToFilterIndex(root, parent_index: -1, result);
        _filter_index = result;
    }

    private void RebuildTreeRoots()
    {
        TreeRoots.Clear();
        _menu_tree_map.Clear();
        foreach (var root in MenuRoots)
        {
            var tree_root = ExplorerTreeNodeMapper.FromMenuNode(root);
            RegisterTreeMap(root, tree_root);
            TreeRoots.Add(tree_root);
        }
    }

    private void RegisterTreeMap(MenuNodeViewModel menu_node, ExplorerTreeNodeVm tree_node)
    {
        _menu_tree_map[menu_node] = tree_node;
        var child_count = Math.Min(menu_node.Children.Count, tree_node.Children.Count);
        for (var i = 0; i < child_count; i++)
            RegisterTreeMap(menu_node.Children[i], tree_node.Children[i]);
    }

    private static void AddToFilterIndex(
        MenuNodeViewModel node,
        int parent_index,
        List<FilterIndexItem> result)
    {
        var current_index = result.Count;
        var search_key = node.IsMenuNode
            ? string.Join(
                '\u001F',
                node.Title,
                node.SysId ?? string.Empty,
                node.WmenuId ?? string.Empty)
            : string.Empty;

        result.Add(new FilterIndexItem(
            node,
            parent_index,
            search_key,
            node.IsMenuNode && !node.IsSeparator));

        foreach (var child in node.Children)
            AddToFilterIndex(child, current_index, result);
    }

    private static bool[] CalculateFilterVisibility(
        IReadOnlyList<FilterIndexItem> index,
        string keyword,
        CancellationToken ct)
    {
        var visible = new bool[index.Count];
        if (string.IsNullOrEmpty(keyword))
        {
            Array.Fill(visible, true);
            return visible;
        }

        for (var i = 0; i < index.Count; i++)
        {
            ct.ThrowIfCancellationRequested();
            var item = index[i];
            if (!item.IsSearchable
                || !item.SearchKey.Contains(keyword, StringComparison.OrdinalIgnoreCase))
                continue;

            // Hiện node khớp và toàn bộ ancestor để giữ đúng nhánh cây.
            var current = i;
            while (current >= 0 && !visible[current])
            {
                visible[current] = true;
                current = index[current].ParentIndex;
            }
        }

        return visible;
    }

    private sealed record FilterIndexItem(
        MenuNodeViewModel Node,
        int ParentIndex,
        string SearchKey,
        bool IsSearchable);

    private static int CountNodes(IEnumerable<MenuNodeViewModel> nodes)
    {
        var count = 0;
        foreach (var n in nodes)
        {
            if (!n.IsMenuNode) continue;
            count++;
            count += CountNodes(n.Children);
        }
        return count;
    }
}
