namespace DevWorkFlow.Application.Skin;

/// <summary>
/// Kết quả tìm vùng host (nơi Designer sẽ nhúng form) trong shell đã capture.
/// <see cref="Found"/>: đã khớp một selector FBO và đã chèn placeholder.
/// <see cref="NotFound"/>: không selector nào khớp — vẫn lưu shell thô, cần cập nhật heuristic/override sau.
/// </summary>
public enum HostStatus
{
    NotFound = 0,
    Found = 1
}

/// <summary>Phân loại asset để thống kê (suy ra từ tag + phần mở rộng).</summary>
public enum SkinAssetKind
{
    Other = 0,
    Css,
    Script,
    Image,
    Icon
}

/// <summary>
/// Trạng thái resolve của một asset khi mirror từ Program.
/// <see cref="Resolved"/>: tìm thấy file dưới program_root và đã copy vào assets/.
/// <see cref="Unresolved"/>: URL ngoại vi (host khác), tài nguyên động (*.axd) hoặc không có file trên đĩa.
/// </summary>
public enum AssetResolveStatus
{
    Pending = 0,
    Resolved = 1,
    Unresolved = 2
}
