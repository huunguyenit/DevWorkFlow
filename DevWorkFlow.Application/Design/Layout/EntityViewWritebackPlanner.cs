using System.Net;
using System.Text.RegularExpressions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Spec v2 (2026-07-24): Dir có view lắp từ entity → layout mutation ghi về ĐÚNG file entity theo
/// <b>ownership cột/token</b> (xem <see cref="ItemValueOwnershipSerializer"/>); Dir giữ reference,
/// không inline ClearText (không nhân đôi hàng). **Không bao giờ chặn** thao tác chỉ vì item có
/// <c>&amp;entity;</c> (kể cả <c>[&amp;k;]</c>, hybrid <c>110&amp;x;</c>, entity pattern <c>&amp;y;</c>).
///
/// Map hàng: model mutate trên ClearText; baseline = parse lại ClearText hiện tại (chưa mutation) →
/// so từng hàng. Provenance mỗi hàng lấy từ <see cref="ClearTextSegment"/> depth 0 (host = Dir hoặc
/// file entity chứa <c>&lt;item&gt;</c>). Trong value từng item, serializer phân mảnh literal/entity.
/// Không map được 1 hàng → giữ raw hàng đó (thao tác vẫn cho), không corrupt.
/// </summary>
public sealed class EntityViewWritebackPlanner
{
    private static readonly Regex ItemTagRegex =
        new(@"<item\b[^>]*>", RegexOptions.IgnoreCase | RegexOptions.Compiled);

    private static readonly Regex CategoryTagRegex =
        new(@"<category\b[^>]*>", RegexOptions.IgnoreCase | RegexOptions.Compiled);

    /// <summary>Vùng &lt;views&gt; của Dir còn entity ref (ngoài comment) → phải đi đường write-back.</summary>
    public bool RequiresEntityWriteback(string dir_xml)
    {
        if (string.IsNullOrWhiteSpace(dir_xml)) return false;

        var comments = CommentSpans(dir_xml);
        var views = FindElement(dir_xml, "views", 0, dir_xml.Length, comments);
        if (views is null || views.SelfClosing) return false;

        foreach (Match m in FboXmlWriter.CustomEntityRegex.Matches(dir_xml[views.Start..views.End]))
        {
            if (!IsInside(comments, views.Start + m.Index))
                return true;
        }

        return false;
    }

    public LayoutWritePlanResult BuildPlan(IErpDocument document, string dir_xml, FboFormModel form)
    {
        try
        {
            return BuildPlanCore(document, dir_xml, form);
        }
        catch (PlanFailException ex)
        {
            return LayoutWritePlanResult.Fail(ex.Message);
        }
        catch (Exception ex)
        {
            // Không corrupt: coi như không ghi được, model rollback (ViewModel reparse).
            return LayoutWritePlanResult.Fail($"Không build được write plan: {ex.Message}");
        }
    }

