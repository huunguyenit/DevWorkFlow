# Phase 1 — Entity Ctrl+Click + Hover Virtual View

Date: 2026-07-22  
Status: Ready for planning  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 1)  
Depends on: Phase 0 keys (Monaco usable); không block bởi tab menu  
Related: ADR-0001/0004/0005, `docs/specs/editor/insight-editor-surface.md`,  
`docs/specs/language/entity-resolution.md`, `EntitySymbolBinder`, `bridge.js`,  
`FormBuilderViewModel.NavigateToEntity`

---

## 1. Goal

1. **Source mode:** Ctrl+Click `&Entity;` và `<!ENTITY Name SYSTEM "…">` → mở file đích hoặc nhảy tới vị trí khai báo.
2. **Source mode:** Hover entity → **virtual view** hiển thị **giá trị** entity (resolved/`DisplayText`); nội dung dài scroll được; nút **Copy**; **chỉ ẩn khi pointer rời vùng virtual view** (không ẩn khi rời token).
3. **Insight mode:** Ctrl+Click vùng entity SYSTEM → mở file đích (sửa/verify đường hiện có nếu đang hỏng).

---

## 2. In scope

| # | Hạng mục | Done when |
|---|----------|-----------|
| 3a | Source Ctrl+Click `&Name;` | Mở SYSTEM file / nhảy `<!ENTITY>` / Status nếu lỗi |
| 3b | Source Ctrl+Click tên hoặc `SYSTEM "path"` trong khai báo | Cùng quy tắc NavigateToEntity |
| 3c | Source hover virtual view | Value + scroll + Copy; dismiss đúng rule |
| 4 | Insight Ctrl+Click SYSTEM | `OpenPath` / `ResolvedPath` mở tab; caret tab cũ không bị kéo |

## 3. Out of scope

- Edit giá trị entity inline trong widget (Phase sau / ADR edit session)
- Hover/nav field, `request()`, `g.$a` (Phase 2–3)
- Thay toàn bộ Insight decoration bằng widget
- Peek Definition (P6-02)
- AvalonEdit legacy path (chỉ Monaco `InsightEditorSurface`)

---

## 4. Current state (gaps)

### Insight (một phần đã có)

- `bridge.js`: Ctrl+Click **chỉ khi** `lastShowInsights` — gửi `openEntityRequested` từ `ClearTextSegment`.
- Hover: `hoverMessage` Monaco = **tên** entity + hint Ctrl+Click — **không** phải value; dismiss theo tooltip Monaco (rời token là ẩn) — **không** đạt rule Phase 1.
- `FormBuilderViewModel.NavigateToEntity`: `OpenPath` → tab mới; khác file `DefinitionPath` → tab; cùng file → `NavigateToOffset(DefinitionOffset)`.
- `ClearTextSegment.OpenPath` = `ResolvedPath` khi `ExternalSystem`.

**Rủi ro #4:** `ResolvedPath` rỗng / file không tồn tại → Status “Không tìm thấy”; relative `..\Include\...` phụ thuộc `ResolveSystemPath`. Phase 1 phải **verify trên fixture SYSTEM** và vá resolve/open nếu fail.

### Source (thiếu gần như toàn bộ)

- Buffer = XML thô; **không** gửi clear-text segments; Ctrl+Click entity **không chạy** (`!lastShowInsights` return sớm).
- F12 `TryGoToDefinition` = tìm **function** JS (`XmlStructureParser`), **không** phải entity.

---

## 5. Design

### 5.1 Language Service — hit-test offset (SoT)

Thêm API thuần Application (không Monaco):

```text
EntityHit? ResolveEntityAtSourceOffset(ErpDocumentId id, int offset)
```

Trả về (đặt tên cuối cùng trong plan):

| Field | Ý nghĩa |
|-------|---------|
| `EntityName`, `SymbolId` | Định danh |
| `HitKind` | `Reference` (`&X;`) \| `Declaration` (`<!ENTITY X …>`) \| `SystemLiteral` (chuỗi path trong SYSTEM) |
| `DefinitionPath`, `DefinitionOffset` | Chỗ khai báo |
| `OpenPath` | File SYSTEM cần mở (nếu có) |
| `DisplayText` / `RawPreview` | Giá trị cho hover (ưu tiên `EntitySymbol.DisplayText`, fallback `RawValue`) |
| `IsError` | Không resolve |

**Thuật toán:**

1. Dùng `EntitySymbol` graph đã bind (Definition span + References spans + SystemId span nếu có trong binder).
2. Offset nằm trong span nào → hit sâu nhất / cụ thể nhất (reference thắng declaration nếu overlap bất thường — thường không overlap).
3. **Không** parse XML trong UI/bridge; bridge chỉ gửi `offset` (+ mode).

Nếu binder chưa có span cho SYSTEM literal path: mở rộng binder **tối thiểu** để gắn `SourceSpan` cho system_id string, hoặc hit declaration span đủ để Ctrl+Click tên entity / cả thẻ ENTITY.

Map sang `EntityNavigationRequest` đã có để **tái sử dụng** `NavigateToEntity` (không nhân đôi logic mở tab).

