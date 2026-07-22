# Design WebView + HTML Generator (không phụ thuộc Skin)

Date: 2026-07-22  
Status: Approved for planning  
Approach: A — Minimal host + HTML Generator từ XML; CSS/JS Program qua main/MasterPage; Form chrome CSS tối thiểu do IDE sở hữu  
Related: `docs/04-DESIGNER_PLATFORM.md`, `.ai/CURRENT_STATE.md` (Skin MVP / Design tab), Dir.xsd / Grid.xsd, `MenuService` / `AspxControllerParser`

---

## 1. Goal

Tab **Design** render giao diện FBO bám sát thực tế trong WebView2 để:

- NSD xem / (sau này) kéo–thả đối tượng;
- Review trực tiếp những gì đã sửa ở XML/code;
- Không phụ thuộc skin template đã capture làm runtime input.

**Skin capture** chỉ còn vai trò phụ: tài liệu/mẫu để AI học quy tắc sinh HTML — **không** là điều kiện để Design hoạt động.

---

## 2. Scope

### In scope (MVP)

- HTML Generator: Semantic/Layout → HTML theo mapping cố định
- Surface theo **file đang active**:
  - `Dir/*.xml` → form (`view id="Dir"`) + Grid Detail trong form (nếu có)
  - `Grid/*.xml` → bảng danh sách (`view id="Grid"`) hoặc Detail theo `type`
- Resolve CSS/JS tĩnh từ Program: menu/`Controller` → main `.aspx` → `MasterPage` → `Css/` / `ClientScript/` / `Images/`
- Inject `<css>` optional của controller → `<style>`
- Stylesheet Form/Grid **tối thiểu do IDE sở hữu** (class đúng tên FBO: `FormTable`, `FormInput`, `GridTable`…) — bổ sung dần theo thời gian
- Tách **Skin Acquisition** khỏi **Design Renderer** (renderer không gọi “Lấy skin”)
- WebView2 host tối giản (IDE-owned document), virtual host map Program assets
- `data-node-id` / `data-symbol-id` trên control sinh ra (chuẩn bị overlay / Property Grid)

### Out of scope (backlog)

- Kéo–thả / Designer Overlay đầy đủ (phase sau generator)
- Sync hai chiều DOM → XML Command đầy đủ
- `view id="Form"` và các view khác ngoài `Dir` / `Grid`
- Materialize / phụ thuộc WebResource.axd
- Skin capture pipeline refactor lớn (giữ như nguồn AI; không bắt Design dùng `shell.html`)
- Thực thi full FBO client script (`$df`, extender) trong Design
- Filter / Lookup / Report design surfaces (trừ khi cùng pattern generator sau)

---

## 3. Core Philosophy

```text
XML → Semantic Model → Layout Model → HTML Generator → Host HTML → WebView2 → DOM
                                                                    ↑
                                                         Designer Overlay (sau)
```

- Designer chỉ làm việc với DOM đã gắn NodeId/SymbolId.
- Không parse XML ở UI; Generator nằm Application (hoặc Core contract + Infra implement) theo Clean Architecture.
- Không dùng captured `shell.html` làm entry của Design tab.
- “Giống ERP” = mapping HTML/CSS class đúng quy tắc FBO + asset Program + CSS IDE bổ sung — không phải clone trang live.

---

## 4. Architecture

### 4.1 Components

```text
┌─────────────────────────────────────────────────────────────┐
│ UI: SkinDesignerView / DesignHost (rename theo implement)   │
│  - Bind active FormBuilder document                         │
│  - Gọi render API với DesignDocument / bundle               │
│  - KHÔNG đọc ProjectSkinViewModel / HasSkin để quyết định   │
│    có render được hay không                                 │
└───────────────────────────┬─────────────────────────────────┘
                            │ DesignRenderRequest
┌───────────────────────────▼─────────────────────────────────┐
│ Application: IDesignHtmlGenerator + IDesignAssetResolver    │
│  - Dir/Grid layout → HTML                                   │
│  - Resolve main aspx + master → danh sách CSS/JS Program    │
│  - Options.xml → dataFormatString @name                     │
│  - Optional controller <css>                                │
└───────────────────────────┬─────────────────────────────────┘
                            │ DesignDocument (html + asset urls)
┌───────────────────────────▼─────────────────────────────────┐
│ UI/Infra: DesignWebViewRenderer                             │
│  - Virtual host Program → ProgramPath                       │
│  - Navigate / set HTML host                                 │
│  - Không biết “Lấy skin”                                    │
└─────────────────────────────────────────────────────────────┘

Song song (tách biệt):
  SkinAcquisition (capture ERP) → SkinBundle cache — chỉ cho AI / tooling
```

### 4.2 Contracts (gợi ý tên — chốt lúc implement)

