# Shell Layout — DevWorkFlow IDE

Version: 1.2  
Related: `docs/07-UI_GUIDELINES.md`, `.ai/UI_SUMMARY.md`, `UI/MainWindow.xaml`

---

## Mục tiêu

Shell **3 cột** (Left | Center | Right), mỗi cột chia **Top / Bottom**. Hàng Bottom đồng bộ chiều cao (Outline | Problems/Output/… | Properties). NSD vừa kéo splitter chung vừa chỉnh từng cột; **5 panel** đều pin/unpin độc lập.

---

## Sơ đồ layout

```text
+------------------------------------------------------------------+
| Title bar | Menu | Ribbon                                        |
+------------------------------------------------------------------+
|  CỘT TRÁI (0)     |  CỘT GIỮA (1)         |  CỘT PHẢI (2)       |
+-------------------+-----------------------+---------------------+
| LEFT TOP          | CENTER TOP            | RIGHT TOP           |
| Explorer          | Editor + Tab bar      | Insight | Toolbox   |
| Menu / Database   |                       |                     |
| [pin]             |                       | [pin]               |
| ~~splitter cột~~  | ~~splitter cột~~      | ~~splitter cột~~    |
| LEFT BOTTOM       | CENTER BOTTOM         | RIGHT BOTTOM        |
| Outline           | Problems|Output|Log|XML| Properties          |
| [pin]             | [pin]                 | [pin]               |
+------------------------------------------------------------------+
| Status bar                                                       |
+------------------------------------------------------------------+
     ↑ GridSplitter ngang toàn bộ (band) — kéo 1 lần, 3 bottom cùng cao ↑
```

**3 cột dọc** (`ColumnDefinition`: Left | Splitter 4px | Center | Splitter 4px | Right).

Mỗi cột là một `Grid` lồng 3 hàng: **Top** | **Splitter 4px** | **Bottom**.

---

## Quy tắc chiều cao

### 1. Band Bottom đồng bộ (Outline = Bottom = Properties)

Ba panel hàng dưới **luôn cùng chiều cao pixel** nhờ biến chia sẻ:

```csharp
// IdeShellViewModel / DockLayoutState
public GridLength BottomBandHeight { get; set; } = new GridLength(180);
```

Mỗi cột bind `RowDefinition` hàng Bottom:

```xml
<RowDefinition Height="{Binding Shell.BottomBandHeight}" MinHeight="60"/>
```

Khi `BottomBandHeight` đổi → Left Bottom, Center Bottom, Right Bottom cùng đổi.

### 2. Splitter ngang — hai cách kéo (cùng tác dụng lên band)

| Splitter | Vị trí | Hành vi |
|----------|--------|---------|
| **Band splitter** (tùy chọn) | Một `GridSplitter` full-width giữa vùng Top tổng và vùng Bottom tổng | Cập nhật `BottomBandHeight` |
| **Splitter từng cột** (bắt buộc) | Mỗi cột có splitter giữa Top/Bottom | Cũng cập nhật **`BottomBandHeight`** — không chỉ cột đó |

**Nguyên tắc:** Kéo splitter ở **bất kỳ cột nào** (trái / giữa / phải) đều ghi vào `BottomBandHeight` → Outline, Bottom, Properties **cùng** đổi chiều cao.

Top của mỗi cột (`Height="*"`) tự chiếm phần còn lại trong cột đó.

### 3. Thay đổi chiều cao từng panel (NSD)

| Cách | Panel | Mô tả |
|------|-------|--------|
| Kéo splitter cột | Top hoặc Bottom của cột đó | Đổi `BottomBandHeight` (bottom 3 cột sync) |
| **Pin / Unpin** | Left Top, Left Bottom, Right Top, Right Bottom, Center Bottom | Đóng → chiều cao = 0, ẩn splitter cột; mở → khôi phục (phase 2: persist) |

