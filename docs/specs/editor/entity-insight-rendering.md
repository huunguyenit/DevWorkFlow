# Entity Insight Rendering

Module: editor
Status: Interim — target hành vi mô tả dưới đây giả định Editor Platform + Monaco theo
ADR-0002/ADR-0005. Implementation hiện tại dùng AvalonEdit (WPF thuần) làm Editor Engine
tạm thời, KHÔNG qua Editor Platform/Message Bridge nào — xem chi tiết hành vi thực tế và
danh sách lệch cụ thể tại `insight-editor-surface.md`. Quyết định giữ AvalonEdit làm giải
pháp tạm thời (không sửa ADR-0002 đã Accepted) đã được xác nhận với chủ dự án; ADR-0002
vẫn là đích đến chính thức.
Related Architecture: 03-EDITOR_PLATFORM.md, ADR-0004-InsightLayer.md, ADR-0005-EditorPlatform.md, ADR-0002-MonacoEditor.md, 07-UI_GUIDELINES.md
Related Specs: insight-editor-surface.md

---

# Triết lý hiển thị đã đổi (2026-07-20) — đọc trước phần còn lại

Spec này mô tả cách hiển thị "giữ `&X;` + chèn giá trị resolve ngay sau nó". **Cách đó không
còn là hành vi hiện hành.** Từ 2026-07-20, Insight mode hiển thị toàn bộ document dưới dạng
clear text (entity đã expand) và chỉ tô nền để cho biết đoạn text đến từ entity nào —
inline ≠ SYSTEM, cấp 0 ≠ lồng; hover hiện tên entity; Ctrl+Click mở entity (tab mới với
entity SYSTEM, giữ nguyên caret tab hiện tại); Insight mode là **read-only**.

Xem `insight-editor-surface.md` mục "Cập nhật 2026-07-20" cho spec hiện hành.

Các mục dưới đây còn hiệu lực về **nguyên tắc** (Layer 1 không bị sửa; entity lồng không
được flatten; lỗi phải hiện inline; không MessageBox; search theo giá trị resolve vẫn là
backlog), nhưng phần mô tả *hình thức hiển thị* (xám/nghiêng, giá trị nằm sau reference,
inline edit tại chỗ) đã bị thay thế.

---

# Implementation Status (bổ sung 2026-07-19)

Spec dưới đây mô tả **hành vi mục tiêu** theo ADR-0004/ADR-0005 (Insight Layer trên
Editor Platform + Monaco) và vẫn là spec mẫu (worked example) cho cấu trúc Template. Khi
đối chiếu với implementation AvalonEdit hiện tại, các điểm sau CHƯA đạt được mục tiêu —
xem `insight-editor-surface.md` để biết đầy đủ:

- Tham chiếu Entity không tồn tại (không resolve được) hiện **không hiển thị chỉ báo lỗi
  inline** — nó im lặng hiển thị như text XML thường (lệch Functional Requirement #6 và
  Acceptance Criterion tương ứng bên dưới).
- Insight loại Validation (không phải Entity) **không render inline** trong AvalonEdit,
  dù Insight Provider Pipeline đã tạo dữ liệu cho nó — chỉ hiện ở Problems panel/Insight
  Panel bên ngoài Editor.
- Search trong Editor (Ctrl+F) hiện chỉ tìm trên Source text (`&ClientDefault;`), **chưa**
  tìm được theo giá trị đã Resolve (`Default`) — lệch Functional Requirement #7 và
  Acceptance Criterion cuối cùng bên dưới.
- Không có Command/Transaction-based Undo/Redo cho việc sửa giá trị Entity — Undo/Redo ở
  cấp IDE hiện là no-op stub; chỉ có Undo built-in của AvalonEdit (theo thao tác text
  editor, không theo Command Rename Entity) — lệch yêu cầu Undo/Redo trong mục Commands.

Các Functional Requirement/UI Behavior/Acceptance Criteria bên dưới GIỮ NGUYÊN như mục
tiêu chính thức — không hạ chuẩn để khớp implementation. Việc chưa đạt là backlog, không
phải thay đổi yêu cầu.

# Purpose

