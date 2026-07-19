# 17 — Generate UI (WPF)

---

**Prompt:**

UI cho: **<màn hình/control>**. Tham chiếu `07-UI_GUIDELINES.md`, `_SHARED/UI_GUIDELINES_SUMMARY.md`.

1. ViewModel chỉ Binding/Command/State — không Parse XML/DB.
2. Design tokens: Primary #2D7FF9, Accent #00B86B, Warning #F39C12, Error #E74C3C,
   font Segoe UI, icon Material Design 20px.
3. Không MessageBox/Tooltip cho thông tin chính. Có Empty State + Loading State. Animation < 150ms.
4. Dữ liệu phân cấp → dùng Tree Framework, không tự tạo TreeView riêng.
