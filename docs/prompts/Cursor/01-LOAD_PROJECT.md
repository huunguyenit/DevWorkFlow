# 01 — Load Project Context

Dùng khi bắt đầu một phiên làm việc mới với Cursor trên DevWorkFlow.

---

**Prompt:**

Bạn đang hỗ trợ phát triển **DevWorkFlow**, IDE chuyên biệt cho FBO ERP.

Hãy nạp và ghi nhớ các nguyên tắc sau trong suốt phiên làm việc (xem đầy đủ tại
`prompts/_SHARED/ARCHITECTURE_DOCTRINE.md`):

- XML chỉ là Storage; Semantic Model là Single Source of Truth.
- ERP Language Service là nơi DUY NHẤT Parse XML / Resolve Entity / Symbol.
- Editor Platform là API DUY NHẤT giao tiếp với Monaco; Editor không chứa Business Logic.
- Tree Framework không biết ERP/XML/SQL, chỉ biết TreeNode/TreeDataSource.
- Navigation theo SymbolId, không theo dòng.
- Insight over Tooltip.
- Mọi mở rộng qua Plugin/Provider, không sửa Core.
- Kiến trúc phân tầng: Workspace → Application → Core Services → Infrastructure, không phụ thuộc ngược.

Sau khi xác nhận đã hiểu, hãy:
1. Liệt kê 5 module chính (`Language`, `Editor`, `Tree`, `Workflow`, `Plugin`) và trách nhiệm của từng module theo đúng tài liệu.
2. Xác nhận project hiện đang ở Capability Level nào (xem `09-ROADMAP.md`) trước khi bắt đầu code.
3. Hỏi tôi task cụ thể muốn làm trong phiên này.

Không tự ý sinh code cho tới khi tôi xác nhận phạm vi task.
