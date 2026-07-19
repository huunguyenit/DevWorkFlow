# Outline

Module: explorer
Status: Implemented — NHƯNG có 2 implementation song song không nhất quán, xem mục
"Known Issue" bên dưới. Đây là phát hiện cần xử lý, không phải hành vi mong muốn.
Related Architecture: 04-TREE_FRAMEWORK.md, ADR-0003-TreeDataSource.md, 02-ERP_LANGUAGE_SERVICE.md
Related Specs: ../language/symbol-navigation.md, project-explorer.md

---

# Purpose

Outline hiển thị cấu trúc phân cấp của Document đang mở (Controller/Field/View/Command/
...), đồng bộ với Editor: click một node trong Outline phải điều hướng Editor tới đúng vị
trí tương ứng. Theo Rule R7, điều hướng này phải dựa trên `NodeId`/`SymbolId`, không dựa
trên số dòng.

# User Story

- Là lập trình viên, tôi muốn thấy cấu trúc tổng quan của một Document XML dài mà không
  phải cuộn đọc toàn bộ, để định vị nhanh phần cần sửa.
- Là lập trình viên, tôi muốn click vào một mục trong Outline và Editor tự cuộn/focus
  đúng vị trí, để tiết kiệm thời gian tìm kiếm thủ công.
- Là lập trình viên, tôi muốn Outline tự cập nhật khi tôi sửa Document, để nó luôn phản
  ánh đúng cấu trúc hiện tại, không cần bấm Refresh thủ công.

# Functional Requirements

1. Outline phải build từ `NavigationMap`/`ErpNavigationService.GetOutlineRoots` — dùng
   lại dữ liệu từ ERP Language Service, không tự Parse XML để dựng cây riêng (Rule R1,
   ADR-0001).
2. Outline phải tự cập nhật khi nội dung Document thay đổi, debounce lại để tránh rebuild
   liên tục theo từng keystroke.
3. Click vào một node Outline phải điều hướng Editor tới đúng vị trí, dùng `NodeId`
   (không dùng offset/số dòng làm khoá điều hướng — Rule R7).
4. Outline phải dùng Tree Framework chung (virtualization, lazy loading nếu cần) — không
   tự vẽ cây bằng `ObservableCollection` riêng ngoài Tree Framework (ADR-0003).

# Known Issue — 2 Implementation song song

Codebase hiện có **hai** implementation Outline hoạt động song song, không nhất quán với
nhau về kiến trúc:

1. **`OutlineViewModel`** (dùng đúng Tree Framework): build cây qua
   `XmlSemanticDataSource` + `TreeFrameworkHost`, lấy dữ liệu từ
   `ErpDocument.NavigationMap`/`ErpNavigationService.GetOutlineRoots`. Click node gọi
   `ErpNavigationService.GoToNode(documentId, nodeId)` — điều hướng theo `NodeId`, đúng
   Rule R7 và ADR-0003.
2. **`XmlStructureOutlineViewModel`** (KHÔNG dùng Tree Framework): tự giữ
   `ObservableCollection<XmlStructureNodeVm>` riêng, tự gọi `XmlStructureParser.Parse(xml)`
   để dựng cây — vi phạm Rule R1 (không được Parse XML ngoài Language Service) và
   ADR-0003 (không dùng lại Tree Framework). Click node gọi
   `NavigateToOffset(node.StartOffset, node.StartLine)` — điều hướng theo **offset/dòng**,
   vi phạm trực tiếp Rule R7.

Cả hai đều đang được dùng trong UI (một ở Explorer dock, một ở Bottom panel) và đều cập
nhật theo cùng cơ chế debounce 350ms trên `XmlSource`/`EditorText`. Đây rõ ràng là tàn dư
từ trước khi Tree Framework được xây (`XmlStructureOutlineViewModel` có vẻ là bản cũ hơn),
chưa được dọn dẹp.

