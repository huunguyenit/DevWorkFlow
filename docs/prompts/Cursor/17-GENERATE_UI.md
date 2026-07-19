# 17 — Generate UI (WPF Screen / Control)

Tham chiếu: `07-UI_GUIDELINES.md`, `../_SHARED/UI_GUIDELINES_SUMMARY.md`.

---

**Prompt:**

Sinh UI cho: **<màn hình/control, ví dụ: "Property Grid cho Field">**

Yêu cầu:

1. ViewModel chỉ chứa Binding/Command/State UI — KHÔNG Parse XML, KHÔNG truy cập Database
   (ViewModel Rules trong `08-CODING_STANDARDS.md`).
2. Dùng MVVM (CommunityToolkit.Mvvm), UI là Dock Panel nếu thuộc Workspace.
3. Tuân thủ Design Tokens: màu (#2D7FF9 primary, #00B86B accent, #F39C12 warning, #E74C3C error,
   nền #FFFFFF/#F6F7F9, viền #D9DEE7, chữ #1F2937/#6B7280), font Segoe UI (fallback Inter),
   icon Material Design 20px đơn sắc.
4. KHÔNG dùng MessageBox. Thông báo qua Status Bar/Toast/Inline Message.
5. KHÔNG dùng Tooltip cho thông tin chính — nếu là thông tin ngữ nghĩa quan trọng, đề xuất
   dùng Insight Layer thay thế.
6. Có Empty State (Icon + Description + Action) và Loading State (Skeleton/Spinner/Progress).
7. Animation < 150ms.
8. Accessibility: hỗ trợ Keyboard Navigation tối thiểu.
9. Nếu control hiển thị dữ liệu phân cấp, dùng Tree Framework (`14-GENERATE_TREE_PROVIDER.md`),
   không tự tạo TreeView/ObservableCollection riêng.