- `DesignRenderRequest`: project_id, program_root, active_file_kind (Dir|Grid), semantic/layout snapshot hoặc path + model đã parse sẵn từ LS
- `DesignDocument`: html_string hoặc entry path, stylesheet_hrefs[], script_hrefs[], embedded_css?, host_meta
- Renderer chỉ nhận `DesignDocument` + `program_root` (để map VH)

Không đưa WebView2 types vào Application/Core.

### 4.3 Skin vs Design

| Concern | Skin capture | Design tab |
|---------|--------------|------------|
| Mục đích | AI học quy tắc / tham chiếu | Render + (sau) edit visual |
| Input | HTML ERP live | XML Semantic/Layout |
| Entry | `shell.html` (AppData) | Host IDE-generated |
| Bắt buộc? | Không | Không cần HasSkin |

---

## 5. Mapping rules

### 5.1 Dir — chỉ `view id="Dir"`

**Fields**

| XML | HTML |
|-----|------|
| `field@name` | id control (vd. `…_form_{name}`; `%l` → tên không có `%l` như runtime) |
| `<header v/e>` | Label text |
| `<footer>` | Footer / Description HTML |
| `type="Boolean"` / `items style="CheckBox"` | `input.FormCheckInput` checkbox |
| không `items` | `input.FormTextInput` text |

**View item đầu:** danh sách độ rộng cột → hàng `<th style="width:Npx">`.

**Các item sau:** `mask: [ref], [ref], …`

| Ký tự mask | Ý nghĩa |
|------------|---------|
| `1` | Bắt đầu ô gắn 1 phần tử view |
| `0` | Nối tiếp `1` trước → tăng `colspan` |
| `-` | Ô trống, không gắn control |

**Suffix phần tử view**

| Suffix | Nguồn text/HTML |
|--------|-----------------|
| `.Label` | `<header>` |
| `.Footer` | `<footer>` |
| `.Description` | `<footer>`; fallback `<header>` nếu không có footer |
| (không suffix) | Control theo field |

**`view@height`:** chiều cao vùng chứa form.

**Categories / tabs (như ERP)**

| `categoryIndex` | Vị trí |
|-----------------|--------|
| (không có) | Body chính phía trên |
| `> 0` | Tab `categories/category[@index]` |
| `-1` | Vùng status / footer chung |

Tab header từ `<category><header v/e>`. Column widths tab từ `category@columns` (và `anchor` nếu có).

### 5.2 items/style (Dir.xsd)

Styles: `Numeric`, `Mask`, `AutoComplete`, `Lookup`, `Grid`, `CheckBox`, `DropDownList`, `ListBox`, `RadioButtonList`.

**Ưu tiên MVP (đã chốt hành vi):**

| style | Control | Ghi chú |
|-------|---------|---------|
| `Mask` | text input | `dataFormatString`: `X` uppercase, `x` lowercase, literal list `"1, 0, *"` → chỉ các ký tự đó; `@upperCaseFormat` resolve Options |
| `Numeric` | text input align right | `dataFormatString="@quantityInputFormat"` → `Options.xml` `<var name="…" value="…">` |
| `CheckBox` | checkbox | |
| `DropDownList` | `<select>` | items con `<item value>` + text |
| `AutoComplete` | input + nút lookup; `reference` field readonly | |
| `Lookup` | input + icon lookup | |
| `Grid` | bảng Detail nhúng | xem §5.4 |
| `ListBox` / `RadioButtonList` | list / radio | MVP tối thiểu hoặc stub có class đúng |

**Options resolve:**  
`App_Data/Controllers/Options/Options.xml` — `dataFormatString="@name"` → `variants/var[@name]/value`.  
Literal không có `@` dùng trực tiếp. Design dùng format cho placeholder/hiển thị, không bắt buộc enforce input.

### 5.3 Grid danh sách — `view id="Grid"`

| XML | HTML |
|-----|------|
| `fields/field@name` + `header` + `width` | Cột header |
| `views/view[@id=Grid]/field` | Thứ tự cột hiển thị |
| (optional) `<css>` | `<style>` |
| Toolbar icons từ css (ImportData, Download…) | Class `div.ImportData`… — MVP có thể stub |

Render: `table.GridTable` + header; **1–N hàng placeholder** (text giả / `…`) để mật độ gần ERP.  
Số N mặc định: **5** (có thể cấu hình sau; TBD nếu product muốn khác).

### 5.4 Grid Detail trong form

- Controller Grid `type="Detail"` (vd. `CustomerUnitDetail`) gắn qua Dir (entity/unit / `items style="Grid"`).
- Khi active file là Dir: sinh form + các Detail table bên trong đúng chỗ layout.
- Khi active file là Grid Detail: chỉ render bảng Detail (header + placeholder rows), không bắt buộc full Dir.

