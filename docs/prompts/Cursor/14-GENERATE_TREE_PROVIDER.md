# 14 — Generate Tree DataSource / Provider

Tham chiếu: `04-TREE_FRAMEWORK.md`, `ADR-0003-TreeDataSource.md`.

---

**Prompt:**

Thêm một TreeDataSource/Provider mới cho: **<nguồn dữ liệu, ví dụ: "Git Explorer">**

Yêu cầu:

1. Implement `ITreeDataSource` (`GetRoot()`, `GetChildren()`, `Refresh()`, `Search()`, `Observe()`).
   Tree Framework KHÔNG được biết chi tiết nguồn dữ liệu (Git/SQL/XML...) — mọi logic domain
   nằm trong DataSource, không nằm trong Tree Control/Renderer.
2. TreeNode chỉ chứa Id/ParentId/DisplayName/Icon/Type/State/HasChildren/IsExpanded/IsSelected/
   Metadata/Tag — không chứa Business Logic.
3. Bắt buộc hỗ trợ Lazy Loading (Placeholder → Async Load → Replace Children → Cache) và
   Virtualization cho dữ liệu lớn (target: Expand Node < 50ms, Search < 100ms, Refresh Node < 30ms
   theo ADR-0003).
4. Nếu người dùng Collapse trước khi load xong → phải Cancel Task (CancellationToken).
5. Đăng ký Icon qua Icon Provider, Context Menu qua Context Menu Provider — Tree không tự biết Icon/Menu.
6. Selection/Navigation lưu bằng NodeId, không lưu TreeViewItem/Index.
7. Nếu Provider này nên là Plugin (thay vì Core), ưu tiên implement dưới dạng Plugin Provider
   (xem `11-GENERATE_PLUGIN.md`).
