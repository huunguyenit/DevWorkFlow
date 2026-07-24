# Layout Blueprint P6 — Toolbox FBO + Layout UX (Design Spec)

Date: 2026-07-24  
Status: Approved — implement: `docs/superpowers/plans/2026-07-24-layout-blueprint-p6-toolbox-fbo-ux.md`  
Parent: `docs/superpowers/specs/2026-07-23-layout-blueprint-designer-design.md` (P0–P5 landed)  
Related: ADR-0009, `.ai/CURRENT_STATE.md`, `FormViewLayout`, `FboXmlWriter`, Design HTML Generator

---

## 1. Goal

Hoàn thiện vòng **Toolbox → Slot** theo đúng semantics FBO và sửa UX Blueprint còn lệch:

1. Palette control FBO **khai báo config** (không list field XML trong Toolbox).
2. Thả control → tạo `<field>` đúng type/items + Place ô view theo ưu tiên I → L → D.
3. Remove field khỏi view **và** XML.
4. Tab 4 loại (Normal / Grid / Post / List) với properties **trước** khi add.
5. Blueprint: spare row visible, **ẩn hẳn hàng hidden-only**, `split` = biên cứng merge, resize/merge gesture mới, chrome split/anchor, Ctrl+Click → Source.

---

## 2. Scope

### In scope (P6)

| Nhóm | Nội dung |
|------|----------|
| Catalog | `UI/Config/xml/toolbox-controls.xml` + parser Application; bỏ FIELDS khỏi Toolbox |
| Theme | `UI/Config/json/blueprint-theme.json` (màu guide/split/anchor/…) |
| CreateField | TextBox-family + AutoComplete(+ref) + Lookup + ComboBox; PlaceFieldParts |
| Remove | Clear mọi ô + xóa `<field>` (+ ref AutoComplete); Delete key |
| Tabs | 4 control + dialog pre-add + `+` trên tab bar |
| Spare | Luôn +1 hàng Empty **visible** (main / footer / category Normal) |
| Hidden | Blueprint **ẩn hẳn** hàng toàn cell `@hidden` (phương án A) |
| Split barrier | Cấm merge / Place span qua `view@split` |
| Gestures | Resize cột chỉ mép trên; merge/split kéo mép ô; kéo dọc region; kéo ngang form |
| Chrome | Line `split` khác màu; icon mỏ neo `anchor` |
| Selection | Click Design không đổi mode; Ctrl+Click → Source tại field |
| Property | Đổi Property Grid → XML (regression đường hiện có) |

### Out of scope (non-goals)

- Undo/Redo Design Command **đầy đủ** (stack lịch sử lớn)
- Replace-on-drop đè control khác
- ADR-0006 Semantic Serializer (vẫn Adapter `FboXmlWriter`)
- Đổi Left Panel chrome (chỉ nội dung list Toolbox)
- **Đổi tên field** từ Property Grid (backlog riêng — G3)
- Mode “edit layout hàng hidden”

### P6+ (không chặn exit)

G1 Ghost L+I · G2 Undo 1 bước XmlSource · G4 Highlight spare · G5 Deep-link Grid companion — chi tiết trong plan § Gợi ý.

---

## 3. Decisions (chốt — không hỏi lại)

| Chủ đề | Quyết định |
|--------|------------|
| Lookup | `items@style="Lookup"` (chọn nhiều) |
| AutoComplete | `items@style="AutoComplete"` (chọn 1) + 1 field reference |
| Remove | Gỡ view **và** xóa `<field>`; AutoComplete xóa luôn ref |
| Place | Ưu tiên `[x]` → `[x].Label` → `[x].Description`; 1 ô trống → chỉ `[x]` |
| Config | Controls = XML; màu Blueprint = JSON |
| FIELDS Toolbox | **Xóa** — không đưa field XML vào Toolbox |
| Label standalone | Không có trong palette (Label = ô `.Label` của field) |
| Blueprint hàng hidden | **(A) ẩn hẳn hàng** hidden-only; XML/model giữ nguyên |
| `view@split` | Biên cứng: **cấm** merge / Place qua điểm split |
| `view@anchor` | Indicator icon mỏ neo trên cột; nghĩa FBO giữ width khi phóng form |
| Tab properties | Xác định **trước** add (dialog); không đổi `tabKind` sau khi tạo |
| Scope | Một milestone P6 full |

