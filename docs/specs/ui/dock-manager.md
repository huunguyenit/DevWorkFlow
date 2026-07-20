# DockManager — Pin / Auto Hide Architecture

Version: 1.0  
Related: ADR-0007, `docs/specs/ui/shell-layout.md`

---

## Nguyên tắc

DevWorkFlow **owns UX**. AvalonDock chỉ là rendering engine (layout, float, auto-hide animation).

```text
User Action → DockManager → IWorkspaceDockHost → AvalonDock
```

ViewModels **không** tham chiếu AvalonDock. Chỉ expose: `PanelId`, `Title`, `Icon`, `DockState`.

---

## Panel states

```csharp
enum DockState { Docked, AutoHide, Floating, Hidden }
```

| State | UX |
|-------|-----|
| **Docked** | Panel ghim, hiển thị đầy đủ |
| **AutoHide** | Chỉ tab cạnh; hover slide-out (AvalonDock + delay 250ms khi đóng flyout) |
| **Floating** | Kéo ra ngoài → cửa sổ float |
| **Hidden** | Ẩn hoàn toàn (phase plugin) |

**Pin** toggles `Docked ⇄ AutoHide` — không destroy/recreate panel hay ViewModel.

---

## DockManager (`UI/Docking/DockManager.cs`)

- Owns `Dictionary<DockPanelId, DockState>`
- `TogglePin`, `SetState`, `Show`, `Hide`, `Activate`
- **One AutoHide flyout per side** — mở Explorer auto-hide sẽ đóng flyout Workflow cùng cạnh
- Events: `PanelPinned`, `PanelAutoHidden`, `PanelFloating`, `PanelClosed`, `PanelActivated`, `DockLayoutChanged`
- Layout: `RestoreLayout` / `SaveLayout` via `JsonDockLayoutStore` → `%AppData%/DevWorkFlow/dock-layout.json`

---

## AvalonDock adapter (`UI/Docking/Avalon/AvalonDockWorkspaceHost.cs`)

- `Attach(DockingManager)`
- `RegisterPanel(id, content)` — gán `LayoutAnchorable.Content`, không tạo VM mới
- `ApplyState` — sync `ToggleAutoHide`, `Float`, `Hide`
- Host events → DockManager cập nhật state khi user kéo float

---

## Shell wiring

| File | Vai trò |
|------|---------|
| `UI/Views/Shell/IdeDockWorkspace.xaml` | `DockingManager` + layout 3 cột |
| `UI/Views/Shell/IdeDockWorkspace.xaml.cs` | Attach host, register panel content |
| `UI/ViewModels/Shell/IdeShellViewModel.cs` | Pin commands → `DockManager.TogglePin` |
| `UI/App.xaml.cs` | `new DockManager(...)`, save layout on exit |

---

## Layout JSON (example)

```json
{
  "version": 1,
  "bottomBandHeight": 180,
  "panels": {
    "LeftTop": { "panelId": "LeftTop", "state": "Docked", "width": 280 },
    "CenterBottom": { "panelId": "CenterBottom", "state": "AutoHide", "height": 240 }
  }
}
```

---

## Future

- Multiple workspaces + layout import/export
- Plugin panels (AI, Workflow) register via `DockPanelRegistry`
- VS2013 theme (`Dirkster.AvalonDock.Themes.VS2013`) — wire when class name confirmed
- Document pane: dynamic `LayoutDocument` per tab (hiện single editor host)

---

## Deprecated

- `IDockService` / `DockService` — replaced by `IDockManager`
- `DockAutoHideStrip` — replaced by AvalonDock native auto-hide tabs
- Custom Grid splitter body in `MainWindow.xaml` — replaced by `IdeDockWorkspace`
