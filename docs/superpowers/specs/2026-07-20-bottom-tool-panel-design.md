# Bottom Tool Panel — Shared Layout Design

Date: 2026-07-20  
Status: Approved (design conversation)  
Related: shell bottom dock (`BottomToolDockHost`), `IdeDiagnosticsViewModel`

---

## Goal

Unify **Problems**, **Output**, **Log**, and **Search** under one shared layout, using the current **Problems** panel as the visual standard.

XML bottom tab stays separate (`XmlBottomPanel`).

---

## Decisions

| Topic | Choice |
|-------|--------|
| Shared UI | One `BottomToolPanel` UserControl (header + list + Clear) |
| Item model | `IBottomListItem` — all tabs map into the same row shape |
| Row layout | Problems-style: icon \| primary + secondary \| trailing |
| Search | Same row shape as Problems; navigate on activate; phase-1 stub API |
| Output / Log | Same row chrome; minimal field mapping; no navigate |
| Approach | Contract + shared control (not per-tab DataTemplates, not style-only copy) |

---

## Layout (Problems as baseline)

```text
┌─────────────────────────────────────────────────────────┐
│ TITLE   [badges…]                          [Clear]      │
├─────────────────────────────────────────────────────────┤
│ ⬤  PrimaryText                          TrailingText    │
│    SecondaryText (optional / collapsed if empty)        │
└─────────────────────────────────────────────────────────┘
```

- Header: `CodePaneHeaderBrush`, title muted, Clear = `IdeToolButtonStyle` (Problems standard).
- List: transparent `ListBox`, pixel virtualization, same item chrome (hover/selected) as Problems.
- No AvalonDock title duplication concerns — content owns this header.

---

## Contracts

### `IBottomListItem`

| Member | Purpose |
|--------|---------|
| `PrimaryText` | Main line |
| `SecondaryText` | Optional subtitle (empty → collapsed) |
| `TrailingText` | Right side (file/location/time) |
| `IconKind` | MaterialDesign PackIcon kind (or string key resolved in view) |
| `IconBrush` | Severity / level color |
| `CanNavigate` | Double-click / Enter enabled |
| `NavigateTarget` | Optional path, line, offset |

### `BottomPaneVm`

| Member | Purpose |
|--------|---------|
| `Title` | Header label (`PROBLEMS`, `OUTPUT`, …) |
| `Badges` | Collection of badge VMs (icon + count + colors); empty OK |
| `Items` | `ObservableCollection<IBottomListItem>` (or typed collection exposed as items) |
| `ClearCommand` | Clears that pane’s data |
| `ActivateItemCommand` | Navigate / open when item allows |

### Field mapping

| Pane | Primary | Secondary | Trailing | Icon | Navigate |
|------|---------|-----------|----------|------|----------|
| Problems | Description (+ Code muted inline or in primary) | Resolution | File + Ln/Col | Severity | RelatedPath / Offset / Line |
| Output | Message | Source | Time (`HH:mm:ss`) | Level | No |
| Log | Message | Source | Time | Level | No |
| Search | Match / snippet | Context | `file:line` | Magnify | Path + Line |

Problems keeps existing semantics (`ProblemItemVm` implements `IBottomListItem`).  
Output/Log use `BottomListItemVm` (or `LogEntryVm` adapted).  
Search uses `BottomListItemVm` + navigate target.

---

## Files

### Add

- `UI/Views/Bottom/BottomToolPanel.xaml` (+ `.cs`)
- `UI/ViewModels/Bottom/IBottomListItem.cs`
- `UI/ViewModels/Bottom/BottomListItemVm.cs`
- `UI/ViewModels/Bottom/BottomPaneVm.cs`
- `UI/ViewModels/Bottom/BottomBadgeVm.cs` (optional small type)

### Change

- `ProblemItemVm` → implement `IBottomListItem`
- `IdeDiagnosticsViewModel` → expose `ProblemsPane`, `OutputPane`, `LogPane`, `SearchPane`
- `BottomToolDockHost.xaml` → four `BottomToolPanel` instances bound to panes; Search tab content real
- Navigate logic from `ProblemsPanel.xaml.cs` → `ActivateItemCommand` (FormBuilder bridge via MainViewModel / injected callback)

### Remove after migrate

- `ProblemsPanel.xaml` / `.cs`
- `OutputPanel.xaml` / `.cs`
- `LogPanel.xaml` / `.cs`

### Keep

- `XmlBottomPanel` + XML tab
- Tab strip order: Problems | Output | Log | XML | Search

---

## Search (phase 1)

- Pane wired with empty list by default.
- API: `SetSearchResults(...)` / `ClearSearch()` on `IdeDiagnosticsViewModel`.
- Badge = result count.
- No Find-in-files UI / indexer in this work.

---

## Navigate

1. User double-clicks (or activates) a list item.
2. `BottomToolPanel` invokes `ActivateItemCommand` with selected `IBottomListItem`.
3. If `!CanNavigate` → no-op.
4. Handler:
   - Problems: existing rules (RelatedPath → open entity file; else Offset; else Line).
   - Search: open path + go to line.
   - Output / Log: never navigate.

---

## Badges

| Pane | Default badges |
|------|----------------|
| Problems | Error / Warning / Hint (current counts) |
| Output | Entry count (optional; may omit if 0 preferred) |
| Log | Entry count (optional) |
| Search | Result count |

---

## Out of scope

- XML bottom panel redesign
- DockManager / AvalonDock changes
- Full-text search engine / Find Replace UI
- Changing bottom tab strip UX beyond wiring Search to shared panel

---

## Success criteria

1. Four tabs share one XAML layout control; visual match Problems header + row chrome.
2. No duplicate panel XAML for Problems/Output/Log.
3. Double-click Problems still navigates as today.
4. Search tab shows shared layout (empty or stub results) with Clear + count badge.
5. XML tab unchanged.
6. `dotnet build` UI project succeeds.
