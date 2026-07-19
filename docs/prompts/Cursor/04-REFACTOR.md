# 04 — Refactor

Dùng khi refactor code hiện có mà không đổi hành vi.

---

**Prompt:**

Refactor đoạn code sau: **<dán code / đường dẫn file>**

Ràng buộc (theo `08-CODING_STANDARDS.md`):

- Không đổi hành vi quan sát được từ bên ngoài (behavior-preserving).
- Áp dụng SOLID, ưu tiên Composition over Inheritance.
- Nếu Class > 500 dòng hoặc Method > 50 dòng → đề xuất tách nhỏ theo trách nhiệm.
- Loại bỏ mọi `new Service()` trực tiếp → chuyển sang Dependency Injection.
- Loại bỏ Static Service / Service Locator / God Class nếu có.
- Không tạo `Utils/Helpers/Common` — đặt method vào đúng domain folder.
- Đảm bảo Async đúng chuẩn: không `.Result`, không `.Wait()`, không `Thread.Sleep()`.
- Nếu file thuộc Core module, giữ nguyên/thêm Unit Test để coverage không giảm.

Kết quả cần có: diff rõ ràng + giải thích ngắn lý do mỗi thay đổi + rủi ro nếu có.
