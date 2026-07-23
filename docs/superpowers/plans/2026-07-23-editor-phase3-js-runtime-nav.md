# Phase 3 — FBO JS Runtime Navigation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ctrl+Click/hover cho `request`→action/case, function FindRefs, `g.$a` GoTo+value, `showForm` multi-open Filter/Lookup/Grid.

**Architecture:** `JsRuntimeAtOffsetResolver` sau entity+structural miss; index `$a` + script call sites lúc resolve (hoặc cache trên document); showForm path resolver riêng; UI SymbolInfo nhận ref list.

**Tech Stack:** C# LS, regex/scanner trên script islands, Monaco hover widget (reuse), xUnit

**Spec:** `docs/superpowers/specs/2026-07-23-editor-phase3-js-runtime-nav-design.md`  
**Prerequisite:** Phase 1–2 offset chain trên `FormBuilderViewModel.OnEntityOffsetActivated`

## Global Constraints

- Không fuzzy-fix typo case/action.
- Không full JS AST; scan trong script islands / ClearText script regions.
- R7: SymbolId + TextRange SoT.
- `snake_case` locals; Left Panel freeze.
- FindRefs function Phase 3 = **document hiện tại**.
- showForm open cap ≤ 12 files.

---

## File map

| File | Role |
|------|------|
| `DevWorkFlow.Domain/Language/JsRuntimeNavHit.cs` | DTO |
| `DevWorkFlow.Application/Language/JsRuntimeAtOffsetResolver.cs` | Hit-test |
| `DevWorkFlow.Application/Language/DollarAIndex.cs` | Parse `g.$a={…}` |
| `DevWorkFlow.Application/Language/ScriptFunctionReferenceFinder.cs` | Call sites |
| `DevWorkFlow.Application/Language/FboRequestCallParser.cs` | request/grid.request literals |
| `DevWorkFlow.Application/Engine/ShowFormRelatedPathResolver.cs` | Multi-folder glob |
| `ErpNavigationService.cs` | FindReferences cho ScriptFunction |
| `IErpLanguageService` / impl | Public APIs |
| `SymbolInfoViewModel` (+ panel) | Hiển thị ref list |
| `FormBuilderViewModel.cs` | Chain + hover `$a` + multi-open |
| tests under `Language/` + `Engine/` | Unit |

---

### Task 1: DollarAIndex + tests

**Files:**
- Create: `DevWorkFlow.Application/Language/DollarAIndex.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/DollarAIndexTests.cs`

**Produces:**

```csharp
public sealed class DollarAProperty
{
    public required string Name { get; init; }
    public required string ValueText { get; init; }  // raw RHS as in source
    public int NameOffset { get; init; }
    public int ValueOffset { get; init; }
}

public sealed class DollarAIndex
{
    public IReadOnlyList<DollarAProperty> Properties { get; init; }
    public static DollarAIndex Build(string script_text);
    public DollarAProperty? FindPropertyAtOffset(int offset_in_script); // on g.$a.name or key
    public DollarAProperty? FindByName(string name);
}
```

- [x] **Step 1: Failing tests** — sample:

```js
g.$a = {
    gia2: '[gia2]:=[gia_nt2]*[$ty_gia]',
    gia_sl: '[gia]:=…'
};
g.executeExpression(o, [g.$a.gia2, g.$a.gia_sl]);
```

Assert `FindByName("gia2").ValueText` contains `ty_gia`; offset on `g.$a.gia2` maps to property.

- [x] **Step 2: Implement** — find `g.$a\s*=\s*\{`, scan props until balancing `}`; support `name:` and `'name':`.

- [x] **Step 3: PASS**

---

### Task 2: FboRequestCallParser + ResponseComplete case finder + tests

**Files:**
- Create: `DevWorkFlow.Application/Language/FboRequestCallParser.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/FboRequestCallParserTests.cs`

**Signatures table (chốt):**