### 5.2 Bridge / Monaco — Source Ctrl+Click

- `onMouseDown`: nếu Ctrl/Meta và **không** (hoặc kể cả khi) insight:
  - Source (`!lastShowInsights`): `post({ event: 'entityHitRequested', payload: { offset } })`.
  - Insight: giữ `openEntityRequested` từ segment **hoặc** thống nhất cũng qua offset + host gọi LS (ưu tiên **thống nhất offset→LS** để một đường; segment path có thể deprecate dần — Phase 1 cho phép giữ Insight segment path nếu ổn định, thêm Source path mới).
- **Khuyến nghị Phase 1:**  
  - Source: offset → C# → `ResolveEntityAtSourceOffset` → `NavigateToEntity`.  
  - Insight: giữ segment Ctrl+Click hiện có; **bổ sung** verify SYSTEM; nếu hỏng thì fallback cùng LS API qua map ClearText→Source offset (`ClearTextOffsetMap`).

### 5.3 Hover virtual view

**Yêu cầu UX (bắt buộc):**

1. Hiện khi hover entity hit (Source: `&X;` / ENTITY; Insight: segment có value).
2. Nội dung chính = **giá trị** (monospace), không chỉ tên.
3. Header nhỏ: `&Name;` + kind (inline/SYSTEM).
4. Body: scroll nếu dài (max-height ~240–320px).
5. Nút **Copy** → clipboard toàn bộ value đang hiện.
6. **Dismiss:** chỉ khi pointer **rời hình chữ nhật widget**; chuyển từ token → widget không được đóng. Không dùng `hoverMessage` Monaco làm UI chính.

**Host widget (chốt trong implement, mặc định A):**

| | A — Monaco Content Widget (trong WebView2) | B — WPF popup ngoài WebView2 |
|--|---------------------------------------------|--------------------------------|
| Ưu | Cùng airspace, scroll/copy trong DOM dễ | Theme WPF thống nhất |
| Nhược | Copy qua JS→postMessage hoặc `navigator.clipboard` | Tọa độ screen + airspace khó |

**Chọn A** trừ khi Content Widget dismiss rule không làm được — khi đó B.

Flow A:

```text
mouse move → debounce → post entityHoverRequested(offset, mode)
C# → ResolveEntityAt* → post showEntityHover({ name, value, x, y })
JS Content Widget show; mouseenter widget keep; mouseleave widget hide
Copy button → clipboard.writeText(value) (+ optional post status)
```

Insight: có thể gửi kèm value từ LS theo `symbolId` segment (tránh nhét full value vào mọi decoration).

### 5.4 Insight SYSTEM Ctrl+Click (#4)

1. Fixture test: DOCTYPE `<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">` + body `&ScriptIrregular;` — assert `OpenPath` / `ResolvedPath` absolute tồn tại khi file fixture có.
2. Manual: Insight Ctrl+Click vùng expand SYSTEM → tab mới đúng file; caret tab cũ giữ.
3. Nếu `OpenPath` rỗng nhưng `ResolvedPath` có trên symbol — vá `Segment(...)`.
4. Nếu path relative sai base — vá `ResolveSystemPath` (base = directory của file khai báo entity).

### 5.5 Architecture

```text
Ctrl+Click / Hover (Monaco)
  → bridge event (offset | segment payload)
  → MonacoEditorHost
  → FormBuilderViewModel / LS ResolveEntityAt*
  → NavigateToEntity | ShowEntityHover command back to bridge
```

UI không parse XML. Editor không giữ EntitySymbol graph.

---

## 6. Testing

| Loại | Nội dung |
|------|----------|
| Unit | `ResolveEntityAtSourceOffset`: reference, declaration, SYSTEM, miss, nested |
| Unit | `ResolveSystemPath` relative `..\` |
| Unit | ClearText segment `OpenPath` cho ExternalSystem |
| Manual | Source Ctrl+Click `&X;` / ENTITY SYSTEM |
| Manual | Hover: scroll, Copy, move token→widget không đóng, leave widget đóng |
| Manual | Insight SYSTEM Ctrl+Click |

---

## 7. Risks

| Risk | Mitigation |
|------|------------|
| Widget dismiss khó với Monaco HoverService | Content Widget tự quản mouseenter/leave; tắt hoverMessage value dài |
| Value cực lớn (file JS include) | Truncate hiển thị + “Copy full” vẫn full; hoặc virtualize scroll DOM |
| Source hit-test chậm | Index spans lúc bind (đã có trên EntitySymbol) — O(n) symbols/refs, OK form |
| Insight vs Source hai đường nav lệch | Cùng `NavigateToEntity` + cùng path fields |

---

## 8. Success criteria

- [ ] Source: Ctrl+Click `&Entity;` → đúng file hoặc declaration.
- [ ] Source: Ctrl+Click ENTITY SYSTEM → mở file đích.
- [ ] Source: hover → virtual view value + scroll + Copy; dismiss chỉ khi rời view.
- [ ] Insight: Ctrl+Click SYSTEM → mở file đích; không kéo caret tab nguồn.
- [ ] Không parse XML trong UI; test Application xanh; build slnx xanh.
