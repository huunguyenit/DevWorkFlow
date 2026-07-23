using System.Text.RegularExpressions;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Application.Language;

/// <summary>
/// Hit-test JS runtime FBO (Phase 3) — chạy SAU khi Entity (Phase 1) và Structural (Phase 2) miss.
///
/// Chạy trên CLEARTEXT, không phải source XML: phần lớn script FBO đến từ entity include dùng
/// chung, nên index trên source bỏ sót rất nhiều (đo trên Grid/SVDetail.xml: 22 function và 8
/// lời gọi request trong ClearText so với 17 và 6 trong source). Mọi vị trí tìm được sau đó
/// ánh xạ ngược về (file, offset) thật qua <see cref="ClearTextLocationMapper"/> — điều hướng
/// phải tới đúng nơi kể cả khi nội dung nằm ở file khác.
///
/// Regex/scanner có kiểm soát — KHÔNG parse full JS AST, KHÔNG parse XML ở UI.
/// </summary>
public static class JsRuntimeAtOffsetResolver
{
    private static readonly Regex ShowFormLiteralRegex = new(
        @"\b\w+\s*\.\s*showForm(?:\$\w+)?\s*\(\s*(['""])(?<name>[A-Za-z_][\w.-]*)\1",
        RegexOptions.Compiled);

    private static readonly Regex DollarAUsageRegex = new(
        @"\$a\s*\.\s*(?<name>[A-Za-z_$][\w$]*)", RegexOptions.Compiled);

    private static readonly Regex FunctionDefinitionRegex = new(
        @"function\s+(?<name>[A-Za-z_$][\w$]*)", RegexOptions.Compiled);

    /// <summary>&lt;action id="X"&gt; (FBO dùng `id`) hoặc &lt;action|response name="X"&gt;.</summary>
    private static readonly Regex ActionDeclarationRegex = new(
        @"<(?:action|response)\b[^>]*?\b(?:id|name)\s*=\s*(['""])(?<name>[^'""]+)\1",
        RegexOptions.Compiled | RegexOptions.IgnoreCase);

    private static readonly Regex CaseLabelRegex = new(
        @"\bcase\s+(['""])(?<name>[^'""]+)\1\s*:", RegexOptions.Compiled);

    /// <summary>
    /// "Hết identifier" cho tên hàm FBO (chữ, số, <c>_</c>, <c>$</c>) — thay cho <c>\b</c> vốn
    /// sai với tên kết thúc bằng <c>$</c>. Xem chú thích trong TryResolveFunctionIdentifier.
    /// </summary>
    internal const string IdentifierEnd = @"(?![\w$])";

    /// <summary>Đối xứng với <see cref="IdentifierEnd"/> cho đầu tên.</summary>
    internal const string IdentifierStart = @"(?<![\w$])";

    /// <param name="clear_text_offset">Offset tính trên ClearText của document.</param>
    public static JsRuntimeNavHit? TryResolve(
        IErpSemanticModel model,
        ErpDocumentProjection clear_text,
        string document_path,
        int clear_text_offset,
        string? controllers_path)
    {
        var text = clear_text.Text;
        if (string.IsNullOrEmpty(text)) return null;
        if (clear_text_offset < 0 || clear_text_offset > text.Length) return null;

        var ctx = new ResolveContext(model, clear_text, document_path, text);

        return TryResolveRequest(ctx, clear_text_offset)
            ?? TryResolveActionDeclaration(ctx, clear_text_offset)
            ?? TryResolveCaseLabel(ctx, clear_text_offset)
            ?? TryResolveShowForm(ctx, clear_text_offset, controllers_path)
            ?? TryResolveDollarA(ctx, clear_text_offset)
            ?? TryResolveFunctionIdentifier(ctx, clear_text_offset);
    }

    private sealed record ResolveContext(
        IErpSemanticModel Model,
        ErpDocumentProjection ClearText,
        string DocumentPath,
        string Text)
    {
        public ResolvedTextLocation Map(int clear_offset) =>
            ClearTextLocationMapper.Resolve(clear_offset, ClearText, Model, DocumentPath);
    }

