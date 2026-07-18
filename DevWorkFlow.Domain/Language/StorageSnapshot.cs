namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Snapshot storage của một document (XML/.f/SQL text) — nguồn lossless tạm thời.
/// </summary>
public sealed class StorageSnapshot
{
    public string Path { get; init; } = string.Empty;

    /// <summary>Nội dung raw trên disk (chưa expand entity).</summary>
    public string RawText { get; init; } = string.Empty;

    /// <summary>Encoding gợi ý (UTF-8, …).</summary>
    public string EncodingName { get; init; } = "UTF-8";

    /// <summary>Phiên bản snapshot tăng khi reload/open lại.</summary>
    public int Version { get; init; }
}
