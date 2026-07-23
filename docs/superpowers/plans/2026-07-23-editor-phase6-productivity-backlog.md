# Phase 6 — Editor Productivity Backlog Implementation Plan (P6-01 … P6-27)

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement all Phase 6 productivity IDs P6-01 through P6-27.

**Architecture:** Monaco-native features via bridge; LS/Application for symbol/fold/diagnostic/related/rename; Shell for tabs/Zen/bookmarks/compare. One mega-plan, **many commits** — not one PR.

**Tech Stack:** C# LS/Application, WPF Shell, Monaco/WebView2 bridge, xUnit, existing SQL Studio / catalogs

**Spec:** `docs/superpowers/specs/2026-07-23-editor-phase6-productivity-backlog-design.md`

## Global Constraints

- R1: UI does not parse XML as SoT.
- R7: Navigation by SymbolId/NodeId where applicable.
- Left Panel UX freeze — P6-25 must not change Left width/layout defaults.
- `snake_case` locals.
- Do not regress Phase 1–5.
- Prefer Config catalogs (`fbo-js`, `sql-snippets`) over hard-coded lists.
- Commit after each task (or logical ID group if tiny Monaco toggles).

---

## File map (high level)

| Area | Files |
|------|-------|
| Nav history / Peek / Symbol | `FormBuilderViewModel`, `NavigationHistory`, `IErpLanguageService`, bridge peek |
| Breadcrumb / Outline | `BreadcrumbViewModel` or shell status, `OutlineViewModel` |
| Edit / Rename | Monaco keybindings, `RenameSymbolService`, Serializer path |
| Fold | `XmlFoldingRangeBuilder`, bridge `FoldingRangeProvider` |
| SQL 14–17 | `SqlFormatter`, plan runner, `sql-snippets.xml`, SqlResult send |
| FBO 18–22 | Inlay providers, related files command, diagnostic publisher, handler template command |
| Chrome 23–27 | `IdeShellViewModel` tab menu, Monaco options, Zen, `BookmarkStore`, Diff view |

---

### Task 1: P6-01 Back / Forward caret

**Files:**
- Create: `DevWorkFlow.Application/Language/NavigationHistory.cs` (or `UI/Services` if UI-only stack — **prefer Application-pure stack of records**)
- Modify: `UI/ViewModels/FormBuilderViewModel.cs` — push on NavigateToOffset / OpenEntity / GoTo
- Modify: `UI/Commands/IdeCommands.cs`, `UI/MainWindow.xaml.cs` — Ctrl+- / Ctrl+Shift+-

**Produces:**

```csharp
public sealed class NavigationHistory
{
    public void Push(string document_uri, int offset);
    public bool TryBack(out string document_uri, out int offset);
    public bool TryForward(out string document_uri, out int offset);
}
```

- [ ] **Step 1:** Unit test push/back/forward/cap
- [ ] **Step 2:** Wire FormBuilder + commands
- [ ] **Step 3:** Manual GoTo then Back
- [ ] **Step 4:** Commit `feat(P6-01): navigation history back/forward`

---

### Task 2: P6-02 Peek Definition

**Files:**
- Modify: `UI/Assets/EditorHost/bridge.js` — peek model or widget
- Modify: `FormBuilderViewModel` — resolve definition without forcing tab when peek requested
- Modify: commands Alt+F12 (or IdeCommands.PeekDefinition)

- [ ] **Step 1:** Host API `peekDefinition({ uri, offset, text? })`
- [ ] **Step 2:** Resolve via existing GoTo/JsRuntime/Structural; show peek
- [ ] **Step 3:** Esc closes; Commit `feat(P6-02): peek definition`

---

### Task 3: P6-03 Go to Symbol in Form

**Files:**
- Modify: `IErpLanguageService` / workspace search scoped to current doc
- Create: `UI/ViewModels/GoToSymbolViewModel.cs` or reuse dialog
- Commands: Ctrl+Shift+O

