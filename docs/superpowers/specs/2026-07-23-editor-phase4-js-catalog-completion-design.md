# Phase 4 — Completion / Hover / Signature từ Config (FBO JS catalog)

Date: 2026-07-23  
Status: Ready for implementation  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 4, hạng mục #6)  
Depends on: Phase 1–3 offset/hover bridge; island JS đã có trong nav pipeline  
Related: ADR-0001/R1/R7, `UI/Config/xml/` (pattern `diagnostics.catalog.xml`),  
`AppConfigStore`, Monaco Completion / Hover / SignatureHelp, P6-21 (diagnostic — **out of scope**)

---

## 1. Goal

Trong island JS (`<script>`, CDATA script, text `command@Checking`), hỗ trợ:

| Gesture | Source mode | Insight mode |
|---------|-------------|--------------|
| Completion (Ctrl+Space / trigger `.`) | Gợi ý API / member từ catalog | **Tắt** (read-only) |
| Hover trên identifier / `receiver.member` | Mô tả + tác dụng (`summary` + `effect`) | **Bật** (cùng catalog) |
| Signature Help khi gõ `(` / trong args | Tham số từ catalog `params` | **Tắt** |

**Done when:** catalog XML có schema rõ; Completion + Hover + SignatureHelp đọc catalog qua Language Service; UI **không** hard-code danh sách API.

---

## 2. Decisions (brainstorm)

| Chủ đề | Chốt |
|--------|------|
| Phạm vi API | **B** — API Checking/script + member sau `.` (`f`, `g`, `sender`, `parentForm`, …) |
| Nguồn nội dung | **3** — Hybrid: seed tay lõi + quét corpus chỉ **gợi ý gap** (không auto-merge) |
| Ngữ cảnh | **C** — Source: Complete+Hover+Signature trong island; Insight: chỉ Hover |
| Signature Help | **B** — Có; catalog khai `params`; Monaco Parameter Hints |
| Kiến trúc | **2** — LS Provider + bridge mỏng (không dump catalog thuần JS; không dual-cache v1) |

---

## 3. In scope

- File catalog mới: `UI/Config/xml/fbo-js.catalog.xml`.
- Application: parse/index catalog; `CompleteAt` / `HoverAt` / `SignatureAt` theo document offset + mode.
- Island gate: chỉ phục vụ khi caret trong vùng JS (script / Checking).
- Resolve alias → type → member; globals không cần receiver.
- Wire Monaco providers → bridge → `FormBuilderViewModel` → LS (cùng pattern Phase 1–3).
- Seed tay nhóm API lõi (xem §5).
- Dev gap-scan (script hoặc test) báo member xuất hiện trong corpus nhưng chưa có trong catalog.

## 4. Out of scope

- P6-21 Diagnostic “sai tên hàm Checking” theo catalog.
- Completion tên field trong string literal (`'ma_kh'`).
- Full JS language service / AST / TypeScript.
- Fuzzy match typo tên member.
- Hot-reload catalog khi sửa file (v1: load lúc startup; Reload API optional / restart app đủ).
- Auto-merge kết quả quét corpus vào XML ship.
- Dump toàn bộ catalog vào `bridge.js` làm SoT (rejected — Cách 1).

---

## 5. Catalog schema

**Path:** `UI/Config/xml/fbo-js.catalog.xml`  
**Root:** `<fboJsCatalog version="1">`

```xml
<fboJsCatalog version="1">
  <type id="form" aliases="f,parentForm">
    <summary>Form chứng từ / filter (thường gán từ sender.parentForm).</summary>
    <member name="getItemValue" kind="method"
            signature="getItemValue(field)"
            summary="Đọc giá trị field trên form."
            effect="Trả về giá trị hiện tại của field (thường string).">
      <param name="field" summary="Tên field XML (vd ma_kh)." />
    </member>
    <member name="_action" kind="property"
            summary="Trạng thái form: View, New, Edit, …" />
  </type>

  <type id="grid" aliases="g,grid">
    <member name="request" kind="method" signature="request(sender, action, context, fields)" …>
      <param name="sender" summary="Thường chính grid (g)." />
      <param name="action" summary="Khớp action id trong response." />
      <param name="context" summary="Khớp case trong ResponseComplete." />
      <param name="fields" summary="Mảng tên field / biểu thức gửi lên." />
    </member>
  </type>

  <type id="sender" aliases="o,sender">
    <member name="parentForm" kind="property" summary="Form chứa control." />
    <member name="grid" kind="property" summary="Grid (nếu handler grid)." />
  </type>

  <type id="func" aliases="$func">
    <member name="trim" kind="method" signature="trim(value)" …>
      <param name="value" summary="Chuỗi cần trim." />
    </member>
  </type>

  <globals>
    <!-- Hàm/global không cần receiver — thêm khi seed cần -->
  </globals>
</fboJsCatalog>
```

**Quy ước:**

| Thuộc tính / node | Ý nghĩa |
|-------------------|---------|
| `type/@id` | Id ổn định (form, grid, sender, func, …) |
| `type/@aliases` | CSV identifier người dùng gõ → type |
| `member/@kind` | `method` \| `property` \| `function` (globals) |
| `member/@signature` | Chuỗi hiển thị Signature Help |
| `member/@summary` | Mô tả ngắn (hover + completion detail) |
| `member/@effect` | Tác dụng / side-effect (hover; có thể trống) |
| `param` | Tên + summary cho từng tham số |

**Seed v1 (tay, tối thiểu):**  
`f`/`parentForm`: `getItemValue`, `setItemValue`, `request`, `_action`;  
`g`: `request`, `showForm`, `$a`, `_getItemValue`, `_setItemValue` (và member hay dùng khác nếu chốt khi implement);  
`o`/`sender`: `parentForm`, `grid`, `row` (nếu phổ biến);  
`$func.trim`.  
Không nhắm cover hết runtime FBO — bổ sung dần qua gap-scan.

