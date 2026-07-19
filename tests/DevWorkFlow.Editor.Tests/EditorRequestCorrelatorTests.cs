using System.Text.Json;
using DevWorkFlow.Editor.Bridge;
using Xunit;

namespace DevWorkFlow.Editor.Tests;

public class EditorRequestCorrelatorTests
{
    [Fact]
    public async Task RegisterAsync_completes_when_matching_response_arrives()
    {
        var correlator = new EditorRequestCorrelator();
        var pending = correlator.RegisterAsync("req-1");

        using var doc = JsonDocument.Parse("""{"word":"ClientDefault"}""");
        var completed = correlator.TryComplete(new EditorHostResponse
        {
            Id = "req-1",
            Result = doc.RootElement.Clone()
        });

        Assert.True(completed);
        var result = await pending;
        Assert.True(result!.Value.TryGetProperty("word", out var word));
        Assert.Equal("ClientDefault", word.GetString());
    }

    [Fact]
    public async Task RegisterAsync_faults_when_response_has_error()
    {
        var correlator = new EditorRequestCorrelator();
        var pending = correlator.RegisterAsync("req-2");

        correlator.TryComplete(new EditorHostResponse { Id = "req-2", Error = "editor not ready" });

        var ex = await Assert.ThrowsAsync<EditorBridgeException>(() => pending);
        Assert.Equal("editor not ready", ex.Message);
    }

    [Fact]
    public void TryComplete_returns_false_for_unknown_id()
    {
        var correlator = new EditorRequestCorrelator();

        var completed = correlator.TryComplete(new EditorHostResponse { Id = "never-registered" });

        Assert.False(completed);
    }

    [Fact]
    public void TryComplete_returns_false_for_response_without_id()
    {
        var correlator = new EditorRequestCorrelator();
        correlator.RegisterAsync("req-3");

        var completed = correlator.TryComplete(new EditorHostResponse { Id = null });

        Assert.False(completed);
        Assert.Equal(1, correlator.PendingCount);
    }

    [Fact]
    public async Task Fail_faults_the_pending_request_with_the_given_reason()
    {
        var correlator = new EditorRequestCorrelator();
        var pending = correlator.RegisterAsync("req-4");

        correlator.Fail("req-4", "WebView2 chưa khởi tạo.");

        var ex = await Assert.ThrowsAsync<EditorBridgeException>(() => pending);
        Assert.Equal("WebView2 chưa khởi tạo.", ex.Message);
    }

    [Fact]
    public void RegisterAsync_throws_on_duplicate_id()
    {
        var correlator = new EditorRequestCorrelator();
        correlator.RegisterAsync("dup");

        Assert.Throws<InvalidOperationException>(() => { _ = correlator.RegisterAsync("dup"); });
    }

    [Fact]
    public async Task Cancellation_faults_the_pending_request()
    {
        var correlator = new EditorRequestCorrelator();
        using var cts = new CancellationTokenSource();
        var pending = correlator.RegisterAsync("req-5", cts.Token);

        cts.Cancel();

        await Assert.ThrowsAsync<EditorBridgeException>(() => pending);
    }

    [Fact]
    public void PendingCount_reflects_registered_and_completed_requests()
    {
        var correlator = new EditorRequestCorrelator();
        correlator.RegisterAsync("a");
        correlator.RegisterAsync("b");
        Assert.Equal(2, correlator.PendingCount);

        correlator.TryComplete(new EditorHostResponse { Id = "a" });
        Assert.Equal(1, correlator.PendingCount);
    }
}
