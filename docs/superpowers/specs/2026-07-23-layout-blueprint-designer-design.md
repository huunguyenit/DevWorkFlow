# Layout Blueprint Designer (Slot-based)

Date: 2026-07-23  
Status: Approved — P0–P5 landed; **P6:** `docs/superpowers/specs/2026-07-24-layout-blueprint-p6-toolbox-fbo-ux-design.md` + `docs/superpowers/plans/2026-07-24-layout-blueprint-p6-toolbox-fbo-ux.md`  
Approach: C — Hybrid Blueprint Layer (WebView hit-test/ghost) + Application Layout Engine + stable Design Commands (Adapter → `FboXmlWriter` tạm)  
Related: `docs/adr/ADR-0009-DesignerPlatform.md`, `docs/04-DESIGNER_PLATFORM.md`, `docs/superpowers/specs/2026-07-22-design-webview-html-generator-design.md`, `.ai/CURRENT_STATE.md`, `FormViewLayout`

---

## 1. Goal

Nâng Form Builder từ **Runtime Preview (HTML Generator)** lên **Slot-based Layout Blueprint Designer**:

- Người dùng thao tác trên **cấu trúc layout khai báo** (Region → cột px → Slot), không kéo theo tọa độ tuyệt đối kiểu WinForms.
- Blueprint Layer chỉ tồn tại ở Design mode; Runtime Preview vẫn là HTML FBO thật.
- Mọi thay đổi đi **Command → Layout Engine → Adapter ghi XML → refresh Preview**, bảo đảm XML luôn hợp lệ với quy tắc FBO (`columns` px, pattern `1/0/-`, `anchor`, `split`, category/footer).

---

## 2. Scope

### In scope (Full vision — triển khai theo pha)

- Mô hình Region / Column (px) / Slot trên nền `FormViewLayout`
- Layout Engine: resize cột, merge/split pattern, insert/reorder theo Slot, enforce `anchor`/`split` đúng nghĩa FBO
- Design Command API ổn định + Adapter tạm qua `FboXmlWriter`
- Blueprint Interaction Layer (Hybrid): tint region, cột nét đứt, nhãn **px only**, splitter, drop target, ghost, merge/split chrome, multi-click selection
- Categories giữ **tab** như runtime; mỗi tab có columns riêng
- Footer / Category ensure khi drop vào vùng chưa có
- Bridge messages DesignWebViewHost ↔ Commands

### Out of scope (non-goals)

- Canvas X/Y, snap theo pixel, kéo control “dính chuột” kiểu WinForms
- Persist `MinWidth` / `MaxWidth` / `Resizable` / `Mergeable` / `AutoGrow` vào XML (FBO không có → không lưu)
- Accordion Category trong Designer (chỉ tab)
- Unify ADR-0006 (Semantic → Serializer) trong cùng pha Overlay — Adapter giữ API; migrate sau
- DOM patch incremental (full HTML refresh chấp nhận đến hết P4)
- Đổi Left Panel UX
- Filter / Lookup / Report designer (trừ khi tái dùng cùng pattern sau)
- Replace-on-drop (pha sau Insert Before/After)

---

## 3. Decisions (chốt brainstorm)

| Chủ đề | Quyết định |
|--------|------------|
| Phạm vi vòng design | Full vision + roadmap pha; không code trước khi có spec + plan implement |
| Độ rộng cột | **px FBO-native**; Blueprint có thể hiện `% = width/total` chỉ để đọc |
| Constraint ngoài XML | Không lưu; Engine chỉ clamp tạm khi kéo (vd. cột ≥ ngưỡng IDE) |
| `Anchor` | Cột `1..anchor` giữ nguyên px khi form phóng to; `anchor+1..end` giãn theo form |
| `Split` | Hai `<table>` độc lập: cột `1..split` = table 1; `split+1..end` = table 2 |
| Categories | Tab như runtime |
| Edit path | Command API ổn định; backend tạm `FboXmlWriter` |
| Overlay | Hybrid (C): hit-test/preview trong WebView; Engine/Commands trong Application |

---

