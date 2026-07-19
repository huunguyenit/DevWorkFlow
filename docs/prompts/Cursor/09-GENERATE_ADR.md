# 09 — Generate ADR

Dùng khi có một quyết định kiến trúc mới cần ghi lại chính thức.

---

**Prompt:**

Sinh một ADR mới cho quyết định: **<mô tả quyết định>**

Yêu cầu format (theo đúng cấu trúc các ADR hiện có, ví dụ ADR-0001..0008):

```
# ADR-000X: <Tên quyết định>

Status: Proposed
Date: <ngày>
Decision Makers: DevWorkFlow Architecture Team

---
# Context
# Problem
# Decision
# Architecture   (sơ đồ text dạng box-drawing như các ADR khác)
# Rationale
# Consequences
  ## Positive
  ## Negative
# Alternatives Considered
# Architectural Rules
# Impact
# Related Documents
# Future Review
```

Ràng buộc nội dung:
- Không được mâu thuẫn với 10 Core Principles và Architectural Rules R1–R10 trong
  `ARCHITECTURE_DOCTRINE.md`, trừ khi mục "Alternatives Considered" giải thích rõ vì sao
  cần thay đổi nguyên tắc nền tảng (trường hợp này phải cảnh báo rõ ràng đây là thay đổi lớn).
- Mục "Related Documents" phải liệt kê chính xác các file `.md`/ADR liên quan đã có.
- Đánh số ADR tiếp theo đúng thứ tự (kiểm tra ADR lớn nhất hiện có trước khi đặt số).
