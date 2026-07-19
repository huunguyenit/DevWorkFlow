# Insight Layer Entity Rendering (Approach A) Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace Monaco Content Widget / HTML Insight UI with native Decorations + InjectedText + ViewZone so Entity Insight feels like semantic highlighting on unchanged XML.

**Architecture:** LS owns entity resolve + InsightItem tree; Editor Platform filters by viewport and relays edit events; Monaco Adapter (`bridge.js` + `MonacoEditorHost`) paints only. No XML parse/resolve in the editor.

**Tech Stack:** .NET 8/9, WPF WebView2, Monaco, xUnit, System.Text.Json camelCase bridge messages.

**Spec:** `docs/superpowers/specs/2026-07-19-insight-layer-entity-rendering-design.md`

## Global Constraints

- Insight NEVER modifies XML model text (`&Entity;` stays in Layer 1).
- No Content Widget, tooltip, popup, border, purple `|`, or `<textarea>` for Insight idle/edit UI.
- Explicit whitespace between entity ref and resolved value.
- Nested hierarchy via ViewZone under the original source line; source line stays intact.
- Leaf edit via InjectedText edit session (click/F2 → type → Enter commit / Esc cancel).
- Viewport-scoped materialization only.
- Snake_case for local vars in C# / JS business code per project rule; keep Monaco/API camelCase payloads.
- Do not touch AvalonEdit path this iteration.
- Out of scope: search by resolved value, multi-insight merge, full IDE undo stack, migrating 7 VMs to `IEditorPlatform`.

## File Structure

| File | Responsibility |
|------|----------------|
| `DevWorkFlow.Domain/Language/Insights.cs` | `InsightErrorKind` + fields on `InsightItem` |
| `DevWorkFlow.Application/Language/InsightProviderPipeline.cs` | Populate ErrorKind; emit Unresolved Entity insights from ERP3003 |
| `DevWorkFlow.Editor/InsightViewportFilter.cs` | Pure filter: insights ∩ visible line range |
| `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs` | New event name constants |
| `DevWorkFlow.Editor/IEditorPlatform.cs` | Optional `IEditorViewportService` surface (range only) |
| `UI/Config/json/editor-theme.json` | Replace `insightBlock` with `entityRef` / `entityValue` / `entityError` |
| `UI/Assets/EditorHost/bridge.js` | Rewrite Insight renderer (Approach A) |
| `UI/Views/Controls/MonacoEditorHost.xaml.cs` | Viewport → filter → `setInsights`; handle cancel events |
| `tests/DevWorkFlow.Application.Tests/InsightProviderPipelineTests.cs` | ErrorKind + unresolved entity insight |
| `tests/DevWorkFlow.Editor.Tests/InsightViewportFilterTests.cs` | Viewport filter unit tests |
| `docs/specs/editor/insight-editor-surface.md` | Document Approach A as current Monaco behavior |
| `docs/specs/editor/entity-insight-rendering.md` | Close status gaps that this plan covers |

---

### Task 1: Domain — InsightErrorKind on InsightItem

**Files:**
- Modify: `DevWorkFlow.Domain/Language/Insights.cs`
- Test: `tests/DevWorkFlow.Application.Tests/InsightProviderPipelineTests.cs` (extended in Task 2; Task 1 is type + compile)

**Interfaces:**
- Produces: `enum InsightErrorKind { None = 0, Unresolved = 1, Circular = 2 }` and properties on `InsightItem`:
  - `InsightErrorKind ErrorKind { get; init; }`
  - `string? ErrorMessage { get; init; }`
- Keep `AnnotatedValue` for now (AvalonEdit may still read it); Monaco renderer must not depend on pipe format.

- [ ] **Step 1: Add enum + properties**

In `Insights.cs`, after `InsightLayer` enum, add:

```csharp
/// <summary>Lỗi Entity Insight (ADR-0004 / entity-insight-rendering).</summary>
public enum InsightErrorKind
{
    None = 0,
    Unresolved = 1,
    Circular = 2
}
```

