using DevWorkFlow.Application.Abstractions;
using UI.ViewModels.Explorer;

namespace UI.Services;

/// <summary>
/// Khi Program đổi: load Explorer + Database song song (Menu do NavigationViewModel).
/// Debounce để gom nhiều SetProgram liên tiếp thành một lần refresh.
/// </summary>
public sealed class LeftExplorerLoadCoordinator
{
    private readonly ProjectExplorerViewModel _explorer;
    private readonly DatabaseExplorerViewModel _database;
    private CancellationTokenSource? _cts;
    private int _refresh_version;

    public LeftExplorerLoadCoordinator(
        IProgramSession program_session,
        ProjectExplorerViewModel explorer,
        DatabaseExplorerViewModel database)
    {
        _explorer = explorer;
        _database = database;
        program_session.ProgramChanged += (_, _) => ScheduleRefresh();

        // Nếu Program đã set trước khi subscribe — vẫn rebuild Explorer/Database.
        if (program_session.Current is not null)
            ScheduleRefresh();
    }

    private void ScheduleRefresh()
    {
        var version = ++_refresh_version;
        _ = DebouncedRefreshAsync(version);
    }

    private async Task DebouncedRefreshAsync(int version)
    {
        await Task.Delay(120);
        if (version != _refresh_version) return;

        _cts?.Cancel();
        _cts = new CancellationTokenSource();
        var ct = _cts.Token;

        try
        {
            await Task.WhenAll(
                _explorer.RebuildTreeAsync(ct),
                _database.RefreshAfterProgramChangeAsync(ct));
        }
        catch (OperationCanceledException)
        {
            // ignore
        }
        catch (Exception ex)
        {
            try
            {
                IdeMessage.ShowException(ex, "Không làm mới Explorer/Database sau khi đổi Program.");
            }
            catch
            {
                // ignore
            }
        }
    }
}
