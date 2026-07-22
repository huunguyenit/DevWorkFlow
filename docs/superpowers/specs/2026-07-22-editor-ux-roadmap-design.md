# Editor UX Roadmap (WebView + Monaco + FBO Language)

Date: 2026-07-22  
Status: Approved for phased planning (Cách 1 — roadmap sống; mỗi phase tách spec/plan riêng)  
Prioritization: **C — Xen kẽ** (quick-win unblock + từng nav slice LS)  
Related: `.ai/EDITOR_SUMMARY.md`, `.ai/ERP_LANGUAGE_SUMMARY.md`, `.ai/CURRENT_STATE.md`,  
`docs/03-EDITOR_PLATFORM.md`, ADR-0001/0002/0004/0005,  
`docs/specs/editor/insight-editor-surface.md`, `docs/specs/language/symbol-navigation.md`,  
`docs/specs/GAPS_AND_PRIORITIES.md`

---

## 1. Goal

Tinh chỉnh trải nghiệm editor (Monaco qua WebView2 + shell tab) và trí tuệ ngôn ngữ FBO
(Entity, XML cấu trúc, JS runtime, SQL) theo danh sách yêu cầu chủ dự án — **không** nhồi
một PR khổng lồ.

Roadmap này là **SoT ưu tiên**. Mỗi phase khi đến lượt: mini-spec → plan → implement →
verify, rồi mới phase sau.

---

## 2. Packaging (Cách 1)

| Quyết định | Chi tiết |
|------------|----------|
| Một file roadmap sống | File này |
| Spec/plan chi tiết | Chỉ khi bắt đầu phase |
| Phase 6 | Backlog có ID; owner chọn 2–4 mục/lần — không “làm hết Phase 6” một PR |
| Không làm | Spec sâu sẵn cho cả 1–17 trong một đợt (Cách 2 đã loại) |

---

## 3. Principles

1. **Editor = render only** — không parse XML/SQL/JS nghiệp vụ trong UI/Monaco bridge.
2. **Nav / Hover / Completion / FindRefs** thuộc Language Service + Provider (R1, R3).
3. Điều hướng theo **SymbolId / NodeId**, không theo line-offset thô (R7).
4. Gesture UI (Ctrl+Click, hover widget, tab menu, Execute selection) chỉ gọi Platform/LS.
5. Mỗi phase **ship được, test được**, không phụ thuộc phase sau mới “có cảm giác dùng”.
6. Hover entity virtual view (Phase 1) là **hover widget** — không thay Insight inline
   (ADR-0004 vẫn Prefer inline Insight; widget bổ sung cho Source mode / giá trị dài).

---

## 4. Source requirements map

| # | Yêu cầu (tóm tắt) | Phase |
|---|-------------------|-------|
| 1 | Tab context: Pin, Copy full path, Open in Explorer | 0 |
| 2 | Home/End/PgUp/PgDn + Shift caret | 0 |
| 3 | Source: Ctrl+Click entity / SYSTEM; hover virtual view (scroll + Copy; dismiss khi rời view) | 1 |
| 4 | Insight: Ctrl+Click SYSTEM → file đích | 1 |
| 5 | Bôi đen → Execute SQL | 5 |
| 6 | Checking/script: JS syntax từ `Config/xml` + hover mô tả | 4 |
| 7 | `field@name` → `view@name` | 2 |
| 8 | `items@controller` → `Lookup/{Name}.xml` | 2 |
| 9 | `item@information` → tab SQL (`key`/`check`/`information`, `%l` = locale v→rỗng / e→`2`) | 5 |
| 10 | `clientScript` CDATA → function | 2 |
| 11 | `request(...)` → action + `ResponseComplete` case | 3 |
| 12 | `function@name` → Find references (chỗ gọi) | 3 |
| 13 | `g.$a.@name` → định nghĩa object | 3 |
| 14 | Hover `g.$a.gia2` → value | 3 |
| 15 | `g.showForm('X')` → mở `Filter/Lookup/Grid` liên quan `*X*` | 3 |
| 16 | Ctrl+Click fn/proc trong thẻ SQL → `ALTER …` | 5 |
| 17 | Snippet `options.name=…` + Tab → `SELECT * FROM options WHERE …` | 5 |

