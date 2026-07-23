# Phase 4 — FBO JS Catalog Completion / Hover / Signature Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Completion, Hover, và Signature Help cho API FBO trong island JS, nguồn từ `UI/Config/xml/fbo-js.catalog.xml`, qua Language Service (không hard-code UI).

**Architecture:** Parse catalog → index Application; island gate + resolve alias/member; Monaco providers gửi offset/mode sang host (request/response JS↔C#); Insight chỉ Hover. Ưu tiên hover `$a` value (Phase 3) trước catalog member.

**Tech Stack:** C# Domain/Application, xUnit, Monaco Completion/Hover/SignatureHelp, WebView2 bridge, XML catalog

**Spec:** `docs/superpowers/specs/2026-07-23-editor-phase4-js-catalog-completion-design.md`  
**Prerequisite:** Phase 1–3 offset/hover bridge trên `FormBuilderViewModel` / `bridge.js`

## Global Constraints

- UI **không** hard-code danh sách API; SoT = catalog XML.
- Fail closed: ngoài island JS → empty/null.
- Insight: Complete + Signature **empty**; Hover **bật**.
- Không fuzzy-match typo tên member.
- Không parse XML ở UI (R1).
- Locals `snake_case`; Left Panel freeze.
- P6-21 diagnostic **out of scope**.
- Gap-scan **không** auto-merge vào catalog.

---

## File map

| File | Role |
|------|------|
| `UI/Config/xml/fbo-js.catalog.xml` | Seed catalog |
| `DevWorkFlow.Domain/Language/EditorAssistMode.cs` | `Source` \| `Insight` |
| `DevWorkFlow.Domain/Language/FboJsAssistDtos.cs` | Completion / Hover / Signature DTOs |
| `DevWorkFlow.Domain/Language/FboJsCatalogModels.cs` | Type/member/param models |
| `DevWorkFlow.Application/Language/FboJsCatalogParser.cs` | Load XML → catalog |
| `DevWorkFlow.Application/Language/FboJsCatalog.cs` | Index aliases + members |
| `DevWorkFlow.Application/Language/ScriptIslandLocator.cs` | Offset ∈ script / Checking? |
| `DevWorkFlow.Application/Language/FboJsAssistResolver.cs` | Complete / Hover / Signature |
| `IErpLanguageService` + `ErpLanguageService` | Public API + hold catalog |
| `UI/App.xaml.cs` | Load catalog path lúc startup |
| `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs` | Event/command names |
| `UI/Assets/EditorHost/bridge.js` | Monaco providers + JS↔host RPC |
| `UI/Views/Controls/MonacoEditorHost.xaml.cs` | Relay events → VM → reply |
| `UI/Views/Controls/InsightEditorSurface.xaml.cs` | Wire new events |
| `UI/ViewModels/FormBuilderViewModel.cs` | Call LS assist APIs |
| `tests/.../Language/FboJsCatalog*.cs` | Unit |
| `tests/.../Language/FboJsAssistResolverTests.cs` | Unit |
| `tests/.../Language/FboJsCatalogGapScanTests.cs` | Dev gap-scan (optional assert) |

---

### Task 1: Domain DTOs + catalog models

**Files:**
- Create: `DevWorkFlow.Domain/Language/EditorAssistMode.cs`
- Create: `DevWorkFlow.Domain/Language/FboJsCatalogModels.cs`
- Create: `DevWorkFlow.Domain/Language/FboJsAssistDtos.cs`

**Produces:**

```csharp
namespace DevWorkFlow.Domain.Language;

public enum EditorAssistMode
{
    Source = 0,
    Insight = 1
}

public enum FboJsMemberKind
{
    Method = 0,
    Property = 1,
    Function = 2
}

public sealed class FboJsParamInfo
{
    public required string Name { get; init; }
    public string Summary { get; init; } = "";
}

public sealed class FboJsMemberInfo
{
    public required string Name { get; init; }
    public required FboJsMemberKind Kind { get; init; }
    public string Signature { get; init; } = "";
    public string Summary { get; init; } = "";
    public string Effect { get; init; } = "";
    public IReadOnlyList<FboJsParamInfo> Params { get; init; } = [];
}

public sealed class FboJsTypeInfo
{
    public required string Id { get; init; }
    public IReadOnlyList<string> Aliases { get; init; } = [];
    public string Summary { get; init; } = "";
    public IReadOnlyList<FboJsMemberInfo> Members { get; init; } = [];
}

public sealed class FboJsCatalogData
{
    public int Version { get; init; }
    public IReadOnlyList<FboJsTypeInfo> Types { get; init; } = [];
    public IReadOnlyList<FboJsMemberInfo> Globals { get; init; } = [];
}

public sealed class FboJsCompletionItem
{
    public required string Label { get; init; }
    public required string InsertText { get; init; }
    public required string Kind { get; init; } // "method"|"property"|"function"|"variable"
    public string Detail { get; init; } = "";
    public string Documentation { get; init; } = "";
}

public sealed class FboJsCompletionList
{
    public IReadOnlyList<FboJsCompletionItem> Items { get; init; } = [];
}

public sealed class FboJsHoverInfo
{
    public required string Title { get; init; }
    public required string Body { get; init; }
}

public sealed class FboJsSignatureParameter
{
    public required string Label { get; init; }
    public string Documentation { get; init; } = "";
}

public sealed class FboJsSignatureHelp
{
    public required string Label { get; init; }
    public string Documentation { get; init; } = "";
    public IReadOnlyList<FboJsSignatureParameter> Parameters { get; init; } = [];
    public int ActiveParameter { get; init; }
}
```

- [x] **Step 1: Add the three files** with types above (Domain only, no logic).

- [x] **Step 2: Build Domain project**

Run: `dotnet build DevWorkFlow.Domain/DevWorkFlow.Domain.csproj`  
Expected: PASS

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Domain/Language/EditorAssistMode.cs DevWorkFlow.Domain/Language/FboJsCatalogModels.cs DevWorkFlow.Domain/Language/FboJsAssistDtos.cs
git commit -m "feat(domain): FBO JS assist DTOs and catalog models"
```

---

### Task 2: Catalog parser + seed XML + tests

**Files:**
- Create: `UI/Config/xml/fbo-js.catalog.xml`
- Create: `DevWorkFlow.Application/Language/FboJsCatalogParser.cs`
- Create: `DevWorkFlow.Application/Language/FboJsCatalog.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/FboJsCatalogParserTests.cs`

**Produces:**

```csharp
public static class FboJsCatalogParser
{
    /// <summary>XML lỗi / thiếu file → <see cref="FboJsCatalogData"/> rỗng (Version=0), không throw.</summary>
    public static FboJsCatalogData ParseFile(string absolute_path);
    public static FboJsCatalogData ParseXml(string xml);
}

public sealed class FboJsCatalog
{
    public static FboJsCatalog Empty { get; }
    public static FboJsCatalog FromData(FboJsCatalogData data);

    public FboJsTypeInfo? ResolveTypeByAlias(string alias); // case-sensitive như JS FBO thường dùng
    public FboJsMemberInfo? FindMember(string type_id, string member_name);
    public IReadOnlyList<FboJsMemberInfo> GetMembers(string type_id);
    public IReadOnlyList<FboJsMemberInfo> Globals { get; }
    public IReadOnlyList<string> AllAliases { get; }
}
```

**Seed tối thiểu trong XML** (đủ test + demo):

- `form` aliases `f,parentForm`: `getItemValue`, `setItemValue`, `request`, `_action`
- `grid` aliases `g,grid`: `request`, `showForm`, `$a`, `_getItemValue`, `_setItemValue`
- `sender` aliases `o,sender`: `parentForm`, `grid`, `row`
- `func` aliases `$func`: `trim`

Mỗi method có `signature` + ít nhất 1 `param` khi có tham số; `summary` / `effect` tiếng Việt ngắn.

- [x] **Step 1: Failing test**

```csharp
[Fact]
public void ParseXml_seed_resolves_f_getItemValue()
{
    var xml = File.ReadAllText(PathToSeedOrInlineMinimalXml());
    var data = FboJsCatalogParser.ParseXml(xml);
    var catalog = FboJsCatalog.FromData(data);
    var type = catalog.ResolveTypeByAlias("f");
    Assert.NotNull(type);
    Assert.Equal("form", type.Id);
    var member = catalog.FindMember("form", "getItemValue");
    Assert.NotNull(member);
    Assert.Equal(FboJsMemberKind.Method, member.Kind);
    Assert.Contains("field", member.Params.Select(p => p.Name));
}

[Fact]
public void ParseXml_invalid_returns_empty()
{
    var data = FboJsCatalogParser.ParseXml("<not-valid");
    Assert.Empty(data.Types);
}
```

- [x] **Step 2: Run — expect FAIL** (types missing)

Run: `dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter FboJsCatalogParserTests`

- [x] **Step 3: Implement parser + `FboJsCatalog` + seed file**

Parse `version`, `type[@id|@aliases]`, `member[@name|@kind|@signature|@summary|@effect]`, `param`, `globals/member`.  
`kind` attribute: `method|property|function` → enum (unknown → Method).  
Aliases: split CSV, trim, bỏ trống.

- [ ] **Step 4: PASS + commit**

```bash
git add UI/Config/xml/fbo-js.catalog.xml DevWorkFlow.Application/Language/FboJsCatalogParser.cs DevWorkFlow.Application/Language/FboJsCatalog.cs tests/DevWorkFlow.Application.Tests/Language/FboJsCatalogParserTests.cs
git commit -m "feat: parse fbo-js.catalog.xml into indexed catalog"
```

---

### Task 3: Script island locator

**Files:**
- Create: `DevWorkFlow.Application/Language/ScriptIslandLocator.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/ScriptIslandLocatorTests.cs`

**Produces:**

```csharp
public static class ScriptIslandLocator
{
    /// <param name="source_text">Buffer đang xét (Source XML hoặc ClearText).</param>
    /// <param name="syntax_root">Root SyntaxNode của document (source tree); null → chỉ regex fallback.</param>
    public static bool IsInsideJsIsland(string source_text, int offset, SyntaxNode? syntax_root);
}
```

**Rules (chốt):**
1. Nếu `syntax_root` có: mọi `SyntaxKind.ScriptIsland` với `Qualifier != "function"` (island script element) — offset trong `node.Span` (nội dung script; nếu Span gồm cả tag thì chấp nhận trong span element script).
2. Thêm: `<command … event="Checking" …>…</command>` body (regex giống tinh thần `ControllerRelatedFileResolver.CheckingCommandRegex`) — offset trong body.
3. Offset ngoài → false. Offset âm / > length → false.

- [x] **Step 1: Failing tests** — XML mẫu:

```xml
<form>
<script><![CDATA[
function foo() { f.getItemValue('a'); }
]]></script>
<commands>
  <command event="Checking"><![CDATA[
    if (1) { }
  ]]></command>
</commands>
<field name="x"/>
</form>
```

Assert: offset trong `foo` → true; trong Checking body → true; trên `<field` → false.

Dùng `ErpLanguageService.OpenDocumentFromText` lấy syntax qua document nếu API có; hoặc parse bằng `FboSyntaxParser` public path mà tests khác dùng. Nếu SyntaxTree không expose dễ: locator nhận `IErpDocument` và tự lấy `document.SyntaxTree` / semantic — **ưu tiên** API:

```csharp
public static bool IsInsideJsIsland(IErpDocument document, int offset, bool offset_is_clear_text);
```

Map ClearText offset → dùng ClearText string + ranges từ projection segments / script islands trên clear text. **Chốt implement:**  
- Source: syntax ScriptIsland + Checking regex trên `document.Snapshot` / source text.  
- ClearText: Checking + script đã expand — scan ClearText bằng cùng regex `<script` / `event="Checking"` trên clear text (đơn giản, đủ Phase 4).

Implement tối thiểu đáng tin: **regex trên buffer đang xét** cho `<script…>…</script>` và `command event=Checking` bodies; optional refine bằng SyntaxNode sau. Unit test trên raw string trước.

```csharp
public static bool IsInsideJsIsland(string buffer_text, int offset);
```

- [x] **Step 2: Implement + PASS**

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Application/Language/ScriptIslandLocator.cs tests/DevWorkFlow.Application.Tests/Language/ScriptIslandLocatorTests.cs
git commit -m "feat: locate caret inside FBO script/Checking islands"
```

---

### Task 4: FboJsAssistResolver (Complete / Hover / Signature)

**Files:**
- Create: `DevWorkFlow.Application/Language/FboJsAssistResolver.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/FboJsAssistResolverTests.cs`

**Produces:**

```csharp
public static class FboJsAssistResolver
{
    public static FboJsCompletionList Complete(
        string buffer_text, int offset, EditorAssistMode mode, FboJsCatalog catalog);

    public static FboJsHoverInfo? Hover(
        string buffer_text, int offset, EditorAssistMode mode, FboJsCatalog catalog);

    public static FboJsSignatureHelp? Signature(
        string buffer_text, int offset, EditorAssistMode mode, FboJsCatalog catalog);
}
```

**Logic:**

1. `mode == Insight` → `Complete` / `Signature` return empty/null; `Hover` tiếp tục.
2. `!IsInsideJsIsland(buffer_text, offset)` → empty/null.
3. **Complete:**  
   - Nếu trước caret là `alias.` (scan identifier + `.` ngay trước prefix đang gõ): members của type, filter `StartsWith(prefix)` (Ordinal).  
   - Else: aliases + globals, filter prefix (identifier partial tại caret — dùng `XmlStructureParser.ExtractIdentifierAt` nếu có, hoặc scan `[A-Za-z_$][\w$]*`).
4. **Hover:** exact member: `alias.member` hoặc global name dưới caret; Body = `summary` + (nếu có effect thì `\n\n` + effect). Title = `alias.member` hoặc name. **Không** fuzzy.
5. **Signature:** tìm lời gọi đang mở: lùi từ offset tìm `ident(` chưa đóng; resolve `alias.ident` hoặc global `ident`; `ActiveParameter` = số dấu `,` ở depth paren 0 giữa `(` và caret.

InsertText Complete: tên member thôi (không snippet Phase 4 — Signature Help lo params). Kind map: Method→`method`, Property→`property`, Function→`function`, alias→`variable`.

- [x] **Step 1: Failing tests** (catalog FromData minimal inline)

```csharp
[Fact]
public void Complete_after_f_dot_filters_prefix()
{
    var text = "<script><![CDATA[\nvar x = f.get\n]]></script>";
    var offset = text.IndexOf("f.get", StringComparison.Ordinal) + "f.get".Length;
    var list = FboJsAssistResolver.Complete(text, offset, EditorAssistMode.Source, Catalog);
    Assert.Contains(list.Items, i => i.Label == "getItemValue");
    Assert.DoesNotContain(list.Items, i => i.Label == "request");
}

[Fact]
public void Complete_insight_empty()
{
    var list = FboJsAssistResolver.Complete(ScriptWithFDot, offset, EditorAssistMode.Insight, Catalog);
    Assert.Empty(list.Items);
}

[Fact]
public void Hover_getItemValue_returns_summary()
{
    var hover = FboJsAssistResolver.Hover(text, offsetOnGetItemValue, EditorAssistMode.Source, Catalog);
    Assert.NotNull(hover);
    Assert.Contains("Đọc", hover.Body, StringComparison.OrdinalIgnoreCase); // khớp summary seed
}

[Fact]
public void Signature_request_active_second_param()
{
    // f.request('A',|
    var help = FboJsAssistResolver.Signature(...);
    Assert.NotNull(help);
    Assert.Equal(1, help.ActiveParameter);
}

[Fact]
public void Outside_island_complete_empty() { ... }
```

- [x] **Step 2: Implement + PASS**

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Application/Language/FboJsAssistResolver.cs tests/DevWorkFlow.Application.Tests/Language/FboJsAssistResolverTests.cs
git commit -m "feat: FBO JS Complete/Hover/Signature from catalog"
```

---

### Task 5: Wire Language Service + App startup load

**Files:**
- Modify: `DevWorkFlow.Application/Language/IErpLanguageService.cs`
- Modify: `DevWorkFlow.Application/Language/ErpLanguageService.cs`
- Modify: `UI/App.xaml.cs`
- Test: extend hoặc thêm `tests/DevWorkFlow.Application.Tests/Language/FboJsAssistLanguageServiceTests.cs`

**Produces (interface additions):**

```csharp
void LoadFboJsCatalog(string absolute_path);

FboJsCompletionList CompleteFboJs(
    ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);

FboJsHoverInfo? HoverFboJs(
    ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);

FboJsSignatureHelp? SignatureFboJs(
    ErpDocumentId document_id, int offset, EditorAssistMode mode, bool offset_is_clear_text);
```

**Impl:**
- Field `_fbo_js_catalog = FboJsCatalog.Empty`.
- `LoadFboJsCatalog`: `FboJsCatalog.FromData(FboJsCatalogParser.ParseFile(path))`.
- Assist methods: lấy document; buffer = ClearText nếu `offset_is_clear_text` else Source/raw; gọi `FboJsAssistResolver.*`.

**App.xaml.cs** sau `new ErpLanguageService()`:

```csharp
language_service.LoadFboJsCatalog(app_config.GetXmlPath("fbo-js.catalog.xml"));
```

(đặt sau `app_config` tạo xong — reorder nếu cần).

- [x] **Step 1: Test OpenDocumentFromText + CompleteFboJs với catalog load từ seed path hoặc ParseXml inject** — nếu Load chỉ từ file, test copy seed vào temp hoặc load từ `UI/Config/xml/fbo-js.catalog.xml` relative to repo (giống corpus skip pattern).

- [x] **Step 2: Implement + PASS**

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Application/Language/IErpLanguageService.cs DevWorkFlow.Application/Language/ErpLanguageService.cs UI/App.xaml.cs tests/DevWorkFlow.Application.Tests/Language/FboJsAssistLanguageServiceTests.cs
git commit -m "feat: expose FBO JS assist on language service"
```

---

### Task 6: Monaco bridge RPC + UI wire

**Files:**
- Modify: `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs` — thêm event/command constants
- Modify: `UI/Assets/EditorHost/bridge.js`
- Modify: `UI/Views/Controls/MonacoEditorHost.xaml.cs`
- Modify: `UI/Views/Controls/InsightEditorSurface.xaml.cs`
- Modify: `UI/ViewModels/FormBuilderViewModel.cs`

**Bridge protocol (JS → C# → JS):**

Events (JS posts):

```text
fboJsCompleteRequested  { id, offset, insight }
fboJsSignatureRequested { id, offset, insight }
```

Hover: **mở rộng** pipeline `entityHoverRequested` hiện có — trong `ResolveEntityHover`, sau `$a` miss, gọi `HoverFboJs`; nếu có → `EntityHoverView(title, body, false)`. Không cần RPC riêng cho hover.

Commands (C# → JS) để resolve Promise:

```text
fboJsCompleteResult  { id, items: [{ label, insertText, kind, detail, documentation }] }
fboJsSignatureResult { id, help: null | { label, documentation, parameters, activeParameter } }
```

**JS (`bridge.js`):**
1. Map `pendingAssist = { [id]: { resolve, reject } }`.
2. `function requestAssist(eventName, payload)` → `id = 'a'+(++seq)`, Promise, `post({ event, payload: { id, ... } })`, timeout 2s → resolve empty.
3. `monaco.languages.registerCompletionItemProvider` cho language id editor đang dùng (erp-xml / javascript plaintext — **đúng id hiện tại của model** trong bridge). Trigger: `.`
4. `registerSignatureHelpProvider` trigger `(` `,`
5. `provideCompletionItems`: nếu `insightMode` (cờ bridge đã có cho Insight) → `{ suggestions: [] }`; else request host.
6. Handler command `fboJsCompleteResult` / `fboJsSignatureResult` → resolve pending.

**C# host:**
- Events → raise lên `MonacoEditorHost` → `InsightEditorSurface` → `FormBuilderViewModel.CompleteFboJsAssist(offset, insight)` / `SignatureFboJsAssist`.
- VM gọi LS với `ErpDocument`, `EditorAssistMode` từ `IsInsightMode`, `offset_is_clear_text: insight`.
- Reply qua `SendCommand(fboJsCompleteResult, …)`.

**Hover conflict (§6.6 spec):** trong `ResolveEntityHover`, thứ tự giữ:
1. Entity hit / insight segment (hiện có)
2. JS `$a` HoverValue (Phase 3)
3. **Mới:** `HoverFboJs` → catalog
4. null

- [x] **Step 1: Constants + VM methods + host relay** (có thể tạm stub empty list)

- [x] **Step 2: bridge.js providers + pending map**

- [ ] **Step 3: Manual smoke** (human): Source — gõ `f.` Ctrl+Space thấy `getItemValue`; hover; `f.request(` thấy signature. Insight — Complete không; Hover catalog OK trên member.

- [ ] **Step 4: Commit**

```bash
git add DevWorkFlow.Editor/Bridge/EditorHostMessages.cs UI/Assets/EditorHost/bridge.js UI/Views/Controls/MonacoEditorHost.xaml.cs UI/Views/Controls/InsightEditorSurface.xaml.cs UI/ViewModels/FormBuilderViewModel.cs
git commit -m "feat: Monaco FBO JS completion and signature via catalog"
```

---

### Task 7: Gap-scan (dev) + roadmap handoff

**Files:**
- Create: `tests/DevWorkFlow.Application.Tests/Language/FboJsCatalogGapScanTests.cs`
- Modify: `docs/superpowers/specs/2026-07-22-editor-ux-roadmap-design.md` — Phase 4 artifacts + plan link
- Modify: spec Phase 4 status → `Ready for implementation` nếu cần

**Gap-scan:**
- Input: 1–2 file corpus (reuse `FboProgramCorpus` / skip nếu thiếu) hoặc fixture XML nhỏ có `f.unknownApi(`.
- Extract `f.\w+` / `g.\w+` / `$func.\w+` trong script islands.
- So với catalog aliases → list missing.
- Test: `Assert.True(true)` sau khi ghi output `ITestOutputHelper` **hoặc** assert fixture cố ý có 1 missing được phát hiện — **không** fail CI vì corpus thiếu API thật.

```csharp
public static IReadOnlyList<string> FindMissingMembers(string buffer_text, FboJsCatalog catalog);
```

Có thể đặt helper trong Application `FboJsCatalogGapScanner.cs` để test gọi.

- [x] **Step 1: Implement scanner + test fixture**

- [x] **Step 2: `dotnet test` Application filter `FboJs` — all PASS; `dotnet build DevWorkFlow.slnx`**

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Application/Language/FboJsCatalogGapScanner.cs tests/DevWorkFlow.Application.Tests/Language/FboJsCatalogGapScanTests.cs docs/superpowers/specs/2026-07-22-editor-ux-roadmap-design.md docs/superpowers/specs/2026-07-23-editor-phase4-js-catalog-completion-design.md
git commit -m "test: FBO JS catalog gap scan; link Phase 4 plan"
```

---

## Self-review (plan vs spec)

| Spec requirement | Task |
|------------------|------|
| Catalog XML + schema/version | 2 |
| Scope B aliases + members | 2 seed + 4 resolve |
| Hybrid gap-scan no auto-merge | 7 |
| Context C Insight hover-only | 4 + 6 |
| Signature Help + params | 2 schema + 4 + 6 |
| Architecture LS + thin bridge | 5 + 6 |
| Island gate fail closed | 3 + 4 |
| No hard-code UI list | 2 + 5 load |
| Hover `$a` priority | 6 |
| Out of scope P6-21 / fuzzy / field strings | không có task |
| Success: tests + build | 7 |

No TBD placeholders in steps. Type names consistent: `FboJsCatalog`, `FboJsAssistResolver`, `EditorAssistMode`, `CompleteFboJs` / `HoverFboJs` / `SignatureFboJs`.

---

## Execution handoff

Plan saved to `docs/superpowers/plans/2026-07-23-editor-phase4-js-catalog-completion.md`.
