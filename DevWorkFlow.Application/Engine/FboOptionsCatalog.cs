using System.Xml.Linq;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Catalog dataFormatString từ Options.xml (@upperCaseFormat → X, ...).
/// </summary>
public class FboOptionsCatalog
{
    private readonly Dictionary<string, string> _formats = new(StringComparer.OrdinalIgnoreCase);

    public FboOptionsCatalog()
    {
        SeedDefaults();
    }

    /// <summary>Resolve "@upperCaseFormat" hoặc trả về nguyên chuỗi nếu không phải biến.</summary>
    public string ResolveFormat(string? data_format_string)
    {
        if (string.IsNullOrWhiteSpace(data_format_string))
            return string.Empty;

        var key = data_format_string.Trim();
        if (key.StartsWith('@'))
            key = key[1..];

        return _formats.TryGetValue(key, out var value) ? value : data_format_string;
    }

    public bool IsUpperCase(string? data_format_string)
    {
        var resolved = ResolveFormat(data_format_string);
        return resolved == "X"
               || data_format_string?.Contains("upperCase", StringComparison.OrdinalIgnoreCase) == true;
    }

    public bool IsLowerCase(string? data_format_string)
    {
        var resolved = ResolveFormat(data_format_string);
        return resolved == "x"
               || data_format_string?.Contains("lowercase", StringComparison.OrdinalIgnoreCase) == true;
    }

    public bool IsDateTime(string? data_format_string)
    {
        var resolved = ResolveFormat(data_format_string);
        return resolved.Contains("dd", StringComparison.OrdinalIgnoreCase)
               || data_format_string?.Contains("datetime", StringComparison.OrdinalIgnoreCase) == true;
    }

    public void LoadFromFile(string options_xml_path)
    {
        if (!File.Exists(options_xml_path)) return;

        try
        {
            var doc = XDocument.Load(options_xml_path);
            foreach (var el in doc.Descendants().Where(e => e.Name.LocalName.Equals("var", StringComparison.OrdinalIgnoreCase)))
            {
                var name = (string?)el.Attribute("name");
                var value = (string?)el.Attribute("value");
                if (!string.IsNullOrWhiteSpace(name) && value is not null)
                    _formats[name] = value;
            }
        }
        catch
        {
            // Giữ defaults nếu Options.xml lỗi
        }
    }

    public static string FindOptionsPath(string program_path)
    {
        var candidates = new[]
        {
            Path.Combine(program_path, "App_Data", "Controllers", "Options", "Options.xml"),
            Path.Combine(program_path, "App_Data", "Options", "Options.xml"),
            Path.Combine(program_path, "App_Data", "Controllers", "Options.xml")
        };
        return candidates.FirstOrDefault(File.Exists) ?? string.Empty;
    }

    private void SeedDefaults()
    {
        // Theo Options.xml chuẩn FBO
        _formats["upperCaseFormat"] = "X";
        _formats["lowercaseFormat"] = "x";
        _formats["datetimeFormat"] = "dd/MM/yyyy";
        _formats["exchangeRateInputFormat"] = "### ### ### ##0.00";
        _formats["exchangeRateViewFormat"] = "### ### ### ###.00";
        _formats["quantityInputFormat"] = "# ### ### ##0.00";
        _formats["quantityViewFormat"] = "# ### ### ###.00";
        _formats["baseCurrencyAmountInputFormat"] = "### ### ### ### ##0";
        _formats["baseCurrencyAmountViewFormat"] = "### ### ### ### ###";
        _formats["baseCurrencyPriceInputFormat"] = "### ### ### ##0";
        _formats["baseCurrencyPriceViewFormat"] = "### ### ### ###";
        _formats["foreignCurrencyAmountInputFormat"] = "# ### ### ### ##0.00";
        _formats["foreignCurrencyAmountViewFormat"] = "# ### ### ### ###.00";
        _formats["foreignCurrencyPriceInputFormat"] = "### ### ### ##0.00";
        _formats["foreignCurrencyPriceViewFormat"] = "### ### ### ###.00";
        _formats["generalCurrencyAmountInputFormat"] = "### ### ### ### ##0";
        _formats["generalCurrencyAmountViewFormat"] = "### ### ### ### ###";
        _formats["generalCurrencyPriceInputFormat"] = "### ### ### ##0";
        _formats["generalCurrencyPriceViewFormat"] = "### ### ### ###";
        _formats["markInputFormat"] = "# ### ##0.00";
        _formats["markViewFormat"] = "# ### ###.00";
        _formats["analysisInputFormat"] = "## ### ### ### ##0.00";
        _formats["analysisViewFormat"] = "## ### ### ### ###.00";
        _formats["coefficientInputFormat"] = "## ### ### ##0.00";
        _formats["coefficientViewFormat"] = "## ### ### ###.00";
        _formats["CapacityNumberInputFormat"] = "### ##0.00";
        _formats["CapacityNumberViewFormat"] = "### ###.00";
        _formats["HourInputFormat"] = "#000.00";
        _formats["HourViewFormat"] = "#00#.00";
    }
}
