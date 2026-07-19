# Form Builder — Layout Canvas

Module: designer
Status: Implemented cho phần "semantic layout inspector/editor" mô tả dưới đây;
Design-ahead (thuộc Roadmap Level 4) cho phần "true drag-drop WYSIWYG" — xem mục Verdict.
KHÔNG coi toàn bộ Designer là "chưa triển khai" — một phần đáng kể đã chạy thật.
Related Architecture: 01-ARCHITECTURE.md, 07-UI_GUIDELINES.md (Designer/Canvas/Pixel Ruler), 09-ROADMAP.md (Level 4)
Related Specs: ../editor/insight-editor-surface.md, ../language/parsing-and-semantic-model.md

---

# Correction (2026-07-19)

Bản spec gốc (viết cùng ngày, dựa trên báo cáo của một agent nghiên cứu code) khẳng định
"Column Ruler tương tác đầy đủ (resize/insert/split/merge/delete cột)" là tính năng thật
đang chạy. Khi dọn dẹp dead code, rà soát trực tiếp (grep toàn bộ `.xaml` + `.cs`, không
chỉ đọc class riêng lẻ) phát hiện điều này SAI: `InteractiveFormRuler.cs`/`FormRuler.cs`
**không được đặt trong bất kỳ file XAML nào** (không có `<ctrl:InteractiveFormRuler>` hay
`<ctrl:FormRuler>` ở đâu cả), và 6 method liên quan trên `FormBuilderViewModel`
(`ApplyColumnWidth`, `ApplyCategoryColumnWidth`, `RulerInsertColumn`, `RulerDeleteColumn`,
`RulerSplitColumn`, `RulerMergeColumns`) có **zero caller** trong toàn bộ ứng dụng. Toàn
bộ cụm này (2 file Control + khối method trên ViewModel, ~250 dòng) đã bị xoá như dead
code (xem `docs/specs/README.md` mục Known Doc Drift). Bài học: báo cáo của agent nghiên
cứu code mô tả một class "có vẻ hoạt động đầy đủ" dựa trên đọc riêng file đó KHÔNG đủ để
kết luận nó thực sự được dùng — phải xác nhận điểm gắn kết thật (XAML placement, caller)
trước khi đưa vào spec là "Implemented".

Ruler thực tế đang hiển thị trên canvas là `PixelRuler` (trong `DesignViewport.xaml`, hỗ
trợ kéo tạo guideline — mục 3 dưới đây vẫn đúng) và `ColumnGuides` (chỉ vẽ đường kẻ dọc
thụ động theo `RulerTicks`, `IsHitTestVisible=False`, không tương tác). Việc đổi độ rộng
cột duy nhất còn hoạt động thật là kéo handle Đông của `SelectionChrome` (mục 8 dưới đây,
`ResizeCellSpanToWidth`/`ApplyCellSpan` — đã xác nhận có caller thật qua
`Chrome_EastDragStarted/Delta/Completed` trong `FormBuilderPage.xaml.cs`).

# Purpose

09-ROADMAP.md xếp "Visual Form Designer" vào Level 4 (tương lai). Rà soát code thực tế
cho thấy một phần đáng kể đã được xây và hoạt động: canvas có zoom/pan/grid/snap/
guideline, resize column-span qua handle Đông của `SelectionChrome`, và Property Grid
đồng bộ hai chiều với XML thật qua Semantic Model. Phần CHƯA có: kéo-thả control mới từ
Toolbox vào canvas, di chuyển/resize tự do (free-form) một control bất kỳ, và
Insert/Split/Merge/Delete cột qua UI (code cho việc này từng tồn tại nhưng chưa từng được
gắn vào UI nên đã bị xoá như dead code — xem mục Correction). Spec này mô tả chính xác
ranh giới đó, để tránh coi toàn bộ Designer là "chưa làm gì" hoặc ngược lại "đã xong
Level 4".

