using System.Windows;
using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;

namespace UI.Services;

/// <summary>
/// Payload kéo từ Toolbox (P6): control tạo field mới (TextBox-family), hoặc Tab* (mở dialog category).
/// (P5 field-L/I/D đã bỏ; <see cref="FieldName"/> giữ cho tương thích slot-move nội bộ nếu cần.)
/// </summary>
public sealed record DesignToolboxDragPayload(
    string? FieldName,
    FormViewCellKind Kind,
    string Label,
    bool IsNewControl = false,
    ToolboxControlKind? ControlKind = null,
    bool IsTab = false,
    string? TabKind = null)
{
    public static DesignToolboxDragPayload ExistingField(string field_name, FormViewCellKind kind, string label) =>
        new(field_name, kind, label);

    public static DesignToolboxDragPayload NewControl(ToolboxControlKind control_kind, string label) =>
        new(null, FormViewCellKind.Input, label, IsNewControl: true, ControlKind: control_kind);

    public static DesignToolboxDragPayload Tab(string tab_kind, string label) =>
        new(null, FormViewCellKind.Input, label, IsTab: true, TabKind: tab_kind);
}

/// <summary>
/// Cầu nối kéo-thả Toolbox (WPF) → Blueprint (WebView2). Hai view nằm ở hai dock khác nhau và WebView2 là
/// HWND riêng nên không dùng OLE <c>DragDrop.DoDragDrop</c>: Toolbox capture chuột rồi bơm toạ độ **màn hình**
/// qua broker; <c>DesignWebViewHost</c> đổi sang toạ độ CSS và gọi <c>window.__dwfToolbox</c> để vẽ ghost +
/// drop target trong trang (pixel của trang do trang sở hữu).
/// </summary>
public sealed class DesignToolboxDragBroker
{
    public static DesignToolboxDragBroker Current { get; } = new();

    public DesignToolboxDragPayload? Payload { get; private set; }

    public bool IsDragging => Payload is not null;

    public event Action<DesignToolboxDragPayload>? Started;
    public event Action<Point, DesignToolboxDragPayload>? Moved;
    public event Action<Point, DesignToolboxDragPayload>? Dropped;
    public event Action? Cancelled;

    public void Start(DesignToolboxDragPayload payload)
    {
        Payload = payload;
        Started?.Invoke(payload);
    }

    public void Move(Point screen_point)
    {
        if (Payload is not { } payload) return;
        Moved?.Invoke(screen_point, payload);
    }

    public void Drop(Point screen_point)
    {
        if (Payload is not { } payload) return;
        Payload = null;
        Dropped?.Invoke(screen_point, payload);
    }

    public void Cancel()
    {
        if (Payload is null) return;
        Payload = null;
        Cancelled?.Invoke();
    }
}
