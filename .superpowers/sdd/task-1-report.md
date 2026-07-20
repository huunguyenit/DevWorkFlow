# Task 1 Report — Contracts: IBottomListItem, navigate target, badge, list item VM

**Date:** 2026-07-20  
**Status:** DONE  
**Scope:** Shared ViewModel contracts under `UI/ViewModels/Bottom/` for unified BottomToolPanel (Problems/Output/Log/Search).

---

## Summary

Created four contract/type files exactly as specified in the task brief. No wiring to `IdeDiagnosticsViewModel` or XAML. Build passes with 0 errors.

---

## Files Created

| File | Purpose |
|------|---------|
| `UI/ViewModels/Bottom/BottomNavigateTarget.cs` | Immutable navigation target: `Path`, `Line`, `Offset` |
| `UI/ViewModels/Bottom/IBottomListItem.cs` | Interface for bottom panel list rows (text, icon, navigate) |
| `UI/ViewModels/Bottom/BottomBadgeVm.cs` | Badge chip VM: icon kind, count, background/foreground colors |
| `UI/ViewModels/Bottom/BottomListItemVm.cs` | Default `ViewModelBase` implementation of `IBottomListItem` |

---

## Implementation Details

### BottomNavigateTarget

- Sealed class with init-only properties.
- `Path` nullable; `Line` and `Offset` default to 0 when not set.

### IBottomListItem

- Read-only contract for list row binding.
- `IconKind` / `IconBrush` documented as MaterialDesign PackIcon kind and hex color string.
- `CanNavigate` + optional `NavigateTarget` for double-click / navigate flows (later tasks).

### BottomBadgeVm

- All four properties `required` — callers must supply icon, count text, and colors.

### BottomListItemVm

- Extends `UI.ViewModels.Base.ViewModelBase`.
- `PrimaryText` required; sensible defaults for secondary/trailing text and icon.
- Implements `IBottomListItem` via init-only properties (immutable row model).

---

## Build Verification

```text
dotnet build "UI/UI.csproj" -v q
```

**Result:** Build succeeded — **0 Error(s)**, 10 Warning(s) (pre-existing: NU1902 AngleSharp, CS0618 IDockService obsolete, MSB3026 file lock retry).

---

## Self-Review

| Check | Result |
|-------|--------|
| Only four files created | ✓ |
| Code matches brief verbatim | ✓ |
| Namespace `UI.ViewModels.Bottom` | ✓ |
| `BottomListItemVm` uses `ViewModelBase` | ✓ |
| No IdeDiagnostics / XAML changes | ✓ |
| No git commit | ✓ |

### Notes for downstream tasks

- `BottomListItemVm` is immutable (`init` only); pane VMs may need factory/helpers or a mutable variant if live updates are required without replace-in-collection.
- Icon/color strings are convention-based; XAML converters or PackIcon binding helpers will be needed in later UI tasks.
- `BottomBadgeVm` is standalone; tab header badge binding comes in later tasks.

---

## Concerns

None blocking Task 1. Pre-existing solution warnings unrelated to these files.

---

## Commits

None (per instructions).
