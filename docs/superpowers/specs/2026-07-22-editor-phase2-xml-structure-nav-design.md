# Phase 2 — XML Structure Navigation (field / controller / clientScript)

Date: 2026-07-22  
Status: Ready for planning  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 2)  
Depends on: Phase 1 Ctrl+Click offset pipeline (`entityOffsetActivated` / LS hit-test) — **chuỗi ưu tiên:** entity hit trước, structural hit sau  
Related: ADR-0001/R7, `docs/specs/language/symbol-navigation.md`, `ErpSemanticBinder`,  
`LookupReferenceResolver`, `XmlStructureParser.FindFunctionDefinition`, `ScriptFunctionSymbol`

---

## 1. Goal

Trong **Source** (và Insight nếu offset map được — ưu tiên Source):

| # | Gesture | Kết quả |
|---|---------|---------|
| 7 | Ctrl+Click `field@name` (định nghĩa trong `<fields>` hoặc tương đương) | Nhảy tới **`view`** chứa field đó (`view@id` / qualifier — user gọi `view@name`) |
| 8 | Ctrl+Click `items@controller="Account"` (giá trị attribute) | Mở `Lookup/Account.xml` (hoặc `.f`) dưới Controllers |
| 10 | Ctrl+Click tên hàm trong `clientScript` / CDATA (kể cả bị entity cắt tên) | Nhảy tới `function …` trong `<script>` |

Mọi điều hướng qua **SymbolId / NavigationTarget / Open file** — không lấy line số làm SoT (R7).

---

## 2. In scope

- Hit-test structural tại source offset (LS).
- Wire vào pipeline Ctrl+Click Monaco đã có (sau entity miss).
- Resolve Lookup path qua Program `ControllersPath` (reuse logic `LookupReferenceResolver.FindLookupFile`).
- clientScript → `ScriptFunctionSymbol` / `FindFunctionDefinition` nâng cấp (tên bị entity xen).

## 3. Out of scope

- Phase 3: `request()`, FindRefs function, `g.$a`, `showForm`
- Phase 4: Checking JS catalog completion
- Phase 5: SQL / information
- Rename / FindRefs cho Field
- Ctrl+Click từ chỗ field *trong* view → field definition (ngược chiều) — **không** yêu cầu Phase 2; có thể backlog P6
- Mở Dir/Grid/Filter related từ controller (P6-20)

---

## 4. Current state (gaps)

| Hạng mục | Hiện có | Thiếu |
|----------|---------|--------|
| 7 field→view | `FieldSymbol`, `ViewSymbol`, field nodes dưới view trong syntax/nav map | Không có hit-test “offset trên field@name → view chứa field”; `CategoryIndex` không đủ thay quan hệ view⊃field |
| 8 items@controller | `FboField.ItemsController`, `LookupReferenceResolver.FindLookupFile` | Không có Ctrl+Click; không expose API LS “controller name at offset → path” |
| 10 clientScript→fn | F12 `XmlStructureParser.FindFunctionDefinition` + `ExtractIdentifierAt`; `ScriptFunctionSymbol` từ script island | Không gắn Ctrl+Click Monaco structural; **entity cắt tên** trong CDATA (`onChangeCurrency` + `&Account;` + `(this)`) làm extract identifier sai / không đủ |

Phase 1 đã có: Ctrl+Click → offset → entity resolve → `NavigateToEntity`. Phase 2 **móc tiếp** khi entity = null.

---

## 5. Design

### 5.1 API LS — structural hit

```text
StructuralNavHit? ResolveStructuralAtSourceOffset(ErpDocumentId id, int offset)
```

DTO (tên chốt trong plan):

| Field | Ý nghĩa |
|-------|---------|
| `Kind` | `FieldToView` \| `ItemsController` \| `ClientScriptFunction` |
| `SymbolId` | Ví dụ `view:Dir`, `script:onChange$Voucher$…` — khi navigate in-doc |
| `TargetPath` | File Lookup tuyệt đối — khi `ItemsController` |
| `DisplayLabel` | Status bar |

**Thứ tự hit tại một offset** (cùng pipeline Ctrl+Click):

1. `ResolveEntityAtOffset` (Phase 1) — nếu có → entity nav, **dừng**.
2. `ResolveStructuralAtSourceOffset` — nếu có → structural nav.
3. (Optional) F12 legacy function-only — không bắt buộc nếu (2) cover clientScript.

### 5.2 field@name → view (#7)

**Hit zone:** attribute value (hoặc name token) của `<field name="X">` nằm trong nhánh **fields** (định nghĩa), không phải mọi `<field name>` trong view (tránh nhảy view→chính nó).

**Resolve view:**

1. Duyệt syntax/semantic: mọi `<view …>` có descendant `<field name="X">` (cùng tên, OrdinalIgnoreCase).
2. Chọn view **đầu tiên theo document order**.
3. `NavigationTarget` = definition của `ViewSymbol` / node view (`GoToDefinition(view:{id})` hoặc `NavigateToOffset` qua map).
4. Không tìm thấy view chứa field → Status: `Field {X} chưa gắn vào view nào.`

