# Phase 5 — SQL tooling (Execute selection / information→SQL / ALTER object / options snippet)

Date: 2026-07-23  
Status: Ready for planning  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 5, #5 #9 #16 #17)  
Depends on: SQL Studio (`SqlDocumentViewModel`, `ISqlScriptRunner`), Program connections (App/Sys),  
`DatabaseObjectScripter` / `object_definition.sql`, Form Source Monaco selection  
Related: ADR-0001/R1, `FboSqlFragmentExtractor`, `AppConnectionResolver`, open question roadmap `%l`

---

## 1. Goal

| # | Gesture | Kết quả |
|---|---------|---------|
| 5 | Form **Source** + SelectedScript → F5 / nút **Thực thi** | Mở (reuse) tab SQL, set script = selection, target **app** hoặc **sys**, **auto-execute** |
| 5b | Source + SelectedScript → nút **SQL** | Mở tab SQL với selection, **không** auto-execute |
| 9 | Ctrl+Click `item@information` (kèm `key` / ghi chú `check`) | Sinh `SELECT` → mở tab SQL (không auto-run) |
| 16 | Ctrl+Click tên proc/function trong thẻ/CDATA SQL | Lấy definition DB → tab `ALTER PROCEDURE` / `ALTER FUNCTION` |
| 17 | Gõ pattern `options.name=… and val = …` + Tab | Expand `SELECT * FROM options WHERE …` (SQL Studio **và** SQL island trên Form Source) |

**Done when:** bốn hạng mục hoạt động trên editor SQL/Monaco tương ứng; parse/build SQL không hard-code trong UI (Application SoT).

---

## 2. Decisions (brainstorm)

