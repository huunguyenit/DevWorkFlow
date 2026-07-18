using System.Collections.ObjectModel;
using System.IO;
using System.Windows;
using System.Windows.Threading;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;
using Microsoft.Win32;
using UI.Services;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>
/// Project Explorer — cây thư mục Program FBO.
/// Load async + filter debounce (không treo UI).
/// </summary>
public sealed class ProjectExplorerViewModel : ViewModelBase, IExplorerTreeSource, IDisposable
{
    private readonly IProgramSession _program_session;
    private readonly FormDocumentNavigator _form_navigator;
    private readonly NavigationViewModel _navigation_vm;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly AppConfigStore _config;
    private readonly DebouncedTreeFilter _filter;
    private readonly Dictionary<string, ExplorerNodeKind> _controller_folder_kinds;
    private readonly HashSet<string> _file_extensions;
    private readonly HashSet<string> _hidden_root_folders;

    private ExplorerTreeNodeVm? _selected_node;
    private string _filter_text = string.Empty;
    private string _program_title = "(chưa chọn Program)";
    private string _status_text = "Chọn Program để xem cây project";
    private bool _is_busy;
    private CancellationTokenSource? _load_cts;
    private List<ExplorerTreeFilterEngine.FilterIndexItem> _filter_index = [];
    private List<string>? _file_index;
    private string? _file_index_root;
    private readonly HashSet<ExplorerTreeNodeVm> _loading_nodes = new();
    private readonly Dictionary<ExplorerTreeNodeVm, Task> _loading_tasks = new();

    public ProjectExplorerViewModel(
        IProgramSession program_session,
        FormDocumentNavigator form_navigator,
        NavigationViewModel navigation_vm,
        SqlStudioNavigator sql_navigator,
        AppConfigStore config)
    {
        _program_session = program_session;
        _form_navigator = form_navigator;
        _navigation_vm = navigation_vm;
        _sql_navigator = sql_navigator;
        _config = config;

        _controller_folder_kinds = config.ControllerFolders
            .ToDictionary(f => f.Name, f => ExplorerTreeNodeMapper.ParseFolderKind(f.Kind),
                StringComparer.OrdinalIgnoreCase);
        _file_extensions = new HashSet<string>(
            config.Explorer.ExplorerFileExtensions,
            StringComparer.OrdinalIgnoreCase);
        _hidden_root_folders = new HashSet<string>(
            config.Explorer.HiddenRootFolders,
            StringComparer.OrdinalIgnoreCase);

        TreeRoots = [];
        SelectProgramCommand = new AsyncRelayCommand(SelectProgramAsync, () => !IsBusy);
        RefreshCommand = new AsyncRelayCommand(() => RebuildTreeAsync(), () => _program_session.Current is not null);

        _filter = new DebouncedTreeFilter(
            config.Explorer.FilterDebounceMs,
            ApplyFilterAsync);

        // Explorer rebuild qua LeftExplorerLoadCoordinator khi ProgramChanged.
    }

    public ObservableCollection<ExplorerTreeNodeVm> TreeRoots { get; }

