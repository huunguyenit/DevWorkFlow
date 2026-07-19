# 05 — Fix Bug

---

**Prompt:**

Bug: **<mô tả, log, cách tái hiện>**

1. Trước tiên viết 1 test tái hiện lỗi (fail) — không sửa code trước khi có test đỏ.
2. Xác định module đúng theo `ARCHITECTURE_DOCTRINE.md` mục 5 — không patch sai layer.
3. Tìm root cause (không patch triệu chứng).
4. Sửa tối thiểu, chạy lại test cho tới khi xanh, chạy toàn bộ test suite để chắc không vỡ chỗ khác.
5. Nếu cần thêm log, dùng Serilog, không `Console.WriteLine`.
