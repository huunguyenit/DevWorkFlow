# Symbol & Navigation

Module: language
Status: Implemented (Go To Definition đầy đủ; Find References đầy đủ chỉ cho Entity)
Related Architecture: 02-ERP_LANGUAGE_SERVICE.md, ADR-0001-LanguageService.md, ADR-0006-SemanticModel.md
Related Specs: parsing-and-semantic-model.md, ../explorer/outline.md

---

# Purpose

Rule R7 (bắt buộc): Navigation phải dựa trên Symbol, không dựa trên số dòng. Spec này mô
tả cách DevWorkFlow định danh Symbol (Controller/Field/View/Command/Query/Script
Function/Response Action/Entity/Category) và cách Go To Definition / Find References /
Outline hoạt động dựa trên `SymbolId`/`NodeId` thay vì Line Number.

# User Story

- Là lập trình viên, tôi muốn nhảy tới định nghĩa gốc của một Field/Entity/Command bằng
  một thao tác, để không phải tự tìm bằng mắt trong file XML dài.
- Là lập trình viên, tôi muốn khi Rename hoặc chỉnh sửa XML làm dịch chuyển số dòng, việc
  Navigation vẫn đúng vị trí, để không bị "nhảy nhầm chỗ" sau khi Document thay đổi.
- Là lập trình viên, tôi muốn tìm tất cả nơi một Entity được tham chiếu trong Document, để
  đánh giá tác động trước khi sửa giá trị của nó.

# Functional Requirements

1. Mỗi phần tử có ý nghĩa trong Document (Controller, Field, View, Command, Query, Script
   Function, Response Action, Entity, Category) phải có một Symbol tương ứng với
   `SymbolKind` rõ ràng.
2. Mỗi vị trí trong cấu trúc tài liệu (kể cả node không phải Symbol, ví dụ một nhánh
   Outline) phải có một `NodeId` ổn định, sinh từ một khoá xác định (stable key) chứ
   không phải từ vị trí/index — để not bị lệch khi Document thay đổi phía trước nó.
3. Go To Definition phải nhận `SymbolId` và trả về đúng một `NavigationTarget` (bao gồm
   `TextRange`, không chỉ số dòng) trỏ tới nơi định nghĩa Symbol đó.
4. Find References cho Entity phải trả về đầy đủ: định nghĩa gốc + toàn bộ nơi Entity đó
   được tham chiếu (kể cả tham chiếu lồng trong giá trị của Entity khác).
5. Outline (cấu trúc phân cấp Document) phải build từ cùng `NavigationMap`, không phải một
   cơ chế Parse XML riêng — đảm bảo Outline và Navigation luôn nhất quán.
6. `WorkspaceSymbolIndex` phải cho phép tìm Symbol theo tên trên toàn Workspace (nhiều
   Document đã mở), không chỉ trong Document hiện tại.
7. Không component nào được dùng số dòng làm khoá tra cứu chính cho Navigation — số dòng
   chỉ là thông tin tiện lợi đi kèm `TextRange`/`SourceLocation`, không phải khoá.

# Data Flow

```
Semantic Model (Symbol list: Controller/Field/View/Command/Query/ScriptFunction/
                ResponseAction/Entity/Category)
    ↓
NavigationMapBuilder.Build  (duyệt Syntax Tree theo Schema — XsdSchemaCatalog, độ sâu tối
                              đa 5; xử lý riêng <script> function con, entity-ref con)
    ↓
NavigationMap  (Dictionary<NodeId, DocumentNode>, Dictionary<SymbolId, NodeId>,
                Dictionary<NodeId, NodeId> parent_of)
    ↓
ErpNavigationService
    ├── GoToDefinition(documentId, symbolId) → NavigationTarget (định nghĩa gốc)
    ├── FindReferences(documentId, symbolId) → danh sách NavigationTarget
    │       (đầy đủ cho Entity; chỉ trả định nghĩa cho các SymbolKind khác — xem Gap)
    ├── PeekDefinition  (giống hệt GoToDefinition)
    ├── FindChildren / FindParent  (duyệt NavigationMap theo parent_of)
    └── GetOutlineRoots  (dùng cho Outline panel)
```

# State Machine

Không có state machine runtime — Navigation là tra cứu tức thời trên `NavigationMap` đã
build sẵn (xem `parsing-and-semantic-model.md` — `NavigationMap` được rebuild toàn bộ mỗi
khi Document thay đổi, không incremental).

# Events

Kiến trúc dự kiến `NavigationChanged` được phát khi Navigation Map thay đổi — **chưa
implement** (kế thừa gap chung, xem `parsing-and-semantic-model.md` mục Events).

