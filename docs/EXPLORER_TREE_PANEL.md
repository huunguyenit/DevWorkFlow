# Explorer TreePanel — Hiện trạng

> Cập nhật: 2026-07-17  
> Phạm vi: Left dock — Explorer / Menu / Database + Outline  
> Nguyên tắc: **giữ nguyên logic hiện tại**; tài liệu này mô tả as-is, không đề xuất refactor.

## 1. Tổng quan

Ba tab left dock dùng **chung một Tree UI** (`ExplorerTreePanel`) và **chung một node VM**
(`ExplorerTreeNodeVm`), khác nhau ở **nguồn dữ liệu** và **hành vi click**.

```text
MainWindow Left Dock
├── ExplorerPanel          → ProjectExplorerViewModel
├── MenuExplorerPanel      → NavigationViewModel (TreeRoots)
└── DatabaseExplorerPanel  → DatabaseExplorerViewModel
         │
         └── mỗi panel embed ExplorerTreePanel
                  │
                  └── IExplorerTreeSource (TreeRoots, FilterText, StatusText,
                                           ActivationDelayMs, OnTreeNodeActivated)
```

| Thành phần | Vai trò |
|------------|---------|
| `UI/Views/Explorer/ExplorerTreePanel.xaml(.cs)` | UI chung: filter box + TreeView + activation |
| `UI/ViewModels/Explorer/ExplorerTreeNodeVm.cs` | Node tree chung |
| `UI/ViewModels/Explorer/ExplorerTreeNodeMapper.cs` | Map file / menu / database → node |
| `UI/ViewModels/Explorer/ExplorerTreeFilterEngine.cs` | Index filter + debounce helper |
| `UI/ViewModels/Explorer/IExplorerTreeSource.cs` | Contract host VM |
| `UI/Services/LeftExplorerLoadCoordinator.cs` | Khi Program đổi: rebuild Explorer + Database song song |

## 2. UI chung — `ExplorerTreePanel`

### Binding

- `ItemsSource` → `TreeRoots`
- Filter textbox → `FilterText` (debounce ở từng VM host)
- Status → `StatusText`
- Style: `IdeTreeViewStyle` / `IdeTreeViewItemStyle` (**virtualization bật**, recycling)

### Activation

- Single-click selection → debounce `ActivationDelayMs` rồi raise `NodeActivated` (`IsDoubleClick=false`)
- Double-click → hủy timer, raise `NodeActivated` (`IsDoubleClick=true`)
- Expand folder → gọi `node.EnsureChildren` nếu chưa load

`ActivationDelayMs` lấy từ `IExplorerTreeSource` (Explorer/Menu đọc `explorer.json`; Database = `0`).

## 3. Tab Explorer — filesystem Program

**VM:** `ProjectExplorerViewModel`

### Load

- Không tự rebuild trong constructor.
- Rebuild khi `ProgramChanged` qua `LeftExplorerLoadCoordinator`.
- Lazy-load thư mục: enumerate disk trên background → add children trên UI.
- Icon đơn giản: Folder / File (config `explorer.json`).
- Placeholder child (`…`) để TreeView hiện expander trước khi load.

### Click

| Node | Single-click | Double-click |
|------|--------------|--------------|
| Folder | Expand + `EnsureChildren` (nếu `expandOnFolderClick`) | — |
| File | Chỉ select | Mở document (Form / SQL / code-only) |

### Search

- Debounce theo `filterDebounceMs`.
- Cache file index theo Program; filter in-memory (không scan lại mỗi lần gõ nếu đã có index).
- Materialize path vào cây; giới hạn `searchMaxHits` (mặc định 400).

### Config

`UI/Config/json/explorer.json` — debounce, max hits, activation delay, icon, preferred/hidden roots, extensions.

## 4. Tab Menu — `wcommand`

**VM:** `NavigationViewModel` (`MenuRoots` + clone `TreeRoots`)

### Load

- `LoadProgramAsync`: đọc Web.config → `SetProgram` → resolve app DB (`UpdateProgram`, không fire lại `ProgramChanged`) → load `wcommand` → dựng `MenuRoots` / `TreeRoots`.
- `RefreshMenuAsync`: chỉ reload menu, **không** gọi lại full `LoadProgramAsync` (không refresh Explorer/Database).

### Click

| Node | Hành vi |
|------|---------|
| Menu không link | Chỉ select |
| Menu có link | Load resource async; sync children nhánh hiện tại (không rebuild cả cây) |
| File | Chỉ mở khi **double-click** |

### Khôi phục Program

