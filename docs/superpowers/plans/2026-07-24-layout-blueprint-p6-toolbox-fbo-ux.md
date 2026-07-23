# Layout Blueprint P6 — Toolbox FBO + Layout UX

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Palette control FBO từ config XML (TextBox kế thừa + Place L/I/D), Remove field khỏi view+XML, bỏ FIELDS khỏi Toolbox, Tab 4 loại (dialog properties trước add), Ctrl+Click → Source, resize cột kiểu Word (mép trên), merge/split bằng kéo mép ô, luôn +1 dòng trống region thường, màu Blueprint từ config JSON. Thêm: kéo dãn **dọc** từng region (header / category / footer), kéo dãn **ngang** toàn form; chrome `view@split` (line 2 vùng) + `view@anchor` (icon mỏ neo).

**Architecture:** Catalog IDE (`UI/Config/xml/toolbox-controls.xml` + `json/blueprint-theme.json`) → Application parser/catalog → Toolbox UI chỉ drag catalog. Engine `CreateFieldAndInsert` / `PlaceFieldParts` / `RemoveField` / spare-row invariant; Writer `ApplyNewField` (đủ attrs) + `ApplyRemoveField`. Blueprint JS: top-only column splitters, cell-edge merge/split, region height / form width handles, split+anchor chrome, Ctrl+Click, Delete. Tab add qua dialog + `AddCategory` seed.

**Tech Stack:** .NET 10, WPF, WebView2 Blueprint script, xUnit. Pattern config giống `sql-functions.xml` / `toolbar.json`.

**Parent decisions (đã chốt — không hỏi lại):**

| Quyết định | Giá trị |
|------------|---------|
| Lookup | `items@style="Lookup"` (chọn nhiều) |
| AutoComplete | `items@style="AutoComplete"` (chọn 1) + 1 field reference |
| Remove | Gỡ mọi ô view **và** xóa `<field>` XML; AutoComplete xóa luôn field ref |
| TextBox drop | Ưu tiên `[x]` → `[x].Label` → `[x].Description`; chỉ 1 ô trống → chỉ `[x]` |
| Config | Controls = XML; màu line = JSON |
| Scope | Full P6 một milestone |

---

## Global Constraints

- Entry: `CLAUDE.md`; Architecture R1–R10; **Left Panel UX freeze** (chỉ đổi nội dung list Toolbox, không đổi chrome dock)
- UI never parses FBO form XML; catalog IDE XML/JSON OK (như `sql-functions.xml`)
- Local vars / params / temps: `snake_case`
- Do **not** edit the Cursor plan file under `.cursor/plans/`
- Do **not** commit unless user explicitly asks
- Preserve unrelated uncommitted work; no destructive git
- Non-goals cứng: Undo/Redo **đầy đủ** Design Command history; Replace-on-drop đè control; ADR-0006 Serializer; **đổi tên field** từ Property Grid (backlog riêng — xem § Gợi ý)
- Gợi ý P6+ (Ghost, Undo 1 bước, spare highlight, Tab Grid deep-link): **không chặn exit** — làm nếu còn thời gian sau Task 1–6; chi tiết § Gợi ý thêm

**Baseline P5 (đã landed — sửa/mở rộng, không revert):**

- Broker + Toolbox drag WebView; `CreateFieldAndInsert` 1 ô; `ApplyNewField` cơ bản
- FIELDS chip L/I/D — **P6 xóa**
- Mapping P5 sai FBO — **P6 sửa** (CheckBox thiếu `items@style`, DateTime thiếu `dataFormatString`, …)

---

## File map

