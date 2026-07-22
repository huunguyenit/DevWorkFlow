namespace UI.Services;

/// <summary>
/// Mở form XML như document tab riêng (không dùng chung 1 FormBuilder singleton).
/// </summary>
public sealed class FormDocumentNavigator
{
    private Action<string, string, string, IEnumerable<string>?, bool, int>? _open;

    public void Attach(Action<string, string, string, IEnumerable<string>?, bool, int> open) =>
        _open = open;

    /// <param name="file_path">Id tab / đường dẫn file.</param>
    /// <param name="title">Tiêu đề tab.</param>
    /// <param name="raw_xml">XML raw (chưa expand) — hoặc để trống để reader load từ path.</param>
    /// <param name="target_offset">Offset (source) cần focus sau khi mở; -1 = không điều hướng.</param>
    public void Open(
        string file_path,
        string title,
        string? raw_xml = null,
        IEnumerable<string>? related_files = null,
        bool code_only = false,
        int target_offset = -1)
    {
        if (_open is null)
            throw new InvalidOperationException("FormDocumentNavigator chưa Attach.");
        _open(file_path, title, raw_xml ?? string.Empty, related_files, code_only, target_offset);
    }
}
