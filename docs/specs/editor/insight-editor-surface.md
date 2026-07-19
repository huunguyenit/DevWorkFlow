# Insight Editor Surface (Interim AvalonEdit Implementation)

Module: editor
Status: Interim — implementation thật hiện tại của Insight rendering, thay thế tạm thời
cho Monaco + Editor Platform (ADR-0002/ADR-0005). Xem `entity-insight-rendering.md` cho
hành vi mục tiêu; spec này mô tả CHÍNH XÁC những gì đã chạy hôm nay bằng AvalonEdit, kể
cả các điểm lệch mục tiêu.
Related Architecture: ADR-0002-MonacoEditor.md, ADR-0004-InsightLayer.md, ADR-0005-EditorPlatform.md, 03-EDITOR_PLATFORM.md
Related Specs: entity-insight-rendering.md, ../language/entity-resolution.md, ../language/diagnostics-pipeline.md

---

# Purpose

DevWorkFlow cần một Editor có thể chạy ngay hôm nay trong khi Monaco + WebView2 + Editor
Platform (đích đến chính thức theo ADR-0002/ADR-0005) chưa được xây. Giải pháp tạm thời
là dùng AvalonEdit (`ICSharpCode.AvalonEdit`) — một Editor WPF thuần — kết hợp một
`VisualLineElementGenerator` tự viết để chèn Insight (giá trị Entity đã Resolve) ngay
trong dòng văn bản mà không sửa nội dung Document gốc.

Đây KHÔNG phải kiến trúc dài hạn. Không module nào khác nên coi đây là API ổn định để
phụ thuộc vào — khi Editor Platform + Monaco Adapter được xây, spec này sẽ được thay thế
hoặc archive, và mọi lệch mục tiêu ghi ở đây sẽ cần được đóng lại theo
`entity-insight-rendering.md`.

# User Story

- Là lập trình viên, tôi muốn xem giá trị Entity ngay cạnh tham chiếu gốc trong lúc IDE
  đang phát triển, dù chưa có Monaco, để công việc phát triển ERP không bị chặn lại chờ
  Editor Platform hoàn chỉnh.
- Là lập trình viên, tôi muốn sửa giá trị Entity trực tiếp trong Editor hoặc trong panel
  bên cạnh, để không phải mở file Entity riêng.

# Cập nhật 2026-07-20 — Insight mode = ClearText + tô nguồn gốc entity (HIỆN HÀNH)

Đổi **triết lý** theo yêu cầu chủ dự án. Thay thế hoàn toàn mục "Cập nhật 2026-07-19
(lần 2)" bên dưới (giữ lại làm lịch sử, KHÔNG còn đúng với code).

**Trước:** editor giữ nguyên XML, `&X;` hiển thị mờ + chèn giá trị resolve ngay sau nó
(injected text) + view zone cho entity nhiều cấp. Người đọc vẫn phải đọc XML lẫn chú giải.

**Nay:** Insight mode hiển thị **toàn bộ document dưới dạng clear text** — mọi tham chiếu
entity đã được expand thành nội dung thật, đọc như văn bản liền mạch. Lớp Insight chỉ còn
nhiệm vụ **tô nền cho biết đoạn text nào đến từ entity nào**:

**Màu = CẤP LỒNG** (cập nhật 2026-07-20, lần 2). Cấp 1 là entity tham chiếu trực tiếp trong
body; entity nằm trong giá trị của entity khác là cấp 2, v.v. Tối đa **9 cấp có màu riêng**;
từ cấp 10 trở đi dùng lại màu cấp 9.

| Cấp | Màu nền mặc định |
|---|---|
| 1 | vàng `rgba(240,180,0,.20)` |
| 2 | xanh lá `rgba(38,166,91,.18)` |
| 3 | đỏ `rgba(231,76,60,.16)` |
| 4 | xanh dương · 5 tím · 6 cam · 7 ngọc · 8 hồng · 9+ nâu |
| lỗi | `#FBE0E0` — thiếu file / chu kỳ, giữ nguyên `&X;`, thắng mọi màu cấp |

Toàn bộ đọc từ `clearTextEntity.levels[]` trong `UI/Config/json/editor-theme.json` (mảng ≤ 9
phần tử; thiếu thì các cấp sau kế thừa màu cuối cùng có thật).

