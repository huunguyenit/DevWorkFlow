# 13 — Generate Editor Platform Feature

Tham chiếu: `03-EDITOR_PLATFORM.md`, `ADR-0002-MonacoEditor.md`, `ADR-0005-EditorPlatform.md`.

---

**Prompt:**

Thêm tính năng cho Editor Platform: **<mô tả, ví dụ: "Sticky Scroll">**

Yêu cầu:

1. Xác định Service liên quan: Document / Selection / Caret / Viewport / Decoration /
   Completion / Diagnostics / Folding / Theme / Clipboard / Command / Message Bridge.
2. Thiết kế API ở tầng `Editor Platform API` (Interface, ví dụ `IDecorationService`) trước,
   Monaco Adapter chỉ implement — không thiết kế thẳng theo Monaco API.
3. Nếu cần giao tiếp WPF ↔ WebView2 ↔ Monaco, dùng Message Bridge (JSON message:
   Command/RequestId/Payload/Response), không gọi JavaScript trực tiếp.
4. Đảm bảo tính năng không chứa Business Logic — nếu cần dữ liệu ngữ nghĩa, lấy từ
   ERP Language Service qua Event/Query, không tự suy luận.
5. Cân nhắc Performance: Incremental Update, Virtual Rendering, Lazy Decoration, Decoration Cache
   — không Render lại toàn bộ Document.
6. Nếu tính năng hiển thị thông tin cho người dùng, ưu tiên Insight Layer/Decoration,
   không dùng Tooltip là kênh chính (UI Guidelines).
