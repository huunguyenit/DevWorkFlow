# Diagnostics Pipeline

Module: language
Status: Implemented (phạm vi hẹp — xem Gap). Bổ sung 2026-07-19: đã có
`UI/Config/xml/diagnostics.catalog.xml` (đọc qua `AppConfigStore.DiagnosticsCatalog`)
cung cấp "cách giải quyết" (Resolution) tra theo mã Diagnostic, hiển thị ở cột "Gợi ý"
trong Problems panel — xem mục Integration.
Related Architecture: 02-ERP_LANGUAGE_SERVICE.md, ADR-0001-LanguageService.md
Related Specs: parsing-and-semantic-model.md, entity-resolution.md, ../editor/insight-editor-surface.md

---

# Purpose

Diagnostics Service sinh Error/Warning/Info/Hint từ quá trình Parse và Semantic Build,
phục vụ Problems panel, Insight Layer (Validation Provider), và bất kỳ Service nào cần
biết Document có vấn đề gì trước khi cho phép thao tác tiếp (ví dụ Save, Generate).
Spec này mô tả các mã Diagnostic thực tế đang tồn tại và cách chúng được ánh xạ ra UI.

# User Story

- Là lập trình viên, tôi muốn thấy ngay lỗi cú pháp hoặc Entity không tồn tại khi mở
  Document, để sửa trước khi lỗi lan sang runtime ERP.
- Là lập trình viên, tôi muốn phân biệt được Error (chặn) và Warning/Info (không chặn),
  để biết cái gì bắt buộc phải sửa ngay.

# Functional Requirements

1. Mọi lỗi phát sinh trong quá trình Parse hoặc Semantic Build phải được biểu diễn dưới
   dạng `ErpDiagnostic` có mã (code), severity, mô tả, và vị trí (File/Line/Column) — không
   được throw Exception làm crash việc mở Document (trừ lỗi hệ thống nằm ngoài phạm vi xử
   lý được, ví dụ hết bộ nhớ).
2. Diagnostic phải có 4 mức severity: `Hidden`, `Info`, `Warning`, `Error`.
3. Diagnostic phải ánh xạ được sang dạng hiển thị UI-agnostic (dòng dữ liệu cho bảng
   Problems: Description/File/Line/Column/Type/SeverityBadge) mà không phụ thuộc trực
   tiếp WPF.
4. Diagnostic `Hidden` không được hiển thị trong Problems panel.
5. Hệ thống phải đếm được số lượng Diagnostic theo từng severity (phục vụ badge/status
   bar, ví dụ "3 Errors, 1 Warning").

# Data Flow

```
FboSyntaxParser (lỗi cú pháp)         EntitySymbolBinder (lỗi Entity)     ErpSemanticBinder
        │                                       │                        (field trùng tên,
        ▼                                       ▼                         legacy parse fail)
   ErpDiagnostic (ERP1001)          ErpDiagnostic (ERP3001-3004, 3010)          │
        │                                       │                              ▼
        └───────────────────┬───────────────────┴──────────────────  ErpDiagnostic (ERP0002, ERP2001)
                             ▼
                  Danh sách Diagnostic gộp (per Document)
                             ▼
                  DiagnosticGridMapper.MapProblems
                             ▼
             DiagnosticGridRow (Description/File/Line/Column/Type/SeverityBadge)
                             ▼
             Problems Panel (bottom dock) / ValidationInsightProvider (inline — xem gap)
```

# Danh sách mã Diagnostic hiện có

| Mã | Severity | Nguồn | Ý nghĩa |
|---|---|---|---|
| `ERP0001` | Warning | Language Service (`expand_error`) | Hiện chưa có call site nào thực sự truyền giá trị khác `null` — về cơ bản chưa được kích hoạt trong thực tế. |
| `ERP0002` | Info | Semantic Binder | `FboXmlParser` (legacy, domain-aware) thất bại, fallback sang Symbol tối thiểu từ Syntax Tree. |
| `ERP1001` | Warning | Syntax Parser | XML/FBO lỗi cú pháp đã được recovery (tag không đóng/không khớp). |
| `ERP2001` | Warning | Semantic Binder | Field trùng tên trong cùng Document. |
| `ERP3001` | Error | Entity Binder | File `SYSTEM` của Entity không tồn tại hoặc không đọc được. |
| `ERP3002` | Error | Entity Binder | Vòng lặp tham chiếu Entity (file include hoặc value). |
| `ERP3003` | Warning | Entity Binder | Tham chiếu tới Entity không có khai báo. |
| `ERP3004` | Warning | Entity Binder | Entity trùng tên (khi fallback DTD pre-resolve thất bại). |
| `ERP3010` | Info | Entity Binder | DTD pre-resolve (XmlDocument/XmlReader) ném Exception, fallback về regex. |

Chi tiết hành vi của các mã `ERP3xxx` xem `entity-resolution.md`.

# Events

Kiến trúc dự kiến `DiagnosticsChanged` — **chưa implement** (kế thừa gap chung).

# Commands

Không có Command người dùng trực tiếp (Diagnostics là hệ quả tự động của Parse/Bind).

# Integration

- Nguồn: `parsing-and-semantic-model.md` (lỗi cú pháp/semantic), `entity-resolution.md`
  (lỗi Entity).
