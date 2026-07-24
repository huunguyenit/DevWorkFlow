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

/// <summary>Nút đáy IdeMessageBox: thông báo = OK; xác nhận = Y/N.</summary>
public enum IdeMessageButtons
{
    Ok = 0,
    YesNo = 1
}
