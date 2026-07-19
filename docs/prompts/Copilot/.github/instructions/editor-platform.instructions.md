---
applyTo: "src/DevWorkFlow.Editor/**"
---
# Editor Platform — Copilot Instructions

Tham chiếu: `03-EDITOR_PLATFORM.md`, `ADR-0002-MonacoEditor.md`, `ADR-0005-EditorPlatform.md`.

- Đây là lớp DUY NHẤT được phép gọi Monaco API / WebView2. Bên ngoài module này, không gợi ý
  tham chiếu Monaco trực tiếp.
- Editor Platform KHÔNG chứa Business Logic, KHÔNG Parse XML, KHÔNG Resolve Entity.
- Mọi giao tiếp WPF ↔ WebView2 ↔ Monaco đi qua Message Bridge (JSON message:
  Command/RequestId/Payload/Response) — không gợi ý gọi JavaScript trực tiếp từ C#.
- Chỉ `Monaco Adapter` được implement chi tiết Monaco; các Service khác (`Document/Caret/Selection/
  Decoration/Completion/Diagnostics/Folding/Theme/Clipboard/Command`) chỉ định nghĩa qua Interface.
- Performance: ưu tiên Incremental Update, Virtual Rendering, Decoration Cache — tránh Render lại
  toàn bộ Document.
- Thông tin ngữ nghĩa hiển thị qua Decoration/Insight Layer, không gợi ý Tooltip làm kênh chính.