On `InsightItem`, after `CanEditResolvedValue`, add:

```csharp
public InsightErrorKind ErrorKind { get; init; }

public string? ErrorMessage { get; init; }
```

Update `AnnotatedValue` XML doc to note Monaco Approach A ignores pipe layout (children-driven ViewZone).

- [ ] **Step 2: Build Domain project**

Run: `dotnet build DevWorkFlow.Domain/DevWorkFlow.Domain.csproj`
Expected: PASS

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Domain/Language/Insights.cs
git commit -m "feat(language): add InsightErrorKind for entity insight errors"
```

---

### Task 2: LS — Circular ErrorKind + Unresolved Entity insights

**Files:**
- Modify: `DevWorkFlow.Application/Language/InsightProviderPipeline.cs` (`EntityInsightProvider`)
- Test: `tests/DevWorkFlow.Application.Tests/InsightProviderPipelineTests.cs`

**Interfaces:**
- Consumes: `InsightErrorKind`, diagnostics id `ERP3003` (undeclared entity ref)
- Produces: Cycle nodes set `ErrorKind = Circular`, `ErrorMessage = DisplayContent`, `CanEditResolvedValue = false`
- Produces: For each `ERP3003` diagnostic in document path, one `InsightItem` Type=Entity, ErrorKind=Unresolved, Range=diagnostic.Location, CanEditResolvedValue=false

- [ ] **Step 1: Write failing tests**

Append to `InsightProviderPipelineTests.cs`:

```csharp
[Fact]
public void Circular_entity_insight_sets_ErrorKind_Circular()
{
    const string xml = """
        <!DOCTYPE dir [
          <!ENTITY A "&B;">
          <!ENTITY B "&A;">
        ]>
        <dir xmlns="urn:schemas-fast-com:data-dir">&A;</dir>
        """;
    var language_service = new ErpLanguageService();
    var document = language_service.OpenDocumentFromText("cycle.xml", xml);

    var insight = Assert.Single(
        document.Insights,
        item => item.Type == InsightType.Entity && item.ReferenceText == "&A;");

    Assert.Contains(
        Flatten(insight),
        item => item.ErrorKind == InsightErrorKind.Circular
                && !string.IsNullOrWhiteSpace(item.ErrorMessage));
}

[Fact]
public void Undeclared_entity_reference_emits_Unresolved_entity_insight()
{
    const string xml = """
        <!DOCTYPE dir [
        ]>
        <dir xmlns="urn:schemas-fast-com:data-dir">&MissingThing;</dir>
        """;
    var language_service = new ErpLanguageService();
    var document = language_service.OpenDocumentFromText("missing.xml", xml);

    Assert.Contains(document.Diagnostics, d => d.Id == "ERP3003");
    var insight = Assert.Single(
        document.Insights,
        item => item.Type == InsightType.Entity
                && item.ErrorKind == InsightErrorKind.Unresolved
                && item.ReferenceText.Contains("MissingThing", StringComparison.OrdinalIgnoreCase));
    Assert.False(insight.CanEditResolvedValue);
    Assert.False(string.IsNullOrWhiteSpace(insight.ErrorMessage));
}

private static IEnumerable<InsightItem> Flatten(InsightItem root)
{
    yield return root;
    foreach (var child in root.Children)
    foreach (var nested in Flatten(child))
        yield return nested;
}
```

If the circular fixture shape differs from current binder behavior, adjust assertions to match real Insight tree while still requiring `ErrorKind.Circular` somewhere on the cycle path.

- [ ] **Step 2: Run tests — expect FAIL**

Run: `dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~InsightProviderPipelineTests"`
Expected: FAIL on new tests (`ErrorKind` defaults to None / no Unresolved item)

- [ ] **Step 3: Implement provider changes**

In `EntityInsightProvider.BuildEntityItem` cycle branch, set:

```csharp
ErrorKind = InsightErrorKind.Circular,
ErrorMessage = $"Chu kỳ entity: {entity.Name}",
CanEditResolvedValue = false,
```

In `Provide`, after building reference insights, also emit Unresolved items for each `ERP3003` diagnostic on `document_path`:

```csharp
foreach (var diagnostic in diagnostics)
{
    if (!string.Equals(diagnostic.Id, "ERP3003", StringComparison.OrdinalIgnoreCase))
        continue;
    if (!PathsEqual(diagnostic.Location.Path, document_path))
        continue;

    var ref_name = TryExtractEntityName(diagnostic);
    result.Add(new InsightItem
    {
        Id = $"entity-unresolved:{diagnostic.Location.Span.StartOffset}",
        Type = InsightType.Entity,
        Range = diagnostic.Location,
        Priority = 100,
        Layer = InsightLayer.Error,
        ReferenceText = string.IsNullOrEmpty(ref_name) ? diagnostic.Message : $"&{ref_name};",
        DisplayContent = diagnostic.Message,
        ResolvedValue = string.Empty,
        CanEditResolvedValue = false,
        ErrorKind = InsightErrorKind.Unresolved,
        ErrorMessage = diagnostic.Message
    });
}
```

Implement `TryExtractEntityName` by parsing `&Name;` from message/metadata or the diagnostic location. Remove `_ = diagnostics;` so diagnostics are used.

- [ ] **Step 4: Run tests — expect PASS**

Run: `dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~InsightProviderPipelineTests"`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add DevWorkFlow.Application/Language/InsightProviderPipeline.cs tests/DevWorkFlow.Application.Tests/InsightProviderPipelineTests.cs
git commit -m "feat(language): mark circular/unresolved entity insights with ErrorKind"
```

---

### Task 3: Editor — InsightViewportFilter

**Files:**
- Create: `DevWorkFlow.Editor/InsightViewportFilter.cs`
- Create: `tests/DevWorkFlow.Editor.Tests/InsightViewportFilterTests.cs`
- Modify: `DevWorkFlow.Editor/IEditorPlatform.cs` (add viewport range DTO + optional service surface)
- Modify: `UI/Services/FormBuilderEditorPlatform.cs` (stub `Viewport` if interface grows)

**Interfaces:**
- Produces:

```csharp
public readonly record struct EditorVisibleRange(int StartLine, int EndLine, int BufferLines = 5);

public static class InsightViewportFilter
{
    public static IReadOnlyList<InsightItem> Filter(
        IReadOnlyList<InsightItem> items,
        EditorVisibleRange range);
}
```

Rules: keep item if `item.Range.Line` is within `[StartLine - BufferLines, EndLine + BufferLines]` (1-based lines as Monaco). If `item.Range.Line <= 0`, include the item (safe default). Do not strip `Children` of kept roots.

- [ ] **Step 1: Write failing tests**

```csharp
public class InsightViewportFilterTests
{
    [Fact]
    public void Filter_keeps_only_items_inside_buffered_range()
    {
        var items = new[]
        {
            Item("a", line: 10),
            Item("b", line: 50),
            Item("c", line: 12),
        };

        var visible = InsightViewportFilter.Filter(items, new EditorVisibleRange(10, 15, BufferLines: 2));

        Assert.Equal(2, visible.Count);
        Assert.Contains(visible, i => i.Id == "a");
        Assert.Contains(visible, i => i.Id == "c");
    }

    [Fact]
    public void Filter_includes_buffer_lines_outside_strict_viewport()
    {
        var items = new[] { Item("edge", line: 8) };
        var visible = InsightViewportFilter.Filter(items, new EditorVisibleRange(10, 20, BufferLines: 2));
        Assert.Single(visible);
    }

