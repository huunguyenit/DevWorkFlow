# 04 — Refactor

---

**Prompt:**

Refactor: **<file/class>**. Behavior-preserving, không đổi hành vi quan sát được.

1. Trước khi sửa, chạy test hiện có để có baseline (pass/fail hiện tại).
2. Áp dụng SOLID, tách Class > 500 dòng / Method > 50 dòng nếu cần, chuyển `new Service()`
   sang DI, loại bỏ Static Service/Service Locator/God Class.
3. Sau khi sửa, chạy lại test — phải pass y hệt baseline (không có regression).
4. Tóm tắt diff + lý do từng thay đổi.
