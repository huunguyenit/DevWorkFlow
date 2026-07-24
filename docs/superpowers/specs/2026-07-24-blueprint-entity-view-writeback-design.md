# Blueprint Layout Write-Back vào Entity (Design Spec) — v2

Date: 2026-07-24  
Status: Approved — **hướng 2** + **hybrid column/token ownership** (bắt buộc luôn cho thao tác)  
Implement: `docs/superpowers/plans/2026-07-24-blueprint-entity-view-writeback.md`  
Related: ADR-0006, P6 Blueprint, Explorer search, Toolbox selection

---

## 1. Goal

Blueprint **luôn** cho thao tác view (drop/add control, spare, merge, split, resize) — **không quan tâm** view có bao nhiêu `&Entity;` hay entity gì.

Khi commit: **cột / đoạn pattern / token thuộc entity nào → ghi đúng file entity đó**; phần inline → ghi Dir. **Không** inline ClearText vào Dir (không nhân đôi hàng).

---

## 2. Vì sao `<item value="1100: [&k;].Label, [&k;]" />` cũng bị chặn?

Guard cũ/`CanCommitLayout` theo kiểu “view còn **bất kỳ** custom entity ref” → coi cả item là entity-view:

- `[&k;].Label` / `[&k;]` chứa `&k;` → detect entity → **block hoặc ép writeback cả hàng sai chỗ**.
- Merge/split/add control Fail hoặc không ghi đúng entity `k`.

**Sai:** coi “có entity ở đâu đó trong item” = không sửa được.  
**Đúng:** item là **chuỗi lai** (inline + entity); thao tác trên model ClearText luôn được; commit **phân mảnh** theo ownership.

---

## 3. Decisions (chốt — không hỏi lại)

| Chủ đề | Quyết định |
|--------|------------|
| Cho phép thao tác | **Luôn** (drop, spare, merge, split, resize) — kể cả view full-entity / hybrid / chỉ `[&k;]` |
| Số lượng / loại entity | **Không chặn** |
| Ghi | Ownership theo **cột pattern** và **token control**; mỗi entity file nhận phần của nó |
| Materialize vào Dir (hướng 1) | Không làm default |
| Mosaic | **Phải hỗ trợ** hybrid trong một `item` (không Fail chỉ vì >1 entity) |

---

## 4. Mô hình ownership (SoT thao tác)

Model Design luôn làm việc trên **ClearText đã expand** (pattern đầy đủ `1/0/-`, control `[field]…`).

Raw Dir/entity giữ `&x;`, `&y;`, `&k;`.

### 4.1 Hai trục entity trong một `item value`

1. **Pattern entity** — entity nằm trong **nửa pattern** (trước `:`), vd. `110&x;` với `&x;="0-1"`.
2. **Control entity** — entity nằm trong **token control** (sau `:`), vd. `[&k;].Label` với `&k;` = tên field hoặc fragment control.

Một item có thể có cả hai.

### 4.2 Ví dụ Hybrid (pattern)

```text
Raw:     110&x;: [&k;].Label, [&k;]
&x; =    "0-1"
Expand:  1100-1: …     → 5 cột pattern: 1,1,0,0,-1  (tuỳ FBO; user: form 5 cột)
         ^^^ ^^
         inline  entity &x;
```

User nói: **3 cột inline + phần entity** (ownership theo vị trí cột trong pattern đã expand).

| Thao tác | Pattern ClearText (ý) | Cập nhật |
|----------|----------------------|----------|
| Merge thêm 1 cột (vào vùng entity) | … | `&x;` đổi `"0-1"` → `"001"` (ví dụ user) |
| Split giảm 1 | | `&x;` → `"0-1"` / `"--1"` / … |
| Split đến biên inline\|entity | phần inline có thể thành `11-` + `&x;` vẫn `"--1"` | Ghi **cả** Dir (đổi prefix inline) **và** entity `&x;` |

**Quy tắc:** cột thuộc span expand của `&x;` → chỉ serialize lại **value của `&x;`**; cột thuộc literal trong Dir → sửa literal trên Dir; **không** thay cả item bằng ClearText full.

### 4.3 Ví dụ Inline thuần

```text
1100-1: [&k;].Label, [&k;]
```

- Pattern literal → ghi Dir.
- `[&k;]` vẫn là control-entity → field name / control text thuộc entity `k` nếu `k` resolve ra field id trong entity file; **hoặc** `k` chỉ là field name entity-encoded — Writer phải giữ `&k;` trong control part, không thay bằng tên ClearText nếu Raw dùng entity.

### 4.4 Ví dụ Entity pattern thuần

```text
Raw:     &y;: [&k;].Label, [&k;]
&y; =    "1100-1"
```

Mọi thay đổi pattern (merge/split cột) → cập nhật **chỉ** `&y;` (vd. `"110001"`, `"1100-1"`, `"110--1"`, `"11---1"`). Dir item giữ `&y;: [&k;].Label, [&k;]`.

