# Template Manager

Module: workflow
Status: Implemented
Related Architecture: 01-ARCHITECTURE.md (Workspace/Application Layer)
Related Specs: approval-state-machine-prototype.md (module hàng xóm, KHÔNG liên quan chức năng)

---

# Purpose

Template Manager quản lý metadata các template tài liệu nghiệp vụ trong hệ thống FBO:
Catalog, Document, Report, Stored Procedure. Đây là một tính năng CRUD độc lập, **không**
liên quan tới Workflow Automation Engine (05-WORKFLOW_ENGINE.md) hay
`approval-state-machine-prototype.md` — chỉ đặt cùng thư mục `docs/specs/workflow/` vì
chưa có thư mục module phù hợp hơn trong cấu trúc specs hiện tại (xem ghi chú ở
`docs/specs/README.md`).

# User Story

- Là lập trình viên/quản trị hệ thống ERP, tôi muốn xem danh sách template (Catalog/
  Document/Report/Stored) theo từng loại, để quản lý tập trung thay vì tìm rải rác trong
  file system.
- Là lập trình viên, tôi muốn đánh dấu Favorite cho template hay dùng, để truy cập nhanh
  hơn.
- Là lập trình viên, tôi muốn mở nhanh Form Builder gắn với một template, để chỉnh sửa nó.

# Functional Requirements

1. Hệ thống phải liệt kê `TemplateItem` theo từng `TemplateType` (`Catalog | Document |
   Report | Stored`) — một ViewModel dùng chung, khởi tạo tham số hoá theo loại.
2. Mỗi `TemplateItem` có thể gắn kèm `WorkflowId`/`FormId` tuỳ chọn (chỗ dự phòng cho
   liên kết tới Workflow/Form trong tương lai — hiện tại chưa có hành động nào dùng tới
   `WorkflowId`).
3. Người dùng phải đánh dấu/bỏ đánh dấu Favorite cho một template.
4. Hành động "Open Form" phải điều hướng tới trang Form Builder tương ứng — đây là hành
   động duy nhất thực sự điều hướng đi nơi khác hiện có.

# Data Flow

```
TemplateManagerViewModel(TemplateType type)
    ↓
TemplateService (in-memory, InMemoryServices.cs)
    ↓
ObservableCollection<TemplateItem>  (Id, Name, TemplateType, IconKind, WorkflowId?,
                                       FormId?, IsFavorite)
    ↓
TemplateManagerPage (hiển thị danh sách, lọc theo Type)
    ↓
OpenFormCommand → điều hướng Pages.FormBuilder
```

# State Machine

Không có state machine phức tạp — đây là CRUD danh sách đơn giản, không có vòng đời nhiều
trạng thái.

# Events

Không có Event hệ thống — cập nhật qua `ObservableCollection`/`PropertyChanged` trực tiếp.

# Commands

- **Toggle Favorite** — đánh dấu/bỏ đánh dấu.
- **Open Form** — điều hướng tới Form Builder (dùng `FormId` nếu có).

Không có Create/Delete Template quan sát được trong `TemplateManagerViewModel` — cần xác
nhận thêm nếu tính năng CRUD đầy đủ (thêm/xoá template) được kỳ vọng, hiện tại (theo
nghiên cứu) chỉ thấy đọc danh sách + toggle favorite + điều hướng.

# Integration

- Độc lập, không phụ thuộc Language Service/Tree Framework.
- Điều hướng sang Form Builder — phụ thuộc `../designer/form-builder-canvas.md` gián
  tiếp qua `FormId`.

# Performance

Không áp dụng — danh sách in-memory nhỏ.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| `FormId` rỗng khi gọi Open Form | Cần xác nhận hành vi cụ thể (có disable nút hay không) — chưa xác nhận trong nghiên cứu này. |

# Future Extension

- Làm rõ vai trò thật của `WorkflowId` trên `TemplateItem` — hiện là field dự phòng chưa
  dùng, cần quyết định có liên kết thật với `approval-state-machine-prototype.md` (nếu
  tính năng đó được phát triển tiếp) hay bỏ hẳn field này.
- Xác nhận có cần Create/Delete/Rename Template hay không, và nếu có thì thêm Command
  tương ứng.
- Cân nhắc đặt lại tên thư mục spec cho tính năng này (không phải `workflow/`) khi cấu
  trúc `docs/specs/` được rà soát lại — hiện đặt tạm ở `workflow/` theo quyết định trong
  phiên viết spec này (xem `docs/specs/README.md` mục Known Doc Drift).

# Acceptance Criteria

- [ ] Given `TemplateManagerViewModel` khởi tạo với `TemplateType.Report`, When tải danh
      sách, Then chỉ hiển thị template loại Report, không lẫn Catalog/Document/Stored.
- [ ] Given một template có `IsFavorite = false`, When Toggle Favorite, Then giá trị đổi
      thành `true` và ngược lại.
- [ ] Given một template có `FormId` hợp lệ, When Open Form, Then điều hướng đúng tới
      Form Builder với đúng `FormId` đó.
