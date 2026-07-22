namespace DevWorkFlow.Application.Design;

/// <summary>Ảnh toolbar Design từ Config/image (data-URI), key = tên lệnh thường (insert, download…).</summary>
public sealed record DesignImageBundle(IReadOnlyDictionary<string, string> DataUriByKey)
{
    public static DesignImageBundle Empty { get; } = new(new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase));

    public string? GetDataUri(string asset_key)
    {
        if (string.IsNullOrWhiteSpace(asset_key)) return null;
        return DataUriByKey.TryGetValue(asset_key.Trim(), out var uri) ? uri : null;
    }
}