Pin **không** ảnh hưởng cột khác: pin Left Bottom chỉ thu cột trái hàng dưới; Editor và Properties giữ band height.

---

## 5 panel — nội dung & pin

| # | Panel | Cột | Hàng | View / Tab | Pin command |
|---|-------|-----|------|------------|-------------|
| 1 | **Left Top** | 0 | Top | Explorer \| Menu \| Database | `ToggleLeftTopCommand` |
| 2 | **Left Bottom** | 0 | Bottom | `OutlinePanel` | `ToggleLeftBottomCommand` |
| 3 | **Center Bottom** | 1 | Bottom | Problems \| Output \| Log \| XML | `ToggleCenterBottomCommand` |
| 4 | **Right Top** | 2 | Top | Insight \| Toolbox (+ Symbol Info?) | `ToggleRightTopCommand` |
| 5 | **Right Bottom** | 2 | Bottom | `PropertyGridPanel` | `ToggleRightBottomCommand` |

**Center Top (Editor)** không pin riêng — luôn fill Top cột giữa; giãn khi pin/unpin các panel xung quanh.

### Pin / Unpin

| Trạng thái | UI | Layout |
|------------|-----|--------|
| **Pinned (mở)** | Icon `Pin` | Panel hiện, splitter cột hiện |
| **Unpinned (đóng)** | Icon `PinOff` | Panel ẩn; **tab auto-hide** hiện ở cạnh màn hình |

**Auto-hide tab:** Khi unpinned, tab hiện ở **góc** tương ứng. Click tab → `ShowPanel(id)`.

| Panel unpinned | Vị trí tab |
|----------------|------------|
| Left Top | Góc **trên-trái** |
| Left Bottom | Góc **dưới-trái** |
| Center Bottom | Góc **dưới-trái** (ngang, cạnh Outline) |
| Right Top | Góc **trên-phải** |
| Right Bottom | Góc **dưới-phải** |

UI: `DockAutoHideStrip.xaml`. VM: `LeftTopAutoHideTabs`, `LeftBottomAutoHideTabs`, `CenterBottomAutoHideTabs`, `RightTopAutoHideTabs`, `RightBottomAutoHideTabs`.

Style: `IdeDockHeaderIconButtonStyle` + `IdeAutoHideTabSideStyle` / `IdeAutoHideTabBottomStyle`.

**Lưu ý:** Không dùng một lệnh `ToggleLeftDock` cho cả cột — pin **từng panel** (5 lệnh). Ribbon/View menu có thể gọi gom (ẩn cả cột trái = pin cả Left Top + Left Bottom).

---

## Cấu trúc XAML gợi ý (`UI/MainWindow.xaml`)

```text
Grid body (Row 3)
├── Col 0: LeftColumnHost
│   ├── Row Top: Explorer tabs + panels  [pin]
│   ├── GridSplitter (Rows) → DragDelta → Shell.SetBottomBandHeight
│   └── Row Bottom: OutlinePanel         [pin]
├── Col 1: GridSplitter (Columns)
├── Col 2: CenterColumnHost
│   ├── Row Top: DocumentTabBar + WorkspaceHost
│   ├── GridSplitter (Rows) → shared BottomBandHeight
│   └── Row Bottom: Bottom tabs + panels [pin]
├── Col 3: GridSplitter (Columns)
└── Col 4: RightColumnHost
    ├── Row Top: Insight/Toolbox tabs    [pin]
    ├── GridSplitter (Rows) → shared BottomBandHeight
    └── Row Bottom: PropertyGridPanel    [pin]
```

### Handler splitter (code-behind hoặc VM)

```csharp
void OnColumnSplitterDrag(object sender, DragDeltaEventArgs e)
{
    var new_height = Shell.BottomBandHeight.Value - e.VerticalChange;
    new_height = Math.Clamp(new_height, MinBottomBand, MaxBottomBand);
    Shell.BottomBandHeight = new GridLength(new_height);
}
```