**Entity SYSTEM không có màu nền riêng** — kênh màu đã thuộc về cấp lồng. Nguồn "từ file
ngoài" báo bằng **gạch chân đứt** (`clearTextEntity.systemMarker`, class `.dwf-ct-system`).
Hai tín hiệu độc lập, đọc được đồng thời: màu = cấp, gạch chân = file khác. Đây là thay đổi
có chủ ý so với quyết định "inline ≠ system bằng màu" ngày 2026-07-20 lần 1 — hai bảng 9 màu
song song sẽ khiến cấp 4 của bảng này lẫn với cấp 1 của bảng kia.

Cơ chế "cấp sâu nhất thắng" nằm ở **thứ tự khai báo CSS**, không ở JS: decoration chồng lấn
làm Monaco gán nhiều class lên cùng text run (`dwf-ct-l1 dwf-ct-l2 dwf-ct-l3`); mọi selector
cùng độ đặc hiệu (1 class) nên theo quy tắc cascade, cái khai báo SAU thắng — `l1…l9` khai
báo tăng dần, `.dwf-ct-error` cuối cùng. Thứ tự class trong DOM không ảnh hưởng.
**Sửa index.html phải giữ đúng thứ tự này.**

Cơ chế:

- **Nguồn dữ liệu:** `ErpDocument.GetProjection(ClearText)` trả về `Text` + `ClearTextSegments`
  (`ClearTextSegment`: `entityName`, `span` **trên clear text**, `depth`, `kind`,
  `definitionPath`, `definitionOffset`, `openPath`, `isError`). Sinh trong
  `EntitySymbolBinder.BuildClearTextProjection` — expand đệ quy, segment con nằm TRỌN trong
  segment cha, cycle-safe.
- **Render:** `bridge.js` `renderClearTextSegments` → `deltaDecorations` với `className`
  (`dwf-ct-l{1..9}` + `dwf-ct-system` nếu SYSTEM). Không widget/zone/injected text nào được
  tạo.
- **Hover:** `hoverMessage` của decoration hiện tên entity + loại + cấp lồng. Đây là tooltip
  *phụ trợ* — không vi phạm "Insight over Tooltip" vì nội dung chính (giá trị entity) đã nằm
  inline trong chính dòng text; tooltip chỉ bổ sung *tên* nguồn.
- **Ctrl+Click:** editor chỉ post `openEntityRequested` (không preventDefault → Monaco vẫn
  đặt caret đúng chỗ click, không cuộn). Host `FormBuilderViewModel.NavigateToEntity` quyết
  định: `openPath` có (entity SYSTEM) → mở tab mới; khai báo ở file include khác → mở tab
  mới; entity inline khai báo trong chính document → nhảy tới `<!ENTITY ...>` trong tab đang
  mở. **Hai nhánh mở tab mới không đụng caret/scroll tab hiện tại** — quay lại là thấy đúng
  chỗ vừa click. Entity SYSTEM có thể là `.ent/.xml/.txt/.sql/...`; `OpenEntityFile` phân
  loại theo đuôi, không giả định `.ent`.
- **Read-only:** Insight mode buffer là clear text, không ánh xạ ngược được về XML →
  `IsEditorReadOnly = IsInsightMode`, `EditorText` setter bỏ qua khi đang ở Insight. Mọi
  chỉnh sửa làm ở Source mode. Đây là lý do sửa giá trị entity inline tại chỗ (edit session,
  `entityValueCommitted`) đã bị **gỡ khỏi đường Monaco**.
- **Offset khai báo dùng chung được cho cả 2 projection:** expand chỉ xảy ra trong body, sau
  DOCTYPE, nên vùng `<!ENTITY ...>` không bị dịch chuyển giữa Source và ClearText — có test
  chốt bất biến này (`ClearText_keeps_doctype_offsets_identical_to_source`). **Bất biến này
  CHỈ đúng trong DOCTYPE** — xem mục dưới.
