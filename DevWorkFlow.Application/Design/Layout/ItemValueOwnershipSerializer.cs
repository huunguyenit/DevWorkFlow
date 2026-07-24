using System.Text;
using System.Text.RegularExpressions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Spec v2 §4 — ownership theo cột pattern / token control cho MỘT <c>&lt;item value="…"&gt;</c>
/// lai (inline + <c>&amp;entity;</c>). Model Design mutate trên ClearText; ở đây serialize ngược:
/// <list type="bullet">
///   <item>Cột pattern thuộc literal → sửa literal trong item value (host: Dir hoặc file entity chứa item).</item>
///   <item>Cột pattern thuộc <c>&amp;E;</c> → chỉ đổi <b>value của E</b> (giữ <c>&amp;E;</c> trong item).</item>
///   <item>Token control <c>[&amp;k;]</c> → giữ nguyên ref khi control không đổi; chỉ rebuild token đã đổi.</item>
/// </list>
/// KHÔNG bao giờ thay cả item bằng ClearText full khi raw còn <c>&amp;…;</c> (tránh phantom).
/// Không map được (độ dài entity value ≠ số cột) → giữ raw phần đó, KHÔNG chặn thao tác.
/// </summary>
internal static class ItemValueOwnershipSerializer
{
    private static readonly Regex ControlTokenRegex =
        new(@"\[(?<name>[^\]]*)\](?<suffix>\.[A-Za-z]*|\.)?", RegexOptions.Compiled);

    public sealed class ItemRewrite
    {
        public required string NewRawValue { get; init; }
        public List<(string Entity, string NewValue)> EntityUpdates { get; } = [];
        public bool Changed { get; init; }

        /// <summary>false = có cột/segment không map được → phần đó giữ raw (thao tác vẫn cho).</summary>
        public bool FullyMapped { get; init; }
    }

    /// <summary>
    /// Serialize lại raw item value theo <paramref name="new_row"/> đã mutate.
    /// <paramref name="resolve_entity"/> trả value expand của entity (vd. <c>x</c> → <c>"0-1"</c>); null = không resolve.
    /// </summary>
    public static ItemRewrite Rewrite(
        string raw_value,
        FormViewRow baseline_row,
        FormViewRow new_row,
        Func<string, string?> resolve_entity)
    {
        var new_pattern = new_row.Pattern;
        var column_count = new_pattern.Length;

        var colon = IndexOfSeparatorColon(raw_value);
        var raw_pattern = colon < 0 ? raw_value : raw_value[..colon];
        var controls_suffix = colon < 0 ? string.Empty : raw_value[colon..]; // gồm ':'

        var (new_raw_pattern, entity_updates, pattern_mapped) =
            RewritePattern(raw_pattern, baseline_row.Pattern, new_pattern, column_count, resolve_entity);

        string new_suffix;
        if (colon < 0)
        {
            new_suffix = string.Empty;
        }
        else if (SameControls(baseline_row, new_row))
        {
            new_suffix = controls_suffix; // control không đổi → giữ &k; nguyên văn
        }
        else
        {
            new_suffix = ": " + RebuildControls(new_row, controls_suffix[1..], resolve_entity);
        }

        var new_raw_value = new_raw_pattern + new_suffix;
        var rewrite = new ItemRewrite
        {
            NewRawValue = new_raw_value,
            Changed = !string.Equals(new_raw_value, raw_value, StringComparison.Ordinal)
                      || entity_updates.Count > 0,
            FullyMapped = pattern_mapped
        };
        rewrite.EntityUpdates.AddRange(entity_updates);
        return rewrite;
    }

    // ── Pattern axis ──────────────────────────────────────────────────────

    private static (string NewRawPattern, List<(string, string)> EntityUpdates, bool Mapped) RewritePattern(
        string raw_pattern,
        string old_pattern,
        string new_pattern,
        int column_count,
        Func<string, string?> resolve_entity)
    {
        var updates = new List<(string, string)>();
        var segments = SplitPatternSegments(raw_pattern, resolve_entity, out var mapped, out var total_cols);

        // Không map được (entity chưa resolve / độ dài vượt cột) → giữ raw pattern, không đụng.
        if (!mapped || total_cols > column_count)
            return (raw_pattern, updates, false);

        // Cột còn thiếu = padding '-' ngầm (raw ngắn hơn column_count).
        var pad = column_count - total_cols;

        var builder = new StringBuilder();
        var col = 0;
        foreach (var seg in segments)
        {
            var slice_end = Math.Min(col + seg.ColumnCount, column_count);
            var new_slice = new_pattern[col..slice_end];
            if (seg.IsEntity)
            {
                builder.Append(seg.RawText); // giữ &E;
                var old_value = old_pattern.Length >= slice_end
                    ? old_pattern[col..slice_end]
                    : seg.EntityValue;
                if (!string.Equals(new_slice, old_value, StringComparison.Ordinal))
                    updates.Add((seg.EntityName!, new_slice));
            }
            else
            {
                builder.Append(new_slice); // literal cột: ghi ký tự pattern mới
            }

            col += seg.ColumnCount;
        }

        // Trailing padding: nếu cột padding giờ khác '-' (merge/split lấn vùng ngầm) → thêm literal.
        if (pad > 0)
        {
            var tail = new_pattern[col..column_count];
            if (tail.Any(c => c != '-'))
                builder.Append(tail);
        }

        return (builder.ToString(), updates, true);
    }

