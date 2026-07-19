# 12 — Generate ERP Language Service Feature

Tham chiếu: `02-ERP_LANGUAGE_SERVICE.md`, `ADR-0001`, `ADR-0006-SemanticModel.md`.

---

**Prompt:**

Thêm tính năng cho ERP Language Service: **<mô tả, ví dụ: "Rename Symbol xuyên Document">**

Yêu cầu:

1. Xác định tính năng thuộc Service nào: Symbol / Entity / Navigation / Completion / Diagnostics /
   Formatting / Refactoring / Search / Insight / Serializer.
2. Mô tả thay đổi trên Semantic Model (nếu có) — nhắc lại: Semantic Model là read-only,
   mọi thay đổi phải qua Command/Transaction.
3. Thiết kế theo Document Lifecycle: Open XML → Parse → Syntax Tree → Semantic Builder →
   Semantic Model → Diagnostics → Insight → Ready. Tính năng mới chèn vào đúng bước nào?
4. Đảm bảo hỗ trợ Incremental (không Parse/Update lại toàn bộ Document).
5. Phát Event tương ứng (`SemanticChanged`, `DiagnosticsChanged`, `NavigationChanged`...),
   không để Consumer (Editor/Tree/Workflow/AI) polling.
6. Không được tham chiếu Monaco/WPF/Tree UI trong code của Language Service (Design Rule).
7. Kèm Unit Test cho phần Semantic/Parser/Navigation vừa thêm.
