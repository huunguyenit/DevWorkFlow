namespace UI.Services;

/// <summary>Loại thông báo dùng chung trong IDE.</summary>
public enum IdeMessageKind
{
    /// <summary>Thông báo / thông tin.</summary>
    Info = 0,

    /// <summary>Cảnh báo — vẫn tiếp tục được nhưng cần chú ý.</summary>
    Warning = 1,

    /// <summary>Nguy hiểm / lỗi — thao tác thất bại.</summary>
    Danger = 2
}
