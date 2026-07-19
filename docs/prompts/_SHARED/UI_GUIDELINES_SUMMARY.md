# UI Guidelines — Tóm tắt cho AI (chi tiết: 07-UI_GUIDELINES.md)

- Editor luôn chiếm diện tích lớn nhất, không bị Tool Window che.
- Ưu tiên: Ribbon → Toolbar → Command Palette (Ctrl+Shift+P) → Context Menu. Hạn chế Menu nhiều tầng.
- Không dùng Tooltip cho thông tin chính, không Popup liên tục, KHÔNG DÙNG MessageBox.
- Notification: Status Bar / Toast / Inline Message.
- Theme mặc định: DevWorkFlow Light; có DevWorkFlow Dark.
- Màu: Primary #2D7FF9, Accent #00B86B, Warning #F39C12, Error #E74C3C,
  Background #FFFFFF, Secondary BG #F6F7F9, Border #D9DEE7, Text #1F2937, Secondary Text #6B7280.
- Font: Segoe UI (fallback Inter). Size: body 12, heading 14, title 16.
- Icon: Material Design Icons, 20px, đơn sắc (không icon nhiều màu).
- Animation < 150ms, không hiệu ứng thừa.
- Empty state: Icon + Description + Action (không để trắng màn hình).
- Loading: Skeleton / Spinner / Progress — không treo UI.
- Error state: Nguyên nhân → Giải pháp → Retry (không chỉ hiện Exception).
- Accessibility: Keyboard Navigation, High Contrast, Screen Reader, Zoom, Large Font.
- Docking dùng AvalonDock: mọi panel Dock/Float/AutoHide/Tab/Split được.
