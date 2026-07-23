namespace UI.ViewModels;

/// <summary>
/// Dữ liệu Content Widget hover Monaco.
/// <paramref name="Name"/> = tiêu đề; <paramref name="Value"/> = body;
/// <paramref name="Kind"/> = nhãn loại (Entity, g.$a, FBO JS, SQL…).
/// </summary>
public sealed record EntityHoverView(
    string Name,
    string Value,
    bool IsError,
    string Kind = "Info");