Đúng bản chất hơn: đây là một **semantic layout inspector/editor** — chọn, đổi độ rộng
cột, sửa thuộc tính field — hiển thị trên một bản preview trực quan (read-only) của layout
FBO dạng lưới ô (grid-of-cells), KHÔNG phải một WYSIWYG designer tổng quát kiểu Visual
Studio/Figma.

# User Story

- Là lập trình viên, tôi muốn xem trực quan layout của một Form FBO (không chỉ đọc XML),
  để hiểu bố cục nhanh hơn.
- Là lập trình viên, tôi muốn kéo biên cột để đổi độ rộng và thấy ngay kết quả, thay vì
  tính toán số pixel thủ công trong XML.
- Là lập trình viên, tôi muốn chọn một field trên canvas và sửa thuộc tính của nó qua
  Property Grid, để không phải nhớ tên attribute XML chính xác.
- Là lập trình viên, tôi muốn sửa trực tiếp trong Source/Insight Editor và thấy Designer
  cập nhật theo, để không phải chọn lại "nguồn sự thật" mỗi lần chuyển qua lại.

# Functional Requirements

1. FormBuilderPage phải có 3 chế độ hiển thị tách biệt: Source, Insight, Designer — chọn
   qua nút chuyển đổi, mặc định mở ở chế độ Insight (không phải Designer).
2. Chế độ Designer phải hiển thị canvas với: zoom (0.25–4.0), pan (giữa-click hoặc
   Space+kéo), lưới chấm (dot grid) phản ứng theo zoom, snap khi đặt guideline.
3. Người dùng phải đặt được guideline bằng cách kéo từ Pixel Ruler (ngang/dọc), có snap
   theo bước cấu hình được, Escape để huỷ khi đang kéo.
4. **Đã sửa 2026-07-19 — yêu cầu này KHÔNG còn áp dụng, xem Correction bên dưới.**
   ~~Column Ruler (thanh riêng phía trên bảng) phải cho phép: kéo biên cột để đổi độ
   rộng (có preview khi kéo + commit khi thả), click chọn cột (Shift = chọn theo khoảng,
   Ctrl = toggle), menu chuột phải để Insert/Split/Merge/Delete cột.~~
5. Chọn một hoặc nhiều cell trên canvas (Ctrl-click cho multi-select) phải cập nhật
   Property Grid hiển thị đúng thuộc tính của field tương ứng.
6. Sửa một thuộc tính trong Property Grid phải ghi lại vào field thật và cập nhật XML
   Source ngay lập tức (không cần nút Save riêng để đồng bộ Designer↔Source).
7. Sửa Source/Insight Editor phải khiến Designer tự cập nhật lại (re-parse + re-map) sau
   một khoảng debounce, không cần thao tác Refresh thủ công.
8. Việc "resize" một control trên canvas chỉ có nghĩa là thay đổi **column span** theo
   lưới cột hiện có — KHÔNG phải resize tự do theo pixel X/Y bất kỳ (vì model dữ liệu
   không có toạ độ tự do).

# UI Behavior

- 8 handle chọn (`SelectionChrome`) hiển thị quanh cell được chọn, nhưng chỉ handle phía
  Đông (East) thực sự tương tác được (kéo để đổi column span); 7 handle còn lại chỉ mang
  tính hiển thị, không bắt sự kiện chuột — đây là chủ đích (model không có free-form
  resize), không phải bug thiếu code.
- Cell nội dung (input) trên canvas là `TextBox` với `IsReadOnly="True"`,
  `IsHitTestVisible="False"` — không gõ trực tiếp được vào canvas; mọi chỉnh sửa giá trị
  thuộc tính đi qua Property Grid hoặc Source/Insight Editor.
- Guideline hiển thị theo 2 lớp: guideline cố định (đã đặt) và guideline tạm thời (đang
  kéo để resize/align) — vẽ bởi `GuidelineLayer`.

# Data Flow

Design → Source (structural edit: column span, field property):

