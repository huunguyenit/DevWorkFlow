# 14 — Tree DataSource / Provider

---

**Prompt:**

TreeDataSource mới cho: **<nguồn dữ liệu>**. Tham chiếu `04-TREE_FRAMEWORK.md`, `ADR-0003`.

1. Implement `ITreeDataSource` (`GetRoot/GetChildren/Refresh/Search/Observe`) — logic domain
   nằm ở đây, Tree Control/Renderer không biết domain.
2. Lazy Loading + Virtualization bắt buộc. Target: Expand < 50ms, Search < 100ms, Refresh Node < 30ms.
3. CancellationToken khi Collapse trước khi load xong.
4. Icon/Context Menu qua Provider riêng, không hardcode trong Tree.
5. Cân nhắc: nên là Plugin Provider hay Core?