| Call shape | Action arg index (0-based among string/context args) | Context arg |
|------------|------------------------------------------------------|-------------|
| `.request('A','B', …)` (form) | 0 → action | 1 → case |
| `.request(sender, 'A', 'B', …)` (grid — first arg not string) | first string → action | second string → context |

```csharp
public sealed record RequestCallHit(
    string ActionName,
    string ContextName,
    int ActionLiteralOffset,
    int ContextLiteralOffset,
    int ActionLiteralLength,
    int ContextLiteralLength);

public static class FboRequestCallParser
{
    public static RequestCallHit? TryFindEnclosing(string script, int offset);
}

public static class ResponseCompleteCaseFinder
{
    /// <summary>Exact case 'context' / "context" trong function on$*$ResponseComplete.</summary>
    public static int? FindCaseOffset(string script, string context_name);
}
```

- [x] **Step 1: Tests** — form request; grid request; typo context → FindCaseOffset null; exact case offset ≥ 0.

- [x] **Step 2: Implement + PASS**

---

### Task 3: ScriptFunctionReferenceFinder + FindReferences extension

**Files:**
- Create: `DevWorkFlow.Application/Language/ScriptFunctionReferenceFinder.cs`
- Modify: `ErpNavigationService.FindReferences`
- Create: `tests/.../ScriptFunctionReferenceFinderTests.cs`

```csharp
public static IReadOnlyList<SourceSpan> FindCallSites(string script_or_doc, string function_name, int definition_offset);
```

Rules: `\b{name}\s*\(`; exclude match overlapping definition line/`function name`.

- [x] **Step 1: Tests** — 1 def + 2 calls → 2 spans.

- [x] **Step 2: In `FindReferences`**, when symbol is `ScriptFunctionSymbol`, return definition target + call-site targets (NodeType=`Reference`).

- [x] **Step 3: PASS** + regression Entity FindReferences vẫn đủ.

---

### Task 4: ShowFormRelatedPathResolver + tests

**Files:**
- Create: `DevWorkFlow.Application/Engine/ShowFormRelatedPathResolver.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Engine/ShowFormRelatedPathResolverTests.cs`

```csharp
public static class ShowFormRelatedPathResolver
{
    public static string StemFromShowFormName(string name);
    // SVOrderFilter → SVOrder (strip Filter|Form|Grid|Lookup|MultiForm|MultiGrid|…)

    public static IReadOnlyList<string> FindRelatedFiles(
        string controllers_path,
        string show_form_name,
        int max_files = 12);
    // Search Filter/, Lookup/, Grid/ for *.xml/*.f where
    // name equals show_form_name OR starts with stem OR starts with show_form_name
}
```

- [x] **Step 1: Temp dirs** with `Filter/SVOrderFilter.xml`, `Filter/SVOrderMultiForm.xml`, `Grid/SVOrderMultiGrid.xml`, `Lookup/SVOrderFilter.xml` → FindRelated returns all 4 for `SVOrderFilter`.

- [x] **Step 2: Implement + PASS**

---

### Task 5: JsRuntimeNavHit DTO + JsRuntimeAtOffsetResolver + LS API

**Files:**
- Create: `DevWorkFlow.Domain/Language/JsRuntimeNavHit.cs`
- Create: `DevWorkFlow.Application/Language/JsRuntimeAtOffsetResolver.cs`
- Modify: `IErpLanguageService`, `ErpLanguageService`

```csharp
public enum JsRuntimeNavKind
{
    RequestAction = 0,
    RequestResponseCase = 1,
    ScriptFunctionRefs = 2,
    DollarAProperty = 3,
    ShowFormRelated = 4
}

public sealed class JsRuntimeNavHit
{
    public JsRuntimeNavKind Kind { get; init; }
    public string SymbolId { get; init; } = "";
    public string DisplayLabel { get; init; } = "";
    public int TargetOffset { get; init; } = -1;
    public string HoverValue { get; init; } = "";
    public IReadOnlyList<string> RelatedPaths { get; init; } = [];
    public IReadOnlyList<NavigationTarget> References { get; init; } = [];
}
```

