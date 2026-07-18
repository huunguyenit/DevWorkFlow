namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Profile metadata theo phiên bản ERP (không hard-code trong binder).
/// Phase 3: stub cấu hình; Phase 8 mở rộng multi-version packages.
/// </summary>
public sealed class ErpMetadataProfile
{
    public string ProfileId { get; init; } = "fbo-default";

    public string DisplayName { get; init; } = "FBO Default";

    /// <summary>Nhãn phiên bản ERP (ví dụ 11.0 / SP226).</summary>
    public string? ErpVersion { get; init; }

    public static ErpMetadataProfile Default { get; } = new();
}