    private static LayoutWritePlanResult BuildPlanCore(
        IErpDocument document, string dir_xml, FboFormModel form)
    {
        var layout = form.Layout
            ?? throw new PlanFailException("Form không có layout để ghi.");

        var projection = document.GetProjection(ErpProjectionKind.ClearText);
        var ct = projection.Text;

        var ct_comments = CommentSpans(ct);
        var ct_views = FindElement(ct, "views", 0, ct.Length, ct_comments)
            ?? throw new PlanFailException("Không tìm thấy <views> trong ClearText.");
        var ct_view = SelectTargetView(ct, ct_views.ContentStart, ct_views.ContentEnd, ct_comments)
            ?? throw new PlanFailException("Không tìm thấy <view> trong ClearText.");
        var ct_categories = FindElement(ct, "categories", ct_view.ContentStart, ct_view.ContentEnd, ct_comments);
        var ct_items = ScanItems(ct, ct_view.ContentStart, ct_view.ContentEnd, ct_comments, ct_categories);

        FormViewLayout baseline;
        try
        {
            baseline = new FboXmlParser().Parse(ct, document.Path).Form?.Layout
                ?? throw new PlanFailException("ClearText không có layout baseline.");
        }
        catch (PlanFailException) { throw; }
        catch (Exception ex)
        {
            throw new PlanFailException($"Không parse được ClearText baseline: {ex.Message}");
        }

        var has_width_item = ct_items.Count > 0 && !ct_items[0].DecodedValue.Contains(':');
        var row_items = has_width_item ? ct_items.Skip(1).ToList() : ct_items;

        // Cấu trúc lệch (add/xóa hàng) → chưa persist theo ownership (không chặn thao tác).
        if (baseline.Rows.Count != row_items.Count
            || layout.Rows.Count != baseline.Rows.Count)
            return LayoutWritePlanResult.Success(new LayoutWritePlan());

        string? Resolve(string name) => document.SemanticModel.FindEntity(name)?.DisplayText;

        var view_segments = projection.ClearTextSegments
            .Where(s => s.Depth == 0
                        && s.Span.StartOffset < ct_view.End
                        && s.Span.EndOffset > ct_view.Start)
            .ToList();

        ClearTextSegment? OwnerOf(int offset) =>
            view_segments.FirstOrDefault(s => offset >= s.Span.StartOffset && offset < s.Span.EndOffset);

        // ── Hosts: Dir + mỗi entity chứa <item> ───────────────────────────
        var hosts = new Dictionary<string, HostCtx>(StringComparer.Ordinal);
        var host_cursor = new Dictionary<string, int>(StringComparer.Ordinal);

        HostCtx DirHost()
        {
            const string key = "\0dir";
            if (hosts.TryGetValue(key, out var existing)) return existing;
            var comments = CommentSpans(dir_xml);
            var views = FindElement(dir_xml, "views", 0, dir_xml.Length, comments);
            var view = views is null ? null
                : SelectTargetView(dir_xml, views.ContentStart, views.ContentEnd, comments);
            var categories = view is null ? null
                : FindElement(dir_xml, "categories", view.ContentStart, view.ContentEnd, comments);
            var items = view is null
                ? []
                : ScanItems(dir_xml, view.ContentStart, view.ContentEnd, comments, categories);
            var ctx = new HostCtx
            {
                IsEntity = false,
                Content = dir_xml,
                Comments = comments,
                Items = items,
                ViewTag = view
            };
            hosts[key] = ctx;
            return ctx;
        }

        HostCtx? EntityHost(ClearTextSegment segment)
        {
            if (hosts.TryGetValue(segment.EntityName, out var existing)) return existing;
            var symbol = document.SemanticModel.FindEntity(segment.EntityName);
            if (symbol is null || !symbol.IsResolved
                || symbol.DeclarationKind == EntityDeclarationKind.Parameter)
                return null;

            string content;
            string? resolved_path = symbol.ResolvedPath;
            if (symbol.DeclarationKind == EntityDeclarationKind.ExternalSystem)
            {
                if (string.IsNullOrWhiteSpace(resolved_path) || !File.Exists(resolved_path))
                    return null;
                content = File.ReadAllText(resolved_path);
            }
            else
            {
                var value_path = symbol.ValueLocation.Path;
                if (string.IsNullOrWhiteSpace(value_path) || PathsEqual(value_path, document.Path))
                    return null; // inline trong chính Dir — không tách được host riêng (MVP)
                content = symbol.RawValue ?? string.Empty;
            }

            var comments = CommentSpans(content);
            var view = SelectTargetView(content, 0, content.Length, comments);
            var scan_from = view?.ContentStart ?? 0;
            var scan_to = view?.ContentEnd ?? content.Length;
            var categories = FindElement(content, "categories", scan_from, scan_to, comments);
            var items = ScanItems(content, scan_from, scan_to, comments, categories);
            var ctx = new HostCtx
            {
                IsEntity = true,
                EntityName = symbol.Name,
                ResolvedPath = resolved_path,
                Content = content,
                Comments = comments,
                Items = items,
                ViewTag = view
            };
            hosts[segment.EntityName] = ctx;
            return ctx;
        }

        // Raw item cho ct item thứ index (theo ordinal trong host của nó).
        ItemHit? RawItemFor(ItemHit ct_item, out HostCtx? host)
        {
            var owner = OwnerOf(ct_item.Tag.Start);
            host = owner is null ? DirHost() : EntityHost(owner);
            if (host is null) return null;
            var key = owner?.EntityName ?? "\0dir";
            var ordinal = host_cursor.TryGetValue(key, out var c) ? c : 0;
            host_cursor[key] = ordinal + 1;
            return ordinal < host.Items.Count ? host.Items[ordinal] : null;
        }

        var entity_value_updates = new Dictionary<string, string>(StringComparer.Ordinal);

        void QueueEntityValue(string name, string value)
        {
            // Xung đột value khác nhau cho cùng entity → giữ lần đầu (best effort, không corrupt).
            entity_value_updates.TryAdd(name, value);
        }

        // ── Width row ──────────────────────────────────────────────────────
        if (has_width_item)
        {
            var raw = RawItemFor(ct_items[0], out var host);
            var new_widths = string.Join(", ", layout.ColumnWidths);
            var old_widths = string.Join(", ", baseline.ColumnWidths);
            if (host is not null && raw is not null
                && !string.Equals(new_widths, old_widths, StringComparison.Ordinal)
                && !FboXmlWriter.CustomEntityRegex.IsMatch(raw.RawValue)) // width entity → bỏ qua (MVP)
            {
                host.Edits.Add((raw.ValueSpan, EscapeAttr(new_widths)));
            }
        }

        // ── Pattern rows ────────────────────────────────────────────────────
        for (var i = 0; i < baseline.Rows.Count; i++)
        {
            var ct_item = row_items[i];
            var raw = RawItemFor(ct_item, out var host);
            if (host is null || raw is null) continue; // không map được host → giữ raw

            var rewrite = ItemValueOwnershipSerializer.Rewrite(
                raw.RawValue, baseline.Rows[i], layout.Rows[i], Resolve);

            // Chỉ patch host khi text item thật đổi (đổi value entity đã tách sang EntityUpdates).
            if (!string.Equals(rewrite.NewRawValue, raw.RawValue, StringComparison.Ordinal))
                host.Edits.Add((raw.ValueSpan, rewrite.NewRawValue));
            foreach (var (entity, value) in rewrite.EntityUpdates)
                QueueEntityValue(entity, value);
        }

        // ── Attr view: anchor / split / height ──────────────────────────────
        ApplyAttrChanges(layout, baseline, ct, ct_view, OwnerOf, EntityHost, DirHost, QueueEntityValue);

        // ── Categories: columns đổi ─────────────────────────────────────────
        ApplyCategoryChanges(layout, baseline, DirHost());

        // ── Materialize ─────────────────────────────────────────────────────
        var entity_writes = new List<ViewLayoutEntityWrite>();

        foreach (var host in hosts.Values.Where(h => h.IsEntity && h.Edits.Count > 0))
        {
            entity_writes.Add(new ViewLayoutEntityWrite
            {
                EntityName = host.EntityName!,
                NewContent = ApplyEdits(host.Content, host.Edits),
                ResolvedPath = host.ResolvedPath
            });
        }

        foreach (var (name, value) in entity_value_updates)
        {
            if (hosts.TryGetValue(name, out var host) && host.Edits.Count > 0)
                continue; // đã ghi qua content edits, tránh double

            var symbol = document.SemanticModel.FindEntity(name);

            // Entity inline khai báo trong CHÍNH Dir (<!ENTITY y "…">) → patch value span ngay trên Dir
            // (không đi UpdateEntityValue vì đó ghi in-memory rồi bị reparse XmlSource cũ ghi đè).
            if (symbol is { DeclarationKind: EntityDeclarationKind.Inline }
                && PathsEqual(symbol.ValueLocation.Path, document.Path)
                && symbol.ValueLocation.Span is { Length: > 0 } span
                && span.EndOffset <= DirHost().Content.Length)
            {
                DirHost().Edits.Add((new TextSpan(span.StartOffset, span.Length), EscapeAttr(value)));
                continue;
            }

            entity_writes.Add(new ViewLayoutEntityWrite
            {
                EntityName = name,
                NewContent = value,
                ResolvedPath = symbol?.ResolvedPath
            });
        }

        var dir_host = DirHost();
        var dir_new = dir_host.Edits.Count > 0 ? ApplyEdits(dir_host.Content, dir_host.Edits) : null;

        return LayoutWritePlanResult.Success(new LayoutWritePlan
        {
            DirXml = dir_new,
            EntityWrites = entity_writes
        });
    }