| File | Action |
|------|--------|
| `UI/Config/xml/toolbox-controls.xml` | **Create** — palette |
| `UI/Config/json/blueprint-theme.json` | **Create** — màu Blueprint |
| `DevWorkFlow.Domain/Design/ToolboxControlCatalogModels.cs` *(hoặc Domain/Language-adjacent)* | **Create** — DTOs catalog |
| `DevWorkFlow.Application/Design/Toolbox/ToolboxControlCatalogParser.cs` | **Create** |
| `DevWorkFlow.Application/Design/Toolbox/ToolboxControlCatalog.cs` | **Create** — load file, fail-closed |
| `DevWorkFlow.Application/Design/Toolbox/BlueprintThemeCatalog.cs` | **Create** — load JSON theme |
| `DevWorkFlow.Application/Design/Layout/ToolboxControlKind.cs` | **Modify** — enum P6 |
| `DevWorkFlow.Application/Design/Layout/ILayoutEngine.cs` | **Modify** |
| `DevWorkFlow.Application/Design/Layout/LayoutEngine.cs` | **Modify** — Place/Remove/spare/Tab seed |
| `DevWorkFlow.Application/Design/Layout/IDesignLayoutCommands.cs` | **Modify** |
| `DevWorkFlow.Application/Design/Layout/DesignLayoutCommands.cs` | **Modify** |
| `DevWorkFlow.Application/Design/Layout/IDesignLayoutWriterAdapter.cs` | **Modify** — remove fields |
| `DevWorkFlow.Application/Design/Layout/FboDesignLayoutWriterAdapter.cs` | **Modify** |
| `DevWorkFlow.Application/Engine/FboXmlWriter.cs` | **Modify** — attrs + `ApplyRemoveField` |
| `UI/ViewModels/Toolbox/ToolboxViewModel.cs` | **Modify** — bỏ FIELDS; bind catalog |
| `UI/Views/Toolbox/ToolboxPanel.xaml` (+ `.cs`) | **Modify** — bỏ chip L/I/D |
| `UI/Services/DesignToolboxDragBroker.cs` | **Modify** — payload Tab / IsTab |
| `UI/ViewModels/FormBuilderViewModel.cs` | **Modify** — Create/Remove/Tab/selection/Ctrl+Click |
| `UI/Views/Design/DesignWebViewHost.xaml.cs` | **Modify** — Blueprint JS + Delete + Ctrl+Click + theme |
| `UI/Views/Design/AddTabCategoryDialog.xaml` (+ `.cs`) | **Create** — pre-add Tab props |
| `UI/App.xaml.cs` | **Modify** — load catalogs, inject ToolboxViewModel |
| `DevWorkFlow.Application/Design/Assets/fbo-design-blueprint.css` | **Modify** nếu inject CSS vars |
| `tests/.../Design/Layout/*` + catalog tests | **Create/Modify** |
| `.ai/CURRENT_STATE.md` | **Modify** — P6 landed |

---

## Control → XML map (SoT)

| `ToolboxControlKind` / config `id` | Field defaults | View khi thả |
|------------------------------------|----------------|--------------|
| `TextBox` | `type` String hoặc bỏ | Place Input→Label→Description |
| `DateTime` *(rename từ DatePicker)* | `type="DateTime"` `dataFormatString="@dateTimeFormat"` | như TextBox |
| `Numeric` | `type="Decimal"` `dataFormatString=""` (attr rỗng vẫn ghi hoặc omit — chọn **ghi attr rỗng** nếu FBO cần) | như TextBox |
| `CheckBox` | `type="Boolean"` `<items style="Checkbox"/>` | như TextBox |
| `AutoComplete` | `<items style="AutoComplete" reference="ten_…%l"/>` + field ref `readOnly` | Place Input (+Label nếu đủ); **ref không auto-place** |
| `Lookup` | `<items style="Lookup"/>` (controller/key trống) | như TextBox |
| `ComboBox` | `<items style="DropDownList"/>` | như TextBox |
| `TabNormal` / `TabGrid` / `TabPost` / `TabList` | Không phải TextBox-family — `AddCategory` + seed | Dialog trước commit |

**Bỏ khỏi Toolbox:** FIELDS (mọi field XML), Label standalone, stub Layout/Advanced không có trong config.

