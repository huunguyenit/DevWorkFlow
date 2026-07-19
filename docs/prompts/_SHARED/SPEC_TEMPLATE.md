# Spec Template

Mọi spec trong `docs/specs/**` phải theo đúng cấu trúc dưới đây. Đây là spec mô tả
**hành vi** (behavior) của một feature/module, không phải thiết kế implementation
(class, method). Architecture (`docs/0X-*.md`, `docs/adr/ADR-000X-*.md`) luôn là nguồn
sự thật cao hơn spec — nếu một spec mâu thuẫn với Architecture/ADR, Architecture/ADR thắng
và spec phải được sửa lại, không phải ngược lại.

Xem `docs/specs/editor/entity-insight-rendering.md` như một ví dụ mẫu (worked example)
đã áp dụng đầy đủ template này.

---

## Header (bắt buộc, đặt ngay đầu file)

```
# <Tên Feature>

Module: <explorer|editor|workflow|language|designer|plugin|ai|database>
Status: <Draft|Implemented|Interim|Design-ahead — chưa triển khai, thuộc Level N>
Related Architecture: <danh sách file trong docs/0X-*.md và docs/adr/ADR-000X-*.md liên quan>
Related Specs: <spec khác cùng module có liên quan, hoặc "(chưa có spec liên quan khác)">
```

`Status` phải phản ánh đúng thực tế code hiện tại:

- **Implemented** — hành vi mô tả trong spec đã có code tương ứng, spec là tài liệu
  bám theo hành vi thật (reverse-engineered từ code + đối chiếu Architecture).
- **Interim** — có code, nhưng implementation hiện tại lệch khỏi quyết định trong một
  ADR đã Accepted (ví dụ dùng công nghệ tạm thời khác). Phải nêu rõ ADR nào bị lệch và
  trạng thái đích (target) là gì.
- **Draft** — hành vi đã được thống nhất nhưng chưa code hoặc code chưa hoàn chỉnh.
- **Design-ahead — chưa triển khai, thuộc Level N** — viết trước cho tính năng thuộc
  Capability Level tương lai (xem `09-ROADMAP.md`), chưa có code, có thể còn thay đổi.

---

## Cấu trúc bắt buộc (theo thứ tự)

### 1. Purpose
1–3 đoạn ngắn: vấn đề gì đang được giải quyết, cho ai, tại sao cần tính năng này thay
vì cách làm cũ. Không mô tả implementation.

### 2. User Story
Danh sách "Là \<vai trò\>, tôi muốn \<hành động\>, để \<lý do\>." — tối thiểu 1, thường 2-3.

### 3. Functional Requirements
Danh sách đánh số, mỗi mục là một hành vi quan sát được (observable behavior), không
phải chi tiết kỹ thuật. Viết theo dạng "Khi X xảy ra, hệ thống phải Y."

### 4. UI Behavior
Chỉ có nếu feature có phần hiển thị. Mô tả màu sắc/trạng thái/tương tác cụ thể, đối
chiếu `07-UI_GUIDELINES.md` và `_SHARED/UI_GUIDELINES_SUMMARY.md`. Nêu rõ những gì
KHÔNG được dùng (Tooltip/Popup/MessageBox) nếu Architecture cấm.

### 5. Data Flow
Sơ đồ dạng text (mũi tên `↓`) mô tả luồng dữ liệu đi qua các layer/service nào, theo
đúng hướng phụ thuộc trong `01-ARCHITECTURE.md` mục 3. Bắt buộc có chiều thuận
(input → hiển thị) và chiều ngược (user edit → lưu) nếu feature có edit.

### 6. State Machine
Chỉ có nếu feature có trạng thái rõ ràng (loading/resolved/error, hoặc lifecycle).
Dạng text, không cần hình vẽ phức tạp.

### 7. Events
Liệt kê Event hệ thống phát ra/lắng nghe liên quan tới feature này, tham chiếu Event
đã định nghĩa trong Architecture tương ứng thay vì tự đặt tên mới. Nếu cần Event mới,
phải ghi rõ "Event mới, cần xác nhận trước khi implement".

### 8. Commands
Liệt kê Command người dùng có thể thực hiện (nếu có), có hỗ trợ Undo/Redo hay không,
theo cơ chế Command chung của IDE (`08-CODING_STANDARDS.md` mục Command Rules).

### 9. Integration
Feature này phụ thuộc module nào (theo Module Map trong `ARCHITECTURE_DOCTRINE.md` mục 5),
ảnh hưởng tới module nào khác, và Extension Point nào Plugin có thể dùng để mở rộng
tính năng này mà không cần sửa Core.

### 10. Performance
Target cụ thể nếu Architecture đã định nghĩa (ví dụ Tree: Expand < 50ms — xem ADR-0003).
Nếu chưa có target cụ thể, ghi rõ "kế thừa nguyên tắc chung của \<module\>" thay vì bịa số.

### 11. Error Handling
Bảng 2 cột: Tình huống | Hành vi mong đợi. Phải theo mẫu Nguyên nhân → Giải pháp → Retry
của `07-UI_GUIDELINES.md`, không phải chỉ hiển thị Exception.

### 12. Future Extension
Những gì cố ý để ngoài phạm vi (out of scope) của spec này nhưng có thể mở rộng sau,
và spec/ADR nào sẽ cần viết thêm khi làm.

### 13. Acceptance Criteria
Danh sách checkbox dạng Given/When/Then, đủ cụ thể để dùng làm test case. Mỗi Functional
Requirement quan trọng nên có ít nhất một Acceptance Criterion tương ứng.

---

## Quy tắc viết

- Ngắn gọn, dùng heading + bullet, hạn chế văn xuôi dài dòng.
- Không mô tả implementation (tên class, tên method cụ thể) trừ khi cần thiết để
  không mơ hồ — ưu tiên mô tả hành vi và khái niệm (Service, Provider, Model) đã có
  trong Architecture/Glossary.
- Mọi thuật ngữ dùng đúng theo `_SHARED/GLOSSARY.md`.
- Nếu phát hiện spec cần mâu thuẫn với một ADR đã Accepted, KHÔNG tự sửa ADR — ghi rõ
  mâu thuẫn trong mục Status/Purpose và báo cáo lại thay vì âm thầm viết đè.
- Trước khi viết, đối chiếu `_SHARED/ARCHITECTURE_DOCTRINE.md` mục 5 (Module map) để
  xác định đúng thư mục `docs/specs/<module>/` cần đặt file.
