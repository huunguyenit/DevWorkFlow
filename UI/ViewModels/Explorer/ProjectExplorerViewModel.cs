using System.IO;
using System.Windows;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Infrastructure.Tree;
using DevWorkFlow.Tree;
using Microsoft.Win32;
using UI.Services;
using UI.Tree;
using UI.ViewModels;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>
/// Project Explorer — chỉ qua DevWorkFlow.Tree + FileSystemDataSource (không dual TreeRoots).
/// </summary>
public sealed class ProjectExplorerViewModel : ViewModelBase, IAsyncDisposable
{
    private readonly IProgramSession _program_session;
    private readonly FormDocumentNavigator _form_navigator;
    private readonly NavigationViewModel _navigation_vm;
    private readonly SqlStudioNavigator _sql_navigator;
    private readonly AppConfigStore _config;
    private readonly FileSystemDataSource _fs_source;
    private readonly TreeFrameworkHost _tree_host;
    private readonly Dictionary<string, ExplorerNodeKind> _controller_folder_kinds;

    private string _filter_text = string.Empty;
    private string _program_title = "(chưa chọn Program)";
    private string _status_text = "Chọn Program để xem cây project";
    private bool _is_busy;
    private CancellationTokenSource? _load_cts;

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

        var hidden = new HashSet<string>(config.Explorer.HiddenRootFolders, StringComparer.OrdinalIgnoreCase);
        var excluded = new HashSet<string>(
            config.Explorer.ExplorerFileExtensions
                .Where(ext => !string.IsNullOrWhiteSpace(ext)
                              && !ext.Equals(".*", StringComparison.Ordinal)),
            StringComparer.OrdinalIgnoreCase);

        _fs_source = new FileSystemDataSource(() =>
        {
            var explorer = _config.Explorer;
            return new FileSystemDataSourceOptions
            {
                HiddenRootFolders = hidden,
                ExcludedExtensions = excluded,
                SearchMaxHits = explorer.SearchMaxHits,
                PreferredRootFolders = explorer.PreferredRootFolders,
                HideDotFWhenXmlExistsFolders = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
                {
                    "Dir", "Grid", "Filter"
                },
                ResolveVisual = (full_path, is_directory) =>
                    TreeIconCatalog.ForExplorerPath(
                        full_path,
                        is_directory,
                        explorer.FileIcons,
                        explorer.FolderIcon,
                        explorer.FolderIconColor,
                        explorer.FileIcon,
                        explorer.FileIconColor)
            };
        });
        _tree_host = new TreeFrameworkHost(config.Explorer.FilterDebounceMs, ApplyTreeFilterAsync);

