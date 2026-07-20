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
using DevWorkFlow.Infrastructure.Tree;
using DevWorkFlow.Tree;
using Microsoft.Win32;
using UI.Services;
using UI.Tree;
using UI.ViewModels.Base;
using UI.ViewModels.Explorer;

namespace UI.ViewModels;

/// <summary>
/// Sidebar: chọn Program → load wcommand → click/expand menu (link)
/// → hiện file từ aspx/Controller (AspxControllerParser + ControllerRelatedFileResolver).
/// </summary>
public class NavigationViewModel : ViewModelBase
{
    private readonly INavigationService _nav;
    private readonly IWebConfigReader _web_config_reader;
    private readonly IMenuService _menu_service;
    private readonly IProgramSession _program_session;
    private readonly IEntityRepository _entity_repo;
    private readonly FormDocumentNavigator _form_navigator;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly IErpLanguageService _language_service;
    private readonly UserSettingsStore _settings_store;
    private readonly int _activation_delay_ms;
    private readonly string[] _blocked_open_extensions;
    private readonly CommandDataSource _command_source = new();
    private readonly TreeFrameworkHost _tree_host;
    private readonly HashSet<MenuNodeViewModel> _loading_menu_nodes = new();

    private MenuNodeViewModel? _selected_node;
    private bool _is_expanded = true;
    private bool _is_busy;
    private string _status_text = "Chưa chọn Program";
    private string _program_name = "(chưa chọn)";
    private string _filter_text = string.Empty;

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
        _activation_delay_ms = config.Explorer.ActivationDelayMs;
        _blocked_open_extensions = config.Explorer.BlockedOpenExtensions;
        _tree_host = new TreeFrameworkHost(config.Menu.FilterDebounceMs, ApplyTreeFilterAsync);

        MenuRoots = [];