    // ── #11 request(...) → action / case ────────────────────────────────────
    private static JsRuntimeNavHit? TryResolveRequest(ResolveContext ctx, int offset)
    {
        var call = FboRequestCallParser.TryFindEnclosing(ctx.Text, offset);
        if (call is null) return null;

        if (offset >= call.ActionLiteralOffset
            && offset < call.ActionLiteralOffset + call.ActionLiteralLength)
        {
            // FBO: <action id="Item"> trong <response>. Binder gán ResponseActionSymbol theo
            // Qualifier (name → event → id) nên tra theo Name là đủ cho cả hai kiểu đặt tên.
            var action = ctx.Model
                .GetSymbolsOfKind<ResponseActionSymbol>(ErpSymbolKind.ResponseAction)
                .FirstOrDefault(s => s.Name.Equals(call.ActionName, StringComparison.OrdinalIgnoreCase));

            if (action is null)
            {
                return new JsRuntimeNavHit
                {
                    Kind = JsRuntimeNavKind.RequestAction,
                    DisplayLabel = $"Không tìm thấy action: {call.ActionName}"
                };
            }

            // Definition của symbol tính trên SOURCE của file khai báo (binder chạy trên source),
            // nên dùng trực tiếp — không đi qua ClearText mapper.
            var definition_path = string.IsNullOrWhiteSpace(action.Definition.Path)
                ? ctx.DocumentPath
                : action.Definition.Path;
            return new JsRuntimeNavHit
            {
                Kind = JsRuntimeNavKind.RequestAction,
                SymbolId = action.Id,
                SymbolName = call.ActionName,
                SymbolKindText = "Request Action",
                TargetPath = definition_path,
                TargetOffset = action.Definition.Span.StartOffset,
                DisplayLabel = $"Action: {call.ActionName}",
                Relations = BuildRequestChain(ctx, MatchingCalls(ctx, c => c.ActionName == call.ActionName))
            };
        }

        if (offset >= call.ContextLiteralOffset
            && offset < call.ContextLiteralOffset + call.ContextLiteralLength)
        {
            var case_offset = ResponseCompleteCaseFinder.FindCaseOffset(ctx.Text, call.ContextName);
            if (case_offset is null)
            {
                return new JsRuntimeNavHit
                {
                    Kind = JsRuntimeNavKind.RequestResponseCase,
                    DisplayLabel = $"Không tìm thấy case '{call.ContextName}'"
                };
            }

            var location = ctx.Map(case_offset.Value);
            return new JsRuntimeNavHit
            {
                Kind = JsRuntimeNavKind.RequestResponseCase,
                SymbolName = call.ContextName,
                SymbolKindText = "Response Context",
                TargetPath = location.Path,
                TargetOffset = location.Offset,
                DisplayLabel = Describe($"case '{call.ContextName}'", location),
                Relations = BuildRequestChain(ctx, MatchingCalls(ctx, c => c.ContextName == call.ContextName))
            };
        }

        return null;
    }

    private static IReadOnlyList<RequestCallHit> MatchingCalls(
        ResolveContext ctx, Func<RequestCallHit, bool> predicate) =>
        FboRequestCallParser.EnumerateAll(ctx.Text).Where(predicate).ToList();

    // ── Chiều ngược #11a: <action id="X"> → các chỗ gọi request('X', …) ──────
    private static JsRuntimeNavHit? TryResolveActionDeclaration(ResolveContext ctx, int offset)
    {
        foreach (Match m in ActionDeclarationRegex.Matches(ctx.Text))
        {
            var group = m.Groups["name"];
            if (offset < group.Index || offset >= group.Index + group.Length) continue;

            var name = group.Value;
            var sites = CollectRequestSites(
                ctx, call => call.ActionName.Equals(name, StringComparison.Ordinal),
                call => call.ActionLiteralOffset, call => call.ActionLiteralLength,
                $"action:{name}");

            return new JsRuntimeNavHit
            {
                Kind = JsRuntimeNavKind.ActionRequestSites,
                SymbolId = $"action:{name}",
                SymbolName = name,
                SymbolKindText = "Request Action",
                DisplayLabel = sites.Count == 0
                    ? $"Không có lời gọi request('{name}', …)"
                    : $"request('{name}', …) — {sites.Count} nơi gọi",
                References = sites,
                Relations = BuildRequestChain(
                    ctx, MatchingCalls(ctx, c => c.ActionName.Equals(name, StringComparison.Ordinal)))
            };
        }
        return null;
    }

