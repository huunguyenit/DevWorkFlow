using System.Text.RegularExpressions;
using System.Xml;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language;

/// <summary>Kết quả bind entity graph cho một document.</summary>
public sealed class EntityBindResult
{
    public IReadOnlyList<EntitySymbol> Symbols { get; init; } = [];

    public IReadOnlyList<ErpDiagnostic> Diagnostics { get; init; } = [];

    public string ClearText { get; init; } = string.Empty;

    public IReadOnlyList<EntityProjectionSegment> Segments { get; init; } = [];

    /// <summary>Provenance của từng đoạn text đã expand trong <see cref="ClearText"/>.</summary>
    public IReadOnlyList<ClearTextSegment> ClearTextSegments { get; init; } = [];

    /// <summary>Ánh xạ offset Source ↔ <see cref="ClearText"/> cho navigation ở Insight mode.</summary>
    public ClearTextOffsetMap ClearTextOffsets { get; init; } = ClearTextOffsetMap.Identity;
}

/// <summary>
/// Bind DTD entity thành symbol graph: inline/SYSTEM/parameter, nested include,
/// definition/reference, cycle và missing diagnostics.
/// </summary>
public sealed class EntitySymbolBinder
{
    private static readonly Regex DeclarationRegex = new(
        "<!ENTITY\\s+(?<parameter>%\\s+)?(?<name>[A-Za-z_][\\w.-]*)\\s+" +
        "(?:SYSTEM\\s+(?<sq>[\"'])(?<system>.*?)\\k<sq>|" +
        "(?<vq>[\"'])(?<value>.*?)\\k<vq>)\\s*>",
        RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.Compiled);

    private static readonly Regex GeneralReferenceRegex = new(
        @"&(?<name>[A-Za-z_][\w.-]*);",
        RegexOptions.Compiled);

    private static readonly Regex ParameterReferenceRegex = new(
        @"%(?<name>[A-Za-z_][\w.-]*);",
        RegexOptions.Compiled);

    private static readonly HashSet<string> BuiltInNames =
        new(StringComparer.OrdinalIgnoreCase) { "amp", "lt", "gt", "quot", "apos" };

    /// <summary>Bind toàn bộ entity graph từ lossless source.</summary>
    public EntityBindResult Bind(string path, string source_text, ISyntaxTree syntax_tree)
    {
        source_text ??= string.Empty;
        var diagnostics = new List<ErpDiagnostic>();
        var declarations = new List<EntityDeclaration>();
        var file_stack = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        var doctype_token = syntax_tree.Tokens.FirstOrDefault(
            token => token.Kind == SyntaxKind.DocType);
        if (doctype_token is not null)
        {
            CollectDeclarations(
                path,
                doctype_token.Text,
                doctype_token.Span.StartOffset,
                declarations,
                diagnostics,
                file_stack);
        }

        // ── Dùng XmlDocument làm authoritative resolver để biết entity nào active ──
        // ResolveActiveDtdEntities xử lý đúng conditional sections (INCLUDE/IGNORE).
        var active_entities = ResolveActiveDtdEntities(path, source_text, diagnostics);

        var definitions = BuildActiveDefinitions(
            declarations,
            active_entities,
            path,
            diagnostics);

        // Chỉ entity thực sự ĐƯỢC SỬ DỤNG mới thành symbol: tham chiếu trực tiếp trong
        // body document, hoặc gián tiếp qua giá trị của entity đã dùng. File include
        // (Unit.ent, ...) khai báo hàng loạt entity dùng chung — không được đổ hết vào
        // document (ví dụ Account.xml không gọi &Lookup.Job; thì không lấy Lookup.Job).
        var used = ComputeUsedEntityClosure(source_text, doctype_token?.Span, definitions);

        var references = BuildReferenceIndex(
            path,
            source_text,
            doctype_token?.Span,
            definitions,
            used,
            diagnostics);

        var resolved_values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        var annotated_values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        foreach (var declaration in definitions.Values)
        {
            if (declaration.Kind != EntityDeclarationKind.Parameter
                && !used.Contains(declaration.Name))
                continue;

            ResolveValue(
                declaration.Name,
                definitions,
                resolved_values,
                new HashSet<string>(StringComparer.OrdinalIgnoreCase),
                diagnostics);
            BuildAnnotatedValue(
                declaration.Name,
                definitions,
                resolved_values,
                annotated_values,
                new HashSet<string>(StringComparer.OrdinalIgnoreCase));
        }

        var symbols = new List<EntitySymbol>();
        foreach (var declaration in definitions.Values)
        {
            references.TryGetValue(declaration.Name, out var symbol_references);

            // Parameter không được %ref và không phải SYSTEM include → bỏ
            // (tránh Conditional.* chỉ nằm trong IGNORE). Giữ %Include SYSTEM để Outline/GoTo.
            if (declaration.Kind == EntityDeclarationKind.Parameter
                && (symbol_references is null || symbol_references.Count == 0)
                && string.IsNullOrWhiteSpace(declaration.SystemId))
                continue;

            // General entity không được sử dụng (trực tiếp lẫn gián tiếp) → không tạo symbol.
            if (declaration.Kind != EntityDeclarationKind.Parameter
                && !used.Contains(declaration.Name))
                continue;

            resolved_values.TryGetValue(declaration.Name, out var display_text);
            annotated_values.TryGetValue(declaration.Name, out var annotated_text);
            var symbol_diagnostics = diagnostics
                .Where(item =>
                    item.Location.Path.Equals(
                        declaration.Definition.Path,
                        StringComparison.OrdinalIgnoreCase)
                    || item.Message.Contains(declaration.Name, StringComparison.OrdinalIgnoreCase))
                .ToList();

            symbols.Add(new EntitySymbol
            {
                Id = EntityId(declaration.Name),
                Name = declaration.Name,
                DisplayName = declaration.Name,
                DisplayText = display_text ?? declaration.RawValue ?? string.Empty,
                AnnotatedText = annotated_text ?? display_text ?? declaration.RawValue ?? string.Empty,
                RawValue = declaration.RawValue,
                DeclarationKind = declaration.Kind,
                SystemId = declaration.SystemId,
                ResolvedPath = declaration.ResolvedPath,
                IsResolved = declaration.IsResolved,
                Definition = declaration.Definition,
                ValueLocation = declaration.ValueLocation,
                ResolvedDocumentId = declaration.ResolvedPath is null
                    ? null
                    : ErpDocumentId.FromPath(declaration.ResolvedPath),
                References = symbol_references ?? [],
                ChildEntityIds = GetChildEntityIds(declaration.RawValue, definitions),
                Diagnostics = symbol_diagnostics,
                Metadata = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
                {
                    ["declaring_path"] = declaration.DeclaringPath,
                    ["parameter"] = (declaration.Kind == EntityDeclarationKind.Parameter).ToString(),
                    ["active"] = "true"
                }
            });
        }

        // XML lỗi TRONG nội dung entity (inline value hoặc file SYSTEM) trước đây im lặng —
        // NavigationMapBuilder.BuildFragmentChildren catch rồi bỏ. Validate ở Language Service (R1).
        ValidateEntityContent(symbols, diagnostics);

        var segments = BuildProjectionSegments(
            path,
            source_text,
            doctype_token?.Span,
            symbols);
        var clear_text = BuildClearTextProjection(
            source_text,
            doctype_token?.Span,
            symbols,
            out var clear_text_segments,
            out var clear_text_offsets);

        return new EntityBindResult
        {
            Symbols = symbols,
            Diagnostics = diagnostics,
            ClearText = clear_text,
            Segments = segments,
            ClearTextSegments = clear_text_segments,
            ClearTextOffsets = clear_text_offsets
        };
    }