    // ── Attr / Category ─────────────────────────────────────────────────────

    private static void ApplyAttrChanges(
        FormViewLayout layout,
        FormViewLayout baseline,
        string ct,
        ElementSpan ct_view,
        Func<int, ClearTextSegment?> owner_of,
        Func<ClearTextSegment, HostCtx?> entity_host,
        Func<HostCtx> dir_host,
        Action<string, string> queue_entity_value)
    {
        var changes = new List<(string Name, string? Value)>();
        if (layout.Anchor != baseline.Anchor) changes.Add(("anchor", layout.Anchor?.ToString()));
        if (layout.Split != baseline.Split) changes.Add(("split", layout.Split?.ToString()));
        if (!string.Equals(layout.HeightExpression ?? "", baseline.HeightExpression ?? "", StringComparison.Ordinal))
            changes.Add(("height", layout.HeightExpression));
        if (changes.Count == 0) return;

        var view_owner = owner_of(ct_view.Start);
        var host = view_owner is null ? dir_host() : entity_host(view_owner);
        if (host is null || host.ViewTag is null) return;

        foreach (var (attr_name, attr_value) in changes)
        {
            var tag_text = host.Content[host.ViewTag.Start..host.ViewTag.StartTagEnd];
            var attr = FindAttr(tag_text, attr_name);
            if (attr is { } found)
            {
                var raw_value = tag_text.Substring(found.ValueStart, found.ValueLength);
                var entity_match = FboXmlWriter.CustomEntityRegex.Match(raw_value);
                if (entity_match.Success && entity_match.Length == raw_value.Length)
                {
                    // attr = entity thuần → ownership: đổi value entity đó.
                    if (!string.IsNullOrWhiteSpace(attr_value))
                        queue_entity_value(entity_match.Groups[1].Value, attr_value!);
                    continue;
                }
                if (entity_match.Success)
                    continue; // attr lai literal+entity → bỏ qua (hiếm), không corrupt
            }

            host.Edits.Add(BuildAttrEdit(host.Content, host.ViewTag, attr_name, attr_value));
        }
    }