**AutoComplete reference naming:** main = `{prefix}_{n}` (vd. `ac_1`); ref = `ten_{prefix}_{n}` (vd. `ten_ac_1`); `items@reference="ten_ac_1%l"`; ref field `readOnly=true`, cùng `categoryIndex`.

**PlaceFieldParts:** từ slot đích, đi sang **phải cùng hàng** các ô Empty; gán lần lượt Input (`.Suffix=""`), Label (`.Label`), Description (`.Description`). Không có ô Empty cho Input → Fail. Không tạo ô mới / không đổi số cột.

---

## Task 1: Config XML + JSON + Catalog parsers

**Files:**
- Create: `UI/Config/xml/toolbox-controls.xml`
- Create: `UI/Config/json/blueprint-theme.json`
- Create: Domain DTOs + Application parser/catalog
- Modify: `UI/App.xaml.cs` (load + pass vào ToolboxViewModel)

- [ ] **Step 1: Viết `toolbox-controls.xml`**

```xml
<?xml version="1.0" encoding="utf-8"?>
<toolbox version="1">
  <group id="basic" title="Basic Controls">
    <control id="TextBox" name="TextBox" icon="FormTextbox" enabled="true"
             prefix="text" type="String" placeKinds="Input,Label,Description"/>
    <control id="DateTime" name="DateTime" icon="Calendar" enabled="true"
             prefix="date" type="DateTime" dataFormatString="@dateTimeFormat"
             placeKinds="Input,Label,Description"/>
    <control id="Numeric" name="Numeric" icon="Numeric" enabled="true"
             prefix="num" type="Decimal" dataFormatString=""
             placeKinds="Input,Label,Description"/>
    <control id="CheckBox" name="CheckBox" icon="CheckboxMarkedOutline" enabled="true"
             prefix="check" type="Boolean" itemsStyle="Checkbox"
             placeKinds="Input,Label,Description"/>
    <control id="ComboBox" name="ComboBox" icon="FormDropdown" enabled="true"
             prefix="combo" type="String" itemsStyle="DropDownList"
             placeKinds="Input,Label,Description"/>
    <control id="AutoComplete" name="AutoComplete" icon="TextSearch" enabled="true"
             prefix="ac" type="String" itemsStyle="AutoComplete" createReference="true"
             placeKinds="Input,Label,Description"/>
    <control id="Lookup" name="Lookup" icon="Magnify" enabled="true"
             prefix="lookup" type="String" itemsStyle="Lookup"
             placeKinds="Input,Label,Description"/>
  </group>
  <group id="tabs" title="Tabs">
    <control id="TabNormal" name="Tab (Normal)" icon="Tab" enabled="true" tabKind="Normal"/>
    <control id="TabGrid" name="Tab (Grid)" icon="TableLarge" enabled="true" tabKind="Grid"/>
    <control id="TabPost" name="Tab (Post)" icon="FileDocument" enabled="true" tabKind="Post"/>
    <control id="TabList" name="Tab (List)" icon="ViewList" enabled="true" tabKind="List"/>
  </group>
</toolbox>
```

- [ ] **Step 2: Viết `blueprint-theme.json`** (contrast cao hơn nền)

```json
{
  "columnGuide": "rgba(255, 111, 0, 0.85)",
  "columnLabel": "#E65100",
  "splitter": "rgba(255, 111, 0, 0.35)",
  "regionMain": "rgba(33, 150, 243, 0.75)",
  "regionFooter": "rgba(255, 152, 0, 0.75)",
  "regionTab": "rgba(156, 39, 176, 0.75)",
  "selectedControl": "#0D47A1",
  "selectedSlot": "#1565C0",
  "selectedRegion": "#6A1B9A",
  "dropTarget": "#2E7D32",
  "topResizeHitPx": 12,
  "splitDivider": "#C62828",
  "anchorIcon": "#1565C0",
  "spareRowHighlight": "rgba(46, 125, 50, 0.12)",
  "ghostLabelInput": "rgba(21, 101, 192, 0.25)"
}
```

