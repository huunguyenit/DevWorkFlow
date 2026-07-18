using System.IO;
using UI.ViewModels;

namespace UI.Services;

/// <summary>
/// Điều phối mở document SQL (file hoặc buffer) — gắn handler từ MainViewModel.
/// </summary>
public sealed class SqlStudioNavigator
{
    private Action<string, string, string, string?, string?>? _open;

    public void Attach(Action<string, string, string, string?, string?> open) => _open = open;

    public void OpenFile(string path)
    {
        if (string.IsNullOrWhiteSpace(path) || !File.Exists(path))
            throw new FileNotFoundException("Không tìm thấy file SQL.", path);

        var text = File.ReadAllText(path);
        var title = Path.GetFileName(path);
        _open?.Invoke(path, title, text, path, null);
    }

    public void OpenBuffer(
        string id,
        string title,
        string text,
        string? preferred_target_id = null) =>
        _open?.Invoke(id, title, text ?? string.Empty, null, preferred_target_id);
}