- [ ] **Step 1:** LS API `GetDocumentSymbols(ErpDocumentId)` → list name/kind/offset
- [ ] **Step 2:** UI filter box + Navigate
- [ ] **Step 3:** Commit `feat(P6-03): go to symbol in form`

---

### Task 4: P6-04 Breadcrumb XML path

**Files:**
- Create: `DevWorkFlow.Application/Language/SyntaxPathBuilder.cs`
- Modify: shell status or editor chrome bind `BreadcrumbSegments`
- Click → Navigate

**Produces:** `IReadOnlyList<BreadcrumbSegment> Build(SyntaxNode root, int offset)` with Display + TargetOffset/NodeId.

- [ ] **Step 1:** Unit path for nested views/field
- [ ] **Step 2:** UI strip + click
- [ ] **Step 3:** Commit `feat(P6-04): XML breadcrumb path`

---

### Task 5: P6-05 Outline ↔ caret sync

**Files:**
- Modify: `UI/ViewModels/Explorer/OutlineViewModel.cs`
- Modify: `FormBuilderViewModel` caret events

- [ ] **Step 1:** On caret change select nearest outline node (NodeId/line)
- [ ] **Step 2:** On outline select NavigateTo (already partial — harden both ways, no timer poll)
- [ ] **Step 3:** Commit `feat(P6-05): outline caret two-way sync`

---

### Task 6: P6-06 Multi-cursor + select all occurrences

**Files:**
- Modify: `bridge.js` / Monaco editor options + keybindings (Ctrl+D, Ctrl+Shift+L)

- [ ] **Step 1:** Enable multi-cursor defaults for Form Monaco
- [ ] **Step 2:** Manual verify
- [ ] **Step 3:** Commit `feat(P6-06): Monaco multi-cursor`

---

### Task 7: P6-07 Rename Symbol (LS)

**Files:**
- Create: `DevWorkFlow.Application/Language/RenameSymbolService.cs`
- Modify: LS interface `Rename(documentId, symbolId, newName) → WorkspaceEdit` (document-local)
- Modify: UI command + preview list (Symbol Info or dialog)
- Apply via Serializer / text edits through LS only

**Scope v1:** `FieldSymbol`, `ScriptFunctionSymbol` in current document (+ call sites already indexed).

- [ ] **Step 1:** Failing tests rename field name attribute + refs
- [ ] **Step 2:** Implement + apply
- [ ] **Step 3:** Commit `feat(P6-07): rename symbol via language service`

---

### Task 8: P6-08 Surround / wrap selection

**Files:**
- Modify: bridge commands `surroundCdata`, `surroundXmlComment`, `surroundJsComment`
- IdeCommands + menu

- [ ] **Step 1:** Implement three wraps on selection
- [ ] **Step 2:** Commit `feat(P6-08): surround selection wrappers`

---

### Task 9: P6-09 Duplicate / move line

**Files:**
- bridge: run Monaco actions `editor.action.copyLinesDownAction`, `moveLinesUp/Down`
- Keybindings

- [ ] **Step 1:** Wire actions
- [ ] **Step 2:** Commit `feat(P6-09): duplicate and move lines`

---

### Task 10: P6-10 XML tag autoclose + paired rename

**Files:**
- Modify: `erp-xml-language.js` / Monaco language config `autoClosingPairs`, `linkedEditing`
- Optional Application helper for tag rename ranges

- [ ] **Step 1:** Autoclose `>`
- [ ] **Step 2:** Linked editing start/end tag names
- [ ] **Step 3:** Commit `feat(P6-10): XML tag autoclose and pair rename`

---

### Task 11: P6-11 Fold XML elements

**Files:**
- Create: `DevWorkFlow.Application/Language/XmlFoldingRangeBuilder.cs`
- bridge: `registerFoldingRangeProvider` → request host ranges
- Host: LS/document SyntaxTree → ranges

- [ ] **Step 1:** Unit ranges for script/views/fields
- [ ] **Step 2:** Wire Monaco
- [ ] **Step 3:** Commit `feat(P6-11): fold XML elements`

---

