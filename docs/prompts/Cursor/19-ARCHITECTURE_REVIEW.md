# 19 — Architecture Compliance Review

---

**Prompt:**

Kiểm tra module/thay đổi sau có tuân thủ kiến trúc DevWorkFlow không: **<mô tả hoặc dán code>**

Đối chiếu lần lượt:

1. 10 Core Principles (mục 2, `ARCHITECTURE_DOCTRINE.md`).
2. Architectural Rules R1–R10 (mục 4).
3. Có vi phạm ADR nào trong ADR-0001..0008 không? Chỉ rõ số ADR và điều khoản bị vi phạm.
4. Hướng phụ thuộc Module Dependencies có bị đảo ngược không (Workspace → Application →
   ERP Language Service → Editor Platform/Tree Framework → Infrastructure)?
5. Nếu phát hiện vi phạm: nêu rõ vi phạm nguyên tắc/rule/ADR nào, mức độ nghiêm trọng,
   và đề xuất phương án sửa tuân thủ kiến trúc (không chỉ nêu vấn đề).
6. Nếu không vi phạm: xác nhận ngắn gọn kèm rule đã kiểm tra qua.

Không được "linh hoạt bỏ qua" rule vì lý do "cho nhanh" — nếu người yêu cầu muốn phá rule,
phải cảnh báo rõ ràng và đề xuất tạo ADR nếu đó là thay đổi có chủ đích.
