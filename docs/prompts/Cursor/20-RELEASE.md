# 20 — Release Checklist (theo Capability Level)

Tham chiếu: `09-ROADMAP.md` (Definition of Done).

---

**Prompt:**

Chuẩn bị release cho Capability: **<tên Level/Milestone, ví dụ: "L1 — Workspace Foundation">**

Checklist Definition of Done (không được đánh dấu Done nếu thiếu mục nào):

- [ ] Kiến trúc đúng (đối chiếu `19-ARCHITECTURE_REVIEW.md`).
- [ ] Unit Test đạt yêu cầu (Core coverage ≥ 80%, ưu tiên Parser/Semantic/Navigation/
      Serializer/Workflow/Tree).
- [ ] Không phá vỡ Public API hiện có (hoặc có ghi chú Breaking Change + ADR nếu cần).
- [ ] Có Documentation cập nhật (`08-UPDATE_DOCS.md`).
- [ ] Có Demo.
- [ ] Có Performance Benchmark cho phần liên quan (Tree/Parser/Editor nếu áp dụng).
- [ ] Roadmap (`09-ROADMAP.md`) được cập nhật: đánh dấu Task hoàn thành, cập nhật Current Status.
- [ ] Exit Criteria của Level được đối chiếu và thỏa mãn đầy đủ.

Xuất kết quả dưới dạng checklist đã điền, kèm ghi chú mục nào chưa đạt và việc cần làm tiếp.