    private static InsightItem Item(string id, int line) => new()
    {
        Id = id,
        Type = InsightType.Entity,
        Range = new SourceLocation { Line = line, Span = new TextSpan(0, 1) }
    };
}
```

Confirm `SourceLocation` / `TextSpan` type names against `DevWorkFlow.Domain.Language` (use actual property types already used in tests).

- [ ] **Step 2: Run — expect FAIL**

Run: `dotnet test tests/DevWorkFlow.Editor.Tests/DevWorkFlow.Editor.Tests.csproj --filter "FullyQualifiedName~InsightViewportFilterTests"`
Expected: FAIL (type missing)

- [ ] **Step 3: Implement filter + optional viewport interface**

Add `InsightViewportFilter.cs` as above.

On `IEditorPlatform.cs`, add:

```csharp
public interface IEditorViewportService
{
    EditorVisibleRange? VisibleRange { get; }
}

// And on IEditorPlatform:
IEditorViewportService Viewport { get; }
```

Implement stub on `FormBuilderEditorPlatform` returning `null` VisibleRange (host still filters via scroll events in Task 6).

- [ ] **Step 4: Run — expect PASS**

Run: `dotnet test tests/DevWorkFlow.Editor.Tests/DevWorkFlow.Editor.Tests.csproj --filter "FullyQualifiedName~InsightViewportFilterTests"`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add DevWorkFlow.Editor/InsightViewportFilter.cs DevWorkFlow.Editor/IEditorPlatform.cs tests/DevWorkFlow.Editor.Tests/InsightViewportFilterTests.cs UI/Services/FormBuilderEditorPlatform.cs
git commit -m "feat(editor): add InsightViewportFilter for visible-range insight materialization"
```

---

### Task 4: Bridge constants + theme tokens

**Files:**
- Modify: `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs`
- Modify: `UI/Config/json/editor-theme.json`
- Modify: any C# theme DTO that deserializes `insightBlock` (search `insightBlock` / `EditorThemeOptions`)

**Interfaces:**
- Produces event constants:

```csharp
public const string EntityValueEditBegan = "entityValueEditBegan";
public const string EntityValueEditCancelled = "entityValueEditCancelled";
// EntityValueCommitted already exists
```

- Theme shape (JSON):

```json
"entityInsight": {
  "entityRef": { "color": "#6B7280", "fontStyle": "italic", "opacity": 0.45 },
  "entityValue": { "color": "#1F2937", "fontStyle": "" },
  "entityError": { "color": "#E74C3C", "fontStyle": "italic" }
}
```

Remove dependency on `insightBlock` border/purple fields for Monaco. AvalonEdit may keep reading old keys temporarily.

- [ ] **Step 1: Find theme DTO**

Search: `insightBlock` in `UI/`. Update DTO property names to match JSON. Ensure `ApplyTheme` still serializes camelCase.

- [ ] **Step 2: Update constants + theme JSON + DTO**

- [ ] **Step 3: Build UI + Editor**

Run: `dotnet build UI/UI.csproj`
Expected: PASS

- [ ] **Step 4: Commit**

```bash
git add DevWorkFlow.Editor/Bridge/EditorHostMessages.cs UI/Config/json/editor-theme.json
git commit -m "feat(editor): add insight edit events and entityInsight theme tokens"
```

---

### Task 5: bridge.js — Approach A renderer (no Content Widgets)

**Files:**
- Modify: `UI/Assets/EditorHost/bridge.js`

**Interfaces:**
- Consumes: `setInsights` payload `{ items, show }` with InsightItem camelCase (`referenceText`, `resolvedValue`, `children`, `errorKind`, `errorMessage`, `canEditResolvedValue`, `range.span.startOffset`…)
- Produces events: `entityValueEditBegan`, `entityValueCommitted`, `entityValueEditCancelled`
- Must delete: `contentWidgets`, `buildInsightNode`, `clearInsightWidgets`, `dwf-insight-block` styles

**Rendering algorithm:**