**Không** dùng số dòng thô làm khoá — dùng SymbolId `view:…` đã bind.

### 5.3 items@controller → Lookup (#8)

**Hit zone:** giá trị attribute `controller` trên element `items` (và tương đương đã parse vào `ItemsController` nếu offset map được từ syntax attribute span).

**Resolve path:**

```text
Path.Combine(ControllersPath, "Lookup", name + ".xml"|".f")
```

Reuse / extract `FindLookupFile` thành helper public (Application), nhận `controllers_path` từ `IProgramSession` / document workspace.

**Navigate:** `FormDocumentNavigator.Open` / cùng đường `OpenEntityFile`-style mở XML Lookup (code-only nếu không phải form surface — Lookup.xml là form lookup hợp lệ → mở Form tab).

File không tồn tại → Status rõ, không crash.

### 5.4 clientScript → function (#10)

**Hit zone:** bên trong `<clientScript>` text/CDATA (và attribute `clientScript` nếu có trên field — theo XSD thực tế file mẫu).

**Extract function name:**

1. Lấy identifier tại offset (`ExtractIdentifierAt`).
2. Nếu fail hoặc trông như mảnh: **scan token JS** trong giá trị clientScript — pattern `on\w+$` / `onChange$…` / `functionName(` — chọn token chứa offset.
3. **Entity-split:** khi xây hit, xét source XML: bỏ qua `&Entity;` khi nối chữ identifier (hoặc dùng ClearText chỉ để lấy tên, rồi `FindFunctionDefinition` trên source). Phase 2 tối thiểu: nối các text node CDATA liền kề trong cùng clientScript, bỏ entity ref ở giữa khi extract tên hàm gọi.
4. Lookup `ScriptFunctionSymbol` by name → `GoToDefinition`; fallback `XmlStructureParser.FindFunctionDefinition`.

**Ví dụ user:**  
`onchange="onChangeCurrency` + entity `Account` + `(this);"`  
→ tên logic `onChangeCurrencyAccount` (nếu entity expand thành `Account`) **hoặc** tên hàm thật trong script. Resolver phải dùng **cùng quy tắc resolve entity** để ghép tên trước khi tìm function — khớp runtime FBO.

Chốt thuật toán ghép:

- Lấy raw clientScript slice.
- Expand entity refs **một lớp** (hoặc dùng `EntitySymbol.DisplayText` cho ref) chỉ trong slice đó → chuỗi “logical”.
- Map offset source → offset logical (bảng nhỏ) → identifier trên logical → tìm function.

### 5.5 Bridge / Host

Mở rộng handler Ctrl+Click Source (và Insight nếu làm được):

```text
offset
  → EntityHit?     → NavigateToEntity
  → StructuralHit? → switch Kind:
        FieldToView → GoToDefinition(SymbolId) / NavigateToOffset
        ItemsController → Open(TargetPath)
        ClientScriptFunction → GoToDefinition(script:…)
  → else Status “Không có mục tiêu điều hướng.”
```

**Không** parse XML trong `bridge.js`.

### 5.6 Insight mode

Ưu tiên Source. Insight: nếu caret/click trên clear text, dùng `ClearTextOffsetMap.ToSource(offset)` rồi cùng resolver — **nếu** map Phase 1 đã có; không block Phase 2 nếu Insight chưa wire.

---

## 6. Testing

| Test | Nội dung |
|------|----------|
| Unit | field trong fields + view chứa field → FieldToView đúng ViewId |
| Unit | field không nằm view nào → null + message path |
| Unit | items controller → path Lookup/Account.xml |
| Unit | clientScript plain → script symbol |
| Unit | clientScript bị entity cắt tên → vẫn resolve đúng hàm |
| Manual | Ctrl+Click ba gesture trên form SP thật |

---

## 7. Risks

| Risk | Mitigation |
|------|------------|
| Nhiều view chứa cùng field | Document order first; Status có thể ghi “(+N view khác)” sau |
| ControllersPath null | Disable / Status “Chưa chọn Program” |
| Entity-split tên hàm sai | Test fixture đúng ví dụ user; mở rộng expand 1 lớp |
| Trùng offset field trong view vs fields | Chỉ hit định nghĩa trong nhánh fields |

---

## 8. Success criteria

- [ ] Ctrl+Click `field@name` (định nghĩa) → caret/reveal tại view tương ứng.
- [ ] Ctrl+Click `items@controller` → tab Lookup đúng file.
- [ ] Ctrl+Click tên trong clientScript (kể cả entity xen) → function định nghĩa.
- [ ] Entity Ctrl+Click Phase 1 không bị phá (ưu tiên entity).
- [ ] R7: SymbolId/path SoT; test Application xanh; build slnx xanh.
