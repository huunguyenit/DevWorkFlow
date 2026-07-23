namespace DevWorkFlow.Application.Language;

/// <summary>Một vị trí đã ghé: file + offset trên SOURCE (không phải buffer ClearText).</summary>
public readonly record struct NavigationHistoryEntry(string DocumentUri, int Offset)
{
    public bool IsValid => !string.IsNullOrWhiteSpace(DocumentUri) && Offset >= 0;

    public bool SamePlaceAs(NavigationHistoryEntry other) =>
        Offset == other.Offset
        && string.Equals(DocumentUri, other.DocumentUri, StringComparison.OrdinalIgnoreCase);
}

/// <summary>
/// Lịch sử caret cho Back / Forward (P6-01) — hai ngăn xếp kiểu trình duyệt.
///
/// <see cref="Push"/> ghi vị trí ĐANG RỜI ĐI (mỗi lần GoTo/NavigateToOffset/mở entity) và xoá
/// nhánh forward; <see cref="TryBack"/>/<see cref="TryForward"/> nhận vị trí hiện tại để đẩy sang
/// ngăn còn lại. Offset luôn tính trên source XML nên quay lại vẫn đúng chỗ dù người dùng đã đổi
/// giữa Source và Insight (buffer ClearText có toạ độ khác).
///
/// Thuần Application: không biết gì về tab, WPF hay Monaco — chỉ (file, offset).
/// </summary>
public sealed class NavigationHistory
{
    /// <summary>Sâu tối đa mỗi chiều; vượt thì bỏ mục CŨ nhất.</summary>
    public const int MaxDepth = 50;

    private readonly List<NavigationHistoryEntry> _back = [];
    private readonly List<NavigationHistoryEntry> _forward = [];

    public bool CanGoBack => _back.Count > 0;

    public bool CanGoForward => _forward.Count > 0;

    public IReadOnlyList<NavigationHistoryEntry> BackEntries => _back;

    public IReadOnlyList<NavigationHistoryEntry> ForwardEntries => _forward;

    /// <summary>
    /// Ghi vị trí vừa rời đi. Bỏ qua entry rỗng/offset âm và bỏ qua khi trùng đúng vị trí trên
    /// đỉnh (đổi Source↔Insight hay nhảy tại chỗ không tạo mục lịch sử ảo).
    /// </summary>
    public void Push(string document_uri, int offset)
    {
        var entry = new NavigationHistoryEntry(document_uri, offset);
        if (!entry.IsValid) return;
        if (_back.Count > 0 && _back[^1].SamePlaceAs(entry)) return;

        _back.Add(entry);
        _forward.Clear();
        TrimOldest(_back);
    }

    /// <summary>
    /// Lùi một bước. <paramref name="current"/> = vị trí đang đứng (đẩy sang forward để Ctrl+Shift+-
    /// quay lại được); truyền entry không hợp lệ thì chỉ lùi mà không ghi forward.
    /// </summary>
    public bool TryBack(NavigationHistoryEntry current, out NavigationHistoryEntry target)
    {
        target = default;
        if (_back.Count == 0) return false;

        target = Pop(_back);
        if (current.IsValid && !current.SamePlaceAs(target))
        {
            _forward.Add(current);
            TrimOldest(_forward);
        }
        return true;
    }

    public bool TryForward(NavigationHistoryEntry current, out NavigationHistoryEntry target)
    {
        target = default;
        if (_forward.Count == 0) return false;

        target = Pop(_forward);
        if (current.IsValid && !current.SamePlaceAs(target))
        {
            _back.Add(current);
            TrimOldest(_back);
        }
        return true;
    }

    public void Clear()
    {
        _back.Clear();
        _forward.Clear();
    }

    private static NavigationHistoryEntry Pop(List<NavigationHistoryEntry> stack)
    {
        var entry = stack[^1];
        stack.RemoveAt(stack.Count - 1);
        return entry;
    }

    private static void TrimOldest(List<NavigationHistoryEntry> stack)
    {
        while (stack.Count > MaxDepth)
            stack.RemoveAt(0);
    }
}