- **Offset trong body thì KHÔNG dùng chung được — cần `ClearTextOffsetMap`** (sửa 2026-07-20,
  lần 3). Navigation toàn hệ thống tính offset trên source XML (`NavigationTarget.TextRange`
  từ NodeId/SymbolId — Rule R7), nhưng buffer hiển thị ở Insight mode là ClearText: mọi offset
  nằm sau tham chiếu entity đầu tiên đều bị dịch đúng bằng tổng (độ dài giá trị đã expand −
  độ dài `&X;`). Hệ quả trước khi vá: **Outline/F12 nhảy sai chỗ ở Insight mode**, lệch càng
  xa khi document càng nhiều entity.
  - `EntitySymbolBinder.BuildClearTextProjection` sinh thêm `ClearTextOffsetMap` — danh sách
    region nối tiếp phủ kín source. Region *literal* (copy 1:1) ánh xạ tuyến tính và được gộp
    với region literal liền trước để bảng không phình theo số tham chiếu; region *expansion*
    (`&X;` → nội dung) có độ dài hai bên khác nhau nên offset bên trong nó không có ảnh 1-1 —
    `ToClearText` snap về đầu đoạn đã expand.
  - Map đi kèm `ErpDocumentProjection.OffsetMap` (chỉ có nghĩa với kind `ClearText`; các kind
    khác giữ `ClearTextOffsetMap.Identity` vì Text chính là source).
  - `FormBuilderViewModel.ToEditorOffset` là **điểm đổi trục duy nhất**: mọi hàm navigate nhận
    offset theo source, `ApplyCaretOffset` gọi `ToEditorOffset` ngay trước khi set `CaretOffset`.
    `NavigateToLine` ở Insight mode đổi dòng → offset source rồi đi cùng đường (số dòng cũng
    lệch khi giá trị entity chứa xuống dòng).
  - Test: `ClearText_offset_map_translates_navigation_offsets_after_expansion`,
    `ClearText_offset_map_is_identity_when_document_has_no_entity`.

Đã gỡ khỏi đường Monaco: `setInsights`, `entityValueCommitted`, `openFileRequested`,
`InsightEditCommand`/`Insights` DP trên `MonacoEditorHost`, double-click chọn giá trị entity,
view zone phân cấp. `FormBuilderViewModel.Insights` và `UpdateEntityValueCommand` GIỮ NGUYÊN
— Insight Panel / Problems / AvalonEdit vẫn dùng.

## Syntax highlighting XML (sửa cùng đợt 2026-07-20)

`erp-xml-language.js` tô sai và gây rối; sửa theo nguyên tắc VS Code dùng cho XML/HTML
(nguyên tắc, không copy nguyên bảng màu):

1. **Dấu cú pháp tách khỏi tên.** `<` `>` `/>` `</` `=` nay là token `delimiter` (xám
   `#767676`); chỉ TÊN thẻ mới là `tag` (`#800000`). Trước đây `<div` là MỘT token `tag` nên
   mọi dấu ngoặc đều đỏ đậm — đây là nguồn gây rối chính trong file nhiều thẻ.
2. **Khai báo ≠ tham chiếu entity.** `entity.name` (trong `<!ENTITY X ...>`) có token/màu
   riêng (`#267F99`, không nghiêng); trước đây map chung `entityReference` nên cả khối
   DOCTYPE bị in nghiêng tím.
3. **Từ khoá DTD** `SYSTEM`/`PUBLIC` → token `keyword` thay vì lẫn vào `metatag` xám.
4. **Giữ ~4 màu mạnh/file**: tên thẻ, tên attribute, chuỗi giá trị, comment. Còn lại kế thừa
   màu chữ nền hoặc xám phụ.

Token mới cần khai báo trong `tokens` của `editor-theme.json`: `entityName`, `keyword`;
`delimiter` đổi từ `#800000` → `#767676`.

Còn nợ: search theo giá trị resolve; virtualization theo viewport cho segment (hiện gửi cả
document — Monaco tự giới hạn vẽ theo viewport nhưng mảng segment thì gửi đủ); bảng màu 9 cấp
và palette XML chưa được xác nhận bằng mắt trên file ERP thật.

---

# Cập nhật 2026-07-19 (lần 2) — LỊCH SỬ, đã bị thay thế bởi mục 2026-07-20 ở trên

Redesign theo prompt "Improve Editor UI" của chủ dự án — Insight Layer đúng nghĩa
ADR-0004: một lớp tô ngữ nghĩa như syntax highlighting, KHÔNG phải widget/control.
Thay thế hoàn toàn thiết kế chip HTML của lần cập nhật trước cùng ngày:

- **Render bằng API native của Monaco**, không tạo HTML control nào:
  - Reference `&X;`: decoration `inlineClassName` → italic, ~45% opacity (CSS
    `.dwf-entity-ref`) — chồng lên syntax highlighting, visually secondary.
  - Giá trị resolve: **injected text** (decoration `options.after`) ngay sau reference —
    cùng font/baseline/line-height, do chính text renderer của Monaco vẽ; Monaco tự
    virtualize theo viewport và reuse decoration qua `createDecorationsCollection`
    (đáp ứng yêu cầu Performance không cần code virtualization riêng).
  - Entity nhiều cấp: **view zone** text thuần (span, không input/border) hiển thị phân
    cấp con dưới dòng chứa reference — không flatten, không giấu cấp cha. Giá trị dài
    cắt tại 60 ký tự + "…".
- **Layer 1 (text buffer) không bao giờ bị lớp này sửa** — decoration/injected text/zone
  đều là render thuần.
- **Sửa giá trị**: injected text về bản chất không gõ vào được (giới hạn native của
  Monaco, giống inlay hint VS Code). Giải pháp thuần native: **double-click vào
  reference → editor chọn đúng đoạn giá trị thật trong `<!ENTITY X "...">`**
  (`value_start`/`value_length` trong `InsightItem.Metadata`, chỉ có với entity khai
  báo inline trong chính document — test xác nhận offset đúng từng ký tự). Người dùng
  sửa bằng text editing thật: Undo/Redo/Selection/caret nguyên bản Monaco, `&X;` trong
  body không đổi, debounce reparse cập nhật lại chú giải. Entity từ file include/
  external: double-click giữ hành vi mặc định (sửa qua Insight Panel dock phải hoặc mở
  file gốc — follow-up).
- **Search**: `WorkspaceSymbolIndex.Search` chuẩn hoá query (`&X;`/`%X;`/`X` → `X`) và
  khớp thêm giá trị resolve của Entity — `&ClientDefault;`, `ClientDefault`, `Default`
  đều ra cùng một Symbol (có test).
- **Cột "Semantic" và "Resolved" trong `InsightEditorSurface.xaml` đã XÓA** (giữ từ lần
  cập nhật trước); `SourceEditor` bật `ShowInsights` theo mode.
