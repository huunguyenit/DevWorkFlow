Bug cần sửa: $ARGUMENTS

1. Viết test tái hiện lỗi (fail) trước.
2. Xác định đúng module chịu trách nhiệm (xem CLAUDE.md mục module map) — không patch sai layer.
3. Tìm root cause, sửa tối thiểu, chạy lại test cho tới khi xanh + chạy toàn bộ suite.
