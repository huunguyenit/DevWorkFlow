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

**Progress (2026-07-23):** `StructuralAtOffsetResolver` (Task 1–3 của plan) đã tồn tại sẵn trên cây
nhưng LS API + UI wiring (Task 4) chưa từng chạy — hoàn thiện khi làm Phase 3 vì chuỗi Ctrl+Click
Phase 3 phụ thuộc nó. Thêm `IErpLanguageService.ResolveStructuralAtOffset` + impl; nối vào
`FormBuilderViewModel.OnEntityOffsetActivated` (chuỗi Entity → Structural → JS Runtime → Status
miss, tách `HandleStructuralHit`/`HandleJsRuntimeHit`). +3 unit test (`StructuralAtOffsetResolverTests`).
Build slnx xanh. **Needs human runtime pass** (field→view, items@controller→Lookup, clientScript→fn
qua UI thật) — chưa verify headless được.

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

**Progress (2026-07-23):** Implemented toàn bộ 7 task của plan — `DollarAIndex` (parse `g.$a={…}`,
GoTo+hover); `FboRequestCallParser` + `ResponseCompleteCaseFinder` (request/grid.request → action/
case, exact string, không fuzzy-fix); `ScriptFunctionReferenceFinder` + `ErpNavigationService.
FindReferences` mở rộng cho `ScriptFunctionSymbol` (definition + call sites, document hiện tại);
`ShowFormRelatedPathResolver` (stem strip + multi-file Filter/Lookup/Grid, cap 12); `JsRuntimeNavHit`
DTO + `JsRuntimeAtOffsetResolver` (ưu tiên request → showForm → `$a` → function def) + LS
`ResolveJsRuntimeAtOffset`; UI wiring — `FormBuilderViewModel.OnEntityOffsetActivated` chuỗi đầy đủ
Entity → Structural → JS Runtime → Status miss, hover `$a` qua `ResolveEntityHover` fallback,
`SymbolInfoViewModel.ShowReferences` + `ActivateReferenceCommand` (double-click reference →
NavigateToOffset, event `ReferencesRequested` từ VM, không polling), showForm multi-open cap 12.
+41 unit test mới (Application 233/233 xanh). Build slnx xanh. **Needs human runtime pass:**
Ctrl+Click/hover matrix thật trên script FBO (request, function refs, `$a`, showForm) — chưa
verify headless được.

**Fix pass (2026-07-23, sau human runtime pass đầu tiên — user báo 4/5 gesture fail):**
Chẩn đoán trên corpus THẬT `SP226/Grid/SVDetail.xml` (fixture tổng hợp không lộ được các lỗi này):

| Triệu chứng | Nguyên nhân gốc | Fix |
|---|---|---|
| request arg1 luôn "Không tìm thấy action" | FBO đặt tên action bằng **`id`** (`<action id="Item">`), và `ErpSemanticBinder` **chưa từng bind element `<action>`** (chỉ bind `<response>`). File thật có 0 `<action name=>`. | Bind `<action>` → `ResponseActionSymbol` (`action:{id}`) |
| function FindRefs "không thấy gì" | LS resolve đúng (3/2/2/2/1 refs) nhưng UI: (a) không hiện panel Symbol Info, (b) Ctrl+Click dời caret → `Refresh()` xoá sạch list vừa dựng | Surface panel từ `MainViewModel`; `_pinned` giữ list qua caret change |
| `$a` + nội dung trong entity không thấy | Index chạy trên **source** — đo được: ClearText có 22 function / 8 request vs source 17 / 6. 5 function + 2 lời gọi **chỉ tồn tại sau khi expand entity** | Index chạy trên **ClearText**; `ClearTextLocationMapper` map ngược về **(file, offset)** thật |
| Mọi gesture chết ở Insight mode | `bridge.js`: Ctrl+Click `return` sớm nếu không trúng entity segment; hover bị **tắt cứng** ở Insight | Fall through gửi offset + cờ `insight`; bật hover Insight |