Chi tiết resolve “Dir tham chiếu Detail nào” — implement theo Semantic Model / related files đã có từ `MenuService.EnrichFromXmlReferences` + field `items style="Grid"`. **TBD ngắn:** nếu Semantic chưa expose đủ, bổ sung mapper từ XML đã parse (Language Service), không parse ở UI.

### 5.5 CSS / JS Program (động theo main)

Không hardcode list CSS theo controller.

```text
Active controller / menu context
  → wcommand.link hoặc aspx có Controller="…"
  → Main/{link} (vd. arkh.aspx)
  → MasterPageFile (vd. MasterPage.master)
  → Thu thập ~/Css/*, ~/ClientScript/*, ~/Images/*
  → Map virtual host → ProgramPath
+ controller <css> optional
+ IDE Form/Grid minimal stylesheet
```

IDE đã có chiều menu → aspx → XML (`MenuService`). Design cần chiều **XML/Controller → aspx → master → assets** (reuse `AspxControllerParser` + đọc MasterPage).

**Không** phụ thuộc WebResource.axd; look-and-feel FormTable bổ sung dần trong CSS IDE.

---

## 6. WebView host

- Document host do IDE sở hữu (HTML string hoặc file tạm trong cache Design — **không** `%AppData%/skins/.../shell.html`).
- Virtual host Program: tái sử dụng pattern `devworkflow.program` → `ProgramRoot` (có thể đổi tên constant Design-specific nếu tách khỏi Skin store).
- Link stylesheet/script bằng URL virtual host + relative path Program.
- UTF-8 (BOM nếu ghi file) để tránh mojibake.
- Bridge scroll/ruler hiện có trên Design tab giữ được nếu vẫn dùng cùng view; tách khỏi Monaco bridge.

---

## 7. Error / empty states

- Không có ProgramPath → vẫn sinh HTML; CSS Program bỏ trống; dùng CSS IDE; message nhẹ trên UI.
- Không resolve được main/aspx → vẫn render structure; thiếu Menu.css Program.
- Host placeholder / field thiếu trong view → bỏ qua hoặc ô trống theo mask `-`.
- Options.xml thiếu → giữ nguyên `@name` làm note; không crash.

---

## 8. Testing

1. **Dir Customer:** `view Dir` → FormTable; `1100: [ma_kh].Label, [ma_kh]` → label colspan 1, input colspan 3; tabs theo categoryIndex; `status` (-1) vùng chung.
2. **Mask/Numeric:** `@upperCaseFormat` / `@baseCurrencyAmountInputFormat` resolve từ Options.xml fixture.
3. **DropDownList / CheckBox / AutoComplete:** đúng loại control + class.
4. **Grid Customer:** cột theo view Grid; ≥1 placeholder row; width từ field.
5. **Detail-in-form:** Dir có unit/Detail → có table trong HTML form.
6. **Active file:** chuyển Grid ↔ Dir đổi surface tương ứng.
7. **Asset resolve:** Customer → arkh.aspx → MasterPage → có `Css/Menu.css` trong document.
8. **`<css>`:** Customer inject `.Break` / `.LabelDescription`.
9. **Renderer độc lập:** render DesignDocument không cần `HasSkin` / `IProjectSkinService`.
10. Build + test project liên quan xanh.

---

## 9. Migration / debt từ Skin Design hiện tại

- `SkinDesignerView` hiện navigate `devworkflow.skin/shell.html` + phụ thuộc `ProjectSkinViewModel` → chuyển sang DesignDocument generator.
- ERR_FILE_NOT_FOUND do `.axd` / URL capture: **không** là blocker của hướng mới (không dùng shell capture). Skin pipeline có thể sửa riêng sau nếu vẫn cần cho AI.
- Comment/manifest cũ nói “assets/ mirror” / Resolved = mapped URL: cập nhật khi đụng file; không bắt buộc rewrite toàn bộ Skin MVP trong cùng PR Design Generator.

---

## 10. Open points (TBD ngắn — không chặn spec)

1. Số hàng placeholder Grid mặc định = 5 — đổi nếu product muốn.
2. Chi tiết DOM id prefix (`ctl00_…` vs id ngắn IDE) — ưu tiên id ổn định gắn `data-node-id`; class FBO giữ đúng.
3. `ListBox` / `RadioButtonList` / `Lookup` độ sâu MVP vs stub.
4. Exact resolve path Dir → Detail grid khi Semantic chưa đủ (mapper bổ sung).
5. Rename UI type `SkinDesignerView` → tên Design-neutral (optional cùng PR hoặc follow-up).

---

## 11. Success criteria

- Mở `Dir/Customer.xml` tab Design: thấy form + tabs gần ERP **không** cần “Lấy skin”.
- Mở `Grid/Customer.xml`: thấy bảng + placeholder rows.
- CSS Program (Menu.css…) load qua virtual host khi resolve được main.
- Không còn phụ thuộc `HasSkin` để enable Design render.
- Generator testable bằng fixture XML + Options.xml không cần WebView2.
