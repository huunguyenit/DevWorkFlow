using System.Text.RegularExpressions;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

/// <summary>
/// Resolve title toolbar:
/// <list type="bullet">
/// <item><c>Toolbar.Down</c> → catalog (v/e); <c>hasText</c> → render full text</item>
/// <item><c>Xem phiếu nhập$$120</c> → text + width 120, class <c>Text{Command}</c></item>
/// <item>có &lt;menuItems&gt; → <c>Group{Command}</c> / <c>TextGroup{Command}</c></item>
/// </list>
/// </summary>
public static class DesignToolbarTitleResolver
{
    private static readonly Regex WidthSuffixRegex = new(
        @"^(.*)\$\$(\d+)\s*$",
        RegexOptions.Compiled);

    public static DesignToolbarRenderInfo Resolve(
        GridToolbarButton button,
        bool vietnamese,
        DesignToolbarBundle? bundle = null)
    {
        var command = (button.Command ?? string.Empty).Trim();
        var has_menu = button.HasMenuItems;
        var title_raw = button.Title.Get(vietnamese);
        var (resolved, has_text_flag) = ResolveSystemTitle(title_raw, command, vietnamese, bundle);
        var (text, width_px) = SplitWidthSuffix(resolved);

        // e="Lookup$" — bỏ $ đuôi (ký hiệu text-button FBO), không phải $$width.
        text = TrimTrailingSingleDollar(text);

        // $$width hoặc catalog hasText=true → hiện full text v/e.
        var show_label = width_px is > 0 || has_text_flag;
        var css_class = BuildCssClass(command, show_label, has_menu);

        var tooltip = string.IsNullOrWhiteSpace(text) ? command : text;
        // WidthPx: $$N → N; hasText không $$ → 0 (auto, không ép width).
        var width = width_px is > 0 ? width_px.Value : show_label ? 0 : 22;

        return new DesignToolbarRenderInfo(
            Command: command,
            CssClass: css_class,
            DisplayText: show_label ? text : string.Empty,
            Tooltip: tooltip,
            WidthPx: width,
            ShowLabel: show_label,
            HasMenuItems: has_menu,
            HasFixedWidth: width_px is > 0);
    }

    /// <summary>
    /// Icon: <c>Insert</c> / group: <c>GroupExtra</c>.
    /// Text + $$/hasText: <c>TextLookup</c> / <c>TextGroupExtra</c>.
    /// </summary>
    internal static string BuildCssClass(string command, bool show_label, bool has_menu)
    {
        if (string.IsNullOrEmpty(command)) return string.Empty;
        if (has_menu)
            return show_label ? "TextGroup" + command : "Group" + command;
        return show_label ? "Text" + command : command;
    }

    /// <summary>Chỉ lấy nhãn (tooltip / Design surface), đã bỏ $$width.</summary>
    public static string ResolveDisplayTitle(
        GridToolbarButton button,
        bool vietnamese,
        DesignToolbarBundle? bundle = null)
    {
        var info = Resolve(button, vietnamese, bundle);
        return info.ShowLabel ? info.DisplayText : info.Tooltip;
    }

    /// <summary>Trả (nhãn đã resolve, hasText từ catalog nếu key Toolbar.*).</summary>
    internal static (string Text, bool HasText) ResolveSystemTitle(
        string raw,
        string command,
        bool vietnamese,
        DesignToolbarBundle? bundle)
    {
        if (string.IsNullOrWhiteSpace(raw))
            raw = string.IsNullOrEmpty(command) ? string.Empty : $"Toolbar.{command}";

        if (!raw.StartsWith("Toolbar.", StringComparison.OrdinalIgnoreCase))
            return (raw, false);

        if (bundle is not null && bundle.TryGet(raw, out var item))
            return (vietnamese ? item.V : item.E, item.HasText);

        // Fallback: Toolbar.Down → Down
        var suffix = raw.Length > "Toolbar.".Length ? raw["Toolbar.".Length..] : command;
        return (string.IsNullOrEmpty(suffix) ? command : suffix, false);
    }

    internal static (string Text, int? WidthPx) SplitWidthSuffix(string raw)
    {
        if (string.IsNullOrEmpty(raw))
            return (string.Empty, null);

        var match = WidthSuffixRegex.Match(raw);
        if (!match.Success)
            return (raw, null);

        if (!int.TryParse(match.Groups[2].Value, out var width) || width <= 0)
            return (match.Groups[1].Value, null);

        return (match.Groups[1].Value, width);
    }

    private static string TrimTrailingSingleDollar(string text)
    {
        if (string.IsNullOrEmpty(text)) return text;
        if (text.EndsWith('$') && !text.EndsWith("$$", StringComparison.Ordinal))
            return text[..^1];
        return text;
    }
}

/// <summary>Kết quả resolve để render HTML toolbar button.</summary>
public sealed record DesignToolbarRenderInfo(
    string Command,
    string CssClass,
    string DisplayText,
    string Tooltip,
    int WidthPx,
    bool ShowLabel,
    bool HasMenuItems = false,
    bool HasFixedWidth = false);
