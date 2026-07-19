# 15 — Workflow Node / Action

---

**Prompt:**

Workflow Node/Action mới: **<mô tả>**. Tham chiếu `05-WORKFLOW_ENGINE.md`.

1. Node chỉ mô tả cấu hình, không chứa Logic — Logic nằm trong Action Provider riêng.
2. Action chỉ thao tác Semantic Model/Service công khai, không Parse XML, không gọi UI trực tiếp.
3. Transaction (Begin/Commit/Rollback) nếu thay đổi dữ liệu; Rollback + Event khi fail.
4. Validate trước khi chạy: Cycle Detection, Missing Connection, Invalid Parameter, Infinite Loop.
5. Cân nhắc expose qua Plugin Action Provider nếu phù hợp.