    // ── Chiều ngược #11b: case 'X': → các chỗ gọi request(…, 'X', …) ─────────
    private static JsRuntimeNavHit? TryResolveCaseLabel(ResolveContext ctx, int offset)
    {
        foreach (Match m in CaseLabelRegex.Matches(ctx.Text))
        {
            var group = m.Groups["name"];
            if (offset < group.Index || offset >= group.Index + group.Length) continue;

            var name = group.Value;
            var sites = CollectRequestSites(
                ctx, call => call.ContextName.Equals(name, StringComparison.Ordinal),
                call => call.ContextLiteralOffset, call => call.ContextLiteralLength,
                $"case:{name}");

            // case không ứng với request nào → không phải case của ResponseComplete; nhường
            // cho resolver sau (tránh nuốt Ctrl+Click trên switch thường).
            if (sites.Count == 0) return null;

            return new JsRuntimeNavHit
            {
                Kind = JsRuntimeNavKind.CaseRequestSites,
                SymbolId = $"case:{name}",
                SymbolName = name,
                SymbolKindText = "Response Context",
                DisplayLabel = $"request(…, '{name}', …) — {sites.Count} nơi gọi",
                References = sites,
                Relations = BuildRequestChain(
                    ctx, MatchingCalls(ctx, c => c.ContextName.Equals(name, StringComparison.Ordinal)))
            };
        }
        return null;
    }

    private static List<NavigationTarget> CollectRequestSites(
        ResolveContext ctx,
        Func<RequestCallHit, bool> matches,
        Func<RequestCallHit, int> literal_offset,
        Func<RequestCallHit, int> literal_length,
        string symbol_id)
    {
        var targets = new List<NavigationTarget>();
        foreach (var call in FboRequestCallParser.EnumerateAll(ctx.Text))
        {
            if (!matches(call)) continue;

            var location = ctx.Map(literal_offset(call));
            if (!location.IsFound) continue;

            targets.Add(new NavigationTarget
            {
                NodeId = NodeId.FromStableKey($"{symbol_id}:{literal_offset(call)}"),
                DocumentUri = location.Path,
                TextRange = new TextRange(
                    location.Offset, location.Offset + literal_length(call)),
                NodeType = "Reference",
                SymbolId = symbol_id
            });
        }
        return targets;
    }

    // ── #15 showForm('Name') → file liên quan ───────────────────────────────
    private static JsRuntimeNavHit? TryResolveShowForm(
        ResolveContext ctx, int offset, string? controllers_path)
    {
        foreach (Match m in ShowFormLiteralRegex.Matches(ctx.Text))
        {
            var group = m.Groups["name"];
            if (offset < group.Index || offset >= group.Index + group.Length) continue;

            var name = group.Value;
            var related = ShowFormRelatedPathResolver.FindRelatedFiles(controllers_path, name);
            return new JsRuntimeNavHit
            {
                Kind = JsRuntimeNavKind.ShowFormRelated,
                DisplayLabel = related.Count == 0
                    ? $"Không tìm thấy file liên quan: {name}"
                    : $"showForm: {name} ({related.Count} file)",
                RelatedPaths = related
            };
        }
        return null;
    }

    // ── #13–14 g.$a.name → GoTo + hover value ────────────────────────────────
    private static JsRuntimeNavHit? TryResolveDollarA(ResolveContext ctx, int offset)
    {
        var index = DollarAIndex.Build(ctx.Text);
        if (index.Properties.Count == 0) return null;

        // Click ngay trên key trong chính object literal g.$a = { … }.
        var direct = index.FindPropertyAtOffset(offset);
        if (direct is not null) return BuildDollarAHit(ctx, direct);

        // Usage site g.$a.name ở nơi khác.
        foreach (Match m in DollarAUsageRegex.Matches(ctx.Text))
        {
            var group = m.Groups["name"];
            if (offset < group.Index || offset >= group.Index + group.Length) continue;

            var property = index.FindByName(group.Value);
            return property is null
                ? new JsRuntimeNavHit
                {
                    Kind = JsRuntimeNavKind.DollarAProperty,
                    DisplayLabel = $"Không tìm thấy khai báo g.$a.{group.Value}"
                }
                : BuildDollarAHit(ctx, property);
        }

        return null;
    }

    private static JsRuntimeNavHit BuildDollarAHit(ResolveContext ctx, DollarAProperty property)
    {
        var location = ctx.Map(property.NameOffset);
        return new JsRuntimeNavHit
        {
            Kind = JsRuntimeNavKind.DollarAProperty,
            DisplayLabel = Describe($"g.$a.{property.Name}", location),
            TargetPath = location.Path,
            TargetOffset = location.Offset,
            HoverValue = property.ValueText
        };
    }