Gắn **cùng handler** cho 3 splitter cột (trái / giữa / phải).

### Pin collapse (ví dụ Left Bottom)

```xml
<RowDefinition Height="{Binding Shell.IsLeftBottomOpen, Converter={StaticResource BoolToStarOrZero}}"/>
```

Hoặc `DataTrigger` trên `Height` / `Visibility` + `MinHeight=0`.

---

## ViewModel & Dock

### `IdeShellViewModel`

```csharp
public GridLength BottomBandHeight { get; set; }

public bool IsLeftTopOpen { get; }
public bool IsLeftBottomOpen { get; }
public bool IsCenterBottomOpen { get; }
public bool IsRightTopOpen { get; }
public bool IsRightBottomOpen { get; }

public RelayCommand ToggleLeftTopCommand { get; }
public RelayCommand ToggleLeftBottomCommand { get; }
public RelayCommand ToggleCenterBottomCommand { get; }
public RelayCommand ToggleRightTopCommand { get; }
public RelayCommand ToggleRightBottomCommand { get; }
```

Giữ `ToggleLeftDockCommand` / `ToggleRightDockCommand` / `ToggleBottomDockCommand` (ribbon) như **shortcut** gom nhiều panel — implementation gọi tuần tự pin các panel trong vùng.

### `DockService` — `DockPanelId`

```csharp
public enum DockPanelId
{
    LeftTop,
    LeftBottom,
    CenterBottom,
    RightTop,
    RightBottom
}
```

Dictionary `DockPanelId → bool visible` + `LayoutChanged` event.

---

## File cần sửa

| File | Việc |
|------|------|
| `UI/MainWindow.xaml` | 3 cột × (Top \| Splitter \| Bottom); 5 pin headers |
| `UI/MainWindow.xaml.cs` | Splitter drag → `BottomBandHeight` (optional) |
| `UI/ViewModels/Shell/IdeShellViewModel.cs` | 5 pin flags/commands, `BottomBandHeight` |
| `UI/Docking/DockService.cs` | `DockPanelId`, visibility per panel |
| `UI/Docking/IDockService.cs` | Contract mở rộng |
| `UI/Views/Explorer/OutlinePanel.xaml` | Pin Left Bottom |
| `UI/Views/Properties/PropertyGridPanel.xaml` | Pin Right Bottom |
| `UI/Views/Controls/DockPanelHeader.xaml` | (mới) Title + tabs + pin tái sử dụng |
| `UI/ViewModels/MainViewModel.cs` | Find References → mở Right Top/Bottom tùy pane |

---

## Không đổi (architecture)

- Outline: `OutlineViewModel` + LS / `NavigationMap` (R1, R7).
- Editor: render only; không parse XML.
- Left tabs Explorer/Menu/Database: logic `LeftExplorerTab` giữ nguyên.

---

## Test plan

1. `dotnet build DevWorkFlow.slnx`
2. Kéo splitter cột **trái** → Outline, Bottom, Properties **cùng** cao/thấp.
3. Kéo splitter cột **giữa** hoặc **phải** → cùng kết quả (sync band).
4. Pin Left Bottom → Outline ẩn; Bottom + Properties vẫn cùng chiều cao band.
5. Pin Right Top → Insight ẩn; Properties (Right Bottom) vẫn hiện nếu chưa pin.
6. Pin cả 3 bottom → Editor giãn full; mở lại → band height khôi phục.
7. Tab Right Top: Insight ↔ Toolbox; Properties cố định Right Bottom.

---

## Changelog

| Version | Thay đổi |
|---------|----------|
| 1.1 | 3 vùng bottom sync; tách Properties khỏi Right tabs |
| 1.2 | **3 cột** rõ ràng; splitter từng cột + `BottomBandHeight` shared; **5 pin** độc lập (Left Top/Bot, Right Top/Bot, Center Bottom) |
