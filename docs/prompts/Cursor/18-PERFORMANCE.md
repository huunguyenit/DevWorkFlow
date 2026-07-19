# 18 — Performance Review

---

**Prompt:**

Rà soát hiệu năng cho: **<module/tính năng, ví dụ: "Mở file XML 50.000 dòng">**

Checklist theo mục Performance của từng module:

- **Parser/Semantic**: có Incremental Parsing / Incremental Semantic Update không? Có Cache/Object Pool?
  Có tránh Parse lại toàn bộ Document không? (`02-ERP_LANGUAGE_SERVICE.md`)
- **Editor**: có Virtual Rendering, Lazy Decoration, Decoration Cache không? Có Render lại toàn bộ
  Document không cần thiết không? (`03-EDITOR_PLATFORM.md`)
- **Tree**: có Virtualization (chỉ render Node trong Viewport) và Lazy Loading không?
  Có đạt target Expand < 50ms / Search < 100ms / Refresh Node < 30ms không? (`ADR-0003`)
- **Workflow**: có Async/Parallel Execution, CancellationToken không?
- **Chung**: mọi tác vụ IO có await đúng chuẩn không (không `.Result`/`.Wait()`)?
  UI Thread có bị block không?

Kết quả: liệt kê điểm nghẽn cụ thể (kèm số liệu nếu có), đề xuất fix ưu tiên theo mức độ ảnh hưởng.