    private readonly record struct PatternSeg(
        bool IsEntity, string RawText, string? EntityName, string EntityValue, int ColumnCount);

    private static List<PatternSeg> SplitPatternSegments(
        string raw_pattern,
        Func<string, string?> resolve_entity,
        out bool mapped,
        out int total_cols)
    {
        mapped = true;
        total_cols = 0;
        var segments = new List<PatternSeg>();
        var cursor = 0;

        foreach (Match m in FboXmlWriter.CustomEntityRegex.Matches(raw_pattern))
        {
            if (m.Index > cursor)
            {
                var literal = raw_pattern[cursor..m.Index];
                segments.Add(new PatternSeg(false, literal, null, literal, literal.Length));
                total_cols += literal.Length;
            }

            var name = m.Groups[1].Value;
            var value = resolve_entity(name);
            if (value is null)
            {
                mapped = false;
                value = string.Empty;
            }

            segments.Add(new PatternSeg(true, m.Value, name, value, value.Length));
            total_cols += value.Length;
            cursor = m.Index + m.Length;
        }

        if (cursor < raw_pattern.Length)
        {
            var literal = raw_pattern[cursor..];
            segments.Add(new PatternSeg(false, literal, null, literal, literal.Length));
            total_cols += literal.Length;
        }

        return segments;
    }

    /// <summary>Colon tách pattern|controls — colon literal đầu tiên (entity ref không chứa ':').</summary>
    private static int IndexOfSeparatorColon(string raw_value) =>
        raw_value.IndexOf(':', StringComparison.Ordinal);

    // ── Control axis ──────────────────────────────────────────────────────

    private static bool SameControls(FormViewRow a, FormViewRow b)
    {
        var ca = NonEmpty(a);
        var cb = NonEmpty(b);
        if (ca.Count != cb.Count) return false;
        for (var i = 0; i < ca.Count; i++)
        {
            if (!string.Equals(ca[i].FieldName ?? "", cb[i].FieldName ?? "", StringComparison.Ordinal)
                || ca[i].Kind != cb[i].Kind
                || !string.Equals(ca[i].Suffix, cb[i].Suffix, StringComparison.Ordinal))
                return false;
        }

        return true;
    }

    private static List<FormViewCell> NonEmpty(FormViewRow row) =>
        row.Cells.Where(c => c.Kind != FormViewCellKind.Empty).ToList();

    /// <summary>Rebuild control list: tái dùng token raw (giữ &amp;k;) khi identity khớp, else literal.</summary>
    private static string RebuildControls(
        FormViewRow new_row,
        string raw_controls,
        Func<string, string?> resolve_entity)
    {
        var raw_tokens = ControlTokenRegex.Matches(raw_controls)
            .Select(m => new RawToken(
                m.Value,
                ExpandName(m.Groups["name"].Value, resolve_entity),
                KindOf(m.Groups["suffix"].Value),
                m.Groups["suffix"].Value))
            .ToList();
        var used = new bool[raw_tokens.Count];

        var parts = new List<string>();
        foreach (var cell in NonEmpty(new_row))
        {
            var match_index = -1;
            for (var j = 0; j < raw_tokens.Count; j++)
            {
                if (used[j]) continue;
                if (string.Equals(raw_tokens[j].ExpandedName, cell.FieldName ?? "", StringComparison.Ordinal)
                    && raw_tokens[j].Kind == cell.Kind)
                {
                    match_index = j;
                    break;
                }
            }

            if (match_index >= 0)
            {
                used[match_index] = true;
                parts.Add(raw_tokens[match_index].Text);
            }
            else
            {
                parts.Add(LiteralToken(cell));
            }
        }

        return string.Join(", ", parts);
    }

    private readonly record struct RawToken(string Text, string ExpandedName, FormViewCellKind Kind, string Suffix);

    private static string ExpandName(string name, Func<string, string?> resolve_entity) =>
        FboXmlWriter.CustomEntityRegex.Replace(name, m => resolve_entity(m.Groups[1].Value) ?? m.Value);

    private static FormViewCellKind KindOf(string suffix)
    {
        if (string.IsNullOrEmpty(suffix)) return FormViewCellKind.Input;
        return suffix.Equals(".Label", StringComparison.OrdinalIgnoreCase)
            ? FormViewCellKind.Label
            : FormViewCellKind.Description;
    }

    private static string LiteralToken(FormViewCell cell)
    {
        var name = cell.FieldName ?? string.Empty;
        if (!string.IsNullOrEmpty(cell.Suffix))
            return $"[{name}]{cell.Suffix}";
        return cell.Kind switch
        {
            FormViewCellKind.Label => $"[{name}].Label",
            FormViewCellKind.Description => $"[{name}].Description",
            _ => $"[{name}]"
        };
    }
}
