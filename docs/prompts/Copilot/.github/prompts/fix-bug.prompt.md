---
mode: agent
description: Sửa lỗi đúng layer kiến trúc, kèm test tái hiện.
---
Mô tả lỗi/log/cách tái hiện: hỏi người dùng nếu chưa có.

1. Xác định module chịu trách nhiệm đúng (không patch sai layer, ví dụ đừng sửa trong ViewModel
   nếu lỗi ở Semantic Builder).
2. Viết test tái hiện lỗi trước (fail), sau đó tìm root cause và fix tối thiểu.
3. Chạy lại test cho tới khi pass, kiểm tra không phá vỡ Architectural Rule nào.
4. Log qua Serilog nếu cần, không Console.WriteLine/MessageBox.