- Tiêu thụ bởi: `ValidationInsightProvider` trong Insight Provider Pipeline (ADR-0004) —
  ánh xạ 1:1 mỗi `ErpDiagnostic` thành một `InsightItem` (`InsightType.Validation`),
  KHÔNG lọc/dedup.
- **Gap quan trọng đã xác nhận**: `InsightElementGenerator` (tầng Editor, xem
  `../editor/insight-editor-surface.md`) chỉ render inline cho `InsightType.Entity` —
  `InsightType.Validation` **không được hiển thị inline trong Editor**, dù
  `ValidationInsightProvider` đã tạo ra Insight item cho nó. Validation hiện chỉ hiển thị
  qua `InsightPanelViewModel` (dock bên phải) và `IdeDiagnosticsViewModel`/`ProblemItemVm`
  (Problems panel dưới đáy) — không phải lỗi trong Diagnostics Pipeline này, mà là gap ở
  tầng render Editor, cần ghi nhớ khi viết spec Insight rendering đầy đủ.
- Extension Point: kiến trúc dự kiến Diagnostics Provider cho Plugin — **chưa có cơ chế
  đăng ký** (tương tự gap ở `symbol-navigation.md`).
- **Diagnostics Catalog (`UI/Config/xml/diagnostics.catalog.xml`)**: bảng tra cứu
  Code → Message/Severity/Resolution, đọc qua `AppConfigStore.DiagnosticsCatalog`
  (Dictionary keyed by Code, theo đúng convention Config hiện có — attribute-based XML,
  fallback rỗng nếu thiếu file, không throw). `ErpDiagnostic.Id` (đã có sẵn) là khoá join.
  `DiagnosticGridRow` được bổ sung `Code`; `ProblemItemVm.FromGridRow` nhận catalog optional
  để điền `Resolution`. Đây LÀ tầng UI (Config thuộc `UI/Config`), không phải một phần của
  `DevWorkFlow.Application/Language` — Diagnostics Pipeline (module này) không phụ thuộc
  ngược vào UI; catalog chỉ tiêu thụ `ErpDiagnostic.Id` do module này tạo ra. Sửa file XML
  không cần rebuild logic C# (đúng nguyên tắc Configuration trong `08-CODING_STANDARDS.md`
  — "Mọi giá trị cấu hình phải nằm trong Configuration... Không Hardcode").

# Performance

Không có target số cụ thể. Diagnostics được tính lại toàn bộ mỗi lần Document được Parse
lại (kế thừa gap "không Incremental" từ `parsing-and-semantic-model.md`).

# Error Handling

Bảng mã lỗi ở trên chính là "Error Handling" của module này — đây là module tạo ra lỗi
cho các module khác tiêu thụ, không phải module tiêu thụ lỗi.

| Tình huống | Hành vi mong đợi |
|---|---|
| `DiagnosticGridMapper.MapProblems` nhận danh sách Diagnostic rỗng | Trả về danh sách `DiagnosticGridRow` rỗng, không lỗi. |
| Diagnostic có severity `Hidden` | Bị lọc khỏi kết quả `MapProblems`, không hiển thị Problems panel. |

# Future Extension

- Sửa gap Validation không hiển thị inline trong Editor (xem mục Integration).
- Diagnostic từ Schema Validation thật (ngoài duplicate-field-name) — hiện chưa có nguồn
  Diagnostic nào kiểm tra Document theo XSD Schema đầy đủ dù `XsdSchemaCatalog` đã tồn
  tại và được dùng cho `NavigationMapBuilder`.
- `DiagnosticsChanged` Event, Diagnostics Provider Extension Point cho Plugin.

# Acceptance Criteria

- [ ] Given một Document có 2 Error, 1 Warning, 1 Hidden, When gọi
      `DiagnosticGridMapper.CountBySeverity`, Then kết quả đếm đúng 2 Error, 1 Warning,
      và không tính Hidden.
- [ ] Given một Document có Diagnostic `Hidden`, When hiển thị Problems panel, Then dòng
      đó không xuất hiện trong danh sách.
- [ ] Given một Entity không tồn tại gây ra `ERP3003`, When kiểm tra Editor (AvalonEdit
      interim), Then Diagnostic đó KHÔNG hiển thị inline trong vùng soạn thảo (xác nhận
      gap hiện tại, dùng làm test hồi quy khi sửa) nhưng CÓ xuất hiện trong Problems panel.
- [ ] Given `diagnostics.catalog.xml` có mục `code="ERP3001"` với `resolution="..."`, When
      một Diagnostic có `Id="ERP3001"` chạy qua `DiagnosticGridMapper.MapProblems` rồi
      `ProblemItemVm.FromGridRow` với catalog tương ứng, Then `ProblemItemVm.Resolution`
      khớp đúng giá trị `resolution` trong file XML.
- [ ] Given `diagnostics.catalog.xml` bị xoá hoặc không đọc được, When khởi động ứng dụng,
      Then `AppConfigStore.DiagnosticsCatalog` trả về Dictionary rỗng (không throw), và
      Problems panel vẫn hoạt động bình thường chỉ với cột "Gợi ý" để trống.