## 4. Core Philosophy

```text
Form ≠ mặt phẳng tọa độ
Form = tập Region
Region = cột (px) + hàng Slot
Người dùng kéo vào Slot, không vào (x, y)
```

```text
Toolbox
  → Ghost
  → Blueprint Layer (highlight / preview merge-split-insert)
  → Drop
  → Design Command
  → Layout Engine (validate)
  → Writer Adapter → XML
  → HTML Generator → Runtime Preview
```

- Declarative layout khớp XML FBO; Designer không invent canvas tự do.
- Overlay ≠ Runtime DOM business (ADR-0009).
- Navigation / selection theo SymbolId / NodeId / SlotId — không theo line offset hay pixel offset lâu dài.

---

## 5. Architecture

### 5.1 Layers

```text
┌──────────────────────────────────────────────────────────────┐
│ UI: Toolbox + FormBuilderViewModel + DesignWebViewHost       │
│  - Bật/tắt Design mode Blueprint                             │
│  - Nhận bridge message → gọi Design Command                  │
│  - KHÔNG parse XML, KHÔNG query DB                           │
└───────────────────────────┬──────────────────────────────────┘
                            │ bridge (select/drag/resize/merge…)
┌───────────────────────────▼──────────────────────────────────┐
│ WebView: Runtime Preview (HTML Generator)                    │
│  + Blueprint Layer inject (data-dwf-*, tint, ghost, handles) │
└───────────────────────────┬──────────────────────────────────┘
                            │ Design Commands
┌───────────────────────────▼──────────────────────────────────┐
│ Application: Layout Engine + Command handlers                │
│  - Resize / Merge / Split / Insert / Move / Ensure region    │
│  - Facade Slot trên FormViewLayout                           │
└───────────────────────────┬──────────────────────────────────┘
                            │ Adapter
┌───────────────────────────▼──────────────────────────────────┐
│ Writer Adapter → FboXmlWriter (tạm)                          │
│  (sau: cùng Command → Semantic Serializer — ADR-0006)        │
└───────────────────────────┬──────────────────────────────────┘
                            │ XmlSource cập nhật
┌───────────────────────────▼──────────────────────────────────┐
│ DesignDocumentService / DesignHtmlGenerator → Preview refresh│
└──────────────────────────────────────────────────────────────┘
```

### 5.2 Components (trách nhiệm)

| Component | Responsibility |
|-----------|----------------|
| `FormLayout` / `LayoutRegion` / `LayoutSlot` (facade) | API ổn định cho Engine/Overlay; map 1–1 `FormViewLayout` / `FormViewCell` |
| `ILayoutEngine` | Validate + apply thao tác layout; không biết WebView |
| `IDesignLayoutCommands` (hoặc tương đương) | Surface Command; undo-friendly về sau |
| `IDesignLayoutWriterAdapter` | Command result → mutate XML via `FboXmlWriter` |
| Blueprint script/CSS (IDE-owned) | Hit-test slot, ghost, tint, splitter preview; post message |
| `DesignFormHtmlBuilder` | Bổ sung `data-dwf-slot` / region attrs cần cho hit-test |
| `DesignWebViewHost` | Bridge + sync viewport với thước hiện có |

---

## 6. Data Model

### 6.1 Form / Region

```text
FormLayout
├── HeaderRegion       (categoryIndex null|0; ColumnWidths của view)
├── CategoryRegion[]   (index > 0; columns từ <category>; UI = tab)
└── FooterRegion?      (index -1; FooterColumnWidths)
```

Mỗi Region:

- `ColumnWidths: int[]` (px) — Source of Truth
- `Rows: LayoutRow[]` → `Slots: LayoutSlot[]`
- `Anchor?`, `Split?` khi áp dụng ở view/region tương ứng XML

### 6.2 Column

| Field | Persistence | Notes |
|-------|-------------|-------|
| `WidthPx` | XML `columns` / category `@columns` | SoT |
| Display `%` | Không lưu | `width / sum(widths)` trên Blueprint |

Không có field persist: MinWidth, MaxWidth, Resizable, Mergeable, AutoGrow.