    /// <summary>
    /// Chọn declaration theo entity active (INCLUDE/IGNORE).
    /// Regex thu thập mọi khai báo (kể cả trong section IGNORE) để có offset;
    /// XmlDocument quyết định giá trị / SYSTEM id thật sự.
    /// Parameter entity không có trong DocumentType.Entities → giữ khi được %ref.
    /// </summary>
    private static Dictionary<string, EntityDeclaration> BuildActiveDefinitions(
        IReadOnlyList<EntityDeclaration> declarations,
        IReadOnlyDictionary<string, ActiveEntityInfo> active_entities,
        string path,
        List<ErpDiagnostic> diagnostics)
    {
        var definitions = new Dictionary<string, EntityDeclaration>(
            StringComparer.OrdinalIgnoreCase);
        var by_name = declarations
            .GroupBy(d => d.Name, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(g => g.Key, g => g.ToList(), StringComparer.OrdinalIgnoreCase);

        if (active_entities.Count == 0)
        {
            // Fallback: first-wins, NHƯNG khai báo trong section IGNORE nhường khai báo ngoài (active).
            // Pass 1: khai báo không bị IGNORE (first-wins). Pass 2: khai báo IGNORE chỉ khi chưa có active.
            foreach (var declaration in declarations)
            {
                if (declaration.InIgnoredSection) continue;
                if (definitions.TryAdd(declaration.Name, declaration))
                    continue;

                diagnostics.Add(CreateDiagnostic(
                    "ERP3004",
                    ErpDiagnosticSeverity.Warning,
                    $"Entity trùng tên: {declaration.Name}",
                    declaration.Definition));
            }

            foreach (var declaration in declarations)
            {
                if (declaration.InIgnoredSection)
                    definitions.TryAdd(declaration.Name, declaration);
            }

            return definitions;
        }

        // General entities: chỉ những entity XmlDocument còn active sau INCLUDE/IGNORE.
        foreach (var (name, active) in active_entities)
        {
            by_name.TryGetValue(name, out var candidates);
            candidates ??= [];

            // Parameter entity (%Name;) và general entity có thể trùng tên trong DTD.
            // Nếu regex thấy khai báo %, giữ Parameter — không ép thành ExternalSystem
            // chỉ vì XmlDocument.DocumentType.Entities cũng liệt kê SYSTEM id.
            var parameter = candidates.FirstOrDefault(c =>
                c.Kind == EntityDeclarationKind.Parameter);
            if (parameter is not null)
            {
                definitions[name] = EnsureParameterResolved(parameter, diagnostics);
                continue;
            }

            var picked = PickMatchingDeclaration(candidates, active)
                         ?? candidates.FirstOrDefault();

            definitions[name] = picked is null
                ? SynthesizeFromActive(name, active, path)
                : ApplyActiveValue(picked, active, diagnostics);
        }

        // Parameter entities (%Name;) — không nằm trong DocumentType.Entities.
        // Chỉ giữ khi có %ref trong document / nested active files (có reference sau này),
        // hoặc được khai báo trực tiếp / include thật sự (xuất hiện trong declarations
        // và không phải “chỉ nằm trong IGNORE” thuần túy). Giữ mọi parameter đã collect
        // để Go To Definition %Control.Unit; vẫn hoạt động; insight sẽ lọc riêng.
        foreach (var declaration in declarations)
        {
            if (declaration.Kind != EntityDeclarationKind.Parameter)
                continue;
            if (definitions.ContainsKey(declaration.Name))
                continue;
            definitions[declaration.Name] = EnsureParameterResolved(declaration, diagnostics);
        }

        return definitions;
    }

    private static EntityDeclaration? PickMatchingDeclaration(
        IReadOnlyList<EntityDeclaration> candidates,
        ActiveEntityInfo active)
    {
        if (candidates.Count == 0) return null;

        if (active.SystemId is not null)
        {
            var by_system = candidates.FirstOrDefault(c =>
                c.Kind != EntityDeclarationKind.Parameter
                && string.Equals(c.SystemId, active.SystemId, StringComparison.OrdinalIgnoreCase));
            if (by_system is not null) return by_system;
        }
        else
        {
            var inline_value = active.InlineValue ?? string.Empty;
            // Ưu tiên inline đúng giá trị (kể cả rỗng sau IGNORE); trong đó ưu tiên declaration
            // KHÔNG nằm trong section IGNORE (khai báo active thật sự).
            var by_value = candidates.FirstOrDefault(c =>
                    c.Kind == EntityDeclarationKind.Inline
                    && !c.InIgnoredSection
                    && string.Equals(c.RawValue ?? string.Empty, inline_value, StringComparison.Ordinal))
                ?? candidates.FirstOrDefault(c =>
                    c.Kind == EntityDeclarationKind.Inline
                    && string.Equals(c.RawValue ?? string.Empty, inline_value, StringComparison.Ordinal));
            if (by_value is not null) return by_value;

            // Fallback: inline ngoài IGNORE trước (first-wins theo W3C cho khai báo ACTIVE),
            // rồi mới tới bất kỳ inline nào (ApplyActiveValue sẽ ghi đè RawValue).
            var any_inline = candidates.FirstOrDefault(c =>
                    c.Kind == EntityDeclarationKind.Inline && !c.InIgnoredSection)
                ?? candidates.FirstOrDefault(c => c.Kind == EntityDeclarationKind.Inline);
            if (any_inline is not null) return any_inline;
        }

        return null;
    }

    private static EntityDeclaration EnsureParameterResolved(
        EntityDeclaration parameter,
        List<ErpDiagnostic> diagnostics)
    {
        if (parameter.Kind != EntityDeclarationKind.Parameter)
            return parameter;
        if (string.IsNullOrWhiteSpace(parameter.SystemId))
            return parameter;
        if (parameter.IsResolved && parameter.RawValue is not null)
            return parameter;

        var resolved_path = parameter.ResolvedPath
                            ?? ResolveSystemPath(parameter.DeclaringPath, parameter.SystemId!);
        if (resolved_path is null || !File.Exists(resolved_path))
        {
            diagnostics.Add(CreateDiagnostic(
                "ERP3001",
                ErpDiagnosticSeverity.Error,
                $"Thiếu file entity {parameter.Name}: {parameter.SystemId}",
                parameter.Definition,
                entity_name: parameter.Name,
                related_path: resolved_path ?? parameter.SystemId));
            return parameter;
        }

        try
        {
            return new EntityDeclaration
            {
                Name = parameter.Name,
                Kind = EntityDeclarationKind.Parameter,
                SystemId = parameter.SystemId,
                ResolvedPath = resolved_path,
                RawValue = File.ReadAllText(resolved_path),
                IsResolved = true,
                Definition = parameter.Definition,
                ValueLocation = parameter.ValueLocation,
                DeclaringPath = parameter.DeclaringPath
            };
        }
        catch (Exception ex)
        {
            diagnostics.Add(CreateDiagnostic(
                "ERP3001",
                ErpDiagnosticSeverity.Error,
                $"Không đọc được entity {parameter.Name}: {ex.Message}",
                parameter.Definition,
                entity_name: parameter.Name,
                related_path: resolved_path));
            return parameter;
        }
    }

    private static EntityDeclaration ApplyActiveValue(
        EntityDeclaration picked,
        ActiveEntityInfo active,
        List<ErpDiagnostic> diagnostics)
    {
        if (active.SystemId is null)
        {
            // Active là inline sau INCLUDE/IGNORE.
            // Không lấy RawValue từ XmlDocument.Value — .Value có thể đã expand
            // nested (&Child; → World) hoặc rỗng sai → phá Insight/ClearText.
            // Chỉ dùng active để biết "không còn là SYSTEM"; RawValue lấy từ source
            // khi declaration đã là inline; nếu IGNORE ghi đè SYSTEM → dùng InlineValue ("" ).
            var raw = picked.Kind == EntityDeclarationKind.Inline
                ? picked.RawValue ?? string.Empty
                : active.InlineValue ?? string.Empty;

            return new EntityDeclaration
            {
                Name = picked.Name,
                Kind = EntityDeclarationKind.Inline,
                SystemId = null,
                ResolvedPath = null,
                RawValue = raw,
                IsResolved = true,
                Definition = picked.Definition,
                ValueLocation = picked.Kind == EntityDeclarationKind.Inline
                    ? picked.ValueLocation
                    : SourceLocation.None,
                DeclaringPath = picked.DeclaringPath
            };
        }

        var resolved_path = ResolveSystemPath(picked.DeclaringPath, active.SystemId)
                            ?? ResolveSystemPath(picked.ResolvedPath ?? picked.DeclaringPath, active.SystemId);
        string? raw_value = null;
        var is_resolved = false;
        if (resolved_path is not null && File.Exists(resolved_path))
        {
            try
            {
                raw_value = File.ReadAllText(resolved_path);
                is_resolved = true;
            }
            catch (Exception ex)
            {
                diagnostics.Add(CreateDiagnostic(
                    "ERP3001",
                    ErpDiagnosticSeverity.Error,
                    $"Không đọc được entity {picked.Name}: {ex.Message}",
                    picked.Definition,
                    entity_name: picked.Name,
                    related_path: resolved_path));
            }
        }
        else if (string.Equals(picked.SystemId, active.SystemId, StringComparison.OrdinalIgnoreCase)
                 && picked.IsResolved)
        {
            raw_value = picked.RawValue;
            is_resolved = true;
            resolved_path = picked.ResolvedPath;
        }
        else
        {
            diagnostics.Add(CreateDiagnostic(
                "ERP3001",
                ErpDiagnosticSeverity.Error,
                $"Thiếu file entity {picked.Name}: {active.SystemId}",
                picked.Definition,
                entity_name: picked.Name,
                related_path: resolved_path ?? active.SystemId));
        }

        return new EntityDeclaration
        {
            Name = picked.Name,
            Kind = EntityDeclarationKind.ExternalSystem,
            SystemId = active.SystemId,
            ResolvedPath = resolved_path,
            RawValue = raw_value,
            IsResolved = is_resolved,
            Definition = picked.Definition,
            ValueLocation = picked.ValueLocation,
            DeclaringPath = picked.DeclaringPath
        };
    }

    private static EntityDeclaration SynthesizeFromActive(
        string name,
        ActiveEntityInfo active,
        string path)
    {
        if (active.SystemId is null)
        {
            return new EntityDeclaration
            {
                Name = name,
                Kind = EntityDeclarationKind.Inline,
                RawValue = active.InlineValue ?? string.Empty,
                IsResolved = true,
                Definition = new SourceLocation { Path = path },
                ValueLocation = SourceLocation.None,
                DeclaringPath = path
            };
        }

        var resolved_path = ResolveSystemPath(path, active.SystemId);
        string? raw = null;
        var ok = false;
        if (resolved_path is not null && File.Exists(resolved_path))
        {
            try
            {
                raw = File.ReadAllText(resolved_path);
                ok = true;
            }
            catch
            {
                // leave unresolved
            }
        }

        return new EntityDeclaration
        {
            Name = name,
            Kind = EntityDeclarationKind.ExternalSystem,
            SystemId = active.SystemId,
            ResolvedPath = resolved_path,
            RawValue = raw,
            IsResolved = ok,
            Definition = new SourceLocation { Path = path },
            ValueLocation = SourceLocation.None,
            DeclaringPath = path
        };
    }

    // ── ActiveEntityInfo ──────────────────────────────────────────────────────
    /// <summary>
    /// Thông tin entity được XmlDocument resolve thành công sau khi xử lý
    /// conditional sections (INCLUDE/IGNORE).
    /// </summary>
    private sealed record ActiveEntityInfo(
        string? InlineValue,   // giá trị inline ("" nếu IGNORE ghi đè; null nếu SYSTEM)
        string? SystemId,      // SYSTEM id gốc (null nếu inline)
        bool IsParameter);

    // ── ResolveActiveDtdEntities ──────────────────────────────────────────────
    /// <summary>
    /// Dùng <see cref="XmlDocument"/> (System.Xml) làm authoritative DTD resolver.
    /// XmlDocument tự xử lý conditional sections &lt;![%Name;[...]]&gt; theo chuẩn W3C.
    /// </summary>
    private static Dictionary<string, ActiveEntityInfo> ResolveActiveDtdEntities(
        string path,
        string source_text,
        List<ErpDiagnostic> diagnostics)
    {
        var result = new Dictionary<string, ActiveEntityInfo>(StringComparer.OrdinalIgnoreCase);
        if (string.IsNullOrWhiteSpace(source_text)) return result;

        try
        {
            var settings = new XmlReaderSettings
            {
                DtdProcessing = DtdProcessing.Parse,
                XmlResolver = new XmlUrlResolver(),
                ValidationType = ValidationType.None
            };

            var base_uri = File.Exists(path)
                ? new Uri(Path.GetFullPath(path))
                : null;

            using var string_reader = new StringReader(source_text);
            using var xml_reader = base_uri is not null
                ? XmlReader.Create(string_reader, settings, base_uri.AbsoluteUri)
                : XmlReader.Create(string_reader, settings);

            var doc = new XmlDocument { XmlResolver = new XmlUrlResolver() };
            doc.Load(xml_reader);

            if (doc.DocumentType?.Entities is null) return result;

            foreach (XmlEntity entity in doc.DocumentType.Entities)
            {
                // XmlEntity.Value luôn null (spec .NET) → dùng InnerText (replacement text; nested đã
                // expand — chỉ để MATCH declaration, không dùng làm RawValue). "" cho IGNORE stub.
                result[entity.Name] = new ActiveEntityInfo(
                    InlineValue: entity.SystemId is null
                        ? entity.Value ?? entity.InnerText ?? string.Empty
                        : null,
                    SystemId: entity.SystemId,
                    IsParameter: false);
            }
        }
        catch (Exception ex)
        {
            diagnostics.Add(new ErpDiagnostic
            {
                Id = "ERP3010",
                Severity = ErpDiagnosticSeverity.Info,
                Message = $"DTD pre-resolve warning (fallback to regex): {ex.Message}",
                Location = new SourceLocation { Path = path }
            });
        }

        return result;
    }

    private static readonly Regex MarkedSectionStartRegex =
        new(@"<!\[\s*(?<status>%[\w.\-]+;|INCLUDE|IGNORE)\s*\[", RegexOptions.Compiled | RegexOptions.IgnoreCase);

    private static readonly Regex ParamSystemRegex =
        new("""<!ENTITY\s+%\s+(?<name>[\w.\-]+)\s+SYSTEM\s+(?:"(?<sys>[^"]*)"|'(?<sys>[^']*)')""", RegexOptions.Compiled);

    private static readonly Regex ParamInlineRegex =
        new("""<!ENTITY\s+%\s+(?<name>[\w.\-]+)\s+(?:"(?<val>[^"]*)"|'(?<val>[^']*)')""", RegexOptions.Compiled);

    private static bool IsInRange(int index, List<(int start, int end)> ranges)
    {
        foreach (var (start, end) in ranges)
            if (index >= start && index < end) return true;
        return false;
    }

    /// <summary>
    /// Tìm các vùng nội dung của conditional marked section <c>&lt;![status[…]]&gt;</c> resolve = IGNORE.
    /// status có thể là literal INCLUDE/IGNORE hoặc <c>%Name;</c> (đọc parameter entity). Chỉ đánh dấu khi
    /// chắc chắn IGNORE (an toàn: không rõ → giữ nguyên như first-wins cũ). INCLUDE thì quét tiếp bên trong
    /// (bắt nested IGNORE); IGNORE thì bỏ qua toàn bộ nội dung.
    /// </summary>
    private static List<(int start, int end)> ComputeIgnoredRanges(
        string text, string declaring_path, IReadOnlyList<EntityDeclaration> known)
    {
        var ranges = new List<(int start, int end)>();
        if (string.IsNullOrEmpty(text) || !text.Contains("<!["))
            return ranges;

        var i = 0;
        while (i < text.Length)
        {
            var m = MarkedSectionStartRegex.Match(text, i);
            if (!m.Success) break;

            var content_start = m.Index + m.Length; // sau dấu '[' mở
            var content_end = FindMarkedSectionEnd(text, content_start);
            if (content_end < 0) break; // không đóng → dừng an toàn

            var status = ResolveMarkedStatus(m.Groups["status"].Value, declaring_path, known);
            if (status == MarkedStatus.Ignore)
            {
                ranges.Add((content_start, content_end));
                i = content_end + 3; // qua ']]>' — nested đã bị bao bởi IGNORE
            }
            else
            {
                // INCLUDE hoặc không rõ: quét tiếp bên trong để bắt nested section.
                i = content_start;
            }
        }
        return ranges;
    }

    /// <summary>Vị trí bắt đầu của <c>]]&gt;</c> khớp, tính cả nested <c>&lt;![</c>.</summary>
    private static int FindMarkedSectionEnd(string text, int content_start)
    {
        var depth = 1;
        var j = content_start;
        while (j < text.Length)
        {
            if (j + 3 <= text.Length && text[j] == '<' && text[j + 1] == '!' && text[j + 2] == '[')
            {
                depth++;
                j += 3;
            }
            else if (j + 3 <= text.Length && text[j] == ']' && text[j + 1] == ']' && text[j + 2] == '>')
            {
                depth--;
                if (depth == 0) return j;
                j += 3;
            }
            else j++;
        }
        return -1;
    }

    private enum MarkedStatus { Include, Ignore, Unknown }

    private static MarkedStatus ResolveMarkedStatus(
        string raw_status, string declaring_path, IReadOnlyList<EntityDeclaration> known)
    {
        var s = raw_status.Trim();
        if (s.Equals("IGNORE", StringComparison.OrdinalIgnoreCase)) return MarkedStatus.Ignore;
        if (s.Equals("INCLUDE", StringComparison.OrdinalIgnoreCase)) return MarkedStatus.Include;

        // %Name; → giá trị parameter entity (đọc file SYSTEM hoặc inline). Trim BOM + whitespace.
        if (s.StartsWith('%') && s.EndsWith(';'))
        {
            var name = s[1..^1].Trim();
            var value = ResolveParameterStatusValue(name, declaring_path, known);
            if (value is null) return MarkedStatus.Unknown;
            var v = value.Trim().Trim('﻿').Trim();
            if (v.Equals("IGNORE", StringComparison.OrdinalIgnoreCase)) return MarkedStatus.Ignore;
            if (v.Equals("INCLUDE", StringComparison.OrdinalIgnoreCase)) return MarkedStatus.Include;
        }
        return MarkedStatus.Unknown;
    }

    private static string? ResolveParameterStatusValue(
        string name, string declaring_path, IReadOnlyList<EntityDeclaration> known)
    {
        // 1) Parameter entity đã collect ở file cha (raw_value = nội dung file SYSTEM đã đọc).
        var decl = known.LastOrDefault(d =>
            d.Kind == EntityDeclarationKind.Parameter
            && string.Equals(d.Name, name, StringComparison.OrdinalIgnoreCase)
            && d.RawValue is not null);
        if (decl?.RawValue is { } collected) return collected;

        // 2) Khai báo cục bộ trong chính file này (chưa vào 'known' khi scan trước loop).
        var text = SafeReadFile(declaring_path);
        if (text is null) return null;

        var inline = ParamInlineRegex.Matches(text)
            .Cast<Match>()
            .LastOrDefault(mm => string.Equals(mm.Groups["name"].Value, name, StringComparison.OrdinalIgnoreCase));
        if (inline is not null) return inline.Groups["val"].Value;

        var sys = ParamSystemRegex.Matches(text)
            .Cast<Match>()
            .LastOrDefault(mm => string.Equals(mm.Groups["name"].Value, name, StringComparison.OrdinalIgnoreCase));
        if (sys is not null)
        {
            var resolved = ResolveSystemPath(declaring_path, sys.Groups["sys"].Value);
            if (resolved is not null) return SafeReadFile(resolved);
        }
        return null;
    }

    private static string? SafeReadFile(string? path)
    {
        try
        {
            return string.IsNullOrWhiteSpace(path) || !File.Exists(path) ? null : File.ReadAllText(path);
        }
        catch
        {
            return null;
        }
    }

    private static void CollectDeclarations(
        string declaring_path,
        string text,
        int base_offset,
        List<EntityDeclaration> declarations,
        List<ErpDiagnostic> diagnostics,
        HashSet<string> file_stack)
    {
        var line_map = new LineMap(text);
        var current_file = NormalizePath(declaring_path);
        if (!string.IsNullOrWhiteSpace(current_file) && !file_stack.Add(current_file))
        {
            diagnostics.Add(CreateDiagnostic(
                "ERP3002",
                ErpDiagnosticSeverity.Error,
                $"Chu kỳ include entity: {declaring_path}",
                new SourceLocation { Path = declaring_path }));
            return;
        }

        // Single-pass: scan tất cả declarations bằng regex, lấy offset chính xác.
        // Ưu tiên XmlDocument (ResolveActiveDtdEntities) quyết INCLUDE/IGNORE; nhưng khi nó fail
        // (DTD external include khổng lồ), fallback dùng cờ InIgnoredSection để bỏ khai báo trong
        // section IGNORE (vd. <![%Conditional.Tiny.External;[ ... ]]> khi Tiny.External.txt = IGNORE).
        var ignored_ranges = ComputeIgnoredRanges(text, declaring_path, declarations);
        var current_declarations = new List<EntityDeclaration>();
        foreach (Match match in DeclarationRegex.Matches(text))
        {
            var name = match.Groups["name"].Value;
            var is_parameter = match.Groups["parameter"].Success;
            var system_id = match.Groups["system"].Success
                ? match.Groups["system"].Value
                : null;
            var value = match.Groups["value"].Success
                ? match.Groups["value"].Value
                : null;
            var kind = is_parameter
                ? EntityDeclarationKind.Parameter
                : system_id is null
                    ? EntityDeclarationKind.Inline
                    : EntityDeclarationKind.ExternalSystem;

            var definition = Location(
                declaring_path,
                line_map,
                match.Index,
                base_offset + match.Index,
                match.Length);
            var value_group = match.Groups["value"].Success
                ? match.Groups["value"]
                : match.Groups["system"];
            var value_location = value_group.Success
                ? Location(
                    declaring_path,
                    line_map,
                    value_group.Index,
                    base_offset + value_group.Index,
                    value_group.Length)
                : SourceLocation.None;

            var resolved_path = system_id is null
                ? null
                : ResolveSystemPath(declaring_path, system_id);
            var raw_value = value;
            var is_resolved = system_id is null;

            if (system_id is not null)
            {
                if (resolved_path is not null && File.Exists(resolved_path))
                {
                    try
                    {
                        raw_value = File.ReadAllText(resolved_path);
                        is_resolved = true;
                    }
                    catch (Exception ex)
                    {
                        diagnostics.Add(CreateDiagnostic(
                            "ERP3001",
                            ErpDiagnosticSeverity.Error,
                            $"Không đọc được entity {name}: {ex.Message}",
                            definition,
                            entity_name: name,
                            related_path: resolved_path));
                    }
                }
                else if (!is_parameter)
                {
                    diagnostics.Add(CreateDiagnostic(
                        "ERP3001",
                        ErpDiagnosticSeverity.Error,
                        $"Thiếu file entity {name}: {system_id}",
                        definition,
                        entity_name: name,
                        related_path: resolved_path ?? system_id));
                }
            }

            var declaration = new EntityDeclaration
            {
                Name = name,
                Kind = kind,
                SystemId = system_id,
                ResolvedPath = resolved_path,
                RawValue = raw_value,
                IsResolved = is_resolved,
                Definition = definition,
                ValueLocation = value_location,
                DeclaringPath = declaring_path,
                InIgnoredSection = IsInRange(match.Index, ignored_ranges)
            };
            declarations.Add(declaration);
            current_declarations.Add(declaration);
        }

        // Đệ quy vào các SYSTEM parameter entities (include files như CheckDir.ent)
        foreach (var declaration in current_declarations)
        {
            if (declaration.Kind != EntityDeclarationKind.Parameter
                || !declaration.IsResolved
                || string.IsNullOrWhiteSpace(declaration.ResolvedPath)
                || declaration.RawValue is null)
                continue;

            CollectDeclarations(
                declaration.ResolvedPath,
                declaration.RawValue,
                0,
                declarations,
                diagnostics,
                file_stack);
        }

        if (!string.IsNullOrWhiteSpace(current_file))
            file_stack.Remove(current_file);
    }

    /// <summary>
    /// Tập entity được sử dụng: tham chiếu &amp;Name; trong body document (ngoài DOCTYPE),
    /// đóng bao gián tiếp qua RawValue của các entity đã dùng (BFS, cycle-safe vì visited
    /// chính là tập kết quả).
    /// </summary>
    private static HashSet<string> ComputeUsedEntityClosure(
        string source_text,
        SourceSpan? doctype_span,
        IReadOnlyDictionary<string, EntityDeclaration> definitions)
    {
        var used = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
        var queue = new Queue<string>();

        foreach (Match match in GeneralReferenceRegex.Matches(source_text))
        {
            if (doctype_span is { } excluded
                && match.Index >= excluded.StartOffset
                && match.Index < excluded.EndOffset)
                continue;
            // FBO: <!-- &Include; --> = tắt include — không tính là "used".
            if (IsInsideXmlComment(source_text, match.Index))
                continue;

            var name = match.Groups["name"].Value;
            if (BuiltInNames.Contains(name) || !definitions.ContainsKey(name))
                continue;
            if (used.Add(name))
                queue.Enqueue(name);
        }

        while (queue.Count > 0)
        {
            var raw_value = definitions[queue.Dequeue()].RawValue;
            if (string.IsNullOrEmpty(raw_value))
                continue;

            foreach (Match match in GeneralReferenceRegex.Matches(raw_value))
            {
                var child = match.Groups["name"].Value;
                if (BuiltInNames.Contains(child) || !definitions.ContainsKey(child))
                    continue;
                if (used.Add(child))
                    queue.Enqueue(child);
            }
        }

        return used;
    }

    private static Dictionary<string, List<SymbolReference>> BuildReferenceIndex(
        string path,
        string source_text,
        SourceSpan? doctype_span,
        IReadOnlyDictionary<string, EntityDeclaration> definitions,
        IReadOnlySet<string> used,
        List<ErpDiagnostic> diagnostics)
    {
        var result = new Dictionary<string, List<SymbolReference>>(
            StringComparer.OrdinalIgnoreCase);

        AddReferences(
            path,
            source_text,
            0,
            doctype_span,
            definitions,
            result,
            diagnostics,
            include_general: true,
            include_parameter: false);

        if (doctype_span is { } doctype
            && doctype.StartOffset >= 0
            && doctype.EndOffset <= source_text.Length)
        {
            AddReferences(
                path,
                source_text.Substring(doctype.StartOffset, doctype.Length),
                doctype.StartOffset,
                excluded_span: null,
                definitions,
                result,
                diagnostics,
                include_general: false,
                include_parameter: true);
        }

        // Chỉ quét RawValue của entity ACTIVE và ĐƯỢC SỬ DỤNG — không quét nội dung file
        // trong IGNORE, không lấy reference phát sinh từ entity mà document không dùng tới.
        foreach (var declaration in definitions.Values)
        {
            if (declaration.Kind == EntityDeclarationKind.Parameter
                || string.IsNullOrEmpty(declaration.RawValue)
                || !used.Contains(declaration.Name))
                continue;

            var base_offset = declaration.Kind == EntityDeclarationKind.Inline
                ? declaration.ValueLocation.Span.StartOffset
                : 0;
            AddReferences(
                declaration.Kind == EntityDeclarationKind.Inline
                    ? declaration.DeclaringPath
                    : declaration.ResolvedPath ?? declaration.DeclaringPath,
                declaration.RawValue,
                base_offset,
                excluded_span: null,
                definitions,
                result,
                diagnostics,
                include_general: true,
                include_parameter: false);
        }

        return result;
    }

    private static void AddReferences(
        string path,
        string text,
        int base_offset,
        SourceSpan? excluded_span,
        IReadOnlyDictionary<string, EntityDeclaration> definitions,
        Dictionary<string, List<SymbolReference>> result,
        List<ErpDiagnostic> diagnostics,
        bool include_general,
        bool include_parameter)
    {
        var line_map = new LineMap(text);
        if (include_general)
            AddMatches(GeneralReferenceRegex, "entity");
        if (include_parameter)
            AddMatches(ParameterReferenceRegex, "parameter");
        return;

        void AddMatches(Regex regex, string reference_kind)
        {
            foreach (Match match in regex.Matches(text))
            {
                var absolute_offset = base_offset + match.Index;
                if (excluded_span is { } excluded
                    && absolute_offset >= excluded.StartOffset
                    && absolute_offset < excluded.EndOffset)
                    continue;
                // Comment-out entity (&X; trong <!-- -->) không tạo reference / ERP3003.
                if (IsInsideXmlComment(text, match.Index))
                    continue;

                var name = match.Groups["name"].Value;
                if (BuiltInNames.Contains(name))
                    continue;

                var location = Location(
                    path,
                    line_map,
                    match.Index,
                    absolute_offset,
                    match.Length);
                if (!definitions.ContainsKey(name))
                {
                    diagnostics.Add(CreateDiagnostic(
                        "ERP3003",
                        ErpDiagnosticSeverity.Warning,
                        $"Entity chưa được định nghĩa: {name}",
                        location));
                    continue;
                }

                if (!result.TryGetValue(name, out var items))
                {
                    items = [];
                    result[name] = items;
                }

                items.Add(new SymbolReference
                {
                    SymbolId = EntityId(name),
                    Location = location,
                    Kind = reference_kind
                });
            }
        }
    }

    private static string ResolveValue(
        string name,
        IReadOnlyDictionary<string, EntityDeclaration> definitions,
        Dictionary<string, string> cache,
        HashSet<string> resolving,
        List<ErpDiagnostic> diagnostics)
    {
        if (cache.TryGetValue(name, out var cached))
            return cached;
        if (!definitions.TryGetValue(name, out var declaration))
            return $"&{name};";
        if (!resolving.Add(name))
        {
            diagnostics.Add(CreateDiagnostic(
                "ERP3002",
                ErpDiagnosticSeverity.Error,
                $"Chu kỳ entity: {string.Join(" → ", resolving)} → {name}",
                declaration.Definition));
            return $"&{name};";
        }

        var raw_value = declaration.RawValue ?? string.Empty;
        var resolved = GeneralReferenceRegex.Replace(raw_value, match =>
        {
            var child_name = match.Groups["name"].Value;
            if (BuiltInNames.Contains(child_name))
                return match.Value;
            return definitions.ContainsKey(child_name)
                ? ResolveValue(child_name, definitions, cache, resolving, diagnostics)
                : match.Value;
        });

        resolving.Remove(name);
        cache[name] = resolved;
        return resolved;
    }

    /// <summary>
    /// Giá trị chú giải cho Insight/Semantic mode:
    /// - Entity lá (RawValue không chứa ref con): giá trị resolve ("1", "xin", ...).
    /// - Entity nhiều cấp: RawValue với mỗi ref con thay bằng "&amp;Con;|chú_giải_con".
    ///   Ví dụ A="xin", B="chào", C="&amp;A;&amp;B;Claude" → C = "&amp;A;|xin&amp;B;|chàoClaude".
    /// Cycle: trả về "&amp;name;" (ERP3002 đã được ResolveValue phát, không phát lại).
    /// </summary>
    private static string BuildAnnotatedValue(
        string name,
        IReadOnlyDictionary<string, EntityDeclaration> definitions,
        IReadOnlyDictionary<string, string> resolved_values,
        Dictionary<string, string> cache,
        HashSet<string> resolving)
    {
        if (cache.TryGetValue(name, out var cached))
            return cached;
        if (!definitions.TryGetValue(name, out var declaration))
            return $"&{name};";
        if (!resolving.Add(name))
            return $"&{name};";

        var raw_value = declaration.RawValue ?? string.Empty;
        var has_children = GeneralReferenceRegex.Matches(raw_value).Any(match =>
        {
            var child = match.Groups["name"].Value;
            return !BuiltInNames.Contains(child) && definitions.ContainsKey(child);
        });

        string annotated;
        if (!has_children)
        {
            annotated = resolved_values.TryGetValue(name, out var resolved)
                ? resolved
                : raw_value;
        }
        else
        {
            annotated = GeneralReferenceRegex.Replace(raw_value, match =>
            {
                var child = match.Groups["name"].Value;
                if (BuiltInNames.Contains(child) || !definitions.ContainsKey(child))
                    return match.Value;
                return $"&{child};|" + BuildAnnotatedValue(
                    child, definitions, resolved_values, cache, resolving);
            });
        }

        resolving.Remove(name);
        cache[name] = annotated;
        return annotated;
    }

    private static IReadOnlyList<string> GetChildEntityIds(
        string? raw_value,
        IReadOnlyDictionary<string, EntityDeclaration> definitions)
    {
        if (string.IsNullOrEmpty(raw_value))
            return [];

        return GeneralReferenceRegex.Matches(raw_value)
            .Select(match => match.Groups["name"].Value)
            .Where(name => !BuiltInNames.Contains(name) && definitions.ContainsKey(name))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .Select(EntityId)
            .ToList();
    }

    private static IReadOnlyList<EntityProjectionSegment> BuildProjectionSegments(
        string path,
        string source_text,
        SourceSpan? doctype_span,
        IReadOnlyList<EntitySymbol> symbols)
    {
        var by_name = symbols.ToDictionary(
            symbol => symbol.Name,
            StringComparer.OrdinalIgnoreCase);
        var segments = new List<EntityProjectionSegment>();

        foreach (Match match in GeneralReferenceRegex.Matches(source_text))
        {
            if (doctype_span is { } excluded
                && match.Index >= excluded.StartOffset
                && match.Index < excluded.EndOffset)
                continue;
            if (IsInsideXmlComment(source_text, match.Index))
                continue;

            var name = match.Groups["name"].Value;
            if (!by_name.TryGetValue(name, out var symbol))
                continue;

            segments.Add(new EntityProjectionSegment
            {
                SymbolId = symbol.Id,
                Name = symbol.Name,
                DisplayText = symbol.DisplayText,
                SourceSpan = new SourceSpan(match.Index, match.Length),
                CanEdit = symbol.DeclarationKind != EntityDeclarationKind.Parameter
                          && symbol.IsResolved
            });
        }

        _ = path;
        return segments;
    }

    /// <summary>
    /// ClearText projection: toàn bộ document với mọi tham chiếu entity trong body đã được
    /// thay bằng nội dung thật (đệ quy), kèm map cho biết mỗi đoạn text đến từ entity nào.
    /// DOCTYPE giữ nguyên — expand chỉ xảy ra sau DOCTYPE, nên offset trong DOCTYPE (khai báo
    /// &lt;!ENTITY&gt;) trùng nhau giữa Source và ClearText; Insight mode dựa vào tính chất này
    /// để Ctrl+Click nhảy tới khai báo inline mà không cần bảng ánh xạ offset riêng.
    /// Ngoài DOCTYPE thì offset KHÔNG trùng — <paramref name="offsets"/> là bảng ánh xạ để
    /// navigation (Outline/F12, tính offset trên source) nhảy đúng chỗ trên buffer ClearText.
    /// </summary>
    private static string BuildClearTextProjection(
        string source_text,
        SourceSpan? doctype_span,
        IReadOnlyList<EntitySymbol> symbols,
        out IReadOnlyList<ClearTextSegment> segments,
        out ClearTextOffsetMap offsets)
    {
        var by_name = symbols.ToDictionary(
            symbol => symbol.Name,
            StringComparer.OrdinalIgnoreCase);
        var builder = new System.Text.StringBuilder(source_text.Length);
        var collected = new List<ClearTextSegment>();
        var regions = new List<ClearTextOffsetRegion>();
        var cursor = 0;

        foreach (Match match in GeneralReferenceRegex.Matches(source_text))
        {
            if (doctype_span is { } excluded
                && match.Index >= excluded.StartOffset
                && match.Index < excluded.EndOffset)
                continue;
            // Match lồng trong vùng đã ghi (không xảy ra với regex này, nhưng giữ an toàn).
            if (match.Index < cursor)
                continue;
            // FBO: <!-- &Include; --> tắt include — giữ nguyên "&X;" trong comment, không expand
            // (value thường chứa "--" → XmlException / Design blank / ERP0002).
            if (IsInsideXmlComment(source_text, match.Index))
                continue;

            AppendLiteral(source_text, cursor, match.Index - cursor, builder, regions);
            cursor = match.Index + match.Length;

            var name = match.Groups["name"].Value;
            if (BuiltInNames.Contains(name) || !by_name.TryGetValue(name, out var symbol))
            {
                // Entity không khai báo — giữ nguyên "&X;" (ERP3003 đã được phát ở nơi khác).
                // Copy 1:1 nên vẫn là vùng literal, offset không lệch.
                AppendLiteral(source_text, match.Index, match.Length, builder, regions);
                continue;
            }

            var clear_start = builder.Length;
            AppendExpansion(
                symbol,
                depth: 0,
                by_name,
                builder,
                collected,
                new HashSet<string>(StringComparer.OrdinalIgnoreCase));
            regions.Add(new ClearTextOffsetRegion(
                match.Index,
                match.Length,
                clear_start,
                builder.Length - clear_start,
                IsExpansion: true));
        }

        AppendLiteral(source_text, cursor, source_text.Length - cursor, builder, regions);
        segments = collected;
        offsets = new ClearTextOffsetMap(regions);
        return builder.ToString();
    }

    /// <summary>
    /// Copy một đoạn source vào ClearText nguyên văn và ghi nhận vùng ánh xạ tuyến tính.
    /// Gộp với vùng literal liền trước để bảng ánh xạ không phình theo số tham chiếu.
    /// </summary>
    private static void AppendLiteral(
        string source_text,
        int start,
        int length,
        System.Text.StringBuilder builder,
        List<ClearTextOffsetRegion> regions)
    {
        if (length <= 0) return;

        var clear_start = builder.Length;
        builder.Append(source_text, start, length);

        if (regions.Count > 0
            && regions[^1] is { IsExpansion: false } previous
            && previous.SourceOffset + previous.SourceLength == start)
        {
            regions[^1] = previous with
            {
                SourceLength = previous.SourceLength + length,
                ClearTextLength = previous.ClearTextLength + length
            };
            return;
        }

        regions.Add(new ClearTextOffsetRegion(start, length, clear_start, length, IsExpansion: false));
    }

    /// <summary>
    /// Ghi nội dung đã expand của một entity vào <paramref name="builder"/> và ghi nhận
    /// segment phủ đúng đoạn vừa ghi. Ref con bên trong RawValue được expand đệ quy và sinh
    /// segment depth + 1 nằm trọn trong segment cha (không flatten — renderer phân biệt được
    /// entity chính và entity lồng).
    /// </summary>
    private static void AppendExpansion(
        EntitySymbol symbol,
        int depth,
        IReadOnlyDictionary<string, EntitySymbol> by_name,
        System.Text.StringBuilder builder,
        List<ClearTextSegment> collected,
        HashSet<string> resolving)
    {
        var start = builder.Length;

        // Chu kỳ hoặc không resolve được → giữ nguyên "&X;" và đánh dấu lỗi để renderer tô khác.
        if (!symbol.IsResolved || !resolving.Add(symbol.Name))
        {
            builder.Append('&').Append(symbol.Name).Append(';');
            collected.Add(Segment(symbol, depth, start, builder.Length - start, is_error: true));
            return;
        }

        var raw_value = symbol.RawValue ?? string.Empty;
        var cursor = 0;
        foreach (Match match in GeneralReferenceRegex.Matches(raw_value))
        {
            if (match.Index < cursor)
                continue;

            builder.Append(raw_value, cursor, match.Index - cursor);
            cursor = match.Index + match.Length;

            var child_name = match.Groups["name"].Value;
            if (BuiltInNames.Contains(child_name)
                || !by_name.TryGetValue(child_name, out var child))
            {
                builder.Append(match.Value);
                continue;
            }

            AppendExpansion(child, depth + 1, by_name, builder, collected, resolving);
        }

        builder.Append(raw_value, cursor, raw_value.Length - cursor);
        resolving.Remove(symbol.Name);

        collected.Add(Segment(symbol, depth, start, builder.Length - start, is_error: false));
    }

    private static ClearTextSegment Segment(
        EntitySymbol symbol,
        int depth,
        int start,
        int length,
        bool is_error) =>
        new()
        {
            SymbolId = symbol.Id,
            EntityName = symbol.Name,
            Span = new SourceSpan(start, length),
            Depth = depth,
            Kind = symbol.DeclarationKind == EntityDeclarationKind.ExternalSystem
                ? ClearTextSegmentKind.System
                : ClearTextSegmentKind.Inline,
            DefinitionPath = symbol.Definition.Path,
            DefinitionOffset = symbol.Definition.Span.StartOffset,
            OpenPath = symbol.DeclarationKind == EntityDeclarationKind.ExternalSystem
                ? symbol.ResolvedPath ?? string.Empty
                : string.Empty,
            IsError = is_error
        };

    private static string? ResolveSystemPath(string declaring_path, string system_id)
    {
        if (string.IsNullOrWhiteSpace(system_id))
            return null;
        try
        {
            var base_directory = File.Exists(declaring_path)
                ? Path.GetDirectoryName(Path.GetFullPath(declaring_path))
                : Path.GetDirectoryName(declaring_path);
            if (string.IsNullOrWhiteSpace(base_directory))
                return null;
            var relative = system_id.Replace('/', Path.DirectorySeparatorChar);
            return Path.GetFullPath(Path.Combine(base_directory, relative));
        }
        catch
        {
            return null;
        }
    }

    private static SourceLocation Location(
        string path,
        LineMap line_map,
        int line_map_offset,
        int absolute_offset,
        int length)
    {
        var local_offset = Math.Clamp(line_map_offset, 0, line_map.TextLength);
        var (line, column) = line_map.GetLineColumn(local_offset);
        return new SourceLocation
        {
            Path = path,
            Span = new SourceSpan(absolute_offset, length),
            Line = line,
            Column = column
        };
    }

    private static ErpDiagnostic CreateDiagnostic(
        string id,
        ErpDiagnosticSeverity severity,
        string message,
        SourceLocation location,
        string? entity_name = null,
        string? related_path = null,
        int? related_line = null) =>
        new()
        {
            Id = id,
            Severity = severity,
            Message = message,
            Location = location,
            EntityName = entity_name,
            RelatedPath = related_path,
            RelatedLine = related_line
        };

    /// <summary>
    /// Kiểm XML trong nội dung entity đã dùng: parse RawValue như fragment, nếu có lỗi cấu trúc
    /// (ERP1002) thì phát ERP3005. SYSTEM → Location = khai báo trong file đang mở, RelatedPath =
    /// file .ent + RelatedLine = dòng lỗi trong file đó (Problems mở được file entity). Inline →
    /// Location = span giá trị trong DOCTYPE. Bỏ qua nội dung không phải XML body (SQL/text) và
    /// nội dung DTD (bắt đầu bằng "&lt;!").
    /// </summary>
    private static void ValidateEntityContent(
        IReadOnlyList<EntitySymbol> symbols,
        List<ErpDiagnostic> diagnostics)
    {
        foreach (var symbol in symbols)
        {
            if (symbol.DeclarationKind == EntityDeclarationKind.Parameter || !symbol.IsResolved)
                continue;

            var raw = symbol.RawValue;
            if (string.IsNullOrWhiteSpace(raw)) continue;
            var trimmed = raw.TrimStart();
            if (trimmed.Length == 0 || trimmed[0] != '<') continue;
            if (trimmed.StartsWith("<!", StringComparison.Ordinal)) continue; // DTD / khai báo

            var is_system = symbol.DeclarationKind == EntityDeclarationKind.ExternalSystem;
            var content_path = is_system
                ? symbol.ResolvedPath ?? symbol.Definition.Path
                : symbol.Definition.Path;

            ISyntaxTree tree;
            try
            {
                tree = Syntax.FboSyntaxParser.Parse(raw, content_path);
            }
            catch
            {
                continue;
            }

            var structural = tree.Diagnostics.FirstOrDefault(d => d.Id == "ERP1002");
            if (structural is null) continue;

            // SYSTEM: điều hướng tới khai báo <!ENTITY> trong file đang mở; file lỗi ở RelatedPath.
            // Inline: value nằm trong DOCTYPE file đang mở.
            var primary = is_system
                ? symbol.Definition
                : symbol.ValueLocation.Path.Length > 0 ? symbol.ValueLocation : symbol.Definition;

            diagnostics.Add(new ErpDiagnostic
            {
                Id = "ERP3005",
                Severity = ErpDiagnosticSeverity.Error,
                Message = is_system
                    ? $"Nội dung entity {symbol.Name} (file {Path.GetFileName(content_path)}) có lỗi XML: {structural.Message}"
                    : $"Nội dung entity {symbol.Name} có lỗi XML: {structural.Message}",
                Location = primary,
                EntityName = symbol.Name,
                SymbolId = symbol.Id,
                RelatedPath = is_system ? content_path : null,
                RelatedLine = is_system ? structural.Location.Line : null
            });
        }
    }

    /// <summary>
    /// True nếu <paramref name="offset"/> nằm trong <c>&lt;!-- … --&gt;</c> (kể cả chưa đóng).
    /// Dùng để tôn trọng FBO comment-out include: <c>&lt;!-- &amp;Entity; --&gt;</c>.
    /// </summary>
    internal static bool IsInsideXmlComment(string text, int offset)
    {
        if (offset < 0 || offset >= text.Length)
            return false;

        var search = 0;
        while (search <= offset)
        {
            var start = text.IndexOf("<!--", search, StringComparison.Ordinal);
            if (start < 0 || start > offset)
                return false;

            var end = text.IndexOf("-->", start + 4, StringComparison.Ordinal);
            if (end < 0)
                return offset >= start;

            // Nội dung comment: [start, end+3)
            if (offset >= start && offset < end + 3)
                return true;

            search = end + 3;
        }

        return false;
    }

    private static string EntityId(string name) => $"entity:{name}";

    private static string NormalizePath(string path)
    {
        if (string.IsNullOrWhiteSpace(path))
            return string.Empty;
        try
        {
            return Path.GetFullPath(path);
        }
        catch
        {
            return path;
        }
    }

    private sealed class EntityDeclaration
    {
        public string Name { get; init; } = string.Empty;

        public EntityDeclarationKind Kind { get; init; }

        public string? SystemId { get; init; }

        public string? ResolvedPath { get; init; }

        public string? RawValue { get; init; }

        public bool IsResolved { get; init; }

        public SourceLocation Definition { get; init; } = SourceLocation.None;

        public SourceLocation ValueLocation { get; init; } = SourceLocation.None;

        public string DeclaringPath { get; init; } = string.Empty;

        /// <summary>Khai báo nằm trong conditional marked section <c>&lt;![%cond;[…]]&gt;</c> resolve = IGNORE.</summary>
        public bool InIgnoredSection { get; init; }
    }
}