    public ExplorerTreeNodeVm? SelectedNode
    {
        get => _selected_node;
        set => SetProperty(ref _selected_node, value);
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

    public string ProgramTitle
    {
        get => _program_title;
        private set => SetProperty(ref _program_title, value);
    }

    public string StatusText
    {
        get => _status_text;
        private set => SetProperty(ref _status_text, value);
    }

    public int ActivationDelayMs => _config.Explorer.ActivationDelayMs;

    public bool IsBusy
    {
        get => _is_busy;
        private set => SetProperty(ref _is_busy, value);
    }

    public AsyncRelayCommand SelectProgramCommand { get; }
    public AsyncRelayCommand RefreshCommand { get; }

    public void OnTreeNodeActivated(ExplorerTreeNodeVm node, bool is_double_click)
    {
        if (node.Tag is not ExplorerFileTag tag) return;

        if (tag.IsDirectory)
        {
            if (_config.Explorer.ExpandOnFolderClick)
            {
                EnsureChildren(node);
                node.IsExpanded = true;
            }
            return;
        }

        // File: chỉ mở khi double-click (single-click chỉ chọn).
        if (!is_double_click) return;
        OpenNode(node);
    }

    public void Dispose()
    {
        _filter.Dispose();
        _load_cts?.Cancel();
        _load_cts?.Dispose();
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
        if (string.IsNullOrWhiteSpace(path))
        {
            StatusText = "Không lấy được đường dẫn folder từ hộp thoại.";
            return;
        }

        path = Path.GetFullPath(path);
        if (!Directory.Exists(path))
        {
            StatusText = $"Thư mục không tồn tại: {path}";
            return;
        }

        IsBusy = true;
        StatusText = "Đang mở Program...";
        try
        {
            await _navigation_vm.LoadProgramAsync(path);
            // ProgramChanged sẽ rebuild Explorer + Database song song.
            if (TreeRoots.Count == 0)
                StatusText = "Không dựng được cây — kiểm tra đường dẫn folder.";
        }
        finally
        {
            IsBusy = false;
        }
    }

    public async Task RebuildTreeAsync(CancellationToken external_ct = default)
    {
        _load_cts?.Cancel();
        _load_cts = CancellationTokenSource.CreateLinkedTokenSource(external_ct);
        var ct = _load_cts.Token;

        var dispatcher = Application.Current?.Dispatcher;
        if (dispatcher is not null && !dispatcher.CheckAccess())
        {
            var tcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
            _ = dispatcher.InvokeAsync(async () =>
            {
                try
                {
                    await RebuildTreeAsync(ct);
                    tcs.TrySetResult();
                }
                catch (Exception ex)
                {
                    tcs.TrySetException(ex);
                }
            });
            await tcs.Task;
            return;
        }

        TreeRoots.Clear();
        _filter_index = [];
        _file_index = null;
        _file_index_root = null;

        var program = _program_session.Current;
        if (program is null)
        {
            ProgramTitle = "(chưa chọn Program)";
            StatusText = "Chọn Program để xem cây project";
            return;
        }

        ProgramTitle = string.IsNullOrWhiteSpace(program.DisplayTitle)
            ? program.ProgramName
            : program.DisplayTitle;

        if (!Directory.Exists(program.ProgramPath))
        {
            StatusText = $"Không tìm thấy: {program.ProgramPath}";
            return;
        }

        IsBusy = true;
        StatusText = "Đang dựng cây Explorer…";
        try
        {
            var program_title = ProgramTitle;
            var program_path = program.ProgramPath;
            var options = _config.Explorer;

            var root = ExplorerTreeNodeMapper.CreateFileNode(
                program_title,
                program_path,
                is_directory: true,
                ExplorerNodeKind.Project,
                options);
            root.EnsureChildren = EnsureChildren;
            root.IsExpanded = true;
            TreeRoots.Add(root);

            await EnsureChildrenAsync(root, ct).ConfigureAwait(true);

            ct.ThrowIfCancellationRequested();
            _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);

            StatusText = $"{program.ProgramPath}  ·  {_filter_index.Count} mục";
            if (!string.IsNullOrWhiteSpace(_filter_text))
                await _filter.FlushAsync();
        }
        catch (OperationCanceledException)
        {
            StatusText = "Đã hủy dựng cây Explorer.";
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi Explorer: {ex.Message}";
        }
        finally
        {
            IsBusy = false;
        }
    }

    private void EnsureChildren(ExplorerTreeNodeVm node) =>
        _ = EnsureChildrenAsync(node);

    private Task EnsureChildrenAsync(ExplorerTreeNodeVm node, CancellationToken ct = default)
    {
        if (node.Tag is not ExplorerFileTag tag || !tag.IsDirectory || node.ChildrenLoaded)
            return Task.CompletedTask;

        Task task;
        lock (_loading_tasks)
        {
            if (_loading_tasks.TryGetValue(node, out var inflight))
                return WaitInflightAsync(inflight, ct);

            task = LoadChildrenCoreAsync(node, tag, ct);
            _loading_tasks[node] = task;
        }

        return task;
    }

    private static async Task WaitInflightAsync(Task inflight, CancellationToken ct)
    {
        if (inflight.IsCompleted)
        {
            await inflight.ConfigureAwait(true);
            return;
        }

        var cancel_tcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
        await using var reg = ct.Register(() => cancel_tcs.TrySetCanceled(ct));
        var completed = await Task.WhenAny(inflight, cancel_tcs.Task).ConfigureAwait(true);
        if (completed == cancel_tcs.Task)
            ct.ThrowIfCancellationRequested();
        await inflight.ConfigureAwait(true);
    }