Khi lập trình viên mở một tài liệu XML chứa tham chiếu Entity (ví dụ `&ClientDefault;`), họ
thường không thể biết giá trị thực của Entity đó mà không rời khỏi Editor để tra cứu. Tính năng
này cho phép Editor hiển thị đồng thời cả tham chiếu Entity gốc và giá trị đã Resolve, ngay
trong luồng đọc/sửa văn bản, để lập trình viên hiểu và chỉnh sửa ERP nhanh hơn mà không mất
khả năng nhìn thấy cấu trúc Entity gốc.

# User Story

- Là lập trình viên ERP, tôi muốn nhìn thấy giá trị đã Resolve của một Entity ngay cạnh tham
  chiếu gốc trong Editor, để tôi không phải mở file Entity riêng hoặc hover để tra cứu.
- Là lập trình viên ERP, tôi muốn sửa giá trị hiển thị và để hệ thống tự cập nhật đúng Entity
  gốc, để tôi không vô tình phá vỡ tham chiếu Entity khi chỉnh sửa.
- Là chuyên viên nghiệp vụ ít kinh nghiệm XML, tôi muốn đọc được ý nghĩa của một dòng cấu hình
  mà không cần hiểu cú pháp `&Entity;`, để tôi có thể tham gia review cấu hình.

# Functional Requirements

1. Khi Document được mở, mọi tham chiếu Entity hợp lệ trong vùng hiển thị (Visible Range) phải
   được hiển thị kèm giá trị đã Resolve ngay sau tham chiếu gốc.
2. Tham chiếu Entity gốc (ví dụ `&ClientDefault;`) luôn được giữ nguyên trong Source — Insight
   không bao giờ ghi đè hoặc xoá tham chiếu gốc khỏi nội dung lưu trữ.
3. Giá trị Resolve hiển thị phải phân biệt trực quan với tham chiếu gốc (xem UI Behavior).
4. Entity lồng nhau (nested, ví dụ `&Company.&Department.Manager;`) phải hiển thị đầy đủ phân
   cấp, không được rút gọn làm mất thông tin cấu trúc gốc.
5. Người dùng có thể chỉnh sửa trực tiếp phần giá trị hiển thị; thay đổi này phải được ghi lại
   vào đúng Entity gốc thông qua Semantic Model, không phải thay thế tham chiếu Entity bằng giá
   trị tĩnh.
6. Nếu một Entity không thể Resolve (không tồn tại, hoặc phát hiện tham chiếu vòng/circular),
   Insight phải hiển thị trạng thái lỗi thay vì im lặng bỏ qua hoặc hiển thị giá trị sai.
7. Search trong Editor phải tìm được cả theo tham chiếu Entity gốc (`&ClientDefault;`) lẫn theo
   giá trị đã Resolve (`Default`).
8. Insight chỉ được tính toán/hiển thị lại cho phần Document đang hiển thị (Visible Range);
   cuộn màn hình không được gây tính toán lại cho toàn bộ Document.

# UI Behavior

- Tham chiếu Entity gốc: hiển thị màu xám, chữ nghiêng, chỉ đọc (readonly) — người dùng không
  gõ trực tiếp vào phần này.
- Giá trị đã Resolve: hiển thị màu chữ bình thường (theo bảng màu Text trong
  `_SHARED/UI_GUIDELINES_SUMMARY.md`), có thể click để chỉnh sửa tại chỗ (inline edit).
- Entity lồng nhau hiển thị theo cấu trúc phân cấp (indent hoặc dạng cây rút gọn inline),
  không hiển thị dưới dạng một chuỗi phẳng làm mất thứ bậc.
- Không sử dụng Tooltip, Popup, hoặc Dialog để hiển thị giá trị Entity — đây là thông tin
  chính, phải hiển thị Insight ngay trong luồng đọc (Insight over Tooltip).
- Khi Entity không Resolve được: hiển thị chỉ báo lỗi inline (ví dụ icon cảnh báo + màu Error
  `#E74C3C`), không dùng MessageBox.
- Trạng thái Loading (khi Resolve đang chạy nền cho Document lớn): hiển thị trạng thái chờ nhẹ
  tại vị trí Entity, không chặn thao tác gõ phím của người dùng ở phần còn lại của Document.

# Data Flow