    private static void ApplyCategoryChanges(
        FormViewLayout layout, FormViewLayout baseline, HostCtx dir_host)
    {
        if (dir_host.ViewTag is null) return;
        var categories = FindElement(
            dir_host.Content, "categories", dir_host.ViewTag.ContentStart, dir_host.ViewTag.ContentEnd,
            dir_host.Comments);
        if (categories is null) return;

        foreach (var category in layout.Categories)
        {
            var baseline_category = baseline.Categories.FirstOrDefault(c => c.Index == category.Index);
            if (baseline_category is null
                || category.ColumnWidths.Count == 0
                || category.ColumnWidths.SequenceEqual(baseline_category.ColumnWidths))
                continue;

            if (TryFindCategoryTag(dir_host.Content, categories, dir_host.Comments, category.Index, out var tag))
            {
                var columns = string.Join(", ", category.ColumnWidths);
                var tag_text = dir_host.Content[tag.Start..tag.StartTagEnd];
                if (FindAttr(tag_text, "columns") is { } found
                    && FboXmlWriter.CustomEntityRegex.IsMatch(
                        tag_text.Substring(found.ValueStart, found.ValueLength)))
                    continue; // columns là entity → bỏ qua
                dir_host.Edits.Add(BuildAttrEdit(dir_host.Content, tag, "columns", columns));
            }
        }
    }

    // ── Host ctx ────────────────────────────────────────────────────────────

    private sealed class HostCtx
    {
        public bool IsEntity { get; init; }
        public string? EntityName { get; init; }
        public string? ResolvedPath { get; init; }
        public required string Content { get; init; }
        public required List<TextSpan> Comments { get; init; }
        public required List<ItemHit> Items { get; init; }
        public ElementSpan? ViewTag { get; init; }
        public List<(TextSpan Span, string Replacement)> Edits { get; } = [];
    }

    // ── Edit primitives ─────────────────────────────────────────────────────