**Yêu cầu chốt từ user:** *"Nếu index reference trong entity thì phải navigation tới đúng file + vị trí.
Phải navigation tới đúng nơi, cho dù nằm ở bất kỳ đâu."* → `JsRuntimeNavHit.TargetPath` +
`ClearTextLocationMapper` (literal → `OffsetMap.ToSource`; trong expansion → entity SYSTEM = file
đó, entity inline = `ValueLocation` + delta). Target khác file → mở tab file đó rồi focus offset
trong file đó (KHÔNG áp offset của hệ toạ độ khác).

Tests: +6 `JsRuntimeRealCorpusTests` chạy trên SP226 (tự Skip nếu thiếu corpus) — trong đó có test
khẳng định offset từ buffer Insight và từ Source cho **cùng một target**. Application 243/243 xanh.

**Fix pass 2 (2026-07-23):** user xác nhận request / `$a` click / `$a` hover **OK**; còn 2 việc:

- **Function FindRefs vẫn fail (source mode).** Đo lại trên corpus: LS **đúng** (`onChange$GridVoucherDetail$Promotion`
  → 3 refs: definition + 2 call site, map đúng offset source). Lỗi nằm ở chỗ *hiện* panel: đường
  surface panel tự chế không khớp đường đã chạy được của Shift+F12. Sửa: dùng đúng trình tự
  `MainWindow.OnFindReferences` (`ShowPanel(RightTop)` → `SelectRightPaneCommand.Execute(pane)`),
  và **không** gọi `SymbolInfoVm.Refresh()` (Refresh dựng theo symbol tại caret → xoá list vừa ghim).
- **Bổ sung chiều ngược (yêu cầu mới).** `JsRuntimeNavKind.ActionRequestSites` +
  `CaseRequestSites`: từ `<action id="X">` / `<response name="X">` → liệt kê các chỗ gọi
  `request('X', …)`; từ `case 'X':` → các chỗ gọi `request(…, 'X', …)`. Dùng
  `FboRequestCallParser.EnumerateAll` + map (file, offset) như FindRefs. Nhiều nơi gọi → luôn hiện
  danh sách Symbol Info, không tự nhảy. `case` không khớp request nào → trả null để không nuốt
  Ctrl+Click trên `switch` thường.

**Corpus rename (SP226 → FBISP24):** golden test bám bản SP226 nên giữ `Sp226Paths` nguyên trạng;
test Phase 3 chuyển sang `FboProgramCorpus` (dò Program bất kỳ + `FboCorpusFact("Grid","SVDetail.xml")`
tự Skip khi thiếu file). `FboLexerConditionalSectionTests.Unit_ent_…` trước đây hardcode `SP226` →
đỏ khi đổi corpus, nay dùng resolver chung.

Application 228 passed / 18 skipped (skip = golden test cần đúng bản SP226), Domain 7, Editor 14, Tree 9.

**Fix pass 3 (2026-07-23):** user xác nhận function FindRefs đã đúng (3 refs). Hai bổ sung:

- **Ctrl+Click trên IDENTIFIER, không cần từ khoá `function`.** `TryResolveFunctionDefinition` chỉ
  bắt khi con trỏ nằm trên tên trong dòng định nghĩa → đứng ở *nơi gọi* không ăn. Thay bằng
  `TryResolveFunctionIdentifier`: lấy identifier tại offset (`XmlStructureParser.ExtractIdentifierAt`),
  xác nhận có `function <ident>` trong ClearText rồi trả cùng bộ references. Đứng ở đâu cũng ra
  cùng kết quả (test khẳng định definition-site và call-site cho số refs bằng nhau).