    private async Task LoadChildrenCoreAsync(
        ExplorerTreeNodeVm node,
        ExplorerFileTag tag,
        CancellationToken ct)
    {
        _loading_nodes.Add(node);
        try
        {
            var options = _config.Explorer;
            var children = await Task.Run(
                () => BuildChildrenList(tag, options, ct),
                ct).ConfigureAwait(true);

            ct.ThrowIfCancellationRequested();
            node.Children.Clear();
            foreach (var child in children)
            {
                if (child.Tag is ExplorerFileTag { IsDirectory: true })
                    child.EnsureChildren = EnsureChildren;
                node.Children.Add(child);
            }

            node.ChildrenLoaded = true;
        }
        catch (OperationCanceledException)
        {
            throw;
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi đọc thư mục: {ex.Message}";
        }
        finally
        {
            _loading_nodes.Remove(node);
            lock (_loading_tasks)
                _loading_tasks.Remove(node);
        }
    }

    private List<ExplorerTreeNodeVm> BuildChildrenList(
        ExplorerFileTag tag,
        ExplorerOptions options,
        CancellationToken ct)
    {
        var result = new List<ExplorerTreeNodeVm>();
        if (!Directory.Exists(tag.FullPath))
            return result;

        try
        {
            var dirs = Directory.EnumerateDirectories(tag.FullPath)
                .Select(d => new DirectoryInfo(d))
                .Where(d => !d.Name.StartsWith('.'))
                .OrderBy(d => PreferredOrder(d.Name, tag))
                .ThenBy(d => d.Name, StringComparer.OrdinalIgnoreCase);

            foreach (var dir in dirs)
            {
                ct.ThrowIfCancellationRequested();
                if (tag.Kind == ExplorerNodeKind.Project
                    && _hidden_root_folders.Contains(dir.Name))
                    continue;

                var kind = ResolveFolderKind(dir.Name, tag);
                result.Add(ExplorerTreeNodeMapper.CreateFileNode(
                    dir.Name,
                    dir.FullName,
                    is_directory: true,
                    kind,
                    options));
            }

            var files = Directory.EnumerateFiles(tag.FullPath)
                .Select(f => new FileInfo(f))
                .Where(f => IsExplorerFile(f.Name))
                .OrderBy(f => f.Name, StringComparer.OrdinalIgnoreCase);

            foreach (var file in files)
            {
                ct.ThrowIfCancellationRequested();
                var kind = ResolveFileKind(file, tag);
                result.Add(ExplorerTreeNodeMapper.CreateFileNode(
                    file.Name,
                    file.FullName,
                    is_directory: false,
                    kind,
                    options));
            }
        }
        catch (OperationCanceledException)
        {
            throw;
        }

        return result;
    }

