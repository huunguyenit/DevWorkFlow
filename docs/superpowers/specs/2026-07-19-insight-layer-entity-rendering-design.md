# Insight Layer Entity Rendering Redesign

Date: 2026-07-19  
Status: Approved for planning  
Approach: A — Decoration + Injected Text + View Zones  
Related: ADR-0002, ADR-0004, ADR-0005, ADR-0006, `03-EDITOR_PLATFORM.md`, `entity-insight-rendering.md`, `insight-editor-surface.md`

---

## 1. Goal

Redesign ERP Language Entity Insight so the editor feels like native Monaco with an additional **semantic rendering layer** — not a form designer, popup, tooltip, or HTML widget surface.

Insight Mode visualizes ERP semantics on top of unchanged XML source. The user always edits ERP Language (via Semantic Model for entity values); storage remains entity references.

---

## 2. Scope

### In scope

- Entity Insight only on Monaco (WebView2 / Editor Platform path)
- Visual: entity ref styling + resolved value rendering (flat + nested multiline)
- Edit session for leaf resolved values
- Viewport-scoped render / dispose
- Unresolved / circular inline error indication
- Minimal Command path for entity value commit (`UpdateEntityValue`)

### Out of scope (backlog)

- Search by Resolved Value (entity-insight-rendering FR#7)
- Multi-insight merge on one symbol (Validation + AI + Entity)
- Full IDE Command Undo stack beyond entity-edit commit path
- Migrating remaining ViewModels onto `IEditorPlatform`
- AvalonEdit visual parity (interim path unchanged this iteration)

---

## 3. Core Philosophy

Insight Mode is **not**: tooltip, popup, HTML widget, floating control, or separate editor.

Insight Mode **is**: a semantic rendering layer over original XML, analogous to syntax highlighting.

Rendering layers (independent):

```text
Layer 1  Raw XML Source
Layer 2  Syntax Highlighting
Layer 3  Semantic Rendering (Insight)
Layer 4  Diagnostics
Layer 5  Selection / Caret
```

Layer 3 must never modify Layer 1. It only paints semantic information via Monaco native decoration APIs.

---

## 4. Architecture

```text
XML
  → ERP Language Service (Parser → Semantic Model → Entity / Insight Providers)
  → Editor Platform (IEditorDecorationService / Viewport / Message Bridge)
  → Monaco Adapter (C# host + bridge.js)
  → Monaco Editor (decorations, InjectedText, ViewZone)
```

| Component | Responsibility |
|-----------|----------------|
| ERP Language Service | Resolve entities, nested tree, diagnostics for unresolved/circular; no render |
| Editor Platform | Abstraction: insights, visible range, edit begin/commit/cancel events |
| Monaco Adapter | Map platform messages to Monaco APIs only |
| Business / UI modules | Never call Monaco or create Insight DOM |

### Migration from current interim

Remove from `UI/Assets/EditorHost/bridge.js`:

- Content Widgets (`addContentWidget`)
- `buildInsightNode` DOM (`dwf-insight-block`, border, purple `|`, `<textarea>`)

Replace theme tokens `insightBlock` (border/purple) with semantic tokens:

- `entityRef`
- `entityValue`
- `entityError`

AvalonEdit interim path is intentionally untouched in this iteration.

---

## 5. Visual Spec

### 5.1 Flat entity

Source (unchanged):

```xml
clientDefault="&ClientDefault;"
```

Render:

```text
clientDefault="&ClientDefault;" Default
```

Rules:

| Region | Appearance | Interaction |
|--------|------------|-------------|
| `&ClientDefault;` | Italic, secondary gray, ~40–50% opacity | Read-only |
| (space) | Explicit whitespace between ref and value | — |
| `Default` | Normal editor text style, same font / baseline / line-height | Editable via edit session |

No border, separator `|`, purple background, or rounded chrome.

### 5.2 Nested entity

Source (one line, unchanged):

```text
&Company.&Department.Manager;
```

Render (View Zone expansion under the source line):

```text
&Company;          ABC Corporation
    &Department;   Sales
        &Manager;  John Smith
```

Rules:

- Never flatten nested entities
- Never hide parent entities
- Indent by depth using editor tab width
- Only **leaf** resolved values are editable; intermediate nodes are read-only
- Entity refs at every level use the same muted italic style

### 5.3 Errors

| Case | Render |
|------|--------|
| Unresolved | Entity ref in Error `#E74C3C` + short inline message; no MessageBox |
| Circular | Same Error styling + short cycle message |

---

## 6. Rendering Mechanics (Approach A)

### Flat

1. Decoration with `inlineClassName` on the source span of the entity reference.
2. `InjectedText` (`after`) immediately after the reference span: `" " + resolvedValue` (leading space required).
3. Source model text remains `&Entity;` only.

### Nested

1. Keep the original source line intact (`&Company.&Department.Manager;`). Style that full chain muted italic on the source line. Do **not** rewrite or split source glyphs into per-node text on the original line.
2. Insert a **View Zone** immediately below the source line. Hierarchy (every parent + leaf) appears only in the View Zone: one display line per level (ref + spacing + value), indented by depth.
3. View Zone content is paint-only (no HTML input controls). Interaction for leaf edit uses the edit session protocol, not DOM form controls.

### Viewport

1. Host (C#) filters insights to VisibleRange ± small line buffer before `setInsights` when range is known.
2. JS still clamps / disposes decorations and zones outside the current viewport.
3. Prefer `deltaDecorations` and reuse decoration / zone ids.
4. No full-document Insight materialization.

---

## 7. Editing

### Protocol

1. **Begin**: single-click on value InjectedText region, or F2 when caret is near the entity → `entityValueEditBegan`.
2. **Type**: keystrokes update a temporary buffer; InjectedText content refreshes each change (or throttled) — no `<input>` / `<textarea>`.
3. **Commit**: Enter → `entityValueCommitted` → host calls `IErpLanguageService.UpdateEntityValue` once → Semantic Model update → Serializer keeps `&Entity;` in XML.
4. **Cancel**: Escape → restore previous InjectedText → `entityValueEditCancelled`.
5. Click outside the value region cancels if buffer unchanged; if changed, prefer cancel (discard) unless product later opts for blur-commit — **this design uses Enter to commit, Esc/click-away to cancel**.

### Constraints

- Entity identifier / reference text is never writable through Insight.
- Caret movement, selection, and scroll remain Monaco-native outside an active edit session.
- During edit session, typing must not insert characters into the XML model at the injection point.

### Undo

- Successful commit is one logical command: **Edit Entity Value**.
- Wire through the existing LS update path; full IDE undo stack integration beyond this minimum remains backlog if stubs persist.

---

## 8. Data Contracts & Platform API

### InsightItem (Entity) for bridge

Minimum fields:

- `id`
- `type` = Entity
- `range` (`SourceLocation` on original XML)
- `referenceText`
- `resolvedValue`
- `children[]` (nested tree already resolved by LS)
- `canEditResolvedValue`
- `errorKind?` — `None` | `Unresolved` | `Circular`
- `errorMessage?`
- `actions[]` — keep `entity.edit` + `entity_name` metadata

Do **not** rely on flat `annotatedValue` pipe format for rendering. View Zone layout is built from `children`.

### Messages

Host → JS (existing / extended):

- `setInsights` `{ items, show }`
- `setShowInsights`

JS → Host:

- `entityValueEditBegan`
- `entityValueEditUpdated` (optional; may debounce)
- `entityValueCommitted` `{ entityName, newValue }`
- `entityValueEditCancelled`

### Platform surfaces

Extend without exposing Monaco types:

- `IEditorDecorationService`: `ShowInsights`, `Insights` (existing)
- Viewport: visible range get/set used to filter insights
- Edit events routed through Message Bridge / platform events only

---

## 9. Data Flow

### Open / scroll / semantic change

```text
LS InsightChanged / SemanticChanged
  → Host builds InsightItem[] for document
  → Filter by VisibleRange (± buffer)
  → setInsights
  → Adapter: decorations + InjectedText + ViewZone (viewport only)
```

### Edit commit

```text
User completes edit session (Enter)
  → entityValueCommitted
  → Editor Platform
  → IErpLanguageService.UpdateEntityValue
  → Semantic Model
  → Serializer
  → XML keeps &Entity;
  → Insight refresh for visible range
```

---

## 10. Performance

- Virtualize Insight to viewport + buffer
- Dispose zones / decorations that leave the viewport
- Batch `deltaDecorations`; avoid per-key full clear/rebuild when possible
- No DOM widgets for idle Insight
- Avoid layout thrash; no full document re-set on every scroll tick (debounce scroll → filter → setInsights)

---

## 11. Error Handling

| Situation | Behavior |
|-----------|----------|
| Unresolved entity | Inline error style + message; still no widget |
| Circular entity | Inline error style + cycle message |
| Commit fails | Revert InjectedText to previous value; surface IdeMessage / status — no MessageBox |
| Large document | Loading state optional per entity; never block typing in non-session regions |

---

## 12. Testing / Acceptance

1. Flat: visible line shows muted italic `&X;` then explicit space then normal `value`; no border, no `|`.
2. Nested: View Zone shows full hierarchy with indent; parents visible.
3. Edit session Commit updates Semantic Model; saved XML retains `&X;`.
4. Escape restores previous value; no `UpdateEntityValue` call.
5. Scroll large file: only viewport insights materialized; leaving range disposes zones.
6. Unresolved / circular show Error `#E74C3C` inline.
7. Architecture: no XML parse / entity resolve in `bridge.js`; no Monaco calls from business modules.

---

## 13. Implementation Boundaries

| Do | Do not |
|----|--------|
| Render from Semantic Insight DTOs | Parse XML in editor / bridge |
| Use Editor Platform messages | Call Monaco from Application/UI business code |
| Keep source model as XML entity refs | Replace `&Entity;` with resolved value in storage |
| Prefer Monaco decorations / InjectedText / ViewZone | Content Widgets, tooltips, popups for primary Insight |

---

## 14. Doc updates after implementation

- Update `docs/specs/editor/insight-editor-surface.md` to describe Monaco Approach A (archive Content Widget behavior as historical).
- Update Implementation Status in `docs/specs/editor/entity-insight-rendering.md` for closed gaps (visual, unresolved indicator) and remaining backlog (search, full undo).
- Refresh `.ai/CURRENT_STATE.md` / `EDITOR_SUMMARY.md` when implementation lands.

---

## 15. Decisions log

| Decision | Choice |
|----------|--------|
| Scope | Monaco Entity Insight only (render + edit + viewport) |
| Nested layout | Multiline indent via View Zone |
| Edit mechanism | Injected text + click/F2 edit session |
| Rendering approach | A — Decorations + InjectedText + View Zones |
| Gap before value | Explicit whitespace required |
| AvalonEdit | Untouched this iteration |
| Search by resolved value | Backlog |