### 6.3 Slot ↔ FormViewCell

| Field | Meaning |
|-------|---------|
| `RegionId` + `RowIndex` + `ColumnIndex` + `ColumnSpan` | Vị trí |
| `Kind` | Label \| Input \| Description \| Empty |
| `FieldName?` + `Suffix` | `.Label` / `` / `.Description` / `.Footer` / `.` |
| Pattern | `1` start, `0` continuation, `-` unused |

**Merge:** hai slot cùng row, liền kề, hợp lệ → một slot span N, pattern `1`+`0…`.  
**Split:** slot span > 1 → tách; control giữ cột bắt đầu, phần còn Empty (mặc định).

### 6.4 Identity

- Control: `data-symbol-id` / `data-node-id` (đã có).
- Slot: `data-dwf-slot` (region, row, col, span) — bổ sung khi generate.
- Selection levels: Control → Slot → Region (1 / 2 / 3 click).

### 6.5 Anchor & Split (FBO semantics)

- **Anchor:** khi phóng to form, cột `1..anchor` giữ px; cột `anchor+1..end` nhận phần rộng thêm. Resize tay bằng splitter **không** đổi nghĩa Anchor; Designer có thể hiển thị marker neo.
- **Split:** biên giữa hai table độc lập. Đổi Split = Command `SetSplit`, **không** gộp vào kéo width thông thường. Blueprint đánh dấu đường Split khác splitter width.

---

## 7. Layout Engine Rules

### 7.1 ResizeColumns

- Kéo biên giữa cột `i` và `i+1`: `w[i] += delta`, `w[i+1] -= delta`; **tổng width Region không đổi**.
- Clamp: mỗi cột ≥ ngưỡng IDE tạm (không ghi XML); reject/commit an toàn khi thả chuột.
- Preview realtime trên Blueprint; commit → Command.

### 7.2 MergeSlots / SplitSlot

- Merge chỉ cùng row, liền kề, không xuyên `-`, không phá field đang chiếm trái phép.
- Split: xem §6.3.
- UI nút Merge/Split trên Blueprint (đường chia / selection), không trên Runtime-only mode.

### 7.3 Insert / Move / Reorder

- Snap Slot→Slot.
- Empty slot → Drop Target.
- Occupied → Insert Before / After (Figma-style).
- Drop vào giữa span → Preview Split Span rồi Insert (gesture đó).
- Reorder trong cùng region: Drop Here marker giữa các control cùng hàng/cột logic slot.

### 7.4 Ensure regions

- Drop vào Categories khi chưa có tab → `AddCategory` rồi Insert.
- Drop vùng Footer khi chưa có → hỏi `EnsureFooter?` Yes/No.

### 7.5 Ghost

- Opacity ~50%; control không “đi theo chuột” dạng bản sao opaque WinForms.

---

## 8. Blueprint Interaction Layer

### 8.1 Visual (Design mode only)

| Region | Tint gợi ý |
|--------|------------|
| Header | xanh nhạt |
| Category (tab đang xem) | tím nhạt |
| Footer | cam nhạt |

- Cột: nét đứt + nhãn `Npx` (+ `%` đọc).
- Splitter handle giữa mỗi biên cột.
- Categories: **tab** (không accordion).

### 8.2 Bridge messages (ổn định về mặt ý tưởng)

- `blueprint{ready|viewport}` — sync zoom/scroll với PixelRuler / `designViewport`
- `select{level, symbolId?, slotId?, regionId?}`
- `drag{phase, toolboxType?|symbolId?, slotHit?}`
- `resize{regionId, splitterIndex, previewWidths[]|commit}`
- `merge|split{…}`
- `ensureFooter` / `addCategory` (qua host confirm nếu cần)

Host chỉ chuyển Command; không parse XML.

### 8.3 HTML attrs

Generator bổ sung đủ để hit-test không đoán layout:

- Giữ `data-dwf-region`, `data-symbol-id`, `data-node-id`
- Thêm `data-dwf-slot` (và attrs cột/splitter nếu cần)