    private int PreferredOrder(string name, ExplorerFileTag parent)
    {
        if (parent.Kind == ExplorerNodeKind.Project)
        {
            var preferred = _config.Explorer.PreferredRootFolders;
            var idx = Array.FindIndex(preferred,
                f => f.Equals(name, StringComparison.OrdinalIgnoreCase));
            return idx >= 0 ? idx : 100;
        }

        if (parent.Kind == ExplorerNodeKind.Controllers
            || Path.GetFileName(parent.FullPath).Equals("Controllers", StringComparison.OrdinalIgnoreCase))
        {
            var folder = _config.ControllerFolders.FirstOrDefault(f =>
                f.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
            return folder?.Order ?? 50;
        }

        return 0;
    }

    private ExplorerNodeKind ResolveFolderKind(string name, ExplorerFileTag parent)
    {
        if (name.Equals("Controllers", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Controllers;

        if (parent.Kind == ExplorerNodeKind.Controllers
            || Path.GetFileName(parent.FullPath).Equals("Controllers", StringComparison.OrdinalIgnoreCase))
        {
            if (_controller_folder_kinds.TryGetValue(name, out var kind))
                return kind;
        }

        if (name.Equals("Include", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Include;

        return ExplorerNodeKind.Folder;
    }

    private bool IsExplorerFile(string name) =>
        _file_extensions.Contains(Path.GetExtension(name));

    private static ExplorerNodeKind ResolveFileKind(FileInfo file, ExplorerFileTag parent)
    {
        var ext = file.Extension;
        if (ext.Equals(".f", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Encrypted;
        if (ext.Equals(".aspx", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Aspx;
        if (ext.Equals(".js", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Script;
        if (ext.Equals(".css", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Css;
        if (ext.Equals(".sql", StringComparison.OrdinalIgnoreCase))
            return ExplorerNodeKind.Script;

        if (ext.Equals(".xml", StringComparison.OrdinalIgnoreCase))
        {
            return parent.Kind switch
            {
                ExplorerNodeKind.Dir => ExplorerNodeKind.XmlForm,
                ExplorerNodeKind.Grid => ExplorerNodeKind.XmlGrid,
                ExplorerNodeKind.Filter => ExplorerNodeKind.XmlFilter,
                ExplorerNodeKind.Lookup => ExplorerNodeKind.XmlLookup,
                ExplorerNodeKind.Report => ExplorerNodeKind.XmlReport,
                _ => ExplorerNodeKind.OtherFile
            };
        }

        return ExplorerNodeKind.OtherFile;
    }

    private async Task ApplyFilterAsync(string raw, CancellationToken ct)
    {
        var keyword = raw.Trim();
        var min_len = _config.Explorer.FilterMinLength;

        if (!string.IsNullOrEmpty(keyword) && keyword.Length < min_len)
            return;

        var program = _program_session.Current;
        if (program is null || TreeRoots.Count == 0)
            return;

        if (string.IsNullOrEmpty(keyword))
        {
            _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);
            var all_visible = ExplorerTreeFilterEngine.CalculateVisibility(_filter_index, string.Empty, ct);
            await ExplorerTreeFilterEngine.ApplyVisibilityAsync(
                _filter_index, all_visible, string.Empty, 120, expand_matches: false, ct);
            StatusText = $"{program.ProgramPath}  ·  {_filter_index.Count} mục";
            return;
        }

        StatusText = $"Đang quét file \"{keyword}\"…";

        var root_path = program.ProgramPath;
        var file_index = await GetOrBuildFileIndexAsync(root_path, ct).ConfigureAwait(true);
        var max_hits = Math.Max(50, _config.Explorer.SearchMaxHits);
        var hits = file_index
            .Where(f => Path.GetFileName(f).Contains(keyword, StringComparison.OrdinalIgnoreCase))
            .Take(max_hits)
            .ToList();

        ct.ThrowIfCancellationRequested();

        for (var i = 0; i < hits.Count; i++)
        {
            ct.ThrowIfCancellationRequested();
            await EnsureFilePathInTreeAsync(hits[i], ct).ConfigureAwait(true);
            if ((i + 1) % 20 == 0)
                await Dispatcher.Yield(DispatcherPriority.Background);
        }

        ct.ThrowIfCancellationRequested();
        _filter_index = ExplorerTreeFilterEngine.BuildIndex(TreeRoots);

        var visible = await Task.Run(
            () => ExplorerTreeFilterEngine.CalculateVisibility(_filter_index, keyword, ct),
            ct).ConfigureAwait(true);

        ct.ThrowIfCancellationRequested();
        await ExplorerTreeFilterEngine.ApplyVisibilityAsync(
            _filter_index,
            visible,
            keyword,
            batch_size: 120,
            expand_matches: true,
            ct);

        var match_nodes = 0;
        for (var i = 0; i < _filter_index.Count; i++)
        {
            if (visible[i]) match_nodes++;
        }

        StatusText = $"Lọc \"{keyword}\" · {hits.Count} file · {match_nodes} node hiện";
    }

    private async Task<List<string>> GetOrBuildFileIndexAsync(string root_path, CancellationToken ct)
    {
        if (string.Equals(_file_index_root, root_path, StringComparison.OrdinalIgnoreCase)
            && _file_index is not null)
        {
            return _file_index;
        }

        var files = await Task.Run(
            () => ScanAllExplorerFiles(root_path, ct),
            ct).ConfigureAwait(true);

        _file_index_root = root_path;
        _file_index = files;
        return files;
    }

    private List<string> ScanAllExplorerFiles(string root_path, CancellationToken ct)
    {
        var results = new List<string>();
        if (!Directory.Exists(root_path)) return results;

        var options = new EnumerationOptions
        {
            RecurseSubdirectories = true,
            IgnoreInaccessible = true,
            AttributesToSkip = FileAttributes.ReparsePoint
        };

        foreach (var file in Directory.EnumerateFiles(root_path, "*.*", options))
        {
            ct.ThrowIfCancellationRequested();
            var name = Path.GetFileName(file);
            if (!IsExplorerFile(name)) continue;

            var relative = Path.GetRelativePath(root_path, file);
            var first = relative.Split(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar)[0];
            if (_hidden_root_folders.Contains(first)) continue;

            results.Add(file);
        }

        return results;
    }

    private async Task EnsureFilePathInTreeAsync(string file_path, CancellationToken ct)
    {
        if (TreeRoots.Count == 0) return;
        var root = TreeRoots[0];
        if (root.Tag is not ExplorerFileTag root_tag) return;

        var full = Path.GetFullPath(file_path);
        var root_full = Path.GetFullPath(root_tag.FullPath);
        if (!full.StartsWith(root_full, StringComparison.OrdinalIgnoreCase))
            return;

        var relative = Path.GetRelativePath(root_full, full);
        var parts = relative.Split(
            [Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar],
            StringSplitOptions.RemoveEmptyEntries);

        var current = root;
        await EnsureChildrenAsync(current, ct).ConfigureAwait(true);

        for (var i = 0; i < parts.Length; i++)
        {
            ct.ThrowIfCancellationRequested();
            var part = parts[i];
            var is_last = i == parts.Length - 1;
            var child = current.Children.FirstOrDefault(c =>
                !ExplorerTreeNodeMapper.IsLoadingPlaceholder(c)
                && c.Name.Equals(part, StringComparison.OrdinalIgnoreCase));

            if (child is null)
            {
                current.ChildrenLoaded = false;
                await EnsureChildrenAsync(current, ct).ConfigureAwait(true);
                child = current.Children.FirstOrDefault(c =>
                    !ExplorerTreeNodeMapper.IsLoadingPlaceholder(c)
                    && c.Name.Equals(part, StringComparison.OrdinalIgnoreCase));
            }

            if (child is null) return;

            if (!is_last)
            {
                await EnsureChildrenAsync(child, ct).ConfigureAwait(true);
                child.IsExpanded = true;
                current = child;
            }
        }
    }

    private void OpenNode(ExplorerTreeNodeVm? node)
    {
        if (node?.Tag is not ExplorerFileTag tag || tag.IsDirectory) return;

        var kind = tag.ToControllerKind() ?? ControllerFileKind.Other;

        if (kind == ControllerFileKind.Aspx
            || node.Name.Equals("main.aspx", StringComparison.OrdinalIgnoreCase))
        {
            StatusText = $"ASPX không hỗ trợ design: {node.Name}";
            return;
        }

        var ext = Path.GetExtension(tag.FullPath);
        if (ext.Equals(".sql", StringComparison.OrdinalIgnoreCase))
        {
            try
            {
                _sql_navigator.OpenFile(tag.FullPath);
                StatusText = tag.FullPath;
            }
            catch (Exception ex)
            {
                StatusText = $"Lỗi đọc SQL: {ex.Message}";
                MessageBox.Show(ex.Message, "SQL Studio", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return;
        }

        var is_form_source = ext.Equals(".xml", StringComparison.OrdinalIgnoreCase)
                             || ext.Equals(".f", StringComparison.OrdinalIgnoreCase);
        if (!is_form_source)
        {
            StatusText = $"Chưa hỗ trợ mở: {node.Name}";
            return;
        }

        try
        {
            var label = kind switch
            {
                ControllerFileKind.Dir => "Dir",
                ControllerFileKind.Grid => "Grid",
                ControllerFileKind.Filter => "Filter",
                ControllerFileKind.Lookup => "Lookup",
                ControllerFileKind.Report => "Report",
                _ => "XML"
            };
            var title = $"{label}: {node.Name}";
            var code_only = FormBuilderViewModel.IsCodeOnlyPath(tag.FullPath);
            _form_navigator.Open(tag.FullPath, title, raw_xml: null, related_files: null, code_only);
            StatusText = tag.FullPath;
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi đọc file: {ex.Message}";
            MessageBox.Show(ex.Message, "FBO Studio", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
