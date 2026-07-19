using System.Collections.Concurrent;
using System.Text.Json;

namespace DevWorkFlow.Editor.Bridge;

/// <summary>
/// Khớp Request (gửi đi, có Id) với Response (nhận về, cùng Id) qua kênh JSON bất đồng bộ
/// của WebView2. Thuần logic, không phụ thuộc WebView2 — kiểm thử được không cần WebView2 thật.
/// </summary>
public sealed class EditorRequestCorrelator
{
    private readonly ConcurrentDictionary<string, TaskCompletionSource<JsonElement?>> _pending = new();

    /// <summary>Đăng ký chờ Response cho một RequestId. Gọi trước khi gửi Request đi.</summary>
    public Task<JsonElement?> RegisterAsync(string request_id, CancellationToken cancellation_token = default)
    {
        var tcs = new TaskCompletionSource<JsonElement?>(TaskCreationOptions.RunContinuationsAsynchronously);
        if (!_pending.TryAdd(request_id, tcs))
            throw new InvalidOperationException($"RequestId đã tồn tại: {request_id}");

        if (cancellation_token.CanBeCanceled)
        {
            cancellation_token.Register(() => Fail(request_id, "Request bị huỷ (CancellationToken)."));
        }

        return tcs.Task;
    }

    /// <summary>Khớp một Response nhận từ JS với Request đang chờ. Trả về false nếu không có Request nào khớp Id.</summary>
    public bool TryComplete(EditorHostResponse response)
    {
        if (string.IsNullOrEmpty(response.Id))
            return false;

        if (!_pending.TryRemove(response.Id, out var tcs))
            return false;

        if (!string.IsNullOrEmpty(response.Error))
            tcs.TrySetException(new EditorBridgeException(response.Error));
        else
            tcs.TrySetResult(response.Result);

        return true;
    }

    /// <summary>Đánh dấu một Request thất bại thủ công (ví dụ WebView2 chưa sẵn sàng, timeout ở tầng gọi).</summary>
    public void Fail(string request_id, string reason)
    {
        if (_pending.TryRemove(request_id, out var tcs))
            tcs.TrySetException(new EditorBridgeException(reason));
    }

    /// <summary>Số Request đang chờ Response — dùng để phát hiện rò rỉ (Request không bao giờ được trả lời).</summary>
    public int PendingCount => _pending.Count;
}
