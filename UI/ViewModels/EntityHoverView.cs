namespace UI.ViewModels;

/// <summary>
/// Dữ liệu cho hover virtual view của entity (Content Widget trong Monaco).
/// <paramref name="Name"/> = <c>&amp;Entity;</c>; <paramref name="Value"/> = giá trị hiển thị.
/// </summary>
public sealed record EntityHoverView(string Name, string Value, bool IsError);
