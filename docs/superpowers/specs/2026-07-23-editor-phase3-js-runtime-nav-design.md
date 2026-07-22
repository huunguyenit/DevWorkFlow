# Phase 3 — FBO JS Runtime Navigation (request / FindRefs / $a / showForm)

Date: 2026-07-23  
Status: Ready for planning  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 3)  
Depends on: Phase 1–2 Ctrl+Click offset chain (entity → structural → **js-runtime**)  
Related: ADR-0001/R7, `docs/specs/language/symbol-navigation.md`, `ScriptFunctionSymbol`,  
`ResponseActionSymbol`, `ControllerRelatedFileResolver`, `ErpNavigationService.FindReferences`

---

## 1. Goal

Trong vùng `<script>` / JS nhúng (CDATA, command Checking text), hỗ trợ:

| # | Gesture | Kết quả |
|---|---------|---------|
| 11 | Ctrl+Click arg1 / arg2 của `request(...)` / `grid.request(...)` | Arg1 → `response`/`action@name`; Arg2 → `case '…'` trong `on$…$ResponseComplete` (chuỗi **đúng như source**, không fuzzy-fix typo) |
| 12 | Ctrl+Click tên `function` (định nghĩa) | Find references — danh sách chỗ gọi; UI Symbol Info / list |
| 13 | Ctrl+Click `g.$a.name` | Nhảy tới property trong `g.$a = { … }` |
| 14 | Hover `g.$a.name` | Virtual view / hover hiện **value** expression string |
| 15 | Ctrl+Click tên trong `g.showForm('SVOrderFilter')` | Mở các file liên quan `*prefix*` trong Filter / Lookup / Grid |

---

## 2. In scope

- LS hit-test JS runtime tại source offset (sau entity + structural miss).
- Index `g.$a` properties + call-sites function trong **document hiện tại** (+ optional related files cùng controller bundle nếu đã mở — bắt đầu: **cùng document**).
- showForm: glob mở nhiều tab theo prefix (không chỉ Filter như `ControllerRelatedFileResolver` hiện tại).
- Wire Ctrl+Click + hover vào pipeline Monaco đã có.

## 3. Out of scope

- Phase 4 Checking catalog completion.
- Rename Symbol / workspace-wide index đầy đủ mọi SymbolKind.
- Fuzzy match typo (`Cusomter` ≠ `Customer`).
- Parse full JS AST (dùng regex/scanner có kiểm soát trên script islands — đủ Phase 3).
- `f.showForm` vs `g.showForm` khác biệt sâu — cùng pattern `\w+\.showForm(`.
- ExecuteExpression runtime eval (chỉ hiện chuỗi khai báo).

---

## 4. Current state (gaps)

| # | Có sẵn | Thiếu |
|---|--------|--------|
| 11 | `ResponseActionSymbol` từ response/action nodes | Không map `request('a','b')` → action / case; không hit-test string literal trong script |
| 12 | `FindReferences` **chỉ Entity** đầy đủ; non-entity = definition only; Shift+F12 mở Symbol Info panel | Call-site scan cho `ScriptFunctionSymbol`; UI list refs |
| 13–14 | Không | Parser `g.$a = { prop: '…' }`; nav + hover value |
| 15 | `ControllerRelatedFileResolver` showForm → **chỉ** `RelatedKind.Filter` | User cần Filter **và** Lookup/Grid theo prefix `SVOrder*`; Ctrl+Click tại literal |

---

## 5. Design

### 5.1 Pipeline Ctrl+Click (mở rộng)

```text
offset
  → EntityHit?          (Phase 1)
  → StructuralNavHit?   (Phase 2)
  → JsRuntimeNavHit?    (Phase 3)  ← mới
  → Status miss
```

### 5.2 API LS

```text
JsRuntimeNavHit? ResolveJsRuntimeAtSourceOffset(ErpDocumentId id, int offset)
IReadOnlyList<NavigationTarget> FindScriptFunctionReferences(documentId, symbolId | functionName)
JsDollarAIndex BuildDollarAIndex(source script text)  // props: name → (defOffset, value)
IReadOnlyList<string> ResolveShowFormRelatedPaths(controllersPath, formName)
```

`JsRuntimeNavHit.Kind`:

| Kind | Navigate |
|------|----------|
| `RequestAction` | GoTo `response`/`action` name = arg1 (SymbolId `response:…` / action) |
| `RequestResponseCase` | Offset của `case 'arg2'` trong handler `on$…$ResponseComplete` (scan script; exact string) |
| `ScriptFunctionRefs` | Không nhảy một chỗ — host mở list refs (Kind riêng hoặc flag) |
| `DollarAProperty` | Offset property trong object `g.$a` |
| `ShowFormRelated` | Danh sách AbsolutePath mở multi-tab |

**Ctrl+Click trên `function foo` định nghĩa:** Kind=`ScriptFunctionRefs` (FindRefs).  
**Ctrl+Click trên chỗ gọi `foo(`:** có thể GoTo definition (đã có Phase 2/F12) — Phase 3 không bắt buộc đổi.

### 5.3 request / ResponseComplete (#11)

Patterns (script ClearText hoặc source trong script island):

```js
o.parentForm.request('Customer', 'Customer', …)
o.grid.request(o, 'Item', 'Item', …)   // lưu ý: grid.request signature khác — arg action/context theo FBO
```