**Gap tool:** quét corpus (regex `f.\w+`, `g.\w+`, … trên script islands) → danh sách tên chưa có trong catalog; **không** ghi XML tự động.

---

## 6. Design

### 6.1 Architecture

```text
Monaco (Completion | Hover | SignatureHelp)
  → bridge: { offset, editorMode, trigger }
  → FormBuilderViewModel
  → IErpLanguageService
       CompleteAt | HoverAt | SignatureAt
  → island gate + FboJsCatalog index
  → DTO → bridge → Monaco widget
```

UI chỉ: đăng ký provider, forward offset/mode, render.  
Application sở hữu catalog index + resolve.  
Load path: ConfigRoot + `fbo-js.catalog.xml` (cùng kiểu `diagnostics.catalog.xml`); inject vào Application lúc startup — **UI không giữ danh sách member**.

### 6.2 Island gate

Trước Complete / Hover / Signature:

1. Xác định caret có nằm trong island JS không (`<script>` / CDATA script / `command` Checking text).
2. Ngoài island → empty / null (fail closed).
3. Offset theo buffer đang edit: Source = source; Insight = ClearText.
4. Tái sử dụng helper island nếu Phase 2–3 đã có; thiếu thì bổ sung trên Syntax/ClearText — **không** parse XML ở UI.

### 6.3 Resolve

| Ngữ cảnh gần caret | Hành vi |
|--------------------|---------|
| `receiver.` + prefix | Complete members của type (alias → type); filter prefix |
| Identifier không có `.` trước | Complete aliases + globals (filter prefix) |
| Hover trên `receiver.member` hoặc identifier global | Exact match → summary + effect |
| Trong lời gọi `member(` / giữa args | Signature Help; active param theo dấu `,` |

Không fuzzy-match typo (`getItemValu` ≠ `getItemValue` khi lookup exact).

### 6.4 API (Application)

```text
void LoadFboJsCatalog(string absolutePath)   // startup; fail → catalog rỗng + log
CompletionList CompleteAt(ErpDocumentId id, int offset, EditorAssistMode mode)
HoverInfo? HoverAt(ErpDocumentId id, int offset, EditorAssistMode mode)
SignatureHelp? SignatureAt(ErpDocumentId id, int offset, EditorAssistMode mode)
```

`EditorAssistMode`: `Source` | `Insight`.

- Insight: `CompleteAt` / `SignatureAt` luôn empty; `HoverAt` vẫn chạy nếu trong island.
- DTO: label, kind, insertText, detail/documentation, signature label, parameters[], activeParameter — UI map sang Monaco; không phụ thuộc Monaco types trong Domain.

### 6.5 Monaco / bridge

- Register Completion (trigger `.`), Hover, SignatureHelp (trigger `(` `,`).
- Message request/response JSON (offset, mode, result).
- Hover: reuse / generic hoá widget hiện có (`showEntityHover` → title + body) nếu cần; không nhân đôi SoT mô tả ở JS.

### 6.6 Conflict với Phase 3 hover

- Phase 3: hover `g.$a.prop` → **value** expression.
- Phase 4: hover member catalog → **summary/effect**.
- Ưu tiên: nếu hit `$a` property value (Phase 3) → giữ value; ngược lại nếu match catalog member → catalog hover; không chồng hai widget.

---

## 7. Testing

| Test | Nội dung |
|------|----------|
| Unit | Parse catalog hợp lệ / XML lỗi → an toàn |
| Unit | Alias `f`/`parentForm` → cùng type |
| Unit | Complete `f.get` → `getItemValue`; ngoài island → rỗng |
| Unit | Complete bare prefix → aliases/globals |
| Unit | Hover exact member → summary+effect; miss → null |
| Unit | Signature trong `f.request(` → params; active param theo `,` |
| Unit | Insight: Complete/Signature empty; Hover vẫn có trong island |
| Unit | Không fuzzy exact hover |
| Dev/manual | Gap-scan 1–2 file corpus → list thiếu (không ghi XML) |
| Manual | Source Complete/Hover/Signature; Insight chỉ Hover; caret XML thường không gợi ý |

---

## 8. Risks

| Risk | Mitigation |
|------|------------|
| Island detect sai → gợi ý trong XML | Fail closed; unit tests island |
| Catalog thiếu API hay dùng | Seed lõi + gap-scan; bổ sung tay |
| Signature active-param với `(` lồng | Scanner đơn giản; đủ pattern FBO thường |
| Round-trip Monaco↔C# chậm khi gõ | Chấp nhận v1 (giống nav); cache dump = Phase sau nếu cần |
| Hover conflict `$a` vs catalog | Ưu tiên Phase 3 `$a` value (§6.6) |

---

## 9. Success criteria

- [x] `fbo-js.catalog.xml` + `version`/schema rõ; seed lõi Checking/script thường gặp.
- [x] Complete + Hover + SignatureHelp đọc catalog qua LS; UI không hard-code danh sách API.
- [x] Island gate đúng; Insight chỉ Hover.
- [x] Ưu tiên hover `$a` value vs catalog member rõ ràng.
- [x] Application tests + build `DevWorkFlow.slnx` xanh.
- [x] Gap-scan corpus chạy được; không auto-merge.

---

## 10. Handoff

Plan: [`../plans/2026-07-23-editor-phase4-js-catalog-completion.md`](../plans/2026-07-23-editor-phase4-js-catalog-completion.md).  
Roadmap parent đã trỏ artifact Phase 4.
