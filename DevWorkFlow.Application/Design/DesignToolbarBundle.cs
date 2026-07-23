namespace DevWorkFlow.Application.Design;

/// <summary>Một mục toolbar system từ Config/json/toolbar.json (key = Toolbar.Insert…).</summary>
public sealed record DesignToolbarSystemItem(
    string Key,
    string V,
    string E,
    bool HasText = false);

/// <summary>Catalog nhãn Toolbar.* — Application không đọc FS.</summary>
public sealed record DesignToolbarBundle(
    IReadOnlyDictionary<string, DesignToolbarSystemItem> ItemsByKey)
{
    public static DesignToolbarBundle Empty { get; } =
        new(new Dictionary<string, DesignToolbarSystemItem>(StringComparer.OrdinalIgnoreCase));

    public bool TryGet(string key, out DesignToolbarSystemItem item)
    {
        if (string.IsNullOrWhiteSpace(key))
        {
            item = null!;
            return false;
        }
        return ItemsByKey.TryGetValue(key.Trim(), out item!);
    }
}

public interface IDesignToolbarCatalog
{
    DesignToolbarBundle GetBundle();
}