```
Người dùng thao tác trên canvas (kéo handle Đông) hoặc property grid
    ↓
FormBuilderViewModel (UpdateFieldProperty / ApplyCellSpan)
    ↓
Mutate FboFormModel/FboField (domain model, in-memory)
    ↓
XmlWriter.ApplyFieldProperty / ApplyLayout  (ghi lại XmlSource)
    ↓
XmlSource property đổi → EditorText (Source/Insight) cập nhật NGAY (không debounce)
```

Source → Design (đường ngược lại, có debounce):

```
Người dùng gõ trong Source/Insight Editor → XmlSource đổi
    ↓
Debounce 800ms (_reparse_timer, DispatcherTimer)
    ↓
ParseXml(): IErpLanguageService.OpenDocumentFromText → FboDesignMapper.Map(Document, ...)
    ↓
Design (DesignSurfaceVm) được XÂY LẠI TOÀN BỘ — SelectedCells/ActiveGuides bị reset
```

# State Machine

```
[Source mode]  ⇄  [Insight mode]  ⇄  [Designer mode]
       (chuyển đổi tự do qua nút chọn chế độ, không mất dữ liệu — cùng 1 XmlSource)

Trong Designer mode:
[Chưa chọn cell]
    │ Click cell
    ▼
[Đã chọn 1 cell] ──(Ctrl-click cell khác)──▶ [Đã chọn nhiều cell]
    │ Kéo handle Đông
    ▼
[Đang resize — preview] ──(thả chuột)──▶ [Commit: ApplyCellSpan → ParseXml]
```

# Events

Không có Event hệ thống — toàn bộ đồng bộ qua `PropertyChanged`/`DispatcherTimer`
debounce trong `FormBuilderViewModel` (tương tự gap chung đã ghi ở
`../language/parsing-and-semantic-model.md`).

# Commands

- **Select Cell** (single/multi qua Ctrl) — không đổi dữ liệu.
- **Resize Cell Span** (kéo handle Đông của `SelectionChrome`) — đổi dữ liệu, ghi lại XML
  ngay; **không có Undo/Redo riêng** (kế thừa gap Undo/Redo chung của IDE, xem
  `../editor/insight-editor-surface.md`).
- **Update Field Property** (qua Property Grid) — đổi dữ liệu field, ghi lại XML, đồng bộ
  gap Undo/Redo tương tự.
- **Place Guideline** — chỉ là hỗ trợ hiển thị, không ghi vào XML (guideline không phải
  dữ liệu Form, là công cụ căn chỉnh khi thiết kế).

Không có Command Insert/Split/Merge/Delete Column — code cho việc này (`RulerInsertColumn`
v.v. trên `FormBuilderViewModel`) đã bị xoá như dead code (xem Correction), vì chưa từng
có UI nào gọi tới.

# Integration

- Phụ thuộc `FboXmlParser` (đọc) và `XmlWriter`/`FboLayoutUnits`/`FboOptionsCatalog` (ghi)
  — các class này nằm ở `DevWorkFlow.Application/Engine`, không phải ở tầng Language
  Service Semantic Model chính thức (`ErpSemanticBinder`) — nghĩa là Designer hiện đọc/
  ghi qua một pipeline domain-specific riêng (FBO Form) song song với, chứ không thống
  nhất hoàn toàn vào, Semantic Model chung mô tả ở
  `../language/parsing-and-semantic-model.md`. Đây là điểm cần lưu ý khi hợp nhất kiến
  trúc Semantic Model dài hạn (ADR-0006 yêu cầu Semantic Model là Source of Truth duy
  nhất).
- **Mã chết đã xoá 2026-07-19**: `XmlFormParser.cs`/`FormDefinition`/`FieldDefinition`/
  `IFormService` (một pipeline Form đơn giản hơn, KHÔNG liên quan tới pipeline FBO thật
  đang dùng — `FboXmlParser`/`FboFormModel`; chỉ inject không gọi) và
  `InteractiveFormRuler.cs`/`FormRuler.cs` + khối 6 method Ruler trên `FormBuilderViewModel`
  (chưa từng gắn vào XAML, zero caller) đã bị xoá khỏi codebase. Xem mục Correction ở đầu
  file và `docs/specs/README.md` mục Known Doc Drift.