- [ ] **Step 3: Parser + Catalog** — fail-closed (file thiếu → empty / defaults cứng trong code cho theme). `UI/Config/**` đã `CopyToOutputDirectory` trong `UI.csproj`.

- [ ] **Step 4: Cập nhật `ToolboxControlKind`**

```csharp
public enum ToolboxControlKind
{
    TextBox,
    DateTime,
    Numeric,
    CheckBox,
    ComboBox,
    AutoComplete,
    Lookup,
    TabNormal,
    TabGrid,
    TabPost,
    TabList
}
```

Xóa `TextArea`, `DatePicker`, `Label` khỏi enum (hoặc map legacy → TextBox/DateTime nếu còn reference test — cập nhật test P5).

- [ ] **Step 5: Wire App** — `new ToolboxViewModel(catalog)` hoặc `toolbox_vm.LoadFrom(catalog)`.

- [ ] **Step 6: Build Application + test parse catalog**

```bash
dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~ToolboxControlCatalog"
```

Expected: PASS (sau khi viết test ở Task 6 hoặc kèm Task 1).

**Checkpoint:** Catalog load được; enum P6 khớp id XML.

---

## Task 2: PlaceFieldParts + CreateField attrs + RemoveField + Writer

**Files:**
- Modify: `LayoutEngine.cs`, interfaces, Commands
- Modify: `FboXmlWriter.cs`, Writer Adapter
- Modify: `FormBuilderViewModel.cs`, Host (Delete)
- Update: `CreateFieldAndInsertTests.cs` (P5)

- [ ] **Step 1: `DescribeControl` / defaults từ kind** (khớp bảng SoT)

```csharp
// Pseudo — CheckBox phải có ItemsStyle = "Checkbox"; DateTime DataFormatString = "@dateTimeFormat"
ToolboxControlKind.CheckBox => ("check", "Boolean", "Checkbox", null, …)
ToolboxControlKind.DateTime => ("date", "DateTime", null, "@dateTimeFormat", …)
ToolboxControlKind.Numeric  => ("num", "Decimal", null, "", …)
ToolboxControlKind.Lookup   => ("lookup", "String", "Lookup", null, …)
ToolboxControlKind.AutoComplete => ("ac", "String", "AutoComplete", null, create_ref: true)
```

- [ ] **Step 2: `PlaceFieldParts`**

```csharp
LayoutMutationResult PlaceFieldParts(
    FboFormModel form,
    LayoutSlotId start,
    string field_name,
    IReadOnlyList<FormViewCellKind> kinds_in_order);
// kinds mặc định: Input, Label, Description
// Fill Empty cells từ start.ColumnIndex sang phải cùng row; RebuildRow sau mỗi lần gán / một lần cuối
```

`CreateFieldAndInsert`: tạo `FboField`(s) → PlaceFieldParts (không còn Insert 1 kind cố định). Tab kinds → Fail với message “Use AddTabCategory”.

AutoComplete: sau add main+ref vào `Fields`/`FieldsByName`, set `ItemsReference = $"{ref_name}%l"` trên main; Place chỉ `field_name` main.

- [ ] **Step 3: `RemoveField(form, field_name)`**

1. Nếu field AutoComplete và có `ItemsReference` → cũng remove ref field name (bỏ `%l`).
2. Mọi cell mọi region có `FieldName` khớp (main hoặc ref) → Empty.
3. Xóa khỏi `Fields` + `FieldsByName`.
4. Gọi spare-row invariant (Task 4) nếu đã có.

- [ ] **Step 4: Writer**

`ApplyNewField`: thêm `dataFormatString`, `readOnly="true"` khi cần, `items@reference`.

`ApplyRemoveField(xml, field_name)`: xóa `<field name="…">`.

Adapter: `WriteFieldAndLayout` chấp nhận nhiều field mới; `WriteRemoveFieldsAndLayout(xml, form, names)`.

- [ ] **Step 5: VM + Host Remove**

`ApplyBlueprintRemoveField(field_name)` → Command → Writer → ParseXml.

