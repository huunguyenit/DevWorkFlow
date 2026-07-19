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

# Cập nhật 2026-07-19 (lần 2) — Insight render NATIVE, không còn HTML widget

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