---

## 5. Phases

### Phase 0 — Unblock input + chrome

| # | Hạng mục | Ghi chú |
|---|----------|---------|
| 2 | Home/End/PageUp/PageDown + Shift+Home/End | Bug WebView2 ↔ Monaco key forwarding — **P0** |
| 1 | Document tab: Pin, Copy full path, Reveal in File Explorer | WPF shell |

**Done when:** caret/selection phím chuẩn; right-click tab đủ 3 lệnh.

**Likely touch:** `MonacoEditorHost`, `bridge.js`, document tab chrome (shell).

**Artifacts:** mini-spec [`2026-07-22-editor-phase0-keys-tab-menu-design.md`](./2026-07-22-editor-phase0-keys-tab-menu-design.md) · plan [`../plans/2026-07-22-editor-phase0-keys-tab-menu.md`](../plans/2026-07-22-editor-phase0-keys-tab-menu.md)

**Progress (2026-07-22):** Implemented — `DocumentTabPathHelper` (+ tests), tab Pin/Copy full path/Reveal in Explorer, DocumentTabBar restyle. Keys: first attempt (`e.Handled=true` on WebView2 PreviewKeyDown) was wrong — under AvalonDock airspace it *blocks* Monaco. Reworked to spec §5.1 fallback: host intercepts Home/End/PageUp/PageDown (±Shift), stops AvalonDock's document `TabControl` swallowing them, and drives Monaco via a new `runAction` bridge command (`cursorHome/End/PageUp/PageDown[Select]`). Tab menu: switched from ContextMenu command-binding (fails — popup outside UserControl visual tree) to code-behind Click handlers. Build + unit tests green; **still needs human runtime pass** (keys matrix, menu click-through, visual review) — not verifiable headless.

---

### Phase 1 — Entity navigate + hover

| # | Hạng mục |
|---|----------|
| 3 | Source: Ctrl+Click `&Entity;` và `<!ENTITY … SYSTEM "…">` → file / vị trí khai báo; hover **virtual view** (scroll nếu dài, nút Copy; **chỉ ẩn khi pointer rời vùng view**) |
| 4 | Insight: Ctrl+Click vùng SYSTEM entity → mở file đích (giữ caret tab cũ nếu đã có hành vi) |

**Done when:** Source + Insight entity nav ổn; dismiss rule hover widget đúng spec phase.

**Likely touch:** Insight/Nav Provider, Monaco hover/widget bridge, entity resolution.

**Artifacts:** mini-spec [`2026-07-22-editor-phase1-entity-nav-hover-design.md`](./2026-07-22-editor-phase1-entity-nav-hover-design.md) · plan [`../plans/2026-07-22-editor-phase1-entity-nav-hover.md`](../plans/2026-07-22-editor-phase1-entity-nav-hover.md)

**Progress (2026-07-22):** Implemented — LS `ResolveEntityAtOffset` (SoT hit-test, `EntityHit` DTO) + 6 unit tests; SYSTEM relative `..\Include\...` OpenPath verified (test, no binder fix needed); Source Ctrl+Click (`entityOffsetActivated` → LS → reuse `NavigateToEntity`); Insight Ctrl+Click segment path kept; hover Content Widget (value + Copy + scroll, dismiss only on leave-widget) in `bridge.js`, native `hoverMessage` removed to avoid double popup. Build slnx green; Application tests 182/182. **Needs human runtime pass:** Source Ctrl+Click nav, hover value/scroll/Copy, dismiss token→widget, Insight SYSTEM Ctrl+Click — not verifiable headless.

---

### Phase 2 — Nav slice #1 (XML cấu trúc)

| # | Hạng mục |
|---|----------|
| 7 | `field@name` → `view@name` tương ứng |
| 8 | `items@controller="Account"` → mở `Lookup/Account.xml` |
| 10 | Nội dung trong `clientScript` CDATA → nhảy tới function định nghĩa |

**Done when:** ba gesture qua SymbolId/NodeId (không offset thô).

**Artifacts:** mini-spec [`2026-07-22-editor-phase2-xml-structure-nav-design.md`](./2026-07-22-editor-phase2-xml-structure-nav-design.md) · plan [`../plans/2026-07-22-editor-phase2-xml-structure-nav.md`](../plans/2026-07-22-editor-phase2-xml-structure-nav.md)