1. `clearInsightDecorations()` via `deltaDecorations(oldIds, [])` and `changeViewZones` remove tracked zone ids.
2. For each Entity item with valid span:
   - If `errorKind !== 0`: decoration on source span with `inlineClassName: 'dwf-entity-error'` (+ optional after text `" " + errorMessage`).
   - Else: decoration on source span `inlineClassName: 'dwf-entity-ref'`.
   - If `children.length === 0` and not error: InjectedText after span: content = `' ' + resolvedValue`, `inlineClassName: 'dwf-entity-value'`.
   - If `children.length > 0`: style source chain; add ViewZone after line with paint-only indented lines built from `children` (no inputs).
3. Register CSS once for `.dwf-entity-ref` (italic, opacity ~0.45), `.dwf-entity-value`, `.dwf-entity-error` (`#E74C3C`), `.dwf-entity-zone`.

**Edit session (flat InjectedText):**

1. Track decoration id → `{ entityName, originalValue }`.
2. Click / F2 on value → begin session, post `entityValueEditBegan`.
3. While active: consume keystrokes into `session_buffer`; refresh InjectedText via decoration replace — do **not** insert into XML model; no `<textarea>`.
4. Enter → post `entityValueCommitted` `{ entityName, newValue }` and end session.
5. Escape / click away → restore original injected text, post `entityValueEditCancelled`.

**Nested leaf edit:** same session protocol on zone leaf `.val` via `textContent` updates; commit uses leaf `entity_name` from `actions`.

**Viewport clamp in JS:** drop items outside `editor.getVisibleRanges()` ± 5; debounce `onDidScrollChange` 50–100ms and re-render from `lastInsights`.

- [ ] **Step 1: Delete Content Widget path**

Remove widget maps and `buildInsightNode`. Confirm no remaining `addContentWidget` for insights.

- [ ] **Step 2: Implement decoration + InjectedText flat path**

Ensure `renderInsights` uses `deltaDecorations` with `after: { content: ' ' + value }`.

- [ ] **Step 3: Implement ViewZone nested path**

Build zone height = depth * lineHeight. Indent with four spaces per depth.

- [ ] **Step 4: Implement edit session**

Wire Enter/Esc and commit/cancel events without DOM inputs.

- [ ] **Step 5: Manual smoke**

Open a document with flat + nested entities (checklist in Task 8).

- [ ] **Step 6: Commit**

```bash
git add UI/Assets/EditorHost/bridge.js
git commit -m "feat(editor): render entity insight via decorations, InjectedText, and ViewZones"
```

---

### Task 6: MonacoEditorHost — viewport push + cancel handling

**Files:**
- Modify: `UI/Views/Controls/MonacoEditorHost.xaml.cs`
- Modify: `UI/Assets/EditorHost/bridge.js` (emit `viewportChanged`)
- Modify: `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs` if constant not already added

**Interfaces:**
- Produces: host caches `_visible_range`; `SendInsights()` sends `InsightViewportFilter.Filter(Insights, range)` when range known.
- Handles `EntityValueEditCancelled` (no-op or status clear); keep `EntityValueCommitted` → `InsightEditCommand`.

- [ ] **Step 1: Add viewportChanged event + JS emitter**

In `EditorHostEvents`:

```csharp
public const string ViewportChanged = "viewportChanged";
```

In `bridge.js`, debounced on scroll/layout:

```javascript
post({
  event: 'viewportChanged',
  payload: {
    startLine: range.startLineNumber,
    endLine: range.endLineNumber
  }
});
```

- [ ] **Step 2: Host applies filter in SendInsights**

```csharp
private EditorVisibleRange? _visible_range;

private void SendInsights()
{
    var items = (IReadOnlyList<InsightItem>?)Insights ?? [];
    if (_visible_range is { } range)
        items = InsightViewportFilter.Filter(items, range);
    SendCommandFireAndForget(EditorHostCommands.SetInsights, new { items, show = ShowInsights });
}
```

On `ViewportChanged`, update `_visible_range` and `SendInsights()`.

- [ ] **Step 3: Handle cancel event**