**Khuyến nghị**: hợp nhất về `OutlineViewModel` (bản đúng kiến trúc), loại bỏ
`XmlStructureOutlineViewModel`/`XmlStructureParser` khỏi luồng Outline, hoặc nếu Bottom
panel cần một dạng hiển thị khác có lý do riêng, phải đổi tên/tách rõ mục đích và sửa lại
để điều hướng theo `NodeId` thay vì offset. Việc dọn dẹp này nên là một task riêng, không
lồng vào công việc khác, vì đụng tới 2 ViewModel + 2 View đang chạy song song.

# Data Flow (nhánh đúng — `OutlineViewModel`)

```
ErpDocument thay đổi (XmlSource/ExpandedXml/LoadedFilePath/HasDocument PropertyChanged)
    ↓
Debounce 350ms (DispatcherTimer)
    ↓
OutlineViewModel.RebuildNow
    ↓
NavigationMap (từ erp_doc.NavigationMap hoặc _language_service.Navigation.GetMap)
    ↓
XmlSemanticDataSource (TreeNode hoá NavigationMap)
    ↓
TreeFrameworkHost.AttachAsync  →  hiển thị qua Tree Framework core
    ↓
Click node → OnTreeNodeActivated → ErpNavigationService.GoToNode(documentId, nodeId)
    → NavigationTarget → form.NavigateToTarget(target)  (Reveal trong Insight Editor Surface)
```

# State Machine

Không có state machine riêng — Outline là một view phái sinh, luôn tính lại toàn bộ từ
`NavigationMap` hiện tại (không incremental, kế thừa gap của
`../language/parsing-and-semantic-model.md`).

# Events

Không có Event hệ thống — cập nhật qua `PropertyChanged` polling-like trên các property
cụ thể của `FormBuilderViewModel`/`ErpDocument`, kết hợp Debounce Timer (không phải
Event-driven đúng nghĩa theo Architecture).

# Commands

- **Navigate to Node** (click) — điều hướng, không đổi dữ liệu, không cần Undo/Redo.

# Integration

- Phụ thuộc `../language/symbol-navigation.md` (`NavigationMap`, `GoToNode`).
- Dùng Tree Framework core — nhánh `OutlineViewModel` tuân thủ, nhánh
  `XmlStructureOutlineViewModel` KHÔNG tuân thủ (xem Known Issue).
- Đồng bộ với Insight Editor Surface (`../editor/insight-editor-surface.md`) qua
  `form.NavigateToTarget`/`NavigateToOffset`.

# Performance

Debounce 350ms trước khi rebuild — chấp nhận được cho việc gõ phím liên tục, nhưng rebuild
vẫn là full-rebuild (không incremental), kế thừa gap chung.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| `NavigationMap` chưa sẵn sàng (Document vừa mở, lỗi Parse) | Outline nên hiển thị Empty State thay vì crash — cần xác nhận cụ thể khi viết test UI. |
| Click node mà `GoToNode` không tìm thấy `NodeId` (Document đã đổi giữa lúc build Outline và lúc click) | Chưa xác nhận hành vi — cần kiểm tra, đây là race condition tiềm ẩn do rebuild không incremental. |

# Future Extension

- Dọn dẹp Known Issue (hợp nhất 2 implementation) — ưu tiên cao vì đang vi phạm trực tiếp
  Rule R1 và R7.
- Event-driven update thay cho debounce polling trên PropertyChanged, khi
  `SemanticChanged` Event được implement ở tầng Language Service.

# Acceptance Criteria

- [ ] Given Document đang mở trong Outline dock (nhánh `OutlineViewModel`), When click một
      node, Then Editor điều hướng đúng vị trí và lời gọi thực hiện qua
      `ErpNavigationService.GoToNode` với `NodeId`, KHÔNG qua offset/line trực tiếp.
- [ ] Given `XmlStructureOutlineViewModel` (nhánh Bottom panel) đang hiển thị, When kiểm
      tra code, Then xác nhận nó gọi `XmlStructureParser.Parse` trực tiếp — dùng làm bằng
      chứng cho việc dọn dẹp Known Issue, không phải hành vi cần giữ nguyên.
- [ ] Given người dùng gõ liên tục trong Editor, When kiểm tra tần suất rebuild Outline,
      Then rebuild không chạy nhiều hơn 1 lần mỗi 350ms.