- Toolbox (`ToolboxViewModel`) hiện chỉ là danh mục tĩnh, tự khai là "stub — chưa kéo
  thả" trong chính comment của nó — không có Drop Target nào ở `DesignViewport` nhận
  input từ Toolbox.

# Performance

Không có target số cụ thể riêng cho Designer trong Architecture. Việc `ParseXml()` xây
lại toàn bộ `DesignSurfaceVm` từ đầu (không incremental) sau mỗi lần Source đổi — với
Form lớn (nhiều field/category) đây có thể là điểm nghẽn khi gõ nhanh dù đã có debounce
800ms.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| Source bị sửa thành XML không hợp lệ trong lúc đang ở Designer mode | `ParseXml()` gọi `OpenDocumentFromText`, dựa vào cơ chế phục hồi lỗi của Parser (xem `../language/parsing-and-semantic-model.md`) — Design nên hiển thị theo kết quả fallback thay vì crash; cần test cụ thể để xác nhận UI không "đứng hình" khi XML tạm thời không hợp lệ giữa lúc gõ. |
| Kéo handle Đông vượt quá số cột khả dụng | Cần xác nhận hành vi giới hạn (clamp) cụ thể — chưa có bằng chứng rõ trong nghiên cứu này. |

# Future Extension

- Toolbox kéo-thả control mới vào canvas — chưa có Drop Target, đây là phần thực sự
  thuộc Level 4 còn thiếu.
- Free-form move/resize (toạ độ X/Y/width/height tự do) — model dữ liệu hiện tại không hỗ
  trợ; cần quyết định có mở rộng model FBO layout để hỗ trợ hay giữ nguyên mô hình lưới
  cột (grid-of-cells) như bản chất thật của FBO Form.
- Nhập giá trị trực tiếp (WYSIWYG in-place editing) trên canvas — hiện input cell là
  read-only, mọi edit qua Property Grid hoặc Source Editor.
- Hợp nhất pipeline đọc/ghi Designer (`FboXmlParser`/`XmlWriter`) vào Semantic Model
  chung của ERP Language Service, thay vì một nhánh song song riêng.
- Nếu Insert/Split/Merge/Delete Column thực sự cần thiết cho workflow người dùng, đây là
  tính năng cần THIẾT KẾ LẠI từ đầu (UI thật + gắn vào ruler/menu) — không phục hồi lại
  code cũ đã xoá, vì code đó chưa từng được thiết kế UI đi kèm.

# Acceptance Criteria

- [ ] Given FormBuilderPage vừa mở một Controller có Design, When kiểm tra chế độ mặc
      định, Then hiển thị ở chế độ Insight, không phải Designer.
- [ ] Given người dùng kéo handle Đông của `SelectionChrome` trên một cell đang chọn, When
      thả chuột, Then column span mới được ghi vào `XmlSource` ngay lập tức (không cần
      Save thủ công).
- [ ] Given người dùng sửa `XmlSource` trực tiếp trong Source Editor, When chờ hết 800ms
      không gõ thêm, Then Designer tự rebuild và phản ánh đúng thay đổi, `SelectedCells`
      bị reset về rỗng.
- [ ] Given người dùng chọn một cell rồi sửa thuộc tính "Required" trong Property Grid,
      When kiểm tra, Then thuộc tính đó được áp dụng cho MỌI cell khác cùng trỏ tới field
      đó trên toàn bộ Design (không chỉ cell đang chọn), và `XmlSource` được cập nhật.
- [ ] Given người dùng click và giữ vào một control trong Toolbox rồi kéo qua canvas, When
      thả chuột trên canvas, Then KHÔNG có control mới nào được thêm (xác nhận gap hiện
      tại — Toolbox chưa hỗ trợ kéo-thả).
- [ ] Given người dùng kéo 1 trong 7 handle không phải Đông (ví dụ handle Nam) của
      `SelectionChrome`, When kiểm tra, Then không có hành vi resize nào xảy ra (xác nhận
      chỉ handle Đông hoạt động).
