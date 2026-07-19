# Database Explorer Tree

Module: database
Status: Implemented (phạm vi hẹp — browse + open script; không có run/export trực tiếp
từ Tree, xem Gap)
Related Architecture: 01-ARCHITECTURE.md (SQL Server + Dapper/SqlClient), 04-TREE_FRAMEWORK.md, ADR-0003-TreeDataSource.md
Related Specs: ../explorer/project-explorer.md, ../language/parsing-and-semantic-model.md

---

# Purpose

Database Explorer cho phép lập trình viên duyệt schema Database (server/database/schema/
object) và mở nhanh script cho một object (table/view/procedure) vào SQL Studio, mà không
cần tự viết `SELECT`/`sp_helptext` thủ công. Đây là consumer thứ hai của Tree Framework
sau Project Explorer, dùng chung engine nhưng DataSource khác hoàn toàn.

# User Story

- Là lập trình viên, tôi muốn duyệt cấu trúc Database (bảng, view, stored procedure) theo
  cây, để tìm object cần xem nhanh hơn viết query catalog thủ công.
- Là lập trình viên, tôi muốn double-click một table và có ngay script `SELECT`/`CREATE`
  tương ứng mở trong SQL Studio, để không phải tự gõ.

# Functional Requirements

1. Hệ thống phải liệt kê các Connection Target khả dụng (Sys và/hoặc App database) qua
   `AppConnectionResolver`, không hardcode connection string.
2. Khi chọn một Connection Target, hệ thống phải truy vấn catalog (danh sách schema/
   object/type) qua một câu lệnh SQL cấu hình được (`CatalogSql`), thực thi qua
   `ISqlScriptRunner` — **UI không được tự mở `SqlConnection`/chạy SQL trực tiếp** (Rule
   R2).
3. Kết quả catalog phải được nhóm theo loại object (folder theo `object_type`, thứ tự
   hiển thị theo cấu hình) trước khi đưa vào Tree Framework hiển thị.
4. Single-click và double-click trên một object phải có thể trigger hành động khác nhau
   (ví dụ single-click = script rút gọn, double-click = script đầy đủ), với cơ chế huỷ
   single-click nếu double-click xảy ra trong khoảng thời gian cấu hình được.
5. Mở script cho một object phải đưa kết quả vào SQL Studio (buffer mới hoặc buffer có
   sẵn), không tự mở Dialog/Popup hiển thị SQL.

# Data Flow

```
DatabaseExplorerViewModel chọn SqlConnectionTargetVm (Sys/App, qua AppConnectionResolver)
    ↓
DatabaseExplorerViewModel.RefreshAsync
    ↓
ISqlScriptRunner.ExecuteAsync(connectionString, CatalogSql, ...)  (SqlScriptRunner —
    nơi DUY NHẤT chứa SqlConnection/SqlCommand/SqlDataReader)
    ↓
DataTable (schema_name/object_name/object_type/modify_date)
    ↓
DatabaseDataSource.SetCatalog(table, folders_by_type, connectionString)
    ↓
Tree Framework core (VirtualTreeEngine/TreeRenderingEngine — dùng chung engine với
    Project Explorer, khác DataSource)
    ↓
Click/double-click object → OpenObjectScriptAsync
    ↓
DatabaseObjectScripter.BuildAsync(connectionString, schema, objectName, kind, clickCount)
    ↓
SqlStudioNavigator.OpenBuffer  (mở script trong SQL Studio, không phải Dialog)
```

# State Machine

```
[Chưa chọn Connection]
    │ Người dùng chọn Connection Target
    ▼
[Đang tải Catalog qua SqlScriptRunner]
    │
    ├── Thành công ──▶ [Cây hiển thị, phân nhóm theo object type]
    └── Thất bại ─────▶ [Lỗi — cần xác nhận UI hiển thị thế nào, xem Error Handling]
```

Click object:

```
[Click] ──(chờ Database.SingleClickDelayMs)──▶ [Thực thi script single-click]
    │
    └── Double-click xảy ra trong lúc chờ ──▶ [Huỷ single-click, thực thi script double-click]
```

# Events

Không có Event hệ thống riêng — cùng cơ chế Tree Framework core (`VisibleRowsChanged`,
`SelectionChanged`/`NodeActivated`) như Project Explorer.

# Commands

- **Refresh** — tải lại catalog cho Connection Target hiện tại.
- **Open Object Script** (single/double-click) — mở script trong SQL Studio.

**Không có**: Context Menu (không có `ITreeCommandProvider` nào gắn cho
`DatabaseDataSource`), không có hành động "Run Query"/"Export Data" trực tiếp từ cây —
việc chạy query thực hiện ở SQL Studio sau khi script đã mở, không phải từ Database
Explorer.

# Integration

- Phụ thuộc `ISqlScriptRunner`/`AppConnectionResolver` (Infrastructure) — UI
  (`DatabaseExplorerViewModel`) chỉ gọi Service, không có `SqlConnection`/`SqlCommand`
  nào trong tầng UI (đã xác nhận qua rà soát code — tuân thủ Rule R2).
- Dùng chung Tree Framework core với `../explorer/project-explorer.md` — khác biệt duy
  nhất là `DatabaseDataSource` thay cho `FileSystemDataSource`.
- Mở kết quả vào SQL Studio qua `SqlStudioNavigator` — không tạo Dialog riêng để hiển thị
  script (đúng UI Guidelines "hạn chế Dialog").

# Performance

Kế thừa target chung của Tree Framework (ADR-0003) — không có target riêng cho việc
truy vấn catalog Database (thời gian phụ thuộc SQL Server, ngoài tầm kiểm soát của Tree
Framework). Không có cache catalog giữa các lần Refresh — mỗi Refresh chạy lại
`CatalogSql` từ đầu.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| Connection String không hợp lệ / không kết nối được | Cần xác nhận cụ thể — hiện chưa rõ UI hiển thị lỗi kết nối thế nào (Inline Message theo UI Guidelines, hay Exception lộ ra ngoài); cần viết test riêng khi làm rõ. |
| `CatalogSql` trả về rỗng | Cây hiển thị Empty State theo nhóm folder (không có object nào) — cần xác nhận Empty State có Icon/Description/Action theo UI Guidelines hay chỉ để trống. |
| Double-click ngay sau single-click trong khoảng `SingleClickDelayMs` | Single-click bị huỷ, chỉ double-click script chạy — không chạy cả hai. |

# Future Extension

- Context Menu cho Database Explorer (Script As, Copy Name, ...) — điểm mở rộng có sẵn ở
  Tree Framework (`ITreeCommandProvider`), chưa có implementation.
- Run Query / Export Data trực tiếp từ Tree (hiện chỉ có ở 05-WORKFLOW_ENGINE.md dưới
  dạng Database Action, chưa liên kết với Database Explorer UI này).
- Cache catalog để Refresh nhanh hơn khi không có thay đổi schema.

# Acceptance Criteria

- [ ] Given người dùng chọn một Connection Target hợp lệ, When Refresh, Then cây hiển thị
      các folder theo object type, không có `SqlConnection`/`SqlCommand` nào được gọi
      trực tiếp từ `DatabaseExplorerViewModel`/View (kiểm tra qua code review, không phải
      test runtime).
- [ ] Given người dùng double-click một table trong khoảng `SingleClickDelayMs` sau khi
      single-click, When kiểm tra, Then chỉ script double-click được mở, script
      single-click không chạy.
- [ ] Given người dùng right-click một object trong Database Explorer, When kiểm tra, Then
      không có Context Menu nào hiện ra (xác nhận gap hiện tại).
- [ ] Given script được mở từ Database Explorer, When kiểm tra, Then nó xuất hiện trong
      SQL Studio (qua `SqlStudioNavigator.OpenBuffer`), không phải trong một Dialog riêng.
