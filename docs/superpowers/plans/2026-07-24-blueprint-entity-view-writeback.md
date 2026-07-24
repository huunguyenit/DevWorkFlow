# Blueprint Entity View Write-Back + Explorer/Toolbox (Implement Plan) — v2

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or executing-plans. Checkbox tracking.

**Spec (SoT):** [`docs/superpowers/specs/2026-07-24-blueprint-entity-view-writeback-design.md`](../specs/2026-07-24-blueprint-entity-view-writeback-design.md) **v2**

**Goal:** Luôn cho thao tác Blueprint trên view có entity (kể cả `[&k;]`, hybrid `110&x;`). Commit theo **ownership cột/token** → cập nhật đúng entity. Thêm: Toolbox highlight selection; sửa Explorer search bị ẩn Dir/Filter khi đổi keyword.

**Không:** hard-block vì “có entity”; không inline ClearText vào Dir; không Fail chỉ vì mosaic nhiều entity.

---

## Global Constraints

- Spec v2 > plan cũ v1 / code writeback hiện tại nếu lệch
- `snake_case`; không sửa `.cursor/plans/*`; không commit trừ khi được hỏi
- Left Panel: **được** sửa logic search (bug); không đổi layout chrome Explorer

---

## Task A — Bỏ chặn `[&k;]` / mọi entity trong item; luôn cho mutate

**Vì sao bị chặn:** detect “bất kỳ `&…;` trong item/view” → `CanCommitLayout` / guard coi cả hàng không ghi được hoặc writeback sai.

- [ ] Mọi đường `CommitLayoutMutation` / `CommitLayoutWrite`: **không** Fail chỉ vì item chứa `&k;` / `&x;` / `&UnitViews;`
- [ ] Engine merge/split/drop/spare chạy trên ClearText model như view thuần
- [ ] Test: fixture `item value="1100: [&k;].Label, [&k;]"` → Merge/Split/Place **Ok** (không StatusMessage block)

---

## Task B — Ownership hybrid: ghi đúng entity theo cột / pattern

Implement serializer commit theo Spec §4 (ví dụ user là SoT hành vi).

### B1. Pattern entity (`110&x;` / `&y;`)

- [ ] Parse raw item → segments: literal chars + `&Entity;` spans
- [ ] Map mỗi segment → số cột ClearText (= độ dài value entity sau expand, hoặc độ dài literal)
- [ ] Sau mutate: với mỗi entity pattern `E`, `new_value =` chuỗi pattern chars thuộc span cột của E (vd. `"0-1"` → `"001"` → `"--1"` … theo merge/split)
- [ ] `UpdateEntityValue` / ghi file `E` **chỉ** phần value pattern (hoặc file nếu entity = cả pattern string)
- [ ] Rewrite raw Dir item: giữ `&E;`, cập nhật literal xung quanh nếu split cắt vào vùng inline (`110&x;` → `11-&x;` + `&x;="--1"`)

### B2. Control entity (`[&k;]`)

- [ ] Giữ `&k;` trên Dir khi Raw dùng entity; không thay bằng field ClearText trong Raw Dir
- [ ] Add control mới: token literal hoặc entity tùy cột ownership

### B3. Tests bắt buộc (bảng user)

| Case | Assert |
|------|--------|
| Hybrid merge vào vùng `&x;` | `&x;` value đổi đúng; Dir vẫn `110&x;` (hoặc literal đổi đúng khi cắt biên) |
| Entity `&y;` split nhiều lần | value `y` lần lượt như spec ví dụ |
| `[&k;]` only | không block; Raw giữ `&k;` |

---

## Task C — Spare + add control luôn bật

- [ ] Spare (chỉ hiện khi toolbox-drag nếu đã làm P6 B) vẫn cho drop trên view entity
- [ ] `CreateFieldAndInsert` / Place không bị writeback Fail sớm

---

## Task D — Toolbox highlight khi chọn control

**Files:** `ToolboxPanel.xaml` / `ToolboxViewModel`

- [ ] Click item palette → `SelectedControl` / `IsSelected` trên `ToolboxItemVm`
- [ ] Style highlight (border/background); clear khi chọn item khác hoặc bắt đầu drag item khác
- [ ] Không đổi Left Panel layout ngoài list Toolbox

---

## Task E — Explorer search: đổi keyword không ẩn Dir/Filter nhầm

**Repro:** search `Customer.xml` → OK; search `item` → Grid/Item hiện, Dir/Filter **hidden** dù có Item.xml.

**Files:** `ProjectExplorerViewModel.ApplyTreeFilterAsync`, `VirtualTreeEngine.ApplySearchMatchesAsync` / `ClearSearchFilter`

- [ ] Mỗi lần filter text đổi: **clear** search state cũ trước khi apply hits mới
- [ ] Mọi hit path (`Dir/Item`, `Filter/Item`, `Grid/Item`) được stitch + keep visible
- [ ] Không tái sử dụng `_search_keep` từ query Customer làm “khung” che Dir
- [ ] Test hoặc manual checklist trong CURRENT_STATE

---

## Task F — CURRENT_STATE

- [ ] Ghi v2 ownership hybrid; hết “block vì có entity”
- [ ] Ghi Toolbox highlight + Explorer search fix

```bash
dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~EntityViewWriteback|CanCommitLayout|SplitBarrier"
dotnet test tests/DevWorkFlow.Tree.Tests --filter "FullyQualifiedName~Search|Filter" 
```

(Thêm test Tree nếu chưa có case đổi keyword.)

---

## Exit

- [ ] `[&k;]` / hybrid / `&y;` — thao tác luôn được; commit đúng file entity theo cột
- [ ] Không phantom row
- [ ] Toolbox selection highlight
- [ ] Explorer search `Customer` → `item` hiện đủ Dir/Filter/Grid

---

## Prompt giao Claude

```text
Update implementation to Spec v2:
docs/superpowers/specs/2026-07-24-blueprint-entity-view-writeback-design.md
Plan: docs/superpowers/plans/2026-07-24-blueprint-entity-view-writeback.md

CRITICAL rule change:
- NEVER block merge/split/drop because item has &entity; (including [&k;].Label).
- ALWAYS allow Blueprint ops + spare.
- On commit: columns/tokens owned by an entity update THAT entity (hybrid 110&x;, pure &y;, control [&k;]). Examples in Spec §4 are SoT.
- Do NOT ApplyLayout full ClearText into Dir while raw still has &refs;.

Also:
- Toolbox: highlight selected control on click.
- Explorer: fix search — after searching Customer.xml, searching "item" must show Dir/Item and Filter/Item (not hide those folders). Reset search state each query.

No auto-inline entities into Dir. No commit unless asked. snake_case.
```