### 4.5 Control token `[&k;]`

- Expand ClearText có thể thành `[ma_kh]` (hoặc giữ tên qua entity).
- Commit: phần control list **giữ** `[&k;].Label, [&k;]` trên Dir nếu Raw dùng entity; nếu merge/split **không** đổi tên field entity thì không đụng file `k` trừ khi đổi cấu trúc nằm trong value của `k`.
- Add control mới (TextBox…) vào cột **inline** → thêm token literal `[text_1]` trên Dir (hoặc đúng ownership cột).
- Add control vào cột thuộc entity pattern → cập nhật entity chứa pattern/controls tương ứng.

### 4.6 Thuật toán commit (ý)

```text
1. BaselineRawItem  = raw item string (có &entity;)
2. BaselineExpand   = ClearText trước mutate (từ projection)
3. NewExpand        = pattern + controls sau Engine mutate
4. Diff theo cột / theo segment entity trong raw:
     - Với mỗi &E; trong pattern: tính substring ClearText thuộc E (cùng độ dài cột với value E)
       → new_value_E = map NewExpand columns trong span đó → pattern chars
       → UpdateEntityValue(E, new_value_E)  // chỉ pattern fragment, hoặc full entity file nếu E là cả item
     - Literal prefix/suffix pattern trên Dir → rewrite raw item giữ &E; refs
     - Control list: giữ &refs; đã có; append/remove literal tokens theo cột ownership
5. Không bao giờ WriteLayout(Dir) bằng full ClearText items khi item còn &entity;
```

**Spare:** luôn cho thả; materialize row theo ownership cột đích (inline → Dir item mới hoặc entity chứa rows).

---

## 5. Anti-patterns (cấm)

- Block merge/split/drop chỉ vì item có `&…;`.
- `ApplyLayout(Dir)` thay toàn bộ item bằng `"1100-1: [ma_kh].Label, …"` trong khi Raw còn `&x;`/`&k;` → phantom.
- Chỉ hỗ trợ “một entity cả view” — **thiếu** hybrid/`[&k;]`.
- Fail mosaic “nhiều entity” — phải patch từng entity.

---

## 6. UX kèm theo (cùng milestone docs cho Claude)

### 6.1 Toolbox — highlight control đang chọn

Khi user **chọn** (click, chưa nhất thiết drag) một `ToolboxItemVm` trong palette:

- Highlight rõ item đang chọn (background/border theme).
- Bỏ highlight item trước.
- Drag vẫn dùng broker như hiện tại; selection visual độc lập hover.

### 6.2 Explorer search — bug tái lọc

**Repro:**

1. Search `Customer.xml` → hiện `Dir/Customer.xml` (OK).
2. Đổi search thành `item` → thấy `Grid/Item`, **Dir (hidden)**, **Filter (hidden)** — **FAIL**.
3. Thực tế `Item` tồn tại ở **Dir** và **Filter** (và có thể Grid).

**Yêu cầu:** mỗi lần search mới = filter độc lập trên **toàn bộ** nguồn (FS search hits), không kế thừa `_search_keep` / cache nhánh từ lần search trước theo cách làm **ẩn** folder có file match. Dir/Filter phải **hiện** nếu có `Item.xml` (hoặc tên khớp) bên trong.

**Hướng fix (gợi ý):**

- `ApplyTreeFilterAsync`: trước search mới, `ClearSearchFilter()` đầy đủ (nodes/cache search state).
- `ApplySearchMatchesAsync`: không để ancestor “mồ côi” từ query cũ; `empty_hides_all` chỉ khi query hiện tại 0 hit.
- Đảm bảo hits từ `SearchAsync("item")` gồm `Dir/Item.xml`, `Filter/Item.xml`, `Grid/Item.xml` nếu tồn tại — rồi stitch path cho **mọi** hit (không drop Dir vì lần trước chỉ mở nhánh Customer).

---

## 7. Acceptance

1. Item `1100: [&k;].Label, [&k;]` — merge/split/drop **không** bị chặn; Raw giữ `&k;` nếu trước đó dùng entity.
2. Hybrid `110&x;: …` — merge/split đổi đúng value `&x;` theo ví dụ cột; literal `110` trên Dir khi cần.
3. Entity pattern `&y;: …` — chỉ file/value `y` đổi (`110001`, `110--1`, …).
4. Spare + add control luôn được.
5. Toolbox click control → highlight selection.
6. Explorer: search `Customer` rồi `item` → Dir/Filter/Grid Item hiện đúng, không folder ẩn sai.
7. Tests: hybrid pattern entity update; `[&k;]` không hard-block; explorer filter reset (nếu có unit/harness).

---

## 8. Non-goals

- ADR-0006 full Serializer.
- Auto materialize toàn view vào Dir.
- Đổi Left Panel chrome (chỉ sửa logic search tree).
