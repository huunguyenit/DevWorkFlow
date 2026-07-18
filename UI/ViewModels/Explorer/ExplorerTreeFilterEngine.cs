using System.Windows.Threading;
using UI.ViewModels.Base;

namespace UI.ViewModels.Explorer;

/// <summary>
/// Filter cây async + debounce — tránh treo UI khi PropertyChanged liên tục.
/// Chỉ chạy một apply tại một thời điểm (serialize) để gõ nhanh không race.
/// </summary>
public sealed class DebouncedTreeFilter : IDisposable
{
    private readonly DispatcherTimer _timer;
    private readonly Func<string, CancellationToken, Task> _apply_async;
    private CancellationTokenSource? _cts;
    private string _pending = string.Empty;
    private int _version;
    private Task _gate = Task.CompletedTask;

    public DebouncedTreeFilter(
        int debounce_ms,
        Func<string, CancellationToken, Task> apply_async)
    {
        _apply_async = apply_async;
        _timer = new DispatcherTimer(DispatcherPriority.Background)
        {
            Interval = TimeSpan.FromMilliseconds(Math.Max(50, debounce_ms))
        };
        _timer.Tick += async (_, _) =>
        {
            _timer.Stop();
            await RunPendingAsync();
        };
    }

    public void Schedule(string keyword)
    {
        _pending = keyword ?? string.Empty;
        _cts?.Cancel();
        _timer.Stop();
        _timer.Start();
    }

    public async Task FlushAsync()
    {
        _timer.Stop();
        await RunPendingAsync();
    }

    private async Task RunPendingAsync()
    {
        var version = ++_version;
        _cts?.Cancel();
        _cts?.Dispose();
        _cts = new CancellationTokenSource();
        var ct = _cts.Token;
        var keyword = _pending;

        // Serialize: chờ lượt trước xong rồi mới apply (tránh 2 filter sửa tree cùng lúc).
        var previous = _gate;
        var tcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
        _gate = tcs.Task;

        try
        {
            try
            {
                await previous.ConfigureAwait(true);
            }
            catch
            {
                // ignore
            }

            if (version != _version)
                return;

            try
            {
                await _apply_async(keyword, ct).ConfigureAwait(true);
            }
            catch (OperationCanceledException)
            {
                // ignore
            }
        }
        finally
        {
            tcs.TrySetResult();
        }
    }

    public void Dispose()
    {
        _timer.Stop();
        _cts?.Cancel();
        _cts?.Dispose();
    }
}

/// <summary>Index + visibility filter chạy background, cập nhật UI theo batch.</summary>
public static class ExplorerTreeFilterEngine
{
    public static List<FilterIndexItem> BuildIndex(IEnumerable<ExplorerTreeNodeVm> roots)
    {
        var result = new List<FilterIndexItem>();
        foreach (var root in roots)
            AddNode(root, parent_index: -1, result);
        return result;
    }

    private static void AddNode(
        ExplorerTreeNodeVm node,
        int parent_index,
        List<FilterIndexItem> result)
    {
        if (ExplorerTreeNodeMapper.IsLoadingPlaceholder(node))
            return;

        var current = result.Count;
        result.Add(new FilterIndexItem(node, parent_index, node.SearchText));
        foreach (var child in node.Children)
            AddNode(child, current, result);
    }

    public static bool[] CalculateVisibility(
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
            if (!item.SearchKey.Contains(keyword, StringComparison.OrdinalIgnoreCase))
                continue;

            var current = i;
            while (current >= 0 && !visible[current])
            {
                visible[current] = true;
                current = index[current].ParentIndex;
            }
        }

        return visible;
    }

    public static async Task ApplyVisibilityAsync(
        IReadOnlyList<FilterIndexItem> index,
        bool[] visible,
        string keyword,
        int batch_size,
        bool expand_matches,
        CancellationToken ct)
    {
        batch_size = Math.Max(40, batch_size);
        for (var i = 0; i < index.Count; i++)
        {
            ct.ThrowIfCancellationRequested();
            var item = index[i];
            if (item.Node.IsVisible != visible[i])
                item.Node.IsVisible = visible[i];

            if (expand_matches
                && !string.IsNullOrEmpty(keyword)
                && visible[i]
                && item.Node.Children.Count > 0
                && !item.Node.IsExpanded)
            {
                item.Node.IsExpanded = true;
            }

            if ((i + 1) % batch_size == 0)
                await Dispatcher.Yield(DispatcherPriority.Background);
        }
    }

    public static void PreloadChildren(ExplorerTreeNodeVm node)
    {
        if (ExplorerTreeNodeMapper.IsLoadingPlaceholder(node))
            return;

        if (node.EnsureChildren is not null && !node.ChildrenLoaded)
            node.EnsureChildren(node);

        foreach (var child in node.Children.ToList())
            PreloadChildren(child);
    }

    public sealed record FilterIndexItem(
        ExplorerTreeNodeVm Node,
        int ParentIndex,
        string SearchKey);
}
