---
mode: agent
description: Sinh Workflow Node/Action mới cho Workflow Engine.
---
Node/Action cần thêm: hỏi người dùng nếu chưa rõ.

1. Node chỉ mô tả cấu hình; Logic nằm trong Action Provider riêng.
2. Action chỉ thao tác Semantic Model/Service công khai; hỗ trợ Transaction nếu đổi dữ liệu.
3. Validate trước khi chạy (Cycle Detection, Missing Connection, Infinite Loop...).
4. Phát Event NodeStarted/Completed/Failed. Kèm test.