        SelectProgramCommand = new AsyncRelayCommand(SelectProgramAsync, () => !IsBusy);
        RefreshMenuCommand = new AsyncRelayCommand(RefreshMenuAsync, () => !IsBusy && _program_session.Current is not null);
        OpenNodeCommand = new RelayCommand<MenuNodeViewModel>(OpenNode);
        OpenSqlFileCommand = new RelayCommand(OpenSqlFileDialog);
        ToggleSidebarCommand = new RelayCommand(() => IsExpanded = !IsExpanded);
    }

    public TreeRenderingEngine? TreeRendering => _tree_host.Rendering;
    public CommandDataSource CommandSource => _command_source;

    /// <summary>Khôi phục Program lần cuối — gọi sau khi LeftExplorerLoadCoordinator đã gắn.</summary>
    public Task TryRestoreLastProgramAsync()
    {
        var last = _settings_store.Data.LastProgramPath;
        if (string.IsNullOrWhiteSpace(last) || !Directory.Exists(last))
            return Task.CompletedTask;
        return LoadProgramAsync(last);
    }

    public ObservableCollection<MenuNodeViewModel> MenuRoots { get; }

    public void OnTreeNodeActivated(TreeNode node, bool is_double_click)
    {
        if (node.Metadata is not CommandNodeMeta { Source: MenuNodeViewModel menu_node }) return;
        if (menu_node.IsSeparator) return;

        _selected_node = menu_node;
        OnPropertyChanged(nameof(SelectedNode));

        if (menu_node.IsFileNode)
        {
            if (is_double_click)
                OpenNode(menu_node);
            return;
        }

        // Folder Kind (Dir/Grid/…) — chỉ expand, không mở file
        if (menu_node.IsKindFolder)
            return;

        if (menu_node.IsMenuNode && menu_node.HasLink)
            _ = LoadMenuResourcesAsync(menu_node);
    }

    /// <summary>
    /// Expand menu có link → resolve file controller trước khi hiện children.
    /// </summary>
    public void OnTreeNodeExpanding(TreeNode node)
    {
        if (node.Metadata is not CommandNodeMeta { Source: MenuNodeViewModel menu_node }) return;
        if (menu_node.IsSeparator || !menu_node.IsMenuNode || !menu_node.HasLink) return;
        if (menu_node.ResourcesLoaded) return;
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
        private set
        {
            if (!SetProperty(ref _status_text, value)) return;
            _tree_host.StatusText = value;
        }
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
            _tree_host.FilterText = value;
        }
    }

    public AsyncRelayCommand SelectProgramCommand { get; }
    public AsyncRelayCommand RefreshMenuCommand { get; }
    public RelayCommand<MenuNodeViewModel> OpenNodeCommand { get; }
    public RelayCommand OpenSqlFileCommand { get; }
    public RelayCommand ToggleSidebarCommand { get; }

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

    /// <summary>
    /// Mở Program: Web.config + wcommand (cây menu).
    /// File controller resolve khi click/expand menu có link → <see cref="LoadMenuResourcesAsync"/>
    /// → <c>IMenuService.ResolveFromMenu</c> (AspxControllerParser + ControllerRelatedFileResolver).
    /// </summary>
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
            IdeMessage.Warning(StatusText, "Mở Program");
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
                IdeMessage.Warning(
                    $"Không đọc được Web.config — chỉ mở thư mục để xem Explorer.\n\n{web_ex.Message}",
                    "Web.config");
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
                IdeMessage.Warning(
                    "Program chưa có sysConnectionString trong Web.config.\n"
                    + "Tab Menu cần kết nối Sys DB để load wcommand.\n"
                    + "Bạn vẫn dùng được Explorer với thư mục Program.",
                    "Menu chưa tải được");
                return;
            }

            // Resolve %Database từ sys.entity.cdata (1 sys — nhiều app)
            // Dùng probe timeout ngắn — chưa áp dụng commandTimeout dài
            var sys_ok = false;
            try
            {
                var apps = await _entity_repo.GetAppDatabasesAsync(program.SysConnectionString);
                AppConnectionResolver.ApplyAppDatabase(
                    program,
                    apps,
                    WebConfigReader.ConnectionProbeTimeoutSeconds);
                _program_session.UpdateProgram(program);
                sys_ok = true;
                if (!string.IsNullOrWhiteSpace(program.AppDatabaseName))
                    StatusText = $"Program: {ProgramName} | App DB: {program.AppDatabaseName}";
            }
            catch (Exception ent_ex)
            {
                StatusText = $"Program: {ProgramName} | entity.cdata: {ent_ex.Message}";
                IdeMessage.ShowException(
                    ent_ex,
                    "Không đọc được danh sách App DB từ sys (entity.cdata).\n"
                    + "Menu vẫn thử load từ Sys connection.",
                    IdeMessageKind.Warning);
            }

            StatusText = "Đang load menu wcommand...";
            try
            {
                var roots = await _menu_service.LoadMenuTreeAsync(program);

                _filter_text = string.Empty;
                OnPropertyChanged(nameof(FilterText));

                MenuRoots.Clear();
                foreach (var root in roots)
                    MenuRoots.Add(new MenuNodeViewModel(root));
                await SyncCommandTreeAsync().ConfigureAwait(true);

                // Kết nối Sys OK → mới gắn commandTimeout đầy đủ vào CS
                WebConfigReader.ApplyFullCommandTimeout(program);
                _program_session.UpdateProgram(program);

                var app_info = string.IsNullOrWhiteSpace(program.AppDatabaseName)
                    ? ""
                    : $" | App: {program.AppDatabaseName}";
                StatusText = $"Program: {ProgramName}{app_info} | Menu: {CountNodes(MenuRoots)} mục";
            }
            catch (Exception menu_ex)
            {
                MenuRoots.Clear();
                await _tree_host.DetachAsync().ConfigureAwait(true);
                OnPropertyChanged(nameof(TreeRendering));
                StatusText = $"Program: {ProgramName} | Menu lỗi: {menu_ex.Message}";

                // entity OK nhưng menu lỗi: vẫn giữ probe timeout (chưa chắc kết nối ổn)
                // Nếu entity đã OK và chỉ menu SQL lỗi, vẫn có thể promote — nhưng ưu tiên fail-fast
                if (sys_ok)
                {
                    // entity đã chứng minh CS đúng → có thể gắn full timeout cho các thao tác sau
                    WebConfigReader.ApplyFullCommandTimeout(program);
                    _program_session.UpdateProgram(program);
                }

                try
                {
                    IdeMessage.ShowException(
                        menu_ex,
                        "Không load được cây menu (wcommand).\n"
                        + "Kiểm tra kết nối Sys DB và bảng wcommand.");
                }
                catch
                {
                    // IdeMessage đã có fallback; không để crash vòng catch
                }
            }
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi: {ex.Message}";
            try
            {
                IdeMessage.ShowException(ex, "Không mở được Program.");
            }
            catch
            {
                // ignore
            }
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

            _filter_text = string.Empty;
            OnPropertyChanged(nameof(FilterText));

            MenuRoots.Clear();
            foreach (var root in roots)
                MenuRoots.Add(new MenuNodeViewModel(root));
            await SyncCommandTreeAsync().ConfigureAwait(true);

            StatusText = $"Program: {ProgramName} | Menu: {CountNodes(MenuRoots)} mục";
        }
        catch (Exception ex)
        {
            StatusText = $"Menu lỗi: {ex.Message}";
            IdeMessage.ShowException(
                ex,
                "Không refresh được cây menu (wcommand).\n"
                + "Kiểm tra kết nối Sys DB.");
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

    /// <summary>
    /// Resolve file gắn menu: aspx → Controller (AspxControllerParser)
    /// → Dir/Grid/Filter/… + related (ControllerRelatedFileResolver) qua IMenuService.ResolveFromMenu.
    /// </summary>
    private async Task LoadMenuResourcesAsync(MenuNodeViewModel menu_node)
    {
        var program = _program_session.Current;
        if (program is null)
        {
            StatusText = "Chưa chọn Program.";
            return;
        }

        if (menu_node.ResourcesLoaded && menu_node.Children.Any(c => c.IsKindFolder || c.IsFileNode))
        {
            menu_node.IsExpanded = true;
            return;
        }

        if (!_loading_menu_nodes.Add(menu_node))
            return;

        StatusText = "Đang load file controller…";
        try
        {
            var menu_tree_node = menu_node.Node!;
            // AspxControllerParser + ControllerRelatedFileResolver (trong MenuService)
            var bundle = await Task.Run(() => _menu_service.ResolveFromMenu(program, menu_tree_node))
                .ConfigureAwait(true);

            if (!string.IsNullOrWhiteSpace(bundle.ErrorMessage) && bundle.Files.Count == 0)
            {
                StatusText = bundle.ErrorMessage;
                IdeMessage.Warning(bundle.ErrorMessage, "Load controller");
                return;
            }

            menu_node.AttachResourceFiles(bundle.Files);
            await SyncCommandTreeAsync().ConfigureAwait(true);

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
            IdeMessage.ShowException(ex, "Không load được file controller gắn với menu.");
        }
        finally
        {
            _loading_menu_nodes.Remove(menu_node);
        }
    }

    private async Task SyncCommandTreeAsync()
    {
        TreeNodeAdapters.FillCommandDataSource(_command_source, MenuRoots);
        await _tree_host.AttachAsync(_command_source, Application.Current?.Dispatcher)
            .ConfigureAwait(true);
        OnPropertyChanged(nameof(TreeRendering));
        await RestoreExpandedStateAsync().ConfigureAwait(true);
        if (!string.IsNullOrWhiteSpace(_filter_text))
            await ApplyTreeFilterAsync(_filter_text, CancellationToken.None).ConfigureAwait(true);
    }

    /// <summary>
    /// Attach tạo engine mới (mất trạng thái expand). Khôi phục theo MenuNodeViewModel.IsExpanded / ResourcesLoaded
    /// để file controller vừa load vẫn hiện dưới menu.
    /// </summary>
    private async Task RestoreExpandedStateAsync()
    {
        var engine = _tree_host.Engine;
        if (engine is null) return;
        await RestoreExpandedLevelAsync(MenuRoots, parent: null, engine).ConfigureAwait(true);
    }

    private async Task RestoreExpandedLevelAsync(
        IReadOnlyList<MenuNodeViewModel> menus,
        TreeNode? parent,
        VirtualTreeEngine engine)
    {
        var tree_children = await _command_source.GetChildrenAsync(parent).ConfigureAwait(true);
        var count = Math.Min(menus.Count, tree_children.Count);
        for (var i = 0; i < count; i++)
        {
            var menu = menus[i];
            var node = tree_children[i];
            if (!menu.IsExpanded && !menu.ResourcesLoaded)
                continue;
            if (!node.HasChildren && !_command_source.HasChildren(node))
                continue;

            try
            {
                await engine.ExpandAsync(node.Id).ConfigureAwait(true);
            }
            catch
            {
                continue;
            }

            if (menu.Children.Count > 0)
                await RestoreExpandedLevelAsync(menu.Children, node, engine).ConfigureAwait(true);
        }
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

        var hits = await _command_source.SearchAsync(keyword, ct).ConfigureAwait(true);
        await engine.ApplySearchMatchesAsync(hits, ct, empty_hides_all: true, keep_descendants: true)
            .ConfigureAwait(true);
        StatusText = $"Lọc \"{keyword}\" · {hits.Count} mục";
    }

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

    private void OpenFile(ControllerFileItem file_item)
    {
        var ext = Path.GetExtension(file_item.FullPath);

        // File nhị phân (Excel/Crystal Report/ảnh/thư viện...) editor không đọc được —
        // chặn theo config Explorer.BlockedOpenExtensions. ASPX mở bình thường (code-only).
        if (_blocked_open_extensions.Contains(ext, StringComparer.OrdinalIgnoreCase))
        {
            StatusText = $"File nhị phân, không mở được trong editor: {file_item.DisplayName}";
            return;
        }
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
                IdeMessage.Danger(ex.Message, "SQL Studio");
            }
            return;
        }

        try
        {
            var related = ResolveRelatedPaths(file_item).ToList();
            var title = $"{file_item.KindLabel}: {file_item.DisplayName}";
            var is_form_source = ext.Equals(".xml", StringComparison.OrdinalIgnoreCase)
                                 || ext.Equals(".f", StringComparison.OrdinalIgnoreCase);
            var code_only = !is_form_source
                            || file_item.Kind is ControllerFileKind.Report
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
            IdeMessage.Danger(ex.Message, "Đọc file");
        }
    }

    private IEnumerable<string> ResolveRelatedPaths(ControllerFileItem file_item)
    {
        var paths = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        if (SelectedNode?.IsFileNode == true)
        {
            var parent = FindParentMenu(SelectedNode);
            if (parent is not null)
            {
                foreach (var child in parent.EnumerateFileNodes())
                {
                    if (child.FileItem is null) continue;
                    if (string.Equals(child.FileItem.FullPath, file_item.FullPath, StringComparison.OrdinalIgnoreCase))
                        continue;
                    paths.Add(child.FileItem.FullPath);
                }
            }
        }

        try
        {
            var program = _program_session.Current;
            if (program is null) return paths;

            var controllers_root = MenuService.ResolveControllersRoot(program.ProgramPath);
            if (controllers_root is null) return paths;

            var document_id = ErpDocumentId.FromPath(file_item.FullPath);
            var document = _language_service.GetDocument(document_id);
            document ??= _language_service.OpenDocument(file_item.FullPath);
            var parent_controller = file_item.ControllerName;
            var clear_text = document.GetProjection(ErpProjectionKind.ClearText).Text;
            foreach (var related in ControllerRelatedFileResolver.FindRelated(clear_text, parent_controller))
            {
                string? path = related.Kind switch
                {
                    ControllerRelatedFileResolver.RelatedKind.Grid =>
                        MenuService.FindControllerFile(controllers_root, "Grid", related.ControllerName),
                    ControllerRelatedFileResolver.RelatedKind.Filter =>
                        MenuService.FindControllerFile(controllers_root, "Filter", related.ControllerName),
                    ControllerRelatedFileResolver.RelatedKind.Upload =>
                        MenuService.FindTemplateAsset(controllers_root, "Upload", related.ControllerName, [".xml", ".f"]),
                    ControllerRelatedFileResolver.RelatedKind.UploadFromParent =>
                        MenuService.FindTemplateAsset(
                            controllers_root, "Upload",
                            string.IsNullOrWhiteSpace(parent_controller) ? related.ControllerName : parent_controller,
                            [".xml", ".f"]),
                    ControllerRelatedFileResolver.RelatedKind.Excel =>
                        MenuService.FindTemplateAsset(controllers_root, "Excel", related.ControllerName, [".xlsx", ".xls", ".xml"]),
                    ControllerRelatedFileResolver.RelatedKind.Rpt =>
                        MenuService.FindTemplateAsset(controllers_root, "Rpt", related.ControllerName, [".rpt"]),
                    _ => null
                };

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
        foreach (var child in current.Children)
        {
            if (ReferenceEquals(child, target))
                return current.IsMenuNode ? current : null;

            // Menu → KindFolder → File
            if (child.IsKindFolder && child.Children.Contains(target))
                return current.IsMenuNode ? current : null;

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
            IdeMessage.Danger(ex.Message, "SQL Studio");
        }
    }
}