```
XML Document
    ↓
ERP Language Service: Parser → Syntax Tree → Semantic Builder → Semantic Model
    ↓
Entity Service (Resolve Entity trong Semantic Model)
    ↓
Insight Provider Pipeline (Entity Provider)
    ↓
Insight Layer
    ↓
Editor Platform — Decoration Service
    ↓
Monaco Editor View (hiển thị cho người dùng)
```

Luồng chỉnh sửa ngược lại (khi người dùng sửa giá trị hiển thị):

```
User chỉnh sửa giá trị hiển thị trong Editor
    ↓
Editor Platform (Message Bridge)
    ↓
Insight Provider (Entity Provider) — Resolve ngược về Entity gốc
    ↓
Semantic Model được cập nhật qua Command/Transaction
    ↓
Serializer
    ↓
XML (tham chiếu Entity gốc `&ClientDefault;` được giữ nguyên, không bị thay bằng giá trị tĩnh)
```

# State Machine

Trạng thái hiển thị của một Entity Insight (theo từng tham chiếu Entity riêng lẻ):

```
[Chưa tính toán]
        │  Document mở / cuộn vào Visible Range
        ▼
   [Đang Resolve] ──────── (background, không chặn UI)
        │
        ├── Resolve thành công ──▶ [Đã hiển thị: Entity gốc + Giá trị]
        │                                 │
        │                                 │ Người dùng sửa giá trị
        │                                 ▼
        │                          [Đang cập nhật Semantic Model]
        │                                 │
        │                                 ├── Thành công ──▶ [Đã hiển thị: Entity gốc + Giá trị mới]
        │                                 └── Thất bại ─────▶ [Lỗi: hiển thị + rollback giá trị cũ]
        │
        └── Resolve thất bại (không tồn tại / circular) ──▶ [Lỗi hiển thị inline]
```

# Events

- `SemanticChanged` — phát bởi ERP Language Service khi Semantic Model thay đổi; Insight Layer
  lắng nghe để biết cần tính toán lại Entity nào.
- `InsightChanged` — phát bởi Insight Service khi một hoặc nhiều Insight (bao gồm Entity Insight)
  cần cập nhật hiển thị.
- `DocumentChanged` — dùng để xác định phạm vi Incremental cần Resolve lại, tránh Resolve toàn bộ
  Document.

Không có Event mới nào cần bổ sung ngoài các Event đã định nghĩa trong
`02-ERP_LANGUAGE_SERVICE.md` — nếu triển khai phát hiện cần Event khác, phải báo cáo trước khi
tự đặt tên Event mới.

# Commands

- **Edit Entity Value** — sửa giá trị hiển thị của một Entity; phải hỗ trợ Undo/Redo theo cơ chế
  Command chung của IDE (không phải cơ chế Undo riêng của Monaco).
- **Navigate to Entity Definition** — từ Insight, điều hướng tới nơi định nghĩa Entity gốc
  (dùng SymbolId, không dùng số dòng — Rule R7).

Không có Command mới nào khác cần thiết cho phạm vi tính năng này.

# Integration

- Phụ thuộc **ERP Language Service** (Entity Service, Insight Service) để Resolve và cung cấp
  dữ liệu Insight — Editor không tự Resolve Entity (Rule R6 áp dụng tương tự cho Editor: không
  Parse/Resolve, chỉ hiển thị dữ liệu đã có).
- Phụ thuộc **Editor Platform** (Decoration Service, Message Bridge) để render — không được cài
  đặt trực tiếp trên Monaco API (Rule R10).
- Ảnh hưởng **Search** (Search Service của ERP Language Service) — cần hỗ trợ tìm theo cả Entity
  gốc và giá trị Resolve.
- Extension Point cho Plugin: Plugin có thể đăng ký thêm **Insight Provider** khác (ví dụ hiển
  thị thêm Validation/Reference Count cạnh Entity Insight) mà không cần sửa tính năng này
  (Everything is a Provider).

# Performance

- Insight chỉ tính toán và Render cho Visible Range hiện tại của Editor (Virtualization,
  tương tự nguyên tắc trong `04-TREE_FRAMEWORK.md`); khi cuộn, Insight ngoài vùng nhìn thấy được
  Dispose và Insight mới trong vùng nhìn thấy được Render.