- **Symbol Info hai chiều.** `JsRuntimeRelation` (+ `Relations` trên hit) dựng chuỗi
  request → action → case bằng `BuildRequestChain`, dùng CHUNG cho cả 4 điểm vào
  (`RequestAction`, `RequestResponseCase`, `ActionRequestSites`, `CaseRequestSites`) — vào từ mắt
  xích nào cũng thấy đủ sơ đồ. Hit thêm `SymbolName` / `SymbolKindText`.

**References có file:line:code.** `NavigationTarget.Preview` + `ReferencePreviewEnricher`
(Application, cache theo lần enrich, ưu tiên buffer đang mở rồi mới đọc đĩa) — panel hiển thị
được "📄 File Line N / đoạn code" mà UI KHÔNG tự đọc file (giữ R1).

**Panel** (`SymbolInfoPanel.xaml` + `SymbolInfoViewModel`): header tên+loại+số reference, section
RELATIONSHIP (click từng mắt xích để nhảy, mở đúng file nếu khác), REFERENCES kèm preview.
`ReferencesRequested` giờ mang cả `JsRuntimeNavHit` thay vì `(title, refs)`.

Application 231 passed / 18 skipped, Domain 7, Editor 14, Tree 9; build slnx xanh.
**Chưa human runtime pass** cho panel mới.

**Fix pass 4 (2026-07-23) — exact match tên hàm.** User báo matching đang hành xử như "contains".
Nguyên nhân: dùng `\b` để chặn đuôi tên hàm, nhưng tên hàm FBO **kết thúc bằng `$`**
(`load$GridVoucherDetail$`, `onChange$GridVoucherDetail$`) và có nhiều hàm **cùng tiền tố**
(`…$GoodsType`, `…$Item`, `…$UOM`, `…$Site`, `…$Quantity`, `…$Promotion`). Sau `$`, `\b` chỉ tồn
tại khi ký tự kế là word-char → vừa **trượt chính định nghĩa của nó** (ký tự kế là `(`), vừa
**khớp nhầm hàm dài hơn**. Hệ quả thấy được: định nghĩa không bị loại khỏi danh sách call site,
và relation "định nghĩa" trỏ sang hàm khác.

Sửa: thay `\b` bằng lookaround "hết ký tự identifier" `(?![\w$])` / `(?<![\w$])`
(`JsRuntimeAtOffsetResolver.IdentifierEnd|IdentifierStart`) tại:
`TryResolveFunctionIdentifier`, `ScriptFunctionReferenceFinder` (call-site + `ResolveDefinitionSpan`),
và `XmlStructureParser.FindFunctionDefinition` (Phase 2 dính cùng lỗi).

Regression test đã **kiểm chứng là bắt được lỗi** (tạm khôi phục `\b` → `Prefix_name_does_not_match_longer_sibling_functions`
fail: 2 items thay vì 1). Application 236 passed / 18 skipped, Domain 7, Editor 14, Tree 9.

**Handoff Phase 4:** Completion / Hover từ Config (Checking JS catalog) — xem mục kế tiếp.

---

### Phase 4 — Completion / Hover từ Config

| # | Hạng mục |
|---|----------|
| 6 | Trong `script` / `command@Checking`: gợi ý cú pháp JS nội bộ; danh sách định nghĩa tại **`Config/xml`** (file catalog mới); hover = mô tả + tác dụng hàm |

**Done when:** catalog XML có schema rõ; Completion + Hover + SignatureHelp đọc catalog; không hard-code danh sách trong UI.

**Depends:** tạo catalog (chưa có trong Config hiện tại — `UI/Config/xml/` chưa có JS syntax file).

**Artifacts:** mini-spec [`2026-07-23-editor-phase4-js-catalog-completion-design.md`](./2026-07-23-editor-phase4-js-catalog-completion-design.md) · plan [`../plans/2026-07-23-editor-phase4-js-catalog-completion.md`](../plans/2026-07-23-editor-phase4-js-catalog-completion.md).

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

Config Phase 4: `UI/Config/xml/fbo-js.catalog.xml` — xem mini-spec Phase 4.

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
