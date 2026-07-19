# 13 — Editor Platform Feature

---

**Prompt:**

Tính năng cho Editor Platform: **<mô tả>**. Tham chiếu `03-EDITOR_PLATFORM.md`, `ADR-0002`, `ADR-0005`.

1. Thiết kế Interface ở tầng Editor Platform API trước, Monaco Adapter chỉ implement.
2. Giao tiếp Monaco qua Message Bridge (JSON: Command/RequestId/Payload/Response), không gọi JS trực tiếp.
3. Không chứa Business Logic — lấy dữ liệu ngữ nghĩa từ ERP Language Service qua Event/Query.
4. Performance: Incremental Update, Virtual Rendering, Decoration Cache.
5. Ưu tiên Insight Layer/Decoration cho hiển thị thông tin, không Tooltip là kênh chính.