**TryResolve(model, source_xml, offset, controllers_path):**

1. Determine if offset in script-like region (inside `<script>`, or CDATA of script/command) — if not, still try `$a`/request if present in doc text at offset.
2. Prefer narrowest hit: string literal in request → ShowForm literal → `g.$a.prop` → `function Name` definition identifier.
3. Fill hit accordingly (action GoTo via ResponseActionSymbol name match / action element; case via FindCaseOffset; refs via FindReferences; dollarA; showForm paths).

- [x] **Step 1: Integration-style unit tests** on one XML fixture covering request + $a + showForm + function.

- [x] **Step 2: Implement + `ResolveJsRuntimeAtOffset` on LS**

- [x] **Step 3: PASS**

---

### Task 6: UI wire — FormBuilderViewModel + SymbolInfo + hover

**Files:**
- Modify: `FormBuilderViewModel.OnEntityOffsetActivated` (đổi tên dần `OnEditorOffsetActivated` optional — không bắt buộc)
- Modify: hover path — `$a` value dùng cùng widget (`showEntityHover` hoặc generic)
- Modify: `SymbolInfoViewModel` — method `ShowReferences(IReadOnlyList<NavigationTarget> refs, string title)`
- Modify: `MainWindow.OnFindReferences` optional align

**Navigate switch:**

```csharp
var js = _language_service.ResolveJsRuntimeAtOffset(ErpDocument.Id, offset, controllers_path);
if (js is null) { StatusMessage = "…"; return; }

switch (js.Kind)
{
    case JsRuntimeNavKind.RequestAction:
    case JsRuntimeNavKind.RequestResponseCase:
    case JsRuntimeNavKind.DollarAProperty:
        if (js.TargetOffset >= 0) NavigateToOffset(js.TargetOffset, 0);
        else if (!string.IsNullOrEmpty(js.SymbolId))
            /* GoToDefinition(js.SymbolId) */;
        break;
    case JsRuntimeNavKind.ScriptFunctionRefs:
        _symbol_info?.ShowReferences(js.References, js.DisplayLabel);
        Shell.ShowPanel(Right SymbolInfo);
        break;
    case JsRuntimeNavKind.ShowFormRelated:
        foreach (var path in js.RelatedPaths.Take(12))
            OpenEntityFile(path); // or form navigator
        StatusMessage = $"Đã mở {js.RelatedPaths.Count} file liên quan {js.DisplayLabel}";
        break;
}
```

**Hover:** trong `ResolveEntityHover` / parallel `ResolveHoverAtOffset`: nếu `$a` hit → `EntityHoverView`/`CodeHoverView` với value.

- [x] **Step 1: Implement SymbolInfo list bind** — click item → `NavigateToOffset` / open doc.

- [ ] **Step 2: Build UI + manual matrix** (request, case miss typo, function refs, $a click/hover, showForm multi).

- [ ] **Step 3: Commit** (khi user yêu cầu)

---

### Task 7: Verify + roadmap

- [x] `dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~DollarA|FboRequest|ScriptFunction|ShowForm|JsRuntime"`
- [x] `dotnet build DevWorkFlow.slnx`
- [x] Spec §8 checklist
- [x] Roadmap Phase 3 artifacts + Progress note
- [x] Handoff Phase 4 (Checking JS catalog)

---

## Spec coverage

| Spec | Task |
|------|------|
| #11 request→action/case | 2 + 5 + 6 |
| #12 function FindRefs | 3 + 5 + 6 |
| #13–14 $a | 1 + 5 + 6 |
| #15 showForm multi | 4 + 5 + 6 |
| No fuzzy typo | 2 |
| Entity/structural priority | 6 chain order |

## Placeholder scan

grid.request arity chốt bảng Task 2. SymbolInfo API tối thiểu Task 6 — không TBD. Stem strip list explicit in Task 4.