Host: keydown Delete/Backspace khi selection level 1 hoặc 2 (có control) → confirm MessageBox ngắn nếu có reference hoặc >1 ô → Remove. Optional chrome nút `Remove`.

- [ ] **Step 6: Tests**

- 1 empty cell → chỉ `[x]`
- ≥2 empty → Input + Label
- ≥3 → + Description
- CheckBox/DateTime/Numeric/Lookup/AutoComplete XML attrs
- Remove xóa view + XML + ref pair

```bash
dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~CreateField|RemoveField|PlaceField"
```

**Checkpoint:** Drop TextBox-family đúng FBO; Remove sạch.

---

## Task 3: Bỏ FIELDS + Toolbox UI chỉ catalog

**Files:**
- Modify: `ToolboxViewModel.cs`, `ToolboxPanel.xaml` (+ `.cs`)
- Modify: `DesignToolboxDragPayload` nếu cần `IsTab` / `TabKind`

- [ ] **Step 1:** Xóa `Fields`, `ToolboxFieldVm` usage, `RefreshFields`, `BindTo` field list (giữ `BindTo` no-op hoặc bỏ nếu không cần Document).
- [ ] **Step 2:** XAML — xóa block FIELDS + chip L/I/D + `OnChipPressed`.
- [ ] **Step 3:** Hint mới: kéo control / Tab vào Slot hoặc tab bar.
- [ ] **Step 4:** Existing-field drop path (`ApplyBlueprintToolboxDrop` từ FIELDS) có thể giữ API nội bộ cho slot-move; không còn UI gọi từ Toolbox. Không bắt buộc xóa Engine `InsertFieldAtSlot`.

**Checkpoint:** Toolbox chỉ hiện controls từ config.

---

## Task 4: Spare trailing row + Tab 4 loại + dialog + tab bar `+`

**Files:**
- Modify: `LayoutEngine` (`EnsureSpareTrailingRow`, `AddCategory` / `AddTabCategory`)
- Create: `UI/Views/Design/AddTabCategoryDialog.xaml` (+ code-behind hoặc ViewModel nhỏ)
- Modify: `FormBuilderViewModel`, `DesignWebViewHost` (message `addTab` / `+`)

- [ ] **Step 1: Spare row invariant**

```csharp
void EnsureSpareTrailingRow(FboFormModel form, LayoutRegionId region);
// Nếu rows empty hoặc hàng cuối không toàn Empty → append row pattern toàn '-' đủ số cột
// Bỏ qua category đang host field style Grid|Post|List (seed tab đặc biệt)
```

Gọi sau: CreateField, RemoveField, Insert/Move/Clear (các mutation đụng row), EnsureFooter, AddCategory Normal.

- [ ] **Step 2: `AddTabCategory(form, tab_kind, header_v, header_e, controller?)`**

- Next index = max(existing tab indices)+1 hoặc 1 nếu chưa có.
- `AddCategory` + 1 empty row (+ spare).
- Grid/Post/List: tạo field seed `items@style` = Grid|Post|List, `categoryIndex` = tab index, optional `items@controller`; 1 ô Input full-span (merge pattern `1` + `0`… hoặc một cell span = column count). **Không** EnsureSpare trên tab loại này.

- [ ] **Step 3: Dialog** — Header V/E bắt buộc; Grid/Post/List thêm Controller (optional string). OK → VM commit. Hủy → no-op.

- [ ] **Step 4: Entry points**

1. Kéo Tab* từ Toolbox → Host phát hiện `IsTab` → mở dialog (slot có thể ignore / dùng để chọn region không bắt buộc) → AddTabCategory.
2. Nút `+` trên tab bar (cuối `DwfTabList`) → message `addTab` → Host mở dialog chọn kind (hoặc submenu 4 kind) → AddTabCategory.
3. Region chrome `+ Tab` cũ: chuyển sang cùng dialog flow (4 kind) hoặc chỉ TabNormal — **chọn: mở dialog chọn kind**.