Blueprint CSS/JS là **IDE-owned**, không nhầm với CSS controller Program.

---

## 9. Command Surface

API ổn định (tên có thể tinh chỉnh khi implement, nghĩa giữ nguyên):

| Command | Effect |
|---------|--------|
| `ResizeColumns` | Đổi widths px trong Region |
| `MergeSlots` / `SplitSlot` | Pattern + span |
| `InsertFieldAtSlot` | Gán field/suffix vào slot / insert before-after |
| `MoveField` / reorder | Đổi vị trí slot |
| `EnsureFooter` | Tạo category index=-1 + layout footer |
| `AddCategory` | Thêm tab category + columns mặc định |
| `SetAnchor` / `SetSplit` | Metadata view |

Writer Adapter áp dụng qua `FboXmlWriter` / ApplyLayout hiện có cho đến khi ADR-0006.

---

## 10. Phased Roadmap

| Phase | Focus | Exit criteria |
|-------|--------|----------------|
| **P0** | Slot facade + Commands + Adapter + unit tests (resize/merge/split/pattern) | Đổi layout bằng Command, chưa cần Overlay |
| **P1** | Blueprint read-only: tint, cột, nhãn, `data-dwf-slot`, viewport sync | Bật Design mode thấy Blueprint đúng region/tab |
| **P2** | Splitter resize + multi-click selection | Kéo cột + chọn Control/Slot/Region |
| **P3** | Toolbox ghost + drop Insert (empty / before-after) | Kéo field vào Slot → Preview cập nhật |
| **P4** | Merge/Split UI + EnsureFooter/AddCategory + Anchor/Split indicator & commands nhẹ | Vòng Slot-based Designer cốt lõi |
| **P5** | Toolbox FIELDS + CreateField 1 ô + fix drop silent | Kéo field/control cơ bản vào Slot (đã land) |
| **P6** | Palette FBO config, Place I/L/D, Remove, Tab 4, hidden-row A, split barrier, UX resize/merge | Spec + plan: `2026-07-24-layout-blueprint-p6-toolbox-fbo-ux-*` |

Mỗi phase: build + tests xanh; cập nhật `.ai/CURRENT_STATE.md` khi land.  
**P6 SoT:** khi conflict với roadmap ngắn ở đây → dùng spec/plan P6 riêng.

---

## 11. Testing Strategy

- **P0:** unit tests Layout Engine / pattern rewrite / width clamp / footer-category ensure trên model — không cần UI.
- **P1+:** builder tests assert `data-dwf-slot` / region attrs; bridge contract tests nếu có harness.
- Không regression HTML Generator / CSS packs hiện có.

---

## 12. Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Dual `Fbo*` vs Semantic (ADR-0006) | Command API + Adapter; không để Overlay phụ thuộc Writer |
| Hit-test lệch zoom/scroll | Tái dùng `designViewport` + origin FormTable đã có |
| Nhầm Split table với splitter width | UI + Command tách biệt |
| Full HTML refresh chậm | Chấp nhận đến P4; DOM patch = backlog riêng |
| Spec drift vs `form-builder-canvas.md` (WPF cũ) | Spec này + CURRENT_STATE là SoT cho hướng mới |

---

## 13. Open Questions (không chặn P0–P1)

- Ngưỡng min px IDE khi clamp (số cụ thể).
- Default columns khi `AddCategory` / `EnsureFooter`.
- Replace-on-drop và multi-select merge > 2 slot — backlog sau P4.
- Thời điểm migrate Adapter → Serializer (ADR-0006) — task riêng, không block Blueprint.

---

## 14. Success Criteria (Full vision)

1. Người dùng thiết kế form bằng Slot/Region, không bằng tọa độ tuyệt đối.
2. XML ghi ra luôn hợp lệ với columns px + pattern FBO + anchor/split đúng nghĩa.
3. Design mode có Blueprint; tắt design / runtime-only không còn overlay.
4. Overlay không chứa luật layout; Engine + Commands là SoT hành vi.
5. Đường migrate ADR-0006 không đòi viết lại Blueprint.