**Chốt mapping theo user:**

- **Var1 (action name):** tìm `<action name="…">` hoặc node response/action tương ứng trong XML (`ResponseActionSymbol` / action element).  
- **Var2 (context):** tìm trong `function on$Voucher$ResponseComplete` / `on$GridVoucherDetail$ResponseComplete` (và biến thể `on$…$ResponseComplete`) một `case 'Var2':` hoặc `case "Var2":` **khớp exact**.

Hit zone: string literal chứa offset (arg position 1 vs 2). Phân biệt:

- `form.request(action, context, …)` — positional.
- `grid.request(sender, action, context, …)` — action=arg2, context=arg3 (theo ví dụ user).

Document signature table trong plan; unit test cả hai.

**Không** sửa typo; nếu không có `case 'Cusomter'` trong source → Status “Không tìm thấy case …”.

### 5.4 Find references function (#12)

1. Khi Ctrl+Click identifier tại **dòng định nghĩa** `function Name` → thu thập call sites trong document:
   - Regex/scanner: `\bName\s*\(` ngoài chính definition; loại comment thô nếu dễ.
2. Gắn `SymbolReference`-like list → `NavigationTarget[]`.
3. UI: reuse Symbol Info / Problems-style list (panel Right `SymbolInfo`) — hiển thị path+line; click → NavigateToOffset. Nếu SymbolInfo chưa nhận list động: mở rộng `SymbolInfoViewModel` API tối thiểu **hoặc** Status + peek first ref + “N references” (ưu tiên list panel).

Phạm vi Phase 3: **document hiện tại**. Related controller files = backlog (roadmap open point).

Mở rộng `ErpNavigationService.FindReferences` cho `ScriptFunctionSymbol` (không chỉ Entity) — đúng hướng Future Extension trong symbol-navigation.md.

### 5.5 g.$a (#13–14)

Scan script islands cho:

```js
g.$a = { … }
```

Property: `name:` hoặc `'name':` / `"name":` → value tới dấu phẩy/hết (string `'…'` hoặc expression).

- Ctrl+Click `g.$a.gia2` hoặc `g.$a['gia2']` → offset key trong object.
- Hover cùng hit → hiện value (reuse Phase 1 Content Widget / `showEntityHover` generic rename `showCodeHover` **hoặc** cùng command với title `g.$a.gia2`).

Index rebuild khi document reparse (cùng lifecycle binder/nav map).

### 5.6 showForm (#15)

User example `SVOrderFilter` → files:

- `Filter/SVOrderFilter.xml`, `Filter/SVOrderMultiForm.xml`
- `Grid/SVOrderMultiGrid.xml`
- `Lookup/SVOrderFilter.xml`

**Rule Phase 3:**

1. Lấy literal name `N` từ `showForm('N')`.
2. Prefix = `N` nếu không có suffix chung; **hoặc** strip trailing known tokens (`Filter`, `Form`, `Grid`, `Lookup`, `MultiForm`, `MultiGrid`) để lấy stem `SVOrder` — chốt trong plan bằng heuristic:

```text
stem = strip_suffix(N, Filter|Form|Grid|Lookup|MultiForm|MultiGrid|Multi…)
search = files under Controllers/{Filter,Lookup,Grid}/ where FileNameWithoutExtension starts with stem
         OR equals N OR starts with N
```

3. Mở **tất cả** match (cap ≤ 12 tab); Status liệt kê. Không match → Status.

Khác `ControllerRelatedFileResolver` (chỉ Filter đúng tên): Phase 3 thêm `ShowFormRelatedPathResolver` riêng; có thể gọi kèm related Filter exact name.

### 5.7 Architecture

```text
Monaco Ctrl+Click/Hover (offset)
  → FormBuilderViewModel chain
  → JsRuntimeAtOffsetResolver (Application)
  → Navigate / Open multi / SymbolInfo refs / Hover widget
```

Không eval JS; không parse XML trong UI.

---

## 6. Testing

| Test | Nội dung |
|------|----------|
| Unit | request form vs grid positional → action / case offsets |
| Unit | case miss (typo) → null |
| Unit | FindScriptFunctionReferences tìm call sites, bỏ definition |
| Unit | DollarA index prop + value |
| Unit | showForm stem → multi paths trong temp Controllers tree |
| Manual | Ctrl+Click/hover trên form script thật |

---

## 7. Risks

| Risk | Mitigation |
|------|------------|
| JS regex brittle | Giới hạn trong script islands; fixture từ user samples; không full ES parser |
| grid.request arity | Bảng signature + tests |
| Mở quá nhiều tab showForm | Cap 12 + Status |
| FindRefs noise (substring) | Word-boundary `\bName\s*\(` |
| Hover conflict entity widget | Cùng widget host; title phân biệt |

---

## 8. Success criteria

- [ ] request arg1/arg2 navigate đúng action / case (exact).
- [ ] Ctrl+Click function def → list/navigate refs trong document.
- [ ] `$a.prop` GoTo + hover value.
- [ ] showForm mở multi file Filter/Lookup/Grid theo stem.
- [ ] Entity/structural Phase 1–2 không regress.
- [ ] Build + Application tests xanh.
