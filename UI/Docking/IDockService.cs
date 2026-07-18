namespace UI.Docking;

/// <summary>
/// Dịch vụ dock tối giản (Grid + splitter). Bước sau có thể thay bằng AvalonDock
/// mà không đổi ViewModel gọi Show/Hide.
/// </summary>
public interface IDockService
{
    bool IsVisible(DockRegion region);
    void Show(DockRegion region);
    void Hide(DockRegion region);
    void Toggle(DockRegion region);
    event EventHandler? LayoutChanged;
}