| Chủ đề | Chốt |
|--------|------|
| Scope | **A** — cả #5, #9, #16, #17 trong một mini-spec |
| #5 | Source + selection: F5/Thực thi execute; nút SQL mở tab; default DB **app**; **sys** khi `(dir\|grid\|lookup)@database="Sys"` |
| #5 kết quả F5 | Mở tab SQL + preselect target + auto-execute (reuse `SqlDocumentViewModel`, không invent result grid trên Form) |
| `%l` (#9) | **B** — luôn sinh đủ cột locale (`ten_tk` + `ten_tk2`); comment ghi `%l`; không cắt theo locale UI |
| #16 | **A** — definition qua DB (`object_definition.sql` / scripter), không skeleton rỗng |
| #17 | **C** — SQL Studio và vùng SQL Form Source |
| Kiến trúc | **2** — Application builders/resolvers + UI host mỏng |

---

## 3. In scope

- Bind/ensure `SelectedScript` trên Form Source Monaco.
- Resolve controller database kind (App vs Sys) từ root attribute.
- `InformationSqlBuilder` từ `information` + `key` (+ comment `check`).
- Hit-test Ctrl+Click `information` attribute và SQL object name trong SQL islands.
- Wire ALTER object qua connection đúng + existing scripter/SQL templates.
- `OptionsSnippetExpander` + Monaco snippet/completion Tab ở hai ngữ cảnh SQL.
- F5 / Thực thi / SQL button trên Form Source khi có selection.

## 4. Out of scope

- Phase 4 JS catalog (agent khác).
- P6-14…P6-17 (format, explain, result→editor, snippet catalog rộng).
- Execute selection ở Insight/Designer.
- Cắt cột `%l` theo Việt/Anh UI.
- Đưa `check` vào mệnh đề `WHERE` của SELECT (chỉ comment).
- Sửa hành vi `OpenSqlFromForm` extract-all khi **không** có selection (giữ nguyên).

---

## 5. Design

### 5.1 Architecture

```text
Form Source Monaco
  selection → SelectedScript
  F5 / Thực thi → OpenSqlDocument(selection, target, execute: true)
  nút SQL        → OpenSqlDocument(selection, target, execute: false)

Ctrl+Click information
  → LS/Application InformationSqlBuilder
  → OpenSqlDocument(sql, execute: false)

Ctrl+Click proc/function in SQL island
  → resolve name → DatabaseObjectScripter / object_definition
  → OpenSqlDocument(alterScript, execute: false)

Tab on options pattern
  → OptionsSnippetExpander → replace text in editor
```

UI không parse `information=` / options pattern bằng logic nghiệp vụ rải View; gọi Application.

### 5.2 Controller database kind (#5 / #16 connection)

```text
ControllerDatabaseKind Resolve(document root):
  attribute database on dir|grid|lookup
  if equals "Sys" (OrdinalIgnoreCase) → Sys
  else → App
```

Map sang connection string Program: Sys connection vs App (database app hiện tại) — cùng cách `SqlDocumentViewModel` / `AppConnectionResolver` đang dựng targets.

### 5.3 #5 Execute / nút SQL

| Điều kiện | Hành vi |
|-----------|---------|
| Source + non-empty SelectedScript | F5 / Thực thi enabled; nút SQL “mở selection” enabled |
| Insight / no selection | F5 execute-selection disabled trên Form |
| F5 | Open/reuse SQL tab: ScriptText=selection, SelectedTarget=App\|Sys, Execute once |
| Nút SQL | Open/reuse SQL tab: ScriptText=selection, set target, **no** execute |
| No Program / no CS | Status error; không crash |

Reuse navigator `OpenBuffer` / `MainViewModel.OpenSqlDocument` — mở rộng API nếu cần flag `executeAfterOpen` + `preferredTargetKind`.

### 5.4 #9 information → SELECT

**Format `information`:** `code$table.display` với optional suffix `%l` trên `display`.

Ví dụ corpus: `tk$dmtk.ten_tk%l`, `ma_kho$dmkho.ten_kho%l`.

**Algorithm:**

1. Split lần đầu `$` → `code` | `rest`.
2. Split `rest` lần đầu `.` → `table` | `displayRaw`.
3. Nếu `displayRaw` ends with `%l` → `display = trimSuffix`, `hasLocale = true`.
4. Columns:
   - always: `code`, `display`
   - if `hasLocale` and `display` does not already end with `2`: add `display + "2"`
5. `WHERE` = raw `key` attribute if present and non-empty.
6. Prefixed comment lines: original `information=…`; if `check` present → `-- check: …`.

**Hit zone:** Ctrl+Click trên attribute `information` (value) của `items` / tương đương — structural/attribute offset resolver (Application), sau entity miss hoặc song song chain Form Ctrl+Click.

### 5.5 #16 ALTER object

1. Caret trong SQL island (`command`/`query` CDATA hoặc text SQL đã nhận diện — tái sử dụng / mở rộng locator gần `FboSqlFragmentExtractor` ranges).
2. Identifier tại offset (`schema.name` hoặc `name` → schema `dbo`).
3. Phân loại Function vs Procedure: thử scripter theo kind từ catalog actions; hoặc query metadata một lần — **chốt plan:** ưu tiên Procedure rồi Function nếu definition trống (hoặc ngược lại theo hit rate corpus); Status nếu cả hai fail.
4. Connection = §5.2.
5. Body từ `object_definition.sql` path hiện có (click ALTER=1).

### 5.6 #17 options snippet

**Match** (flexible whitespace, quotes `'…'` or `"…"`):

```text
options.name = '…' and val = '…'
```

**Replace with:**

```sql
SELECT * FROM options WHERE name = '…' and val = '…'
```

Preserve quote style / values. Application `OptionsSnippetExpander.TryExpand(lineOrSelection) → string?`.

Monaco: snippet hoặc completion item khi pattern match; register trên SQL language document **và** Form Source khi caret trong SQL island (host hỏi Application “có expand được không”).

---

## 6. Testing

| Test | Nội dung |
|------|----------|
| Unit | `ControllerDatabaseKind` Sys vs App |
| Unit | `InformationSqlBuilder` — `%l` đủ 3 cột; không `%l` 2 cột; bad format null; key/check comment |
| Unit | `OptionsSnippetExpander` — happy path, whitespace, no match |
| Unit | SQL object identifier extract at offset |
| Manual | Source F5 / nút SQL; Sys database attribute; information click; ALTER với DB; snippet hai chỗ |

---

## 7. Risks

| Risk | Mitigation |
|------|------------|
| F5 Form vs F5 SQL Studio command routing | CanExecute theo ActiveContent; Form chỉ khi Source+selection |
| Scripter nằm UI (`DatabaseObjectScripter`) | Phase 5 gọi từ VM/host; extract port Application nếu cần test thuần — plan chọn: facade Application bọc hoặc gọi Infrastructure abstraction đã có |
| SQL island detect sai | Fail closed; unit trên fixture command/query |
| Proc vs Function nhầm | Fallback kind + Status |
| Snippet nuốt text không phải options | Match neo đầu/cuối token `options.name` |

---

## 8. Success criteria

- [ ] Source + selection: F5 execute (tab SQL + auto-run), nút SQL mở tab; app/Sys đúng `@database`.
- [ ] Ctrl+Click `information` → SELECT đúng builder (`%l` đủ cột + comment).
- [ ] Ctrl+Click SQL object → ALTER definition từ DB.
- [ ] Options snippet Tab ở SQL Studio và Form Source SQL island.
- [ ] Application tests + `dotnet build DevWorkFlow.slnx` xanh.
- [ ] UI không chứa SoT parse `information` / options.

---

## 9. Handoff

Sau approve spec → `writing-plans` →  
`docs/superpowers/plans/2026-07-23-editor-phase5-sql-tooling.md`.  
Cập nhật roadmap parent trỏ artifact này; đóng open question `%l` theo quyết định B.
