# 15 — Generate Workflow Node / Action

Tham chiếu: `05-WORKFLOW_ENGINE.md`.

---

**Prompt:**

Thêm Workflow Node/Action mới: **<mô tả, ví dụ: "Batch Rename Entity Action">**

Yêu cầu:

1. WorkflowNode chỉ mô tả cấu hình (Id/Type/Name/Inputs/Outputs/Parameters/Position/State/Metadata)
   — KHÔNG chứa Logic thực thi.
2. Logic thực thi nằm trong một **Action Provider** riêng, được Action Dispatcher tìm và gọi.
   Workflow Engine không biết Action cụ thể.
3. Action chỉ thao tác trên Semantic Model / Service công khai — không Parse XML trực tiếp,
   không gọi UI trực tiếp.
4. Nếu Action thay đổi dữ liệu, phải hỗ trợ Transaction (Begin/Commit/Rollback) — nếu thất bại,
   Rollback + phát Event (`NodeFailed`/`WorkflowFailed`).
5. Đăng ký các Event cần thiết: `NodeStarted`, `NodeCompleted`, `NodeFailed`.
6. Validate trước khi chạy: Cycle Detection, Missing Connection, Invalid Parameter,
   Unreachable Node, Infinite Loop.
7. Nếu Action nên do bên thứ ba cung cấp, cân nhắc expose qua Plugin (Action Provider extension point).