- Lưu `LastProgramPath` trong `%AppData%/DevWorkFlow/settings.json`.
- Startup: `App` gọi `TryRestoreLastProgramAsync()` **sau** khi `LeftExplorerLoadCoordinator` đã gắn — tránh miss `ProgramChanged`.

### Config

`UI/Config/json/menu.json` — filter debounce / batch size.

## 5. Outline (left dock dưới Explorer)

**VM:** `OutlineViewModel` — **không parse XML**; đọc Document Model qua `IErpNavigationService`.

### Hành vi

- Filter text (TreePanel chung).
- Click → `NodeId` → `GoToNode` → `NavigationTarget` → Editor.ScrollTo.
- Chi tiết: [`NAVIGATION_SERVICE.md`](NAVIGATION_SERVICE.md).

## 6. Tab Database — SQL objects

**VM:** `DatabaseExplorerViewModel`

### Target Sys / App

- Combo Target: Sys + các App DB.
- `defaultTarget: "App"` trong `database.json`.
- Không giữ Sys khi mặc định App và App đã resolve (tránh kẹt Sys sau lần load đầu).
- Catalog SQL + script object dùng `SelectedTarget.ConnectionString`.

### Click object

| Click | Hành vi |
|-------|---------|
| 1 | Sinh script theo `database.object-actions.xml` (thường ALTER / CREATE) |
| 2 | Mode drop+create (theo config) |

`singleClickDelayMs: 0` — không chờ phân biệt single/double trừ khi config > 0.

### Mở SQL Studio

- `SqlStudioNavigator.OpenBuffer` → `MainViewModel.OpenSqlDocument`.
- Nếu **đã có tab SQL đang active**: **ghi đè nội dung** tab đó (không mở nhiều tab).
- Đồng bộ `SelectedTarget` của SQL Studio theo target Database đang chọn.
- Folder loại object **không** expand sẵn mặc định.

### Config

| File | Vai trò |
|------|---------|
| `UI/Config/json/database.json` | Debounce, timeout, defaultTarget App, singleClickDelayMs |
| `UI/Config/SQL/database_catalog.sql` | Catalog objects |
| `UI/Config/SQL/object_definition.sql` | Lấy definition |
| `UI/Config/xml/database.object-actions.xml` | Template action theo kind + click |

## 7. Program session & coordinator

```text
Chọn / restore Program
        │
        ▼
ProgramSession.SetProgram  →  ProgramChanged
        │
        ▼
LeftExplorerLoadCoordinator (debounce ~120ms)
        ├── ProjectExplorerViewModel.RebuildTreeAsync
        └── DatabaseExplorerViewModel.RefreshAfterProgramChangeAsync
        │
NavigationViewModel tự load menu (song song / tiếp theo)

Sau resolve entity.cdata:
ProgramSession.UpdateProgram  →  KHÔNG fire ProgramChanged
```

## 8. Performance (đã áp dụng — giữ nguyên)

1. TreeView virtualization bật (`IdeTreeViewStyle`).
2. `SetProgram` một lần có ý nghĩa; lần cập nhật app DB dùng `UpdateProgram`.
3. Coordinator debounce gom nhiều `ProgramChanged`.
4. Explorer lazy-load async + file index cache.
5. Database không auto-expand folder; delay click = 0.
6. Mở file Explorer/Menu: double-click; tái sử dụng `IErpDocument` khi có thể.
7. Script Database: reuse tab SQL active.

## 9. File map nhanh

```text
UI/Views/Explorer/
  ExplorerTreePanel.xaml(.cs)     ← TreePanel chung
  ExplorerPanel.xaml              ← tab Explorer
  MenuExplorerPanel.xaml          ← tab Menu
  DatabaseExplorerPanel.xaml      ← tab Database
  OutlinePanel.xaml               ← Outline (cùng TreePanel)

UI/ViewModels/Explorer/
  ExplorerTreeNodeVm.cs
  ExplorerTreeNodeMapper.cs
  ExplorerTreeFilterEngine.cs
  IExplorerTreeSource.cs
  ProjectExplorerViewModel.cs
  DatabaseExplorerViewModel.cs
  OutlineViewModel.cs

UI/ViewModels/NavigationViewModel.cs   ← Menu + TreeRoots
UI/Services/LeftExplorerLoadCoordinator.cs
UI/Services/DatabaseObjectScripter.cs
UI/Services/SqlStudioNavigator.cs
UI/Config/json/{explorer,menu,database}.json
UI/Config/SQL/*.sql
UI/Config/xml/database.*.xml
```