    // ── #12 tên function (ĐỊNH NGHĨA *hoặc* NƠI GỌI) → Find References ───────
    // Ctrl+Click chỉ trên dòng `function X` là chưa đủ: đứng ở một chỗ gọi cũng phải thấy ngay
    // "nó định nghĩa ở đâu + còn ai gọi nữa" (hai chiều). Vì vậy nhận diện theo IDENTIFIER tại
    // offset, rồi xác nhận đó đúng là tên một function có định nghĩa trong tài liệu đã expand.
    private static JsRuntimeNavHit? TryResolveFunctionIdentifier(ResolveContext ctx, int offset)
    {
        var name = XmlStructureParser.ExtractIdentifierAt(ctx.Text, offset);
        if (string.IsNullOrWhiteSpace(name)) return null;

        // KHÔNG dùng \b để chặn đuôi: tên hàm FBO thường KẾT THÚC bằng '$'
        // (load$GridVoucherDetail$, onChange$GridVoucherDetail$…). Sau '$' thì \b chỉ tồn tại khi
        // ký tự kế là word-char → vừa trượt đúng định nghĩa của chính nó (kế là '('), vừa khớp
        // nhầm hàm DÀI HƠN cùng tiền tố (…$GoodsType). Phải là "không còn ký tự identifier nào".
        var definition = Regex.Match(
            ctx.Text, $@"function\s+{Regex.Escape(name)}{IdentifierEnd}");
        if (!definition.Success) return null;

        var relations = new List<JsRuntimeRelation>();
        var definition_location = ctx.Map(definition.Index);
        if (definition_location.IsFound)
        {
            relations.Add(new JsRuntimeRelation
            {
                Role = JsRuntimeRelationRole.FunctionDefinition,
                Label = $"function {name}",
                TargetPath = definition_location.Path,
                TargetOffset = definition_location.Offset
            });
        }

        return new JsRuntimeNavHit
        {
            Kind = JsRuntimeNavKind.ScriptFunctionRefs,
            SymbolId = $"script:{name}",
            SymbolName = $"{name}()",
            SymbolKindText = "JavaScript Function",
            DisplayLabel = $"function {name}",
            Relations = relations
        };
    }

    /// <summary>
    /// Chuỗi quan hệ FBO quanh một lời gọi request: các nơi gọi → khai báo action → nhánh case.
    /// Dùng chung cho CẢ HAI chiều nên đứng ở mắt xích nào cũng thấy đủ sơ đồ.
    /// </summary>
    private static List<JsRuntimeRelation> BuildRequestChain(
        ResolveContext ctx, IReadOnlyList<RequestCallHit> calls)
    {
        var relations = new List<JsRuntimeRelation>();

        foreach (var call in calls)
        {
            var location = ctx.Map(call.ActionLiteralOffset);
            relations.Add(new JsRuntimeRelation
            {
                Role = JsRuntimeRelationRole.RequestSite,
                Label = $"request('{call.ActionName}', '{call.ContextName}')",
                TargetPath = location.Path,
                TargetOffset = location.Offset
            });
        }

        foreach (var action_name in calls.Select(c => c.ActionName).Distinct(StringComparer.Ordinal))
        {
            var declaration = FindActionDeclaration(ctx.Text, action_name);
            if (declaration is null) continue;
            var location = ctx.Map(declaration.Value);
            relations.Add(new JsRuntimeRelation
            {
                Role = JsRuntimeRelationRole.ActionDeclaration,
                Label = $"action '{action_name}'",
                TargetPath = location.Path,
                TargetOffset = location.Offset
            });
        }

        foreach (var context_name in calls.Select(c => c.ContextName).Distinct(StringComparer.Ordinal))
        {
            var case_offset = ResponseCompleteCaseFinder.FindCaseOffset(ctx.Text, context_name);
            if (case_offset is null) continue;
            var location = ctx.Map(case_offset.Value);
            relations.Add(new JsRuntimeRelation
            {
                Role = JsRuntimeRelationRole.ResponseCase,
                Label = $"case '{context_name}'",
                TargetPath = location.Path,
                TargetOffset = location.Offset
            });
        }

        return relations;
    }

    private static int? FindActionDeclaration(string text, string name)
    {
        foreach (Match m in ActionDeclarationRegex.Matches(text))
            if (m.Groups["name"].Value.Equals(name, StringComparison.Ordinal))
                return m.Groups["name"].Index;
        return null;
    }

    private static string Describe(string label, ResolvedTextLocation location) =>
        location.IsFound && !location.IsCurrentDocument && !string.IsNullOrEmpty(location.EntityName)
            ? $"{label} — &{location.EntityName}; ({Path.GetFileName(location.Path)})"
            : label;
}
