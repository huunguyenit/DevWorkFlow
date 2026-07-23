using System.IO;
using DevWorkFlow.Domain.Language;
using UI.ViewModels;

namespace UI.Services;

/// <summary>
/// Yêu cầu mở một document SQL. Dùng record thay vì thêm tham số vị trí — Phase 5 cần thêm
/// "chọn CSDL App/Sys" và "chạy ngay sau khi mở", danh sách positional dài rất dễ truyền lệch.
/// </summary>
public sealed record SqlOpenRequest
{
    public required string Id { get; init; }

    public required string Title { get; init; }

    public required string Text { get; init; }

    /// <summary>File trên đĩa (mở từ file); null = buffer.</summary>
    public string? FilePath { get; init; }

    /// <summary>Chọn target theo Id cụ thể nếu biết.</summary>
    public string? PreferredTargetId { get; init; }

    /// <summary>Chọn target theo loại CSDL của controller (App vs Sys) khi không có Id.</summary>
    public ControllerDatabaseKind? PreferredKind { get; init; }

    /// <summary>Chạy script ngay sau khi mở (F5 từ Form Source).</summary>
    public bool ExecuteAfterOpen { get; init; }
}

/// <summary>
/// Điều phối mở document SQL (file hoặc buffer) — gắn handler từ MainViewModel.
/// </summary>
public sealed class SqlStudioNavigator
{
    private Action<SqlOpenRequest>? _open;
    private Action<SqlOpenRequest>? _run_inline;

    public void Attach(Action<SqlOpenRequest> open) => _open = open;

    /// <summary>
    /// Gắn đường chạy KHÔNG mở tab (F5 ở Form Source). Kết quả đi thẳng ra panel dưới dùng chung.
    /// </summary>
    public void AttachInlineRunner(Action<SqlOpenRequest> run) => _run_inline = run;

    public void OpenFile(string path)
    {
        if (string.IsNullOrWhiteSpace(path) || !File.Exists(path))
            throw new FileNotFoundException("Không tìm thấy file SQL.", path);

        _open?.Invoke(new SqlOpenRequest
        {
            Id = path,
            Title = Path.GetFileName(path),
            Text = File.ReadAllText(path),
            FilePath = path
        });
    }

    public void OpenBuffer(
        string id,
        string title,
        string text,
        string? preferred_target_id = null,
        bool execute_after_open = false,
        ControllerDatabaseKind? preferred_kind = null) =>
        _open?.Invoke(new SqlOpenRequest
        {
            Id = id,
            Title = title,
            Text = text ?? string.Empty,
            PreferredTargetId = preferred_target_id,
            PreferredKind = preferred_kind,
            ExecuteAfterOpen = execute_after_open
        });

    /// <summary>
    /// Chạy ngay một đoạn SQL mà KHÔNG mở tab. Không có inline runner thì rơi về mở tab + chạy
    /// (hành vi cũ) để lệnh không im lặng mất tác dụng.
    /// </summary>
    public void ExecuteInline(
        string id,
        string title,
        string text,
        ControllerDatabaseKind? preferred_kind = null,
        string? preferred_target_id = null)
    {
        var request = new SqlOpenRequest
        {
            Id = id,
            Title = title,
            Text = text ?? string.Empty,
            PreferredTargetId = preferred_target_id,
            PreferredKind = preferred_kind,
            ExecuteAfterOpen = true
        };

        if (_run_inline is not null)
            _run_inline(request);
        else
            _open?.Invoke(request);
    }
}