- [ ] **Step 5: Tests** AddTab Normal có spare; Grid seed field + style; index tăng dần.

**Checkpoint:** Thêm tab qua dialog; Normal luôn dư 1 line trống.

---

## Task 5: Blueprint UX — top resize, edge merge/split, colors, Ctrl+Click, selection fix

**Files:**
- Modify: `DesignWebViewHost.xaml.cs` (`DesignBlueprintScript`)
- Modify: `FormBuilderViewModel.ApplyBlueprintSelection` / `SelectFieldByName` path
- Inject theme từ `BlueprintThemeCatalog`

### 5a — Colors

- [ ] Inject màu từ JSON vào script (const object) và/hoặc CSS variables trên `fbo-design-blueprint.css`.

### 5b — Resize Word-like

- [ ] Bỏ splitter handle full-height.
- [ ] Hit-target chỉ dải ~`topResizeHitPx` ở **mép trên** bảng region (cạnh nhãn `Npx`); vẫn post `resize{regionId,splitterIndex,deltaPx,commit}`.

### 5c — Merge/Split kéo mép

- [ ] Ẩn/xóa nút chrome `Merge ▸` / `◂ Split`.
- [ ] Level 2 (slot selected): handle mép phải span; kéo phải qua biên → `merge`; kéo trái thu span → `split`. Tách gesture khỏi move-control (move vẫn từ mousedown giữa ô, threshold ≥5px).

### 5d — Selection + Ctrl+Click

**Bug P5:** level 1 gọi `SelectFieldByName` → `NavigateToTarget` → thoát Designer.

- [ ] Click thường: chỉ highlight + Property Grid (`SelectCellAny` / select field **không** `GoToDefinition` / **không** đổi `ErpEditorMode`).
- [ ] Ctrl+Click control: post `gotoField{symbolId}` hoặc flag `ctrl:true` trên `select` → VM `JumpCodeToField` + ép **Source** mode; **không** tăng multi-click level.

### 5e — Delete key

- [ ] Đã wire Task 2; đảm bảo không conflict với WebView focus (keydown trên document / host PreviewKeyDown).

### 5f — Kéo dãn dọc region + ngang form (In-scope P6)

**Dọc — từng vùng layout:**

- [ ] Header (main / `TopRows`), mỗi **category tab** đang active, và **footer**: có handle kéo chiều cao ở **mép dưới** region (hoặc cạnh `view@height` / tab body).
- [ ] Commit → cập nhật chiều cao tương ứng FBO:
  - Main / form: `view@height` (hoặc `heigth` legacy — Writer giữ tên attr đang có).
  - Category có Grid-style: ưu tiên `field@rows` của seed Grid nếu tab loại Grid; category Normal: height tab panel / rows pattern theo convention hiện `DesignFormHtmlBuilder`.
  - Footer: height vùng bottom nếu model/XML hỗ trợ; nếu FBO chỉ có rows thì thêm/bớt spare không đủ — **tối thiểu** kéo đổi số px CSS + persist `view@height` khi đó là SoT hiện tại.
- [ ] Engine/Command mới nếu cần: `ResizeRegionHeight(form, region, delta_px)` → Writer; không phá tổng cột.

**Ngang — toàn form:**

- [ ] Handle kéo **mép phải** (hoặc trái) của khung layout tổng (bao cả split tables) → scale / phân bổ lại `ColumnWidths` (giữ tỉ lệ hoặc chỉ nới cột sau `anchor` đúng nghĩa FBO) → `ResizeColumns` / API mới `ResizeFormWidth`.
- [ ] Không nhầm với top column splitter (Task 5b): ngang = cả form; top = biên giữa hai cột.

### 5g — Chrome `split` + `anchor` (In-scope P6)

FBO đã có `LayoutEngine.SetSplit` / `SetAnchor` (1-based) + Writer `view@split` / `view@anchor` — P6 chỉ **hiển thị + (tuỳ chọn) chỉnh bằng chrome**.

