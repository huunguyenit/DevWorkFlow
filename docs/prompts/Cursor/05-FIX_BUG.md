# 05 — Fix Bug

---

**Prompt:**

Mô tả lỗi: **<mô tả, log, stack trace, cách tái hiện>**

Yêu cầu:

1. Xác định module chịu trách nhiệm theo bảng module map (`ARCHITECTURE_DOCTRINE.md` mục 5) —
   không sửa "tạm" ở sai layer (ví dụ: đừng patch trong ViewModel nếu lỗi thực chất ở Semantic Builder).
2. Tìm root cause, không chỉ patch triệu chứng.
3. Kiểm tra lỗi có vi phạm Architectural Rule nào không (VD: đang Parse XML ngoài Language Service
   → đó có thể là nguyên nhân gốc).
4. Đề xuất fix tối thiểu, kèm Unit Test tái hiện lỗi (fail trước fix, pass sau fix).
5. Log lỗi bằng Serilog nếu cần thêm log, không dùng `Console.WriteLine`/`MessageBox`.
6. Nếu fix ảnh hưởng Public API, cập nhật XML doc comment tương ứng.