- Việc Resolve Entity khi Document thay đổi phải là Incremental (chỉ Resolve phần bị ảnh hưởng),
  không Resolve lại toàn bộ Document — kế thừa Performance Goals chung của ERP Language Service
  (`02-ERP_LANGUAGE_SERVICE.md`).
- Không có target số cụ thể (ms) được định nghĩa riêng cho tính năng này trong Architecture hiện
  tại; kế thừa nguyên tắc "không Render lại toàn bộ Document" của Editor Platform.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| Entity không tồn tại | Hiển thị chỉ báo lỗi inline (không phải giá trị rỗng hoặc im lặng bỏ qua); nêu rõ nguyên nhân + gợi ý (ví dụ "Entity không tồn tại — kiểm tra lại tên") theo mẫu Nguyên nhân → Giải pháp → Retry của UI Guidelines. |
| Circular Entity Reference | Entity Service phát hiện vòng lặp (Circular Detection, đã định nghĩa trong `02-ERP_LANGUAGE_SERVICE.md`); Insight hiển thị lỗi vòng lặp, không cố Resolve vô hạn. |
| Người dùng sửa giá trị nhưng cập nhật Semantic Model thất bại | Rollback về giá trị hiển thị trước đó, hiển thị lỗi inline, không để Document ở trạng thái không nhất quán giữa Source và Insight. |
| Document quá lớn khiến Resolve chậm | Hiển thị trạng thái chờ nhẹ tại vị trí Entity đang chờ Resolve, không chặn toàn bộ Editor. |

# Future Extension

- Hiển thị nhiều Insight cùng lúc trên một Entity (ví dụ Entity + Validation + AI Suggestion) —
  đã có cơ chế Insight Provider Pipeline hỗ trợ hợp nhất nhiều Insight (ADR-0004), nhưng cách
  bố trí hiển thị chi tiết khi có ≥ 3 Insight cùng lúc cần một spec riêng, không nằm trong scope
  spec này.
- Hiển thị Entity dạng cây thu gọn/mở rộng (breadcrumb-style) cho Entity lồng nhiều cấp — hiện
  tại chỉ yêu cầu "không mất thông tin phân cấp", chưa quy định chi tiết tương tác mở/thu gọn.
- Hỗ trợ AI đề xuất giá trị Entity thay thế ngay trong Insight — thuộc phạm vi AI Platform
  (Roadmap Level 6), không thuộc scope hiện tại (Level 1–2).

# Acceptance Criteria

- [ ] Given một Document chứa `clientDefault="&ClientDefault;"`, When Document được mở và dòng
      đó nằm trong Visible Range, Then Editor hiển thị cả `&ClientDefault;` (xám, nghiêng,
      readonly) và giá trị Resolve (ví dụ `Default`, màu chữ thường, editable) ngay sau nó.
- [ ] Given Entity lồng nhau `&Company.&Department.Manager;`, When hiển thị Insight, Then cấu
      trúc phân cấp của Entity được thể hiện đầy đủ, không bị rút gọn mất thông tin.
- [ ] Given người dùng sửa giá trị hiển thị của một Entity, When lưu Document, Then XML sinh ra
      vẫn giữ nguyên tham chiếu Entity gốc (`&ClientDefault;`), không bị thay bằng giá trị tĩnh.
- [ ] Given một Entity không tồn tại, When Insight cố Resolve, Then hiển thị chỉ báo lỗi inline
      thay vì giá trị rỗng hoặc im lặng bỏ qua.
- [ ] Given một vòng tham chiếu Entity (circular), When Resolve, Then hệ thống phát hiện và hiển
      thị lỗi thay vì treo hoặc đệ quy vô hạn.
- [ ] Given người dùng cuộn Editor qua một Document lớn, When các dòng mới xuất hiện trong
      Visible Range, Then chỉ Insight của các dòng mới được tính toán/hiển thị, không tính toán
      lại toàn bộ Document.
- [ ] Given người dùng gõ `Default` vào ô Search, When kết quả trả về, Then dòng chứa
      `&ClientDefault;` (được Resolve thành `Default`) xuất hiện trong kết quả tìm kiếm.
