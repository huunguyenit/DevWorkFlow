using DevWorkFlow.Domain.Design;

namespace DevWorkFlow.Application.Design.Toolbox;

/// <summary>Load + cache <c>toolbox-controls.xml</c> (fail-closed). Đọc FS ở tầng ngoài, giữ DTO thuần.</summary>
public sealed class ToolboxControlCatalog
{
    private readonly string _xml_path;
    private readonly object _gate = new();
    private ToolboxControlCatalogData? _cached;

    public ToolboxControlCatalog(string xml_path) => _xml_path = xml_path ?? string.Empty;

    public ToolboxControlCatalogData GetData()
    {
        lock (_gate)
            return _cached ??= ToolboxControlCatalogParser.ParseFile(_xml_path);
    }

    public void Invalidate()
    {
        lock (_gate)
            _cached = null;
    }
}