- [ ] Khi `view@split` / `layout.Split` có giá trị: vẽ **line dọc khác màu** (theme `splitDivider`, không trùng columnGuide) tại biên cột `split` — thể hiện 2 vùng table trái/phải.
- [ ] Khi `view@anchor` / `layout.Anchor` có giá trị: vẽ **icon mỏ neo** trên nhãn cột thứ `anchor` (mép trên layout, cạnh `Npx`). Click/drag icon có thể gọi `SetAnchor` (nice); tối thiểu **read-only indicator**.
- [ ] Theme JSON: `splitDivider`, `anchorIcon` (đã thêm mẫu Task 1).

**Checkpoint:** Multi-click Control→Slot→Region trong Designer; Ctrl+Click → Source; resize cột chỉ mép trên; merge/split kéo mép ô; region kéo dọc; form kéo ngang; split line + anchor icon hiện đúng.

---

## Task 6: Property Grid regression + Tests tổng + CURRENT_STATE

- [ ] **Property → XML:** Sau CreateField, mở Property Grid đổi `header.v` / `dataFormatString` / `items.controller` → `XmlSource` đổi (`UpdateFieldProperty` hiện có). Thêm test Writer nếu thiếu. Tab seed: không expose “đổi tabKind” trên grid (không thêm editor type tab).

- [ ] **Tests bắt buộc**

| Test | Assert |
|------|--------|
| Catalog parse | 7 basic + 4 tab |
| Place 1/2/3 empty | Input only / +Label / +Description |
| CheckBox XML | `type="Boolean"` + `items style="Checkbox"` |
| DateTime XML | `type="DateTime"` + `dataFormatString` |
| Numeric XML | `type="Decimal"` |
| Lookup XML | `style="Lookup"` |
| AutoComplete | main + `ten_*` ref + reference attr; Remove xóa cả hai |
| Spare row | main cuối always empty row sau insert |
| RemoveField writer | không còn `<field name=…>` |

```bash
dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~Design.Layout|ToolboxControl"
dotnet build UI/UI.csproj
```

(Nếu UI bin bị VS lock: build `-o` thư mục tạm để xác nhận compile.)

- [ ] **Update `.ai/CURRENT_STATE.md`**

Thêm bullet **Layout Blueprint P6 (landed)** tóm tắt: config palette, Place L/I/D, Remove, no FIELDS, Tab 4 + dialog, spare row, top column resize, edge merge/split, region height + form width drag, split line + anchor icon, theme JSON, Ctrl+Click Source. Gỡ/điều chỉnh mô tả FIELDS chip P5. Ghi chú P6+ chưa làm (Ghost/Undo1/Rename/spare highlight/Grid deep-link) nếu bỏ qua.

**Checkpoint:** Exit criteria bên dưới đạt.

---

## Exit criteria

- [ ] Kéo TextBox / DateTime / Numeric / CheckBox / ComboBox / AutoComplete / Lookup vào slot → XML đúng attrs; view Place theo ưu tiên I→L→D
- [ ] AutoComplete tạo field reference; Remove xóa cả cặp + view
- [ ] Toolbox **không** liệt kê field XML; chỉ catalog config
- [ ] Tab Normal/Grid/Post/List qua dialog; `+` trên tab bar; Normal có spare row
- [ ] Resize cột chỉ mép trên; merge/split kéo mép ô; màu từ JSON tương phản
- [ ] Region (header / category / footer) kéo dãn **dọc**; toàn form kéo dãn **ngang**
- [ ] Có `split` → line chia 2 table khác màu; có `anchor` → icon mỏ neo trên cột anchor
- [ ] Click Design không thoát mode; Ctrl+Click → Source tại `<field>`
- [ ] Property Grid đổi value → XML đổi
- [ ] Tests xanh; CURRENT_STATE cập nhật

---

## Smoke manual (sau khi code xong)

