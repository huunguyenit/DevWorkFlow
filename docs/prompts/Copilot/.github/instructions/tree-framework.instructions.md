---
applyTo: "src/DevWorkFlow.Tree/**"
---
# Tree Framework — Copilot Instructions

Tham chiếu: `04-TREE_FRAMEWORK.md`, `ADR-0003-TreeDataSource.md`.

- Tree Framework KHÔNG được biết XML/SQL/ERP/Workflow — chỉ làm việc với `TreeNode`/`TreeDataSource`/
  `TreeViewState`/`TreeRenderer`. Domain logic thuộc về `ITreeDataSource` implementation, không
  thuộc Tree Control/Renderer.
- Bắt buộc Virtualization (chỉ render node trong viewport) + Lazy Loading (Placeholder → Async
  Load → Replace → Cache), Cancel Task nếu Collapse trước khi load xong.
- TreeNode là readonly/immutable — thay đổi qua Command.
- Selection/Navigation lưu bằng `NodeId`, không lưu `TreeViewItem`/Index.
- Performance targets: Expand Node < 50ms, Search < 100ms, Refresh Node < 30ms (không treo UI dù
  100.000 node).
- Icon/Context Menu qua Provider riêng (`IconProvider`, `ContextMenuProvider`), không hardcode.