### Task 12: P6-12 Fold JS functions

**Files:**
- Extend folding builder for ScriptIsland function spans
- Same provider as P6-11 or second provider

- [ ] **Step 1:** Unit function fold ranges
- [ ] **Step 2:** Wire
- [ ] **Step 3:** Commit `feat(P6-12): fold script functions`

---

### Task 13: P6-13 Fold Insight entity regions

**Files:**
- Build ranges from `ClearTextSegments` nesting
- Provider only active in Insight mode

- [ ] **Step 1:** Unit nested segments
- [ ] **Step 2:** Wire Insight
- [ ] **Step 3:** Commit `feat(P6-13): fold insight entity regions`

---

### Task 14: P6-14 Format T-SQL

**Files:**
- Create: `DevWorkFlow.Application/Sql/SqlFormatService.cs` (or Infra)
- Wire SqlDocument + command Format Document/Selection

- [ ] **Step 1:** Format fixture SQL (keywords upper, indent)
- [ ] **Step 2:** UI command
- [ ] **Step 3:** Commit `feat(P6-14): format T-SQL selection/document`

---

### Task 15: P6-15 Estimated execution plan

**Files:**
- Modify: `ISqlScriptRunner` / runner batch with SHOWPLAN
- SqlDocument command “Estimated plan”
- Show XML/text in Messages or dedicated pane

- [ ] **Step 1:** Run plan when CS available; Status if not
- [ ] **Step 2:** Commit `feat(P6-15): SQL estimated plan`

---

### Task 16: P6-16 Expand sql-snippets catalog

**Files:**
- Modify: `UI/Config/xml/sql-snippets.xml` — add ≥3 useful snippets (e.g. `exists`, `with(nolock)` pattern, `declare @` helper — real FBO-ish)
- Tests: catalog loads new entries

- [ ] **Step 1:** Add snippets + tests
- [ ] **Step 2:** Commit `feat(P6-16): expand sql-snippets.xml catalog`

---

### Task 17: P6-17 Send result to editor

**Files:**
- Modify: SqlResult panel VM — command SendToEditor
- Insert TSV/CSV at caret in active SqlDocument or open buffer

- [ ] **Step 1:** Export selected grid → text
- [ ] **Step 2:** Insert into SQL editor
- [ ] **Step 3:** Commit `feat(P6-17): send SQL result to editor`

---

### Task 18: P6-18 Inlay request → action/case

**Files:**
- Create: Application inlay hint builder using `FboRequestCallParser`
- bridge `InlayHintsProvider`

- [ ] **Step 1:** Unit hints for sample request line
- [ ] **Step 2:** Wire Monaco Source script islands
- [ ] **Step 3:** Commit `feat(P6-18): inlay hints for request action/case`

---

### Task 19: P6-19 Entity SYSTEM vs inline gutter

**Files:**
- Gutter glyphs from ClearTextSegments (SYSTEM vs inline)
- bridge decorations

- [ ] **Step 1:** Distinct glyph/color per kind (theme tokens if exist)
- [ ] **Step 2:** Commit `feat(P6-19): entity source gutter hints`

---

### Task 20: P6-20 Open related controller files

**Files:**
- Extend `ShowFormRelatedPathResolver` / new `ControllerRelatedBundleResolver` (Dir+Grid+Filter+Lookup+Report same stem)
- Command “Open Related Files”
- Cap tabs ≤ 12 (Phase 3)

- [ ] **Step 1:** Unit stem → paths
- [ ] **Step 2:** UI command
- [ ] **Step 3:** Commit `feat(P6-20): open related controller files`

---

### Task 21: P6-21 Diagnostic Checking JS vs catalog

**Files:**
- Create: `FboJsCatalogDiagnostics.cs` — unknown `f.`/`g.` members in Checking/script
- Publish `ErpDiagnostic` codes; Problems panel
- Depend: Phase 4 catalog loaded

- [ ] **Step 1:** Unit unknown member → diagnostic
- [ ] **Step 2:** Wire on reparse
- [ ] **Step 3:** Commit `feat(P6-21): JS catalog diagnostics`