    private static (TextSpan Span, string Replacement) BuildAttrEdit(
        string text, ElementSpan element, string attr_name, string? new_value)
    {
        var tag_text = text[element.Start..element.StartTagEnd];
        var attr = FindAttr(tag_text, attr_name);
        if (attr is { } found)
        {
            if (string.IsNullOrWhiteSpace(new_value))
            {
                var remove_start = found.AttrStart;
                while (remove_start > 0 && char.IsWhiteSpace(tag_text[remove_start - 1]))
                    remove_start--;
                return (new TextSpan(element.Start + remove_start, found.AttrEnd - remove_start), string.Empty);
            }

            return (new TextSpan(element.Start + found.ValueStart, found.ValueLength), EscapeAttr(new_value));
        }

        if (string.IsNullOrWhiteSpace(new_value))
            return (new TextSpan(element.Start, 0), string.Empty);

        var gt = element.StartTagEnd - 1;
        var insert_at = text[gt - 1] == '/' ? gt - 1 : gt;
        var needs_space = !char.IsWhiteSpace(text[insert_at - 1]);
        var insertion = $"{(needs_space ? " " : "")}{attr_name}=\"{EscapeAttr(new_value)}\"{(text[gt - 1] == '/' ? " " : "")}";
        return (new TextSpan(insert_at, 0), insertion);
    }

    private static bool TryFindCategoryTag(
        string text, ElementSpan? categories, List<TextSpan> comments, int index, out ElementSpan tag)
    {
        var from = categories?.ContentStart ?? 0;
        var to = categories?.ContentEnd ?? text.Length;
        foreach (Match m in CategoryTagRegex.Matches(text[from..to]))
        {
            var start = from + m.Index;
            if (IsInside(comments, start)) continue;
            if (FindAttr(m.Value, "index") is not { } found) continue;
            var value = m.Value.Substring(found.ValueStart, found.ValueLength);
            if (!int.TryParse(value, out var parsed) || parsed != index) continue;
            var gt = start + m.Length;
            tag = new ElementSpan(start, gt, gt, gt, gt, true);
            return true;
        }

        tag = default!;
        return false;
    }

    private static string ApplyEdits(string text, List<(TextSpan Span, string Replacement)> edits)
    {
        var ordered = edits
            .Where(e => e.Span.Length > 0 || e.Replacement.Length > 0)
            .OrderByDescending(e => e.Span.Start)
            .ToList();

        for (var i = 1; i < ordered.Count; i++)
        {
            if (ordered[i].Span.End > ordered[i - 1].Span.Start)
                throw new PlanFailException("Các patch layout chồng lấn — không ghi được.");
        }

        var result = text;
        foreach (var (span, replacement) in ordered)
            result = result[..span.Start] + replacement + result[span.End..];
        return result;
    }

    // ── Text scanning ─────────────────────────────────────────────────────

    internal readonly record struct TextSpan(int Start, int Length)
    {
        public int End => Start + Length;
    }

    internal sealed record ElementSpan(
        int Start, int StartTagEnd, int ContentStart, int ContentEnd, int End, bool SelfClosing);

    internal sealed record ItemHit(TextSpan Tag, TextSpan ValueSpan, string RawValue, string DecodedValue);

    private sealed class PlanFailException(string reason) : Exception(reason);

    private static List<TextSpan> CommentSpans(string text)
    {
        var spans = new List<TextSpan>();
        var index = 0;
        while (true)
        {
            var start = text.IndexOf("<!--", index, StringComparison.Ordinal);
            if (start < 0) break;
            var end = text.IndexOf("-->", start + 4, StringComparison.Ordinal);
            if (end < 0)
            {
                spans.Add(new TextSpan(start, text.Length - start));
                break;
            }

            spans.Add(new TextSpan(start, end + 3 - start));
            index = end + 3;
        }

        return spans;
    }

    private static bool IsInside(List<TextSpan> spans, int offset) =>
        spans.Exists(s => offset >= s.Start && offset < s.End);

