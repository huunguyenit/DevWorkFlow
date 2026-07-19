---
applyTo: "src/DevWorkFlow.UI/**"
---
# UI (WPF/Workspace) — Copilot Instructions

Tham chiếu: `07-UI_GUIDELINES.md`.

- ViewModel chỉ Binding/Command/State UI — KHÔNG Parse XML, KHÔNG truy cập Database trực tiếp.
- Dùng MVVM (CommunityToolkit.Mvvm). Docking qua AvalonDock (Dock/Float/AutoHide/Tab/Split).
- Design tokens: Primary #2D7FF9, Accent #00B86B, Warning #F39C12, Error #E74C3C,
  Background #FFFFFF/#F6F7F9, Border #D9DEE7, Text #1F2937/#6B7280. Font Segoe UI (fallback Inter).
  Icon Material Design 20px, đơn sắc.
- KHÔNG gợi ý `MessageBox.Show(...)`. Dùng Status Bar / Toast / Inline Message.
- KHÔNG dùng Tooltip cho thông tin chính (Insight First, Minimal Distraction).
- Luôn có Empty State (Icon+Description+Action) và Loading State (Skeleton/Spinner/Progress).
  Animation < 150ms.
- Dữ liệu phân cấp → dùng Tree Framework, không tự tạo TreeView/ObservableCollection riêng.