# Commands

- **Go To Definition** — điều hướng tới định nghĩa gốc của Symbol tại vị trí con trỏ.
- **Find All References** — liệt kê mọi nơi Symbol được sử dụng (đầy đủ cho Entity; các
  Symbol khác hiện chỉ trả về định nghĩa — xem Gap, cần làm rõ với người dùng UI rằng đây
  là hành vi tạm thời chứ không phải "không có Reference nào").
- **Navigate to Entity Definition** — trường hợp riêng của Go To Definition dùng trong
  Insight Layer (xem `../editor/entity-insight-rendering.md`).

Không Command nào ở đây thay đổi dữ liệu — không cần Undo/Redo.

# Integration

- Phụ thuộc Semantic Model từ `parsing-and-semantic-model.md`.
- Outline (`../explorer/outline.md`) dùng `NavigationMap`/`ErpNavigationService.GetOutlineRoots`
  làm nguồn dữ liệu — không tự Parse XML để dựng cây riêng (xem gap thực tế: hiện có MỘT
  implementation Outline không tuân theo nguyên tắc này, ghi rõ trong
  `../explorer/outline.md`).
- Editor Platform interim (`../editor/insight-editor-surface.md`) dùng
  `ErpNavigationService.GoToNode`/`GoToDefinition` cho tính năng "Go to Definition"
  (F12) và click vào Outline.
- Extension Point: kiến trúc dự kiến Navigation Provider cho Plugin (06-PLUGIN_SYSTEM.md)
  — **chưa có cơ chế đăng ký Provider ở tầng Navigation**, chỉ có một implementation cố
  định (`ErpNavigationService`).

# Performance

- Không có target số cụ thể riêng cho Navigation trong Architecture hiện tại (Tree
  Framework có target `<50ms Expand`, `<100ms Search` — không áp dụng trực tiếp cho
  Navigation Service). `NavigationMap` được rebuild toàn bộ đồng bộ mỗi lần Document
  thay đổi — kế thừa gap hiệu năng chung của `parsing-and-semantic-model.md`.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| `GoToDefinition`/`FindReferences` gọi với `SymbolId` không tồn tại | Trả kết quả rỗng/null — chưa xác nhận có Diagnostic hay UI feedback riêng; cần kiểm tra khi viết spec UI cho tính năng gọi tới đây. |
| `FindReferences` gọi cho một Symbol không phải Entity | Trả về chỉ định nghĩa gốc, không trả reference thật (đây là giới hạn hiện tại, không phải lỗi — comment trong code ghi "Phase 5 index mở rộng sau"). UI hiển thị tính năng này nên nêu rõ giới hạn, không ngụ ý "không có Reference nào tồn tại". |

# Future Extension

- Mở rộng `FindReferences` để hoạt động đầy đủ cho mọi `SymbolKind` (Field, Command,
  View, ...), không chỉ Entity — đây là công việc lớn nhất còn thiếu ở module này, đã
  được chính code đánh dấu "Phase 5".
- Rename Symbol (Refactoring Service) — chưa có, phụ thuộc vào Find References đầy đủ
  trước.
- Navigation Provider Extension Point cho Plugin.
- `NavigationChanged` Event.

# Acceptance Criteria

- [ ] Given một `EntitySymbol` có 3 tham chiếu trong Document, When gọi Find References,
      Then kết quả trả về đúng 1 định nghĩa + 3 tham chiếu, mỗi mục có `TextRange` chính
      xác (không phải chỉ số dòng).
- [ ] Given Document được sửa làm dịch số dòng của một Symbol, When gọi lại Go To
      Definition với cùng `SymbolId`, Then vị trí trả về là vị trí MỚI (đã cập nhật),
      không phải vị trí cũ theo dòng.
- [ ] Given Outline được yêu cầu build cho một Document, When kiểm tra nguồn dữ liệu, Then
      Outline dùng `NavigationMap`/`GetOutlineRoots`, không Parse XML riêng.
- [ ] Given hai Document khác nhau đã mở trong Workspace cùng có Symbol trùng tên, When
      gọi `WorkspaceSymbolIndex.Search` với tên đó, Then kết quả trả về Symbol từ CẢ HAI
      Document.
- [ ] Given gọi Find References cho một `FieldSymbol` (không phải Entity), When kiểm tra
      kết quả, Then chỉ có định nghĩa gốc được trả về (xác nhận giới hạn hiện tại, không
      phải bug — dùng để viết test hồi quy tránh giả định sai khi mở rộng sau này).