---

## 4. Control → FBO map (SoT)

| Control | Field defaults | View khi thả |
|---------|----------------|--------------|
| TextBox | `type` String (hoặc omit) | Place I→L→D |
| DateTime | `type="DateTime"` `dataFormatString="@dateTimeFormat"` | như TextBox |
| Numeric | `type="Decimal"` `dataFormatString=""` | như TextBox |
| CheckBox | `type="Boolean"` `<items style="Checkbox"/>` | như TextBox |
| ComboBox | `<items style="DropDownList"/>` | như TextBox |
| AutoComplete | `<items style="AutoComplete" reference="ten_…%l"/>` + field ref `readOnly` | Place main I(+L); **ref không auto-place** |
| Lookup | `<items style="Lookup"/>` (controller/key trống — Property Grid) | như TextBox |
| TabNormal / TabGrid / TabPost / TabList | `AddCategory` + seed (Grid/Post/List = field `items@style`) | Dialog trước commit |

**AutoComplete naming:** main `{prefix}_{n}` (vd. `ac_1`); ref `ten_{prefix}_{n}`; `items@reference="ten_ac_1%l"`.

**PlaceFieldParts:** từ slot đích sang **phải cùng hàng**, chỉ ô Empty; không đủ chỗ cho Input → Fail; không đổi số cột Region.

---

## 5. Hidden rows (Blueprint)

```text
field@hidden = true  →  không hiện trên UI FBO runtime
                      →  vẫn được khai báo trong <fields> + có thể có token trong view
                      →  nhiệm vụ: lưu trữ / xử lý ẩn
```

### Quy tắc Design HTML

1. Cell **hidden** ⇔ `Kind != Empty` ∧ `FindField(name)?.Hidden == true`. Empty ≠ hidden.
2. Hàng **hidden-only** ⇔ mọi cell Empty hoặc hidden → **không emit** `<tr>`, không `data-dwf-slot`.
3. Hàng **hỗn hợp** → vẫn render; ô hidden không phải drop target; không Place vào field hidden.
4. Save/Writer **không** xóa hàng/token hidden chỉ vì Design ẩn chúng.

### Spare row

- Chỉ xét hàng **visible**.
- Invariant: main / footer / category Normal luôn có đúng **một** hàng cuối visible toàn Empty (nếu thiếu thì append; nếu đã có thì không append thêm → tránh duplicate).
- Category Grid/Post/List (seed đặc biệt): **không** ép spare form row.

### Bug liên quan (phải hết sau P6)

- Drop control → **không** duplicate dòng.
- Spare không lấy hàng hidden-only làm “hàng cuối”.

---

## 6. Split barrier + Merge

### `view@split` (1-based FBO)

- Cột `1..split` = table trái; `split+1..end` = table phải.
- Biên cứng tại cột index 0-based = `split` (cột đầu bên phải).

**Cấm:**

- `MergeSlots` nếu span giao/vượt biên split.
- Place Before/After / gesture mở rộng span qua biên split.

Message: `Cannot merge across view@split`.

### Merge semantics (không “nhảy” property)

- Chỉ merge khi ≤1 bên occupied.
- Trái Empty + phải có control → dời control về cột bắt đầu, tăng span; **FieldName/Kind/Suffix** không đổi ngoài bước dời.
- Property Grid sau merge vẫn cùng field.

### Chrome

- Line dọc màu `splitDivider` (theme) tại biên split — khác column guide.
- Icon mỏ neo tại cột `anchor` (theme `anchorIcon`) — tối thiểu read-only.

---

## 7. Blueprint gestures (UX)

