# 03 — Implement Task (Sprint / Roadmap Item)

Dùng khi triển khai một task cụ thể lấy từ `09-ROADMAP.md` (Current Sprint) hoặc backlog.

---

**Prompt:**

Task: **<tên task, ví dụ: "Monaco + WebView2 Host">**
Capability Level liên quan: **<L1..L7, xem 09-ROADMAP.md>**
Exit Criteria của Level: **<copy từ ROADMAP>**

Yêu cầu:

1. Xác nhận task này thuộc đúng phạm vi Level hiện tại — nếu vượt phạm vi (ví dụ đụng tới
   tính năng của Level sau), cảnh báo tôi trước khi làm.
2. Liệt kê các file/class cần tạo hoặc sửa, map theo layer trong `ARCHITECTURE_DOCTRINE.md` mục 5.
3. Chỉ ra Interface cần tuân thủ (nếu có, ví dụ `IEditorPlatform`, `ITreeDataSource`).
4. Triển khai theo từng bước nhỏ, sau mỗi bước tóm tắt: đã làm gì, còn thiếu gì so với Exit Criteria.
5. Kết thúc bằng checklist đối chiếu Exit Criteria của task/Level.
