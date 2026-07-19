---
mode: agent
description: Sinh TreeDataSource/Provider mới tuân thủ Tree Framework (ADR-0003).
---
Nguồn dữ liệu cần thêm Tree: hỏi người dùng nếu chưa rõ.

1. Implement `ITreeDataSource` (GetRoot/GetChildren/Refresh/Search/Observe); domain logic ở đây,
   Tree Control/Renderer không biết domain.
2. Lazy Loading + Virtualization bắt buộc; CancellationToken khi Collapse trước khi load xong.
3. Icon/Context Menu qua Provider riêng. Selection/Navigation dùng NodeId.
4. Kèm test cho DataSource.