| Gesture | Hành vi |
|---------|---------|
| Resize cột | Chỉ hit-target **mép trên** bảng region (Word-like); không full-height splitter |
| Merge / Split ô | Chọn Slot → kéo mép phải: mở rộng = merge, thu = split; bỏ nút chrome Merge/Split |
| Move control | Mousedown giữa ô + threshold; tách khỏi edge-resize |
| Kéo dọc | Handle mép dưới header / category active / footer → height (`view@height` / convention hiện có) |
| Kéo ngang | Handle mép form tổng → phân bổ `ColumnWidths` (tôn trọng anchor FBO) |
| Click | Highlight + Property Grid; **không** đổi editor mode |
| Ctrl+Click control | Ép **Source** + caret tới `<field name>` |
| Delete / Backspace | Remove field (confirm nếu có ref / nhiều ô) |

---

## 8. Tabs

- 4 toolbox control: TabNormal, TabGrid, TabPost, TabList.
- Trước add: dialog Header V/E (bắt buộc); Grid/Post/List: Controller optional.
- Entry: kéo Tab* · nút `+` cuối tab bar · chrome `+ Tab` → cùng dialog (chọn kind).
- Normal: category + empty + spare visible.
- Grid/Post/List: category + seed field `items@style` + Input full-span; không spare form.

---

## 9. Architecture / data flow

```text
Config/xml/toolbox-controls.xml ──► ToolboxControlCatalog ──► Toolbox UI (drag)
Config/json/blueprint-theme.json ──► BlueprintThemeCatalog ──► DesignWebViewHost script/CSS

Drop field control ──► CreateFieldAndInsert + PlaceFieldParts
                 ──► ApplyNewField(+ref) + ApplyLayout ──► ParseXml ──► Design refresh

Drop/Add Tab* ──► Dialog ──► AddTabCategory ──► Writer ──► refresh

Delete ──► RemoveField ──► ApplyRemoveField + ApplyLayout ──► refresh

Hidden rows ──► DesignFormHtmlBuilder skip emit (model giữ)
Split ──► LayoutEngine.MergeSlots / Place validate barrier
```

**Constraints kiến trúc (R1–R10):**

- UI không parse FBO form XML; catalog IDE XML/JSON OK.
- Chỉ Language/Engine path ghi XML qua Writer Adapter.
- Left Panel UX freeze (chỉ đổi nội dung Toolbox list).

---

## 10. Config contracts

### `toolbox-controls.xml` (ý)

```xml
<toolbox version="1">
  <group id="basic" title="Basic Controls">
    <control id="TextBox" … prefix="text" type="String" placeKinds="Input,Label,Description"/>
    …
  </group>
  <group id="tabs" title="Tabs">
    <control id="TabNormal" … tabKind="Normal"/>
    …
  </group>
</toolbox>
```

Fail-closed nếu thiếu file.

### `blueprint-theme.json` (ý)

Keys: `columnGuide`, `columnLabel`, `splitter`, `regionMain|Footer|Tab`, `selected*`, `dropTarget`, `topResizeHitPx`, `splitDivider`, `anchorIcon`, `spareRowHighlight`, `ghostLabelInput`.

---

## 11. Acceptance (exit)

1. Palette config kéo được 7 control cơ bản + 4 Tab; không còn FIELDS XML.
2. CreateField XML đúng bảng §4; Place I→L→D; AutoComplete có ref; Remove sạch cặp.
3. Hàng hidden-only **không** hiện Blueprint; spare 1 dòng visible; drop **không** duplicate row.
4. Merge/Place **không** qua `split`; merge không đổi nhầm field.
5. Resize cột mép trên; edge merge/split; region dọc + form ngang; split line + anchor icon.
6. Click giữ Design; Ctrl+Click → Source; Property → XML.
7. Tests Application xanh; `.ai/CURRENT_STATE.md` ghi P6 landed.

---

## 12. Roadmap note

P0–P5: Commands, Overlay, Resize, Slot DnD, Merge UI, Toolbox FIELDS + CreateField 1 ô.  
**P6:** thay FIELDS bằng palette FBO config + UX/layout luật hidden & split (spec này).  
Sau P6: Rename field (G3), Undo đầy đủ, Replace-on-drop, ADR-0006.