    private static int FindTagStart(string text, string tag, int from, int to, List<TextSpan> comments)
    {
        var needle = "<" + tag;
        var index = from;
        while (index >= 0 && index < to)
        {
            index = text.IndexOf(needle, index, StringComparison.OrdinalIgnoreCase);
            if (index < 0 || index >= to) return -1;
            var after = index + needle.Length;
            var boundary_ok = after < text.Length
                              && (char.IsWhiteSpace(text[after]) || text[after] is '>' or '/');
            if (boundary_ok && !IsInside(comments, index)) return index;
            index = after;
        }

        return -1;
    }

    private static ElementSpan? FindElement(
        string text, string local_name, int from, int to, List<TextSpan> comments)
    {
        var start = FindTagStart(text, local_name, from, to, comments);
        if (start < 0) return null;

        var gt = text.IndexOf('>', start);
        if (gt < 0 || gt >= to) return null;
        var start_tag_end = gt + 1;

        if (text[gt - 1] == '/')
            return new ElementSpan(start, start_tag_end, start_tag_end, start_tag_end, start_tag_end, true);

        var close = FindTagStart(text, "/" + local_name, start_tag_end, to, comments);
        if (close < 0) return null;
        var close_gt = text.IndexOf('>', close);
        if (close_gt < 0 || close_gt >= to) return null;

        return new ElementSpan(start, start_tag_end, start_tag_end, close, close_gt + 1, false);
    }

    private static ElementSpan? SelectTargetView(string text, int from, int to, List<TextSpan> comments)
    {
        ElementSpan? first = null;
        var cursor = from;
        while (cursor < to)
        {
            var view = FindElement(text, "view", cursor, to, comments);
            if (view is null) break;
            first ??= view;

            var tag_text = text[view.Start..view.StartTagEnd];
            if (FindAttr(tag_text, "id") is { } id
                && tag_text.Substring(id.ValueStart, id.ValueLength)
                    .Equals("Dir", StringComparison.OrdinalIgnoreCase))
                return view;

            cursor = view.End;
        }

        return first;
    }

    private static List<ItemHit> ScanItems(
        string text, int from, int to, List<TextSpan> comments, ElementSpan? exclude)
    {
        var items = new List<ItemHit>();
        if (from >= to) return items;

        foreach (Match m in ItemTagRegex.Matches(text[from..to]))
        {
            var start = from + m.Index;
            if (IsInside(comments, start)) continue;
            if (exclude is not null && start >= exclude.Start && start < exclude.End) continue;

            var tag = new TextSpan(start, m.Length);
            if (FindAttr(m.Value, "value") is { } attr)
            {
                var raw = m.Value.Substring(attr.ValueStart, attr.ValueLength);
                items.Add(new ItemHit(
                    tag, new TextSpan(start + attr.ValueStart, attr.ValueLength), raw, WebUtility.HtmlDecode(raw)));
            }
            else
            {
                items.Add(new ItemHit(tag, new TextSpan(start + m.Length, 0), string.Empty, string.Empty));
            }
        }

        return items;
    }

    private static (int AttrStart, int AttrEnd, int ValueStart, int ValueLength)? FindAttr(
        string tag_text, string name)
    {
        var m = Regex.Match(
            tag_text,
            $@"\s{Regex.Escape(name)}\s*=\s*(""(?<dq>[^""]*)""|'(?<sq>[^']*)')",
            RegexOptions.IgnoreCase);
        if (!m.Success) return null;

        var group = m.Groups["dq"].Success ? m.Groups["dq"] : m.Groups["sq"];
        return (m.Index + 1, m.Index + m.Length, group.Index, group.Length);
    }

    /// <summary>Escape cho attribute value (chỉ ký tự phá cú pháp; giữ &amp;entity; nếu caller đã chèn).</summary>
    private static string EscapeAttr(string value) =>
        value
            .Replace("&", "&amp;", StringComparison.Ordinal)
            .Replace("<", "&lt;", StringComparison.Ordinal)
            .Replace("\"", "&quot;", StringComparison.Ordinal);

    private static bool PathsEqual(string? left, string? right)
    {
        if (string.IsNullOrWhiteSpace(left) || string.IsNullOrWhiteSpace(right))
            return false;
        try
        {
            return Path.GetFullPath(left).Equals(Path.GetFullPath(right), StringComparison.OrdinalIgnoreCase);
        }
        catch
        {
            return left.Equals(right, StringComparison.OrdinalIgnoreCase);
        }
    }
}
