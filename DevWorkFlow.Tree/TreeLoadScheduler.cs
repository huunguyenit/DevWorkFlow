namespace DevWorkFlow.Tree;

/// <summary>Priority queue for background tree loads — Tree never spawns fire-and-forget Tasks ad hoc.</summary>
internal sealed class TreeLoadScheduler : IDisposable
{
    private readonly int _max_concurrent;
    private readonly SemaphoreSlim _gate;
    private readonly object _lock = new();
    private readonly LinkedList<(TreeLoadPriority Priority, Func<CancellationToken, Task> Work, TaskCompletionSource Tcs, CancellationToken Ct)> _queue = new();
    private int _running;
    private bool _disposed;

    public TreeLoadScheduler(int max_concurrent)
    {
        _max_concurrent = Math.Max(1, max_concurrent);
        _gate = new SemaphoreSlim(1, 1);
    }

    public async Task<T> EnqueueAsync<T>(
        TreeLoadPriority priority,
        Func<CancellationToken, Task<T>> work,
        CancellationToken cancellation_token)
    {
        var tcs = new TaskCompletionSource<T>(TaskCreationOptions.RunContinuationsAsynchronously);
        Func<CancellationToken, Task> wrapper = async ct =>
        {
            try
            {
                var result = await work(ct).ConfigureAwait(false);
                tcs.TrySetResult(result);
            }
            catch (OperationCanceledException)
            {
                tcs.TrySetCanceled(ct);
            }
            catch (Exception ex)
            {
                tcs.TrySetException(ex);
            }
        };

        var entry_tcs = new TaskCompletionSource(TaskCreationOptions.RunContinuationsAsynchronously);
        lock (_lock)
        {
            if (_disposed) throw new ObjectDisposedException(nameof(TreeLoadScheduler));

            LinkedListNode<(TreeLoadPriority, Func<CancellationToken, Task>, TaskCompletionSource, CancellationToken)>? insert_before = null;
            for (var n = _queue.First; n is not null; n = n.Next)
            {
                if (n.Value.Priority > priority)
                {
                    insert_before = n;
                    break;
                }
            }

            var item = (priority, wrapper, entry_tcs, cancellation_token);
            if (insert_before is null)
                _queue.AddLast(item);
            else
                _queue.AddBefore(insert_before, item);
        }

        Pump();
        await entry_tcs.Task.ConfigureAwait(false);
        return await tcs.Task.ConfigureAwait(false);
    }

    private void Pump()
    {
        while (true)
        {
            (TreeLoadPriority Priority, Func<CancellationToken, Task> Work, TaskCompletionSource Tcs, CancellationToken Ct) item;
            lock (_lock)
            {
                if (_disposed || _running >= _max_concurrent || _queue.Count == 0)
                    return;

                var node = _queue.First!;
                _queue.RemoveFirst();
                item = node.Value;
                _running++;
            }

            _ = RunOneAsync(item);
        }
    }

    private async Task RunOneAsync(
        (TreeLoadPriority Priority, Func<CancellationToken, Task> Work, TaskCompletionSource Tcs, CancellationToken Ct) item)
    {
        try
        {
            if (item.Ct.IsCancellationRequested)
            {
                item.Tcs.TrySetCanceled(item.Ct);
                return;
            }

            await item.Work(item.Ct).ConfigureAwait(false);
            item.Tcs.TrySetResult();
        }
        catch (OperationCanceledException)
        {
            item.Tcs.TrySetCanceled(item.Ct);
        }
        catch (Exception ex)
        {
            item.Tcs.TrySetException(ex);
        }
        finally
        {
            lock (_lock) _running--;
            Pump();
        }
    }

    public void Dispose()
    {
        lock (_lock)
        {
            _disposed = true;
            _queue.Clear();
        }

        _gate.Dispose();
    }
}