1. Mở Dir Form → Design Blueprint.
2. Kéo TextBox vào hàng có ≥2 ô trống → thấy Label+Input; Source có `text_N`.
3. Kéo CheckBox → XML có Boolean + Checkbox style.
4. Kéo AutoComplete → 2 field; Delete control → cả hai biến mất.
5. Multi-click 1→2→3 vẫn trong Design; Ctrl+Click → tab Source đúng field.
6. Kéo mép trên đổi width cột; chọn slot kéo mép phải/trái merge/split.
7. `+` tab → dialog → Tab Grid tạo seed.
8. Kéo mép dưới header/footer đổi chiều cao; kéo mép phải form đổi chiều ngang.
9. Form có `split`/`anchor` → thấy line đỏ (hoặc theme) + icon neo.

---

## Gợi ý thêm (P6+ — không chặn exit)

Làm **sau** Task 1–6 nếu còn thời gian. Không fail milestone nếu bỏ qua. Mỗi mục đủ chi tiết để agent làm độc lập.

### G1. Ghost preview khi kéo TextBox (và TextBox-family)

- Khi `DesignToolboxDragBroker` đang drag control PlaceKinds chứa Input+Label: Blueprint `__dwfToolbox.over` vẽ **ghost 2 ô** mờ (Label | Input) thay vì 1 chip — màu `ghostLabelInput` từ theme.
- Nếu dưới con trỏ chỉ còn **1** ô Empty: ghost thu về **1 ô** (Input only), khớp rule Place.
- Tab* / control không Place L+I: giữ ghost 1 nhãn như hiện tại.

### G2. Undo 1 bước Remove / Create (stack nhỏ trên `XmlSource`)

- **Không** làm Undo/Redo Command đầy đủ (non-goal).
- Chỉ stack tối đa ~20 snapshot `string` XmlSource (hoặc cặp xml + selection) trên `FormBuilderViewModel`.
- Trước mọi `CommitLayoutMutation` thành công của **CreateField** / **RemoveField** / **AddTabCategory**: `PushUndo(xml_trước)`.
- Menu/phím `Ctrl+Z` (khi focus Design): pop → gán XmlSource → ParseXml → Design refresh. `Ctrl+Y` optional.
- Lý do: Remove xóa `<field>` không hoàn tác được thì rất đau — đây là giảm đau tối thiểu.

### G3. Đổi tên field từ Property Grid — **backlog riêng (không làm trong P6)**

- Hiện `name` read-only trên Property Grid.
- Cần: đổi `field@name` + rewrite mọi token view `[old]` / `[old].Label` / … + `items@reference` trỏ tới tên cũ + SymbolId / Outline.
- Track task/ADR riêng; **P6 không implement**.

### G4. Drop zone highlight hàng spare cuối region

- Hàng spare (Task 4 invariant) luôn Empty: khi đang Toolbox-drag, tô nền nhạt `spareRowHighlight` trên `tr` cuối của main / category Normal / footer.
- Giúp user biết chỗ thả an toàn (không đè control).
- Tắt highlight khi cancel/drop.

### G5. Tab Grid — deep-link mở Grid companion sau add

- Sau `AddTabCategory(Grid)` thành công: nếu Program có file `Grid/{ControllerName}.xml` (hoặc companion qua `DesignRelatedDocumentLocator` / FS explorer convention) → optional hỏi hoặc tự mở tab Form Builder đọc Grid đó.
- Không có file → StatusMessage gợi ý tạo Grid; không Fail AddTab.
- Không chặn exit nếu locator chưa đủ — wire best-effort.

---

## Thứ tự ưu tiên khi thiếu thời gian

1. Task 1–4 + 5a–5e + 6 (palette, Place, Remove, Tab, selection, tests) — **bắt buộc**
2. Task 5f–5g (kéo dọc/ngang, split line, anchor icon) — **in-scope P6**, ưu tiên ngay sau bắt buộc
3. G1 Ghost, G4 spare highlight, G2 Undo 1 bước — nên có
4. G5 deep-link Tab Grid — nice
5. G3 Rename field — **cấm** trong P6 (backlog)