---

### Phase 3 — Nav slice #2 (JS runtime FBO)

| # | Hạng mục |
|---|----------|
| 11 | `request('Customer','Customer')` / `grid.request(...)`: var1 → `response`/`action@name`; var2 → `case` trong `on$…$ResponseComplete` |
| 12 | Ctrl+Click `function@name` → Find references (các chỗ gọi) |
| 13 | Ctrl+Click `g.$a.@name` → vị trí khai báo trong `g.$a = { … }` |
| 14 | Hover `g.$a.gia2` → hiển thị value chuỗi expression |
| 15 | `g.showForm('SVOrderFilter')` → mở file liên quan `SVOrder*.xml` trong Filter / Lookup / Grid |

**Done when:** GoTo + FindRefs + hover `$a` cơ bản trong script/command.

**Note (11):** ví dụ user có typo `case 'Cusomter'` — nav phải resolve theo chuỗi thật trong source / metadata, không “đoán sửa” tên.

**Artifacts:** mini-spec [`2026-07-23-editor-phase3-js-runtime-nav-design.md`](./2026-07-23-editor-phase3-js-runtime-nav-design.md) · plan [`../plans/2026-07-23-editor-phase3-js-runtime-nav.md`](../plans/2026-07-23-editor-phase3-js-runtime-nav.md)

---

### Phase 4 — Completion / Hover từ Config

| # | Hạng mục |
|---|----------|
| 6 | Trong `script` / `command@Checking`: gợi ý cú pháp JS nội bộ; danh sách định nghĩa tại **`Config/xml`** (file catalog mới); hover = mô tả + tác dụng hàm |

**Done when:** catalog XML có schema rõ; Completion + Hover Provider đọc catalog; không hard-code danh sách trong UI.

**Depends:** tạo catalog (chưa có trong Config hiện tại — `UI/Config/xml/` chưa có JS syntax file).

---

### Phase 5 — SQL tooling

| # | Hạng mục |
|---|----------|
| 5 | Trong editor: bôi đen dòng/vùng → Execute SQL (connection/target theo context DB/SQL Studio) |
| 9 | Ctrl+Click `item@information`: parse `key` / `check` / `information` → mở tab SQL. Ví dụ `information="tk$dmtk.ten_tk%l"` + `key="status = '1'"` → `SELECT tk, ten_tk, ten_tk2 FROM dmtk WHERE status = '1'`. **`%l`:** giao diện Việt → bỏ cột locale (rỗng / không lấy `ten_tk2` tương ứng quy ước FBO); Anh → cột thứ 2 (`ten_tk2`). Chi tiết mapping `%l` chốt trong mini-spec Phase 5 theo đúng runtime FBO. |
| 16 | Trong thẻ khai báo SQL: Ctrl+Click function/proc → tab SQL nội dung `ALTER FUNCTION` / `ALTER PROCEDURE` |
| 17 | Snippet: gõ `options.name='m_instock_split' and val = '1'` + Tab → `SELECT * FROM options WHERE name = 'm_instock_split' and val = '1'` |

**Done when:** execute selection, information→SQL, alter object, snippet `options` hoạt động trên editor SQL/Monaco tương ứng.

---

### Phase 6 — Editor productivity backlog

Không nằm critical path Phase 0–5. Owner chọn **2–4 ID**/đợt → mini-spec → plan → implement.

#### 6.1 Navigation & orientation

| ID | Tính năng |
|----|-----------|
| P6-01 | Back / Forward caret sau GoTo (Ctrl+- / Ctrl+Shift+-) |
| P6-02 | Peek Definition (inline) song song GoTo tab |
| P6-03 | Go to Symbol in Form (Command Palette / Ctrl+Shift+O) |
| P6-04 | Breadcrumb XML path (`form > views > view[@name] > …`) |
| P6-05 | Outline ↔ caret sync hai chiều chắc hơn |

#### 6.2 Edit nhanh

| ID | Tính năng |
|----|-----------|
| P6-06 | Multi-cursor + select-all-occurrences |
| P6-07 | Rename Symbol (qua LS/Command — không search-replace mù) |
| P6-08 | Surround/wrap selection (`CDATA`, comment XML/JS, …) |
| P6-09 | Duplicate / move line |
| P6-10 | XML tag autoclose + rename cặp tag |