- `InsightEditCommand`/`entityValueCommitted` không còn được JS sử dụng (binding C# giữ
  nguyên, vô hại); `AnnotatedText` (FR #11 entity-resolution.md) vẫn được tính ở tầng
  Language nhưng renderer hiện dùng phân cấp view zone thay vì chuỗi flatten — đúng yêu
  cầu "Never flatten nested entities" của redesign.

# Functional Requirements

1. Khi Document được mở ở chế độ Insight, mọi tham chiếu Entity (`InsightType.Entity`)
   trong `Insights` phải được render như một khối UI (`EntityInsightBlock`) thay thế
   glyph run tại đúng offset của nó trong dòng — không sửa `Document.Text` gốc của
   AvalonEdit.
2. Bên cạnh view AvalonEdit inline (cột "Source"), hệ thống còn cung cấp một view dạng
   danh sách phẳng song song (cột "Semantic"/"Resolved" trong `InsightEditorSurface`) từ
   cùng một nguồn `Insights` — đây là 2 cơ chế hiển thị độc lập, không phải một.
3. Entity lồng nhau phải hiển thị đệ quy có thụt lề (`depth * 10px`) trong khối inline;
   view danh sách song song KHÔNG hỗ trợ lồng nhau (chỉ phẳng).
4. Khi người dùng sửa giá trị Resolve (trong khối inline hoặc trong cột "Resolved"), hệ
   thống phải gọi `IErpLanguageService.UpdateEntityValue` và thay `XmlSource` toàn bộ
   bằng bản chiếu mới lấy từ `ErpDocument.GetProjection(Source)`.
5. Vòng lặp Entity (circular) phải được phát hiện và hiển thị (`Layer = Error`,
   `DisplayContent = "Chu kỳ entity: {name}"`) NHƯNG dùng cùng màu tím/xám như Entity
   bình thường — không có màu lỗi riêng biệt (khác với mục tiêu Error `#E74C3C` trong
   `entity-insight-rendering.md`).
6. Go To Definition (F12) và Search/Replace (Ctrl+F/Ctrl+H) chỉ hoạt động trên Source
   text thô của AvalonEdit — không có logic tìm theo Resolved Value.

# UI Behavior

- Tham chiếu Entity gốc: font `Cascadia Code, Consolas`, size 12, `Italic`, màu `#757575`
  (xám), không thể gõ trực tiếp (`TextBlock`, không phải `TextBox`).
- Dấu phân cách `│` màu `#AB47BC` (tím) giữa tham chiếu gốc và giá trị Resolve.
- Giá trị Resolve: cùng font mono, `TextBox` (`IsReadOnly` theo `CanEditResolvedValue`),
  nền trắng khi editable / trong suốt khi không, chữ `#2D2D2D`.
- Khung chứa (`Border`): viền `#CE93D8`, nền `#F8F0FA` ở depth 0, `#FCF8FD` ở các depth lồng
  sâu hơn.
- **Không có màu Error riêng** cho trường hợp circular hay bất kỳ lỗi Entity nào khác —
  toàn bộ vẫn dùng bảng màu tím/xám ở trên. Đây là lệch so với UI Guidelines/ADR-0004 (màu
  `#E74C3C` cho lỗi), ghi nhận là backlog.
- Commit giá trị: `LostKeyboardFocus` hoặc Ctrl+Enter trong khối inline; `LostFocus` trong
  cột "Resolved" của panel song song. Escape trong khối inline revert về giá trị trước đó
  (`_original_value`) — panel song song không có hành vi Escape-revert tương đương.

# Data Flow

```
ErpDocument.Insights (từ InsightProviderPipeline — xem ../language/entity-resolution.md)
    ↓
FormBuilderViewModel.RefreshEntitiesFromSemantic
    ↓
    ├── BindableXmlEditor.Insights (DependencyProperty)
    │        ↓
    │   InsightElementGenerator (VisualLineElementGenerator, đăng ký trên
    │                              TextArea.TextView.ElementGenerators)
    │        ↓
    │   InlineObjectElement chứa EntityInsightBlock  (thay thế glyph run tại offset,
    │                                                   Document.Text KHÔNG đổi)
    │
    └── InsightEditorLineVm (danh sách phẳng, cột Semantic/Resolved trong
                              InsightEditorSurface.xaml — độc lập với luồng trên)
```

Luồng edit ngược lại (cả 2 nguồn UI đều hội tụ về cùng một điểm):

```
EntityInsightBlock.Commit()  hoặc  InsightEditorSurface ResolvedValue_LostFocus
    ↓
FormBuilderViewModel.UpdateEntityInline / CommitEntityValue
    ↓
IErpLanguageService.UpdateEntityValue(documentId, entityName, newValue)
    ↓
ApplyLanguageDocument: thay ErpDocument + SemanticModel, ghi đè TOÀN BỘ XmlSource từ
    ErpDocument.GetProjection(Source).Text
    ↓
BoundText (DependencyProperty) → BindableXmlEditor.OnBoundTextChanged
    ↓
Document.Text = new_text   (thay toàn bộ nội dung AvalonEdit Document — không phải patch
                              cục bộ tại vị trí Entity)
```

# State Machine

```
[Insight chưa render]
    │  Document mở ở chế độ Insight / Insights property thay đổi
    ▼
[InsightElementGenerator.ConstructElement được gọi cho offset trong dòng đang hiển thị]
    │
    ├── InsightType.Entity → render EntityInsightBlock
    └── InsightType khác (Validation, ...) → KHÔNG render (IsRenderable = false)
    │
    ▼
[Người dùng sửa giá trị Resolve]
    │
    ▼
[UpdateEntityValue thành công] ──▶ [XmlSource ghi đè toàn bộ, Document.Text thay toàn bộ]
        │
        └── thất bại ──▶ (chưa xác nhận rollback cụ thể — cần kiểm tra khi viết test)
```

# Events

Không có Event hệ thống nào được phát (không `SemanticChanged`/`InsightChanged` — kế thừa
gap ở `../language/parsing-and-semantic-model.md`). Cập nhật UI hoàn toàn qua WPF
`DependencyProperty`/`PropertyChanged` binding trực tiếp giữa `FormBuilderViewModel` và
`BindableXmlEditor`/`InsightEditorSurface`.

# Commands

- **Edit Entity Value** — thực hiện qua `RelayCommand<EntityValueEdit>`
  (`BindableXmlEditor.InsightEditCommand`) hoặc gọi trực tiếp `CommitEntityValue` từ
  code-behind (không đi qua `ICommand` trong trường hợp panel song song) — **không nhất
  quán về đường đi Command giữa 2 cơ chế UI**.
- **Undo/Redo** — `IdeCommands.Undo`/`Redo` (Ctrl+Z/Ctrl+Y) ở cấp IDE hiện là **no-op
  stub** (comment trong code: "Stubs an toàn — không crash"). Chỉ có Undo built-in của
  AvalonEdit hoạt động khi focus nằm trong `TextEditor`, và nó undo theo thao tác text
  (bao gồm cả việc `Document.Text` bị thay toàn bộ sau mỗi Entity edit — tức 1 lần Edit
  Entity Value = 1 undo step rất lớn, không phải "undo đúng 1 giá trị Entity vừa sửa").
  Đây là lệch rõ ràng so với yêu cầu "Command chung của IDE hỗ trợ Undo/Redo" trong
  `entity-insight-rendering.md`.
- **Go To Definition (F12)**, **Open Search (Ctrl+F)**, **Open Replace (Ctrl+H)** — hoạt
  động trên Source text thô, dùng `XmlStructureParser` + AvalonEdit `SearchPanel` built-in.

# Integration

- Phụ thuộc `../language/entity-resolution.md` (nguồn `Insights`) và
  `IErpLanguageService.UpdateEntityValue` — không tự resolve/parse Entity.
- **Cập nhật 2026-07-19 — `IEditorPlatform` đã tồn tại** (project mới
  `DevWorkFlow.Editor`, theo đúng ADR-0005: `IEditorDocumentService`,
  `IEditorSelectionService`, `IEditorDecorationService`). Implementation duy nhất hiện
  tại là `FormBuilderEditorPlatform` (`UI/Services/FormBuilderEditorPlatform.cs`) — một
  Adapter thuần bọc quanh `FormBuilderViewModel`, không đổi hành vi gì, truy cập qua
  `FormBuilderViewModel.Platform`. **Chưa migrate consumer nào** (`OutlineViewModel`,
  `InsightPanelViewModel`, `SymbolInfoViewModel`, `PropertyGridViewModel`,
  `XmlBottomViewModel`, `XmlStructureOutlineViewModel`, `FormBuilderDiagnosticsBridge` —
  7 ViewModel — vẫn nhận thẳng `FormBuilderViewModel?` qua constructor thay vì
  `IEditorPlatform`) — đây là việc còn lại, cố ý để riêng vì rủi ro hồi quy cao (không thể
  kiểm chứng trực quan các panel WPF trong môi trường viết spec/code này). `View` vẫn bind
  `DependencyProperty` trực tiếp vào property của `FormBuilderViewModel` (đúng MVVM: View
  bind vào ViewModel, không phải chiều ngược) — phần vi phạm ADR-0005 thực sự nằm ở việc
  7 ViewModel khác phụ thuộc thẳng vào lớp cụ thể `FormBuilderViewModel` thay vì abstraction,
  không phải ở binding View↔ViewModel.
  Không có Message Bridge (chỉ cần khi có Monaco/WebView2 thật — AvalonEdit chạy in-process,
  không cần serialize qua JSON).
- `BindableSqlEditor` (SQL Studio) là editor AvalonEdit riêng, **không** có bất kỳ máy
  Insight nào (không `InsightElementGenerator`, không `Insights` property) — chỉ syntax
  highlight TSQL/SQL.
- Diagnostics: `IdeDiagnosticsViewModel`/`ProblemItemVm` hiển thị Diagnostic ở Problems
  panel (bottom dock), tách biệt hoàn toàn khỏi cơ chế Insight inline này — xem
  `../language/diagnostics-pipeline.md` mục Integration cho gap "Validation không render
  inline".

# Performance

Không có Virtualization/Incremental Rendering riêng cho Insight — `InsightElementGenerator`
dựa vào cơ chế dòng-hiển-thị (`VisualLine`) sẵn có của AvalonEdit (AvalonEdit tự giới hạn
render theo viewport), không có logic Dispose/Render lại theo Visible Range tự viết thêm.
Mỗi lần sửa 1 Entity, toàn bộ `Document.Text` bị thay (không phải patch cục bộ) — với
Document lớn đây có thể gây giật khi gõ nhanh liên tiếp nhiều Entity.

# Error Handling

| Tình huống | Hành vi mong đợi hiện tại |
|---|---|
| Entity vòng lặp (circular) | Hiển thị `"Chu kỳ entity: {name}"` inline, nhưng dùng màu bình thường (không phải màu Error) — người dùng dễ bỏ sót. |
| Entity không tồn tại (không có khai báo) | **Không hiển thị gì cả** — tham chiếu `&Name;` hiện ra như text XML thường, không có chỉ báo lỗi (gap đã xác nhận, xem `entity-insight-rendering.md` Implementation Status). |
| `UpdateEntityValue` thất bại | Chưa xác nhận có rollback UI hay không — cần viết test cụ thể trước khi coi đây là "đã xử lý đúng". |
| Document rất lớn, gõ nhanh liên tiếp | Không có debounce nào cấp Insight riêng ngoài debounce 800ms reparse ở FormBuilderViewModel cho luồng Source→Design (xem `../designer/form-builder-canvas.md`) — có thể giật do thay toàn bộ `Document.Text` mỗi lần Entity edit. |

# Future Extension

- Khi Editor Platform + Monaco Adapter thật được xây (theo ADR-0002/ADR-0005), toàn bộ
  spec này cần được thay thế — không mở rộng thêm tính năng mới lên nền AvalonEdit ngoài
  việc vá các gap đã liệt kê, để tránh đầu tư sâu thêm vào giải pháp tạm thời.
  - **Trạng thái đến 2026-07-19: `IEditorPlatform` (interface) đã có, Monaco Adapter vẫn
    chưa có timeline.** Bước tiếp theo hợp lý: (1) migrate từng consumer trong số 7
    ViewModel còn lại sang `IEditorPlatform` thay vì `FormBuilderViewModel` cụ thể — nên
    làm từng cái một, có test/kiểm chứng thủ công sau mỗi lần, không làm hàng loạt cùng
    lúc; (2) khi đó mới bắt đầu Monaco Adapter thật (WebView2 + Message Bridge), lúc này
    interface đã ổn định nên Adapter mới không phá vỡ consumer đã migrate.
- Hợp nhất 2 cơ chế UI (inline block + panel song song Semantic/Resolved) thành một nguồn
  sự thật duy nhất, hoặc quyết định rõ vai trò khác nhau của mỗi cái (ví dụ: panel song
  song dùng cho review nhanh nhiều Entity, inline dùng cho edit tại chỗ) — hiện chưa có
  quyết định rõ ràng, cả hai đang tồn tại song song không lý do kiến trúc.
- Thêm màu Error riêng cho Entity lỗi (circular/không tồn tại).
- Search theo Resolved Value.
- Command/Transaction-based Undo/Redo thay cho AvalonEdit built-in undo.

# Acceptance Criteria

- [ ] Given một Document mở ở chế độ Insight với `&ClientDefault;`, When render, Then
      `Document.Text` của AvalonEdit vẫn chứa nguyên `&ClientDefault;` (kiểm tra bằng
      cách đọc `Document.Text` trực tiếp, không phải qua bản hiển thị).
- [ ] Given người dùng sửa giá trị Resolve trong khối inline và nhấn Ctrl+Enter, When
      commit, Then `IErpLanguageService.UpdateEntityValue` được gọi đúng 1 lần với giá
      trị mới.
- [ ] Given người dùng nhấn Escape khi đang sửa giá trị Resolve trong khối inline, When
      kiểm tra, Then giá trị hiển thị quay lại `_original_value`, KHÔNG gọi
      `UpdateEntityValue`.
- [ ] Given một Entity vòng lặp, When render inline, Then hiển thị
      `"Chu kỳ entity: {name}"` — xác nhận KHÔNG có màu Error khác biệt (dùng làm test
      hồi quy cho tới khi gap được vá).
- [ ] Given người dùng nhấn Ctrl+Z (Undo) ở cấp IDE (ribbon/menu), When kiểm tra, Then
      không có gì xảy ra (no-op, xác nhận gap hiện tại).
- [ ] Given SQL Studio đang mở một buffer, When kiểm tra `BindableSqlEditor`, Then không
      có `InsightElementGenerator` hay `Insights` property nào được gắn.