Ignore payload beyond debug log, or clear a transient status if one exists.

- [ ] **Step 4: Build + smoke**

Run: `dotnet build UI/UI.csproj`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add UI/Views/Controls/MonacoEditorHost.xaml.cs UI/Assets/EditorHost/bridge.js DevWorkFlow.Editor/Bridge/EditorHostMessages.cs
git commit -m "feat(editor): filter Monaco insights by viewport and handle edit cancel"
```

---

### Task 7: Spec / status docs sync

**Files:**
- Modify: `docs/specs/editor/insight-editor-surface.md`
- Modify: `docs/specs/editor/entity-insight-rendering.md` (Implementation Status)
- Modify: `.ai/CURRENT_STATE.md` and `.ai/EDITOR_SUMMARY.md` if present (brief)

- [ ] **Step 1: Rewrite Monaco section of insight-editor-surface**

State: Content Widgets removed; Approach A is current. Link to design spec. Keep AvalonEdit interim section clearly separated.

- [ ] **Step 2: Update entity-insight-rendering Implementation Status**

Mark closed: inline unresolved indicator (`ErrorKind`), visual no-widget path, viewport filter. Leave open: search by Resolved Value, full Command Undo.

- [ ] **Step 3: Commit**

```bash
git add docs/specs/editor/insight-editor-surface.md docs/specs/editor/entity-insight-rendering.md .ai/CURRENT_STATE.md .ai/EDITOR_SUMMARY.md
git commit -m "docs(editor): sync Insight Approach A status with implementation"
```

---

### Task 8: Acceptance verification

**Files:** none (manual + automated)

- [ ] **Step 1: Automated**

Run:

```bash
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~InsightProviderPipelineTests"
dotnet test tests/DevWorkFlow.Editor.Tests/DevWorkFlow.Editor.Tests.csproj --filter "FullyQualifiedName~InsightViewportFilterTests|FullyQualifiedName~EditorHostMessageTests"
dotnet build UI/UI.csproj
```

Expected: all PASS

- [ ] **Step 2: Manual checklist (app)**

1. Flat: `&ClientDefault;` muted italic + space + value; no border/`|`.
2. Nested: source line unchanged; ViewZone shows indented parents + leaf.
3. Edit leaf: F2/click → type → Enter → XML still has `&Entity;`; value updates via LS.
4. Esc restores value; no `UpdateEntityValue`.
5. Unresolved (`ERP3003`) and circular show `#E74C3C` inline.
6. Scroll large file: no leftover `dwf-insight-block` widgets in DOM.

- [ ] **Step 3: Final commit only if docs/tests need fixes discovered during verification**

---

## Spec coverage (self-review)

| Spec requirement | Task |
|------------------|------|
| No HTML widget / popup / tooltip for Insight | 5 |
| Ref muted italic ~40–50% opacity | 4, 5 |
| Explicit space before value | 5 |
| Nested ViewZone hierarchy, source line intact | 5 |
| Leaf edit session Enter/Esc | 5, 6 |
| Serializer keeps `&Entity;` | existing `UpdateEntityValue` path + Task 6 commit wiring |
| Viewport-only render | 3, 5, 6 |
| Unresolved / Circular Error `#E74C3C` | 1, 2, 5 |
| Platform abstraction / no business Monaco calls | 3, 6 |
| Search Resolved Value | out of scope (documented Task 7) |
| AvalonEdit untouched | Global Constraints |

## Placeholder scan

No TBD/TODO steps. Exact paths, commands, and code snippets included. Adjust circular test fixture if binder tree shape differs — still assert `ErrorKind.Circular`.

## Type consistency

- `InsightErrorKind` used in Domain → Application → JSON `errorKind` number → JS checks.
- `EditorVisibleRange(StartLine, EndLine, BufferLines)` shared by filter + host.
- Events: `entityValueEditBegan` / `entityValueCommitted` / `entityValueEditCancelled` / `viewportChanged`.
