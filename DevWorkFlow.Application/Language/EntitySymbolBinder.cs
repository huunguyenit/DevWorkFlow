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

        var references = BuildReferenceIndex(
            path,
            source_text,
            doctype_token?.Span,
            definitions,
            diagnostics);

        var resolved_values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        foreach (var declaration in definitions.Values)
        {
            ResolveValue(
                declaration.Name,
                definitions,
                resolved_values,
                new HashSet<string>(StringComparer.OrdinalIgnoreCase),
                diagnostics);
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

            resolved_values.TryGetValue(declaration.Name, out var display_text);
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

        var segments = BuildProjectionSegments(
            path,
            source_text,
            doctype_token?.Span,
            symbols);
        var clear_text = BuildClearText(source_text, doctype_token?.Span, symbols);

        return new EntityBindResult
        {
            Symbols = symbols,
            Diagnostics = diagnostics,
            ClearText = clear_text,
            Segments = segments
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
            // Fallback: first-wins + cảnh báo trùng (DTD pre-resolve thất bại).
            foreach (var declaration in declarations)
            {
                if (definitions.TryAdd(declaration.Name, declaration))
                    continue;

                diagnostics.Add(CreateDiagnostic(
                    "ERP3004",
                    ErpDiagnosticSeverity.Warning,
                    $"Entity trùng tên: {declaration.Name}",
                    declaration.Definition));
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
            // Ưu tiên inline đúng giá trị (kể cả rỗng sau IGNORE).
            var by_value = candidates.FirstOrDefault(c =>
                c.Kind == EntityDeclarationKind.Inline
                && string.Equals(c.RawValue ?? string.Empty, inline_value, StringComparison.Ordinal));
            if (by_value is not null) return by_value;

            // Fallback: bất kỳ inline nào (sẽ bị ApplyActiveValue ghi đè RawValue).
            var any_inline = candidates.FirstOrDefault(c => c.Kind == EntityDeclarationKind.Inline);
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
                parameter.Definition));
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
                parameter.Definition));
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
                    picked.Definition));
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
                picked.Definition));
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
                // Chuẩn hoá: Value null → "" để so khớp với IGNORE stub.
                result[entity.Name] = new ActiveEntityInfo(
                    InlineValue: entity.SystemId is null ? entity.Value ?? string.Empty : null,
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
        // Việc lọc INCLUDE/IGNORE đã được xử lý bởi ResolveActiveDtdEntities (XmlDocument)
        // ở tầng trên — CollectDeclarations chỉ cần cung cấp đầy đủ offset cho mọi declaration
        // để Bind() có thể chọn đúng declaration sau khi đã biết entity nào active.
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
                            definition));
                    }
                }
                else if (!is_parameter)
                {
                    diagnostics.Add(CreateDiagnostic(
                        "ERP3001",
                        ErpDiagnosticSeverity.Error,
                        $"Thiếu file entity {name}: {system_id}",
                        definition));
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
                DeclaringPath = declaring_path
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

    private static Dictionary<string, List<SymbolReference>> BuildReferenceIndex(
        string path,
        string source_text,
        SourceSpan? doctype_span,
        IReadOnlyDictionary<string, EntityDeclaration> definitions,
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

        // Chỉ quét RawValue của entity ACTIVE — không quét nội dung file trong IGNORE.
        foreach (var declaration in definitions.Values)
        {
            if (declaration.Kind == EntityDeclarationKind.Parameter
                || string.IsNullOrEmpty(declaration.RawValue))
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

    private static string BuildClearText(
        string source_text,
        SourceSpan? doctype_span,
        IReadOnlyList<EntitySymbol> symbols)
    {
        var by_name = symbols.ToDictionary(
            symbol => symbol.Name,
            StringComparer.OrdinalIgnoreCase);
        return GeneralReferenceRegex.Replace(source_text, match =>
        {
            if (doctype_span is { } excluded
                && match.Index >= excluded.StartOffset
                && match.Index < excluded.EndOffset)
                return match.Value;

            var name = match.Groups["name"].Value;
            return by_name.TryGetValue(name, out var symbol) && symbol.IsResolved
                ? symbol.DisplayText
                : match.Value;
        });
    }

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
        SourceLocation location) =>
        new()
        {
            Id = id,
            Severity = severity,
            Message = message,
            Location = location
        };

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
    }
}
