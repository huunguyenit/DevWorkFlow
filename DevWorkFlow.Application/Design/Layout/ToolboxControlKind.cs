namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Control trong palette Toolbox (P6). Tên khớp <c>id</c> trong <c>toolbox-controls.xml</c> để map bằng
/// <c>Enum.TryParse</c>. TextBox-family tạo <c>&lt;field&gt;</c> mới; Tab* tạo category qua dialog.
/// </summary>
public enum ToolboxControlKind
{
    TextBox,
    DateTime,
    Numeric,
    CheckBox,
    ComboBox,
    AutoComplete,
    Lookup,
    TabNormal,
    TabGrid,
    TabPost,
    TabList
}