#### 6.3 Fold / structure

| ID | Tính năng |
|----|-----------|
| P6-11 | Fold theo thẻ XML (`script`, `views`, `fields`, …) |
| P6-12 | Fold function JS trong `<script>` / Checking |
| P6-13 | Fold region entity Insight theo cấp lồng |

#### 6.4 SQL & data (mở rộng Phase 5)

| ID | Tính năng |
|----|-----------|
| P6-14 | Format selection / document T-SQL |
| P6-15 | Explain / estimated plan (khi có connection) |
| P6-16 | Snippet catalog mở rộng ngoài `options` |
| P6-17 | Kết quả Execute → grid + “Send to editor” |

#### 6.5 FBO-specific power-ups

| ID | Tính năng |
|----|-----------|
| P6-18 | Inlay hint: `request` → action / response case |
| P6-19 | Inlay/gutter: entity SYSTEM vs inline |
| P6-20 | “Open related files” cho controller (Dir+Grid+Filter+…) — bổ sung mục 15 |
| P6-21 | Diagnostic Checking JS theo catalog Config (sai tên hàm) |
| P6-22 | Template handler: sinh `onChange$Voucher$…` từ field |

#### 6.6 Chrome / comfort

| ID | Tính năng |
|----|-----------|
| P6-23 | Tab: Close Others / Close Right / Copy relative path |
| P6-24 | Minimap + sticky scroll (Monaco) |
| P6-25 | Zen / Maximize editor focus |
| P6-26 | Bookmark / mark dòng (non-debug) |
| P6-27 | Compare Source ↔ Insight (diff caret-aligned) |

**Suggested first pick after Phase 0–5:** P6-01, P6-02, P6-03, P6-11, P6-06, P6-07.

---

## 6. Execution order

```text
Phase 0 → 1 → 2 → 3 → 4 → 5
Phase 6 = backlog riêng (owner chọn ID)
```

Mỗi phase:

1. Mini-spec trong `docs/superpowers/specs/` (hoặc `docs/specs/editor|language/…` nếu SoT dài hạn)
2. Plan trong `docs/superpowers/plans/`
3. Implement + verify (build/test theo module chạm)
4. Cập nhật checkbox / ghi chú tiến độ trên file roadmap này (living doc)

---

## 7. Out of scope (roadmap này)

- Đổi layout Left Panel (UX freeze)
- Workflow L5 / AI L6 / Plugin host đầy đủ
- Rewrite Designer dual-model (ADR-0006) — trừ khi một nav slice bắt buộc đụng Semantic
- “Làm hết Phase 6” trong một PR

---

## 8. Architecture sketch (cross-phase)

```text
User gesture (Ctrl+Click / Hover / Tab menu / Execute)
    → Editor Platform / Monaco bridge (offset ↔ SymbolId qua LS)
    → Language Service Providers (Nav | Hover | Completion | FindRefs | SQL)
    → Application commands (Open file, Open SQL tab, Reveal in Explorer, Run script)
    → UI shell (document tabs, SQL Studio, hover widget host)
```

Config mới dự kiến (Phase 4+): `UI/Config/xml/` — catalog JS nội bộ Checking/script
(tên file chốt trong mini-spec Phase 4).

---

## 9. Success criteria (roadmap-level)

- Chủ dự án biết phase nào đang làm / tiếp theo mà không đọc lại chat.
- Claude không bắt đầu Phase N+1 khi Phase N chưa Done when.
- Không có regression kiến trúc: UI không parse XML; nav không dùng offset làm SoT.

---

## 10. Open points (chốt trong mini-spec phase, không chặn roadmap)

1. `%l` mapping Exact runtime FBO (Phase 5 / mục 9) — Việt/Anh cột nào.
2. Execute SQL (5): dùng connection Database Explorer target hay SQL Studio active?
3. Hover widget host: Monaco Content Widget vs WPF popup ngoài WebView2.
4. Pin tab (1): hành vi đóng “Close All” có tôn trọng pin không (mặc định: có).
5. FindRefs (12): phạm vi một document vs toàn Program workspace (bắt đầu: document + related controller files).