---

### Task 22: P6-22 Template onChange handler

**Files:**
- Application command: given field name + Dir/Grid context → propose clientScript + function stub
- Apply via LS/Serializer safe path (or documented text edit on script CDATA)
- **Do not** hand-edit XML structure in UI

- [ ] **Step 1:** Unit generate names `onChange$Voucher$field`
- [ ] **Step 2:** Command from Property Grid / palette
- [ ] **Step 3:** Commit `feat(P6-22): template onChange handler`

---

### Task 23: P6-23 Tab Close Others / Right / Copy path

**Files:**
- Modify: `IdeShellViewModel` / document tab context menu

- [ ] **Step 1:** Close Others, Close to the Right
- [ ] **Step 2:** Copy relative path (Program-relative if possible)
- [ ] **Step 3:** Commit `feat(P6-23): document tab context actions`

---

### Task 24: P6-24 Minimap + sticky scroll

**Files:**
- Monaco `minimap.enabled`, `stickyScroll.enabled` from `editor-theme.json` / AppConfig

- [ ] **Step 1:** Options + defaults on
- [ ] **Step 2:** Commit `feat(P6-24): minimap and sticky scroll`

---

### Task 25: P6-25 Zen / Maximize editor

**Files:**
- Shell: hide bottom + right docks (and ribbon optional); **do not** change Left Panel width/layout
- Toggle restore previous visibility

- [ ] **Step 1:** Zen toggle command
- [ ] **Step 2:** Verify Left Panel unchanged
- [ ] **Step 3:** Commit `feat(P6-25): zen maximize editor focus`

---

### Task 26: P6-26 Bookmarks

**Files:**
- Create: `BookmarkStore` (per path+line)
- Gutter click / command toggle; list panel or command next/prev

- [ ] **Step 1:** Persist session (memory OK v1; optional user settings)
- [ ] **Step 2:** Navigate marks
- [ ] **Step 3:** Commit `feat(P6-26): line bookmarks`

---

### Task 27: P6-27 Compare Source ↔ Insight

**Files:**
- Diff editor host (Monaco diff) Source text vs ClearText
- Optional: map caret via OffsetMap when clicking

- [ ] **Step 1:** Open compare command from FormBuilder
- [ ] **Step 2:** Side-by-side buffers
- [ ] **Step 3:** Commit `feat(P6-27): compare Source vs Insight`

---

### Task 28: Phase closeout

**Files:**
- Update roadmap Phase 6 progress + artifacts links
- Update spec success checkboxes

- [ ] **Step 1:** `dotnet test` Application + `dotnet build DevWorkFlow.slnx`
- [ ] **Step 2:** Manual checklist smoke (nav, fold, rename, SQL format, zen, compare)
- [ ] **Step 3:** Commit `docs: Phase 6 backlog implementation complete notes`

---

## Suggested implementation order (dependencies)

```text
01 → 02, 05
03, 04 (parallel after 01)
06, 08, 09, 10, 24 (Monaco batch OK)
07 (after symbols solid)
11 → 12 → 13
14 → 15 → 16 → 17
18 → 19 (inlays)
20, 21 (21 needs catalog), 22
23, 25, 26, 27
28 closeout
```

Agents may parallelize independent Monaco-only tasks (06/08/09/24) carefully.

---

## Self-review vs spec

| Spec IDs | Tasks |
|----------|-------|
| P6-01…05 | Tasks 1–5 |
| P6-06…10 | Tasks 6–10 |
| P6-11…13 | Tasks 11–13 |
| P6-14…17 | Tasks 14–17 |
| P6-18…22 | Tasks 18–22 |
| P6-23…27 | Tasks 23–27 |
| Success/build | Task 28 |

No TBD IDs. P6-25 Left freeze called out. P6-21 depends on Phase 4 catalog.

---

## Execution handoff

Plan: `docs/superpowers/plans/2026-07-23-editor-phase6-productivity-backlog.md`.