        SelectProgramCommand = new AsyncRelayCommand(SelectProgramAsync, () => !IsBusy);
        RefreshCommand = new AsyncRelayCommand(() => RebuildTreeAsync(), () => _program_session.Current is not null);
    }

    public TreeRenderingEngine? TreeRendering => _tree_host.Rendering;

    public string FilterText
    {
        get => _filter_text;
        set
        {
            if (!SetProperty(ref _filter_text, value)) return;
            _tree_host.FilterText = value;
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
        private set
        {
            if (!SetProperty(ref _status_text, value)) return;
            _tree_host.StatusText = value;
        }
    }

    public int ActivationDelayMs => _config.Explorer.ActivationDelayMs;

    public bool IsBusy
    {
        get => _is_busy;
        private set => SetProperty(ref _is_busy, value);
    }

    public AsyncRelayCommand SelectProgramCommand { get; }
    public AsyncRelayCommand RefreshCommand { get; }

    public void OnTreeNodeActivated(TreeNode node, bool is_double_click)
    {
        if (node.Metadata is not FileSystemNodeMeta meta) return;

        if (meta.IsDirectory)
        {
            // Double-click: TreeControl đã ToggleExpand. Single-click: chỉ expand (không collapse).
            if (!is_double_click && _config.Explorer.ExpandOnFolderClick)
                _ = _tree_host.Engine?.ExpandAsync(node.Id);
            return;
        }

        if (!is_double_click) return;
        OpenFilePath(meta.FullPath, node.DisplayName);
    }

    public async ValueTask DisposeAsync()
    {
        _load_cts?.Cancel();
        _load_cts?.Dispose();
        await _tree_host.DisposeAsync().ConfigureAwait(true);
    }

    public void Dispose() => _ = DisposeAsync().AsTask();

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
            if (_tree_host.Engine is null)
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

        var program = _program_session.Current;
        if (program is null)
        {
            ProgramTitle = "(chưa chọn Program)";
            StatusText = "Chọn Program để xem cây project";
            await _tree_host.DetachAsync().ConfigureAwait(true);
            OnPropertyChanged(nameof(TreeRendering));
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
        StatusText = "Đang load Explorer (lv1)…";
        try
        {
            _fs_source.SetRoot(program.ProgramPath);
            await _tree_host.AttachAsync(_fs_source, dispatcher, ct).ConfigureAwait(true);
            OnPropertyChanged(nameof(TreeRendering));

            var rows = _tree_host.Rendering?.Rows.Count ?? 0;
            StatusText = $"{program.ProgramPath}  ·  lv1: {rows} mục";
            if (!string.IsNullOrWhiteSpace(_filter_text))
                await ApplyTreeFilterAsync(_filter_text, ct).ConfigureAwait(true);
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

    private async Task ApplyTreeFilterAsync(string raw, CancellationToken ct)
    {
        var keyword = raw.Trim();
        var engine = _tree_host.Engine;
        if (engine is null) return;

        if (string.IsNullOrEmpty(keyword)
            || keyword.Length < _config.Explorer.FilterMinLength)
        {
            engine.ClearSearchFilter();
            var program = _program_session.Current;
            if (program is not null)
                StatusText = program.ProgramPath;
            return;
        }

        StatusText = $"Đang quét file \"{keyword}\"…";
        try
        {
            var hits = await _fs_source.SearchAsync(keyword, ct).ConfigureAwait(true);
            if (ct.IsCancellationRequested
                || !string.Equals(keyword, _filter_text.Trim(), StringComparison.Ordinal))
                return;

            await engine.ApplySearchMatchesAsync(hits, ct).ConfigureAwait(true);
            if (ct.IsCancellationRequested
                || !string.Equals(keyword, _filter_text.Trim(), StringComparison.Ordinal))
                return;

            StatusText = $"Lọc \"{keyword}\" · {hits.Count} file";
        }
        catch (OperationCanceledException)
        {
            // Gõ tiếp — search cũ bị hủy, bỏ qua.
        }
    }

    private void OpenFilePath(string full_path, string display_name)
    {
        var kind = ResolveControllerKind(full_path);
        var ext = Path.GetExtension(full_path);

        // File nhị phân (Excel/Crystal Report/ảnh/thư viện...) editor không đọc được —
        // chặn theo config Explorer.BlockedOpenExtensions (explorer.json).
        if (_config.Explorer.BlockedOpenExtensions.Contains(ext, StringComparer.OrdinalIgnoreCase))
        {
            StatusText = $"File nhị phân, không mở được trong editor: {display_name}";
            return;
        }

        if (ext.Equals(".sql", StringComparison.OrdinalIgnoreCase))
        {
            try
            {
                _sql_navigator.OpenFile(full_path);
                StatusText = full_path;
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
            var label = kind switch
            {
                ControllerFileKind.Dir => "Dir",
                ControllerFileKind.Filter => "Filter",
                ControllerFileKind.Grid => "Grid",
                ControllerFileKind.Lookup => "Lookup",
                ControllerFileKind.Report => "Report",
                ControllerFileKind.Aspx => "Aspx",
                _ => "Form"
            };
            var title = $"{label}: {display_name}";
            // .xml/.f mở đầy đủ (Design/Insight); mọi file text khác (.aspx/.ent/.txt/
            // .js/.css...) mở dạng code-only.
            var is_form_source = ext.Equals(".xml", StringComparison.OrdinalIgnoreCase)
                                 || ext.Equals(".f", StringComparison.OrdinalIgnoreCase);
            var code_only = !is_form_source || FormBuilderViewModel.IsCodeOnlyPath(full_path);
            _form_navigator.Open(full_path, title, raw_xml: null, related_files: null, code_only);
            StatusText = full_path;
        }
        catch (Exception ex)
        {
            StatusText = $"Lỗi mở form: {ex.Message}";
            IdeMessage.Danger(ex.Message, "DevWorkFlow");
        }
    }

    private ControllerFileKind ResolveControllerKind(string full_path)
    {
        var dir = Path.GetFileName(Path.GetDirectoryName(full_path) ?? string.Empty);
        if (_controller_folder_kinds.TryGetValue(dir, out var mapped))
        {
            return mapped switch
            {
                ExplorerNodeKind.Dir or ExplorerNodeKind.XmlForm => ControllerFileKind.Dir,
                ExplorerNodeKind.Filter or ExplorerNodeKind.XmlFilter => ControllerFileKind.Filter,
                ExplorerNodeKind.Grid or ExplorerNodeKind.XmlGrid => ControllerFileKind.Grid,
                ExplorerNodeKind.Lookup or ExplorerNodeKind.XmlLookup => ControllerFileKind.Lookup,
                ExplorerNodeKind.Report or ExplorerNodeKind.XmlReport => ControllerFileKind.Report,
                ExplorerNodeKind.Aspx => ControllerFileKind.Aspx,
                _ => ControllerFileKind.Other
            };
        }

        return ControllerFileKind.Other;
    }
}
