# Design View — Layout Height/Width, Padding, Ruler Origin & Crosshair

**Date:** 2026-07-22  
**Status:** Implemented (2026-07-22)  
**Parent:** `2026-07-22-design-webview-html-generator-design.md`  
**Amend (2026-07-22):** Form shell — `div.FormParent.UpdateDlgPanel` (≡ `updateDlgPanel`) wraps title + main + tabs + footer; title = `UpdateDlgTitle` / `UpdateDlgTitleText` từ `<title v/e>`.

## 1. Goal

Chỉnh tab Design (HTML Generator) cho khớp hành vi layout FBO runtime:

1. `view@height` = chiều cao **tab panel** khi tab **không** có Grid.
2. Tab **có** Grid: `field@rows` = chiều cao px của `divGrid` (body scroll), không phải cả panel.
3. `table.FormTable` `width` = tổng độ rộng cột dòng đầu view; `padding: 8px`.
4. Ruler X/Y gốc (0,0) neo mép trên-trái bảng **main**.
5. Chuột trong vùng Design: crosshair 2 line + tọa độ px theo gốc đó.

## 2. Decisions (đã chốt)

| Topic | Choice |
|-------|--------|
| `view@height` khi có main + tabs | Chỉ tab panel; main/footer auto theo nội dung |
| Tab có Grid + `rows` | `height` px trên `divGrid` (vd. ERP `*_divGrid { height:120px }`) |
| Padding 8px | Trên mỗi `table.FormTable` |
| Ruler origin | Luôn bảng main (`data-dwf-region="main" table.FormTable`); tab/footer không đổi gốc |
| Crosshair | Script trong WebView; bridge scroll/origin → WPF `PixelRuler` |

## 3. HTML layout

### 3.1 Main / footer

- `FormRegion[data-dwf-region=main|footer]`: **không** gắn `view@height`.
- Cao theo số dòng / nội dung.

### 3.2 Tab không Grid

- `section.DwfTabPanel`: `style="height:{HeightPx}px"` khi `layout.HeightPx > 0`.
- Nội dung vẫn là `table.FormTable` như hiện tại.

### 3.3 Tab có Grid

- Detect: trong rows của category có cell Input gắn field `items style="Grid"`.
- Không cố định height panel theo `view@height`.
- Detail grid render: vùng body (class ổn định, vd. `DwfGridBody` / tương đương `divGrid`) nhận `height:{field.Rows}px` khi `Rows` có giá trị dương.
- Toolbar / header / split / footer grid giữ cấu trúc gần ERP; chỉ body dùng `rows` làm height px.
- Số dòng placeholder: giữ default hiện có (5) trừ khi sau này product đổi; **không** suy `placeholder_rows` từ `Rows` trừ khi có quyết định riêng (Rows = px body, không phải số dòng).

### 3.4 FormTable width + padding

- Mỗi `table.FormTable`:
  - `style="width:{sum}px;table-layout:fixed;padding:8px"` (hoặc class + CSS tương đương; inline width bắt buộc để khớp ERP).
  - `sum` = tổng `ColumnWidths` truyền vào `RenderTable` (đã resolve: category `@columns` hoặc layout dòng đầu).
- Giữ hàng col-width ẩn (`DwfColRow` / `th` width từng cột) như hiện tại.
- Forms không có column widths: không ép `width` (bỏ qua hoặc auto).

### 3.5 Forms không categories

- Không có tab → `view@height` **không** áp dụng (không gắn main). Chỉ có ý nghĩa khi `HasCategories`.

## 4. Ruler + crosshair

### 4.1 Origin

- Selector: ` [data-dwf-region="main"] table.FormTable ` (bảng đầu nếu nhiều).
- Document origin: `rect.left + scrollX`, `rect.top + scrollY` (CSS px).
- Recalc: load, resize, scroll, tab switch (DOM có thể reflow).

### 4.2 PixelRuler (WPF)

- `OffsetX/Y` = `(scroll − origin) × ZoomFactor` để tick `0` khớp mép bảng main trên viewport.
- Zoom giữ công thức hiện tại (`DesignWebViewHost` / `PixelRuler`).

### 4.3 Crosshair (WebView)

- Overlay 2 line full-bleed theo `clientX/Y` (vertical + horizontal).
- Readout `x,y` = vị trí chuột trong document − origin bảng main (px, có thể âm).
- Ẩn khi `mouseleave` document / ngoài WebView.
- Không chặn pointer events của control bên dưới (`pointer-events: none` trên overlay).

### 4.4 Bridge messages

Mở rộng script postMessage (JSON), ví dụ:

```json
{ "type": "designViewport", "scrollX": 0, "scrollY": 0, "originX": 8, "originY": 8 }
```

- `mousemove` có thể chỉ cập nhật crosshair trong WebView (không bắt buộc spam WPF mỗi frame).
- Host cập nhật `RulerX/Y.Offset` từ `scroll` + `origin`.

## 5. Layers / files (dự kiến)

| Layer | Touch |
|-------|--------|
| Application | `DesignFormHtmlBuilder`, `DesignGridHtmlBuilder` (height divGrid), CSS minimal/config nếu cần |
| UI | `DesignWebViewHost` script + message handler; `PixelRuler` nếu cần origin offset API |
| Tests | Builder: tab height / no height on main; FormTable width+padding; grid body height từ Rows |

UI không parse XML. Không đổi Left Panel.

## 6. Out of scope

- Overlay drag-drop / DOM→Command.
- Đồng bộ split/anchor runtime FBO đầy đủ.
- Đổi `view@height` semantics trong Semantic Model (vẫn parse như cũ; chỉ cách **render** Design đổi).
- Crosshair trên WPF Canvas ngoài WebView.

## 7. Acceptance

1. Dir có categories, không Grid trong tab: tab panel cao đúng `view@height`; main không có height cố định đó.
2. Tab có Grid + `rows="120"`: `divGrid`/`DwfGridBody` có `height:120px`.
3. `FormTable` width = sum widths dòng đầu (hoặc category columns); padding 8px.
4. Ruler `0` khớp mép trên-trái bảng main khi scroll/zoom.
5. Di chuyển chuột trong Design → 2 line giao nhau + tọa độ px theo gốc bảng main.
