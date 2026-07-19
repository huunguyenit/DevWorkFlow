# Entity Resolution

Module: language
Status: Implemented
Related Architecture: 02-ERP_LANGUAGE_SERVICE.md, ADR-0001-LanguageService.md, ADR-0006-SemanticModel.md
Related Specs: parsing-and-semantic-model.md, ../editor/entity-insight-rendering.md, ../editor/insight-editor-surface.md

---

# Purpose

FBO XML dùng DOCTYPE `<!ENTITY Name "value">` để định nghĩa các tham chiếu tái sử dụng
(`&Name;`), có thể lồng nhau, và có thể include từ file khác (`SYSTEM` parameter
entity). Entity Resolution là dịch vụ duy nhất được phép "giải" các tham chiếu này
thành giá trị thật, phục vụ Insight Layer (hiển thị inline) và các Service khác cần
biết giá trị thực của một Entity thay vì chỉ tên tham chiếu.

# User Story

- Là ERP Language Service, tôi cần Resolve `&ClientDefault;` ra giá trị thật của nó, kể
  cả khi giá trị đó lại tham chiếu tới Entity khác, để Insight Layer hiển thị đúng.
- Là lập trình viên, tôi cần được cảnh báo ngay khi tạo ra một vòng lặp tham chiếu Entity
  (A → B → A), để không gây treo hệ thống hoặc lỗi khó debug.
- Là lập trình viên, tôi cần biết ngay khi tham chiếu tới một Entity không tồn tại hoặc
  file Entity không đọc được, để sửa trước khi lỗi lan sang runtime của ERP.

# Functional Requirements

1. Hệ thống phải thu thập toàn bộ khai báo `<!ENTITY Name "value">` trong DOCTYPE của
   Document, bao gồm cả khai báo lấy từ file ngoài qua `SYSTEM "path"` (parameter entity
   `%Name;`), đọc đệ quy nếu file được include lại include file khác.
2. Khi một file `SYSTEM` được include nhiều lần theo một chu trình (A include B, B include
   lại A), hệ thống phải phát hiện và báo lỗi (`ERP3002`) thay vì đọc file vô hạn.
3. Việc xác định giá trị Entity nào đang "active" (trong trường hợp có INCLUDE/IGNORE
   trong conditional section của DTD) phải đối chiếu với kết quả resolve DTD chuẩn
   (không chỉ dựa trên regex tự viết), để đảm bảo đúng theo ngữ nghĩa XML DTD thật.
4. Khi giá trị của một Entity chứa tham chiếu tới Entity khác (`&Child;`), hệ thống phải
   resolve đệ quy tới khi ra giá trị cuối cùng (text thuần), giữ nguyên cấu trúc phân cấp
   cho mục đích hiển thị (không rút gọn mất thông tin — Rule R8/ADR-0004).
5. Khi việc resolve giá trị đệ quy quay lại chính Entity đang được resolve (A → B → A),
   hệ thống phải phát hiện vòng lặp, báo lỗi (`ERP3002`), và trả về tham chiếu gốc
   (`&A;`) thay vì đệ quy vô hạn hoặc treo.
6. Khi một tham chiếu `&Name;` trỏ tới Entity không có khai báo nào, hệ thống phải phát
   Diagnostic (`ERP3003`) — không được im lặng bỏ qua hoặc trả về chuỗi rỗng.
7. Khi file `SYSTEM` không tồn tại hoặc không đọc được, hệ thống phải phát Diagnostic
   (`ERP3001`) nêu rõ nguyên nhân (thiếu file / không đọc được), không throw Exception
   làm crash việc mở Document.
8. Hệ thống phải cung cấp một phiên bản "ClearText" của Document (mọi tham chiếu Entity
   đã được thay thế bằng giá trị resolve) phục vụ hiển thị, tách biệt khỏi Document gốc
   (Source luôn giữ nguyên tham chiếu — Rule: Insight không sửa Source).
9. Mỗi vị trí tham chiếu Entity trong Document phải xác định được có cho phép chỉnh sửa
   tại chỗ hay không (`CanEdit`), để Editor biết Entity nào hiển thị readonly.
10. **(Bổ sung 2026-07-19)** Chỉ Entity thực sự ĐƯỢC SỬ DỤNG mới được tạo symbol: tham
    chiếu trực tiếp trong body Document, hoặc gián tiếp qua giá trị của Entity đã dùng
    (transitive closure). File include (`Unit.ent`, ...) khai báo hàng loạt Entity dùng
    chung — KHÔNG đổ toàn bộ vào Document (ví dụ `Account.xml` không gọi `&Lookup.Job;`
    thì `Lookup.Job` không xuất hiện trong danh sách Entity của Account). Parameter
    entity (`%Include`) giữ nguyên quy tắc cũ (phục vụ Go To Definition include).
11. **(Bổ sung 2026-07-19)** Mỗi EntitySymbol có `AnnotatedText` phục vụ hiển thị
    Insight/Semantic mode: Entity lá → giá trị resolve; Entity nhiều cấp → RawValue với
    mỗi ref con thay bằng `&Con;|giá_trị_chú_giải_con`. Ví dụ `&A;`="xin", `&B;`="chào",
    `&C;`="&A;&B;Claude" → `C.AnnotatedText` = `&A;|xin&B;|chàoClaude`. Editor hiển thị
    reference gốc + widget `| AnnotatedText` ngay sau (Source không đổi). Cycle → trả về
    `&name;`, không đệ quy vô hạn.

# Data Flow

```
DOCTYPE text (trong Syntax Tree)
    ↓
CollectDeclarations  (regex quét khai báo ENTITY, đệ quy theo SYSTEM include, phát hiện
                       cycle theo file — ERP3002)
    ↓
ResolveActiveDtdEntities  (dùng XmlDocument/XmlReader làm nguồn "authoritative" cho
                            INCLUDE/IGNORE conditional section)
    ↓
BuildActiveDefinitions / PickMatchingDeclaration  (đối chiếu regex-collected declarations
                                                     với kết quả DTD chuẩn)
    ↓
ResolveValue (đệ quy, HashSet theo tên Entity đang resolve để phát hiện cycle giá trị
              — ERP3002; ERP3003 nếu tham chiếu không tồn tại)
    ↓
BuildReferenceIndex  (SymbolReference cho mọi &Name; xuất hiện trong Document + trong
                       RawValue của các Entity khác + trong DOCTYPE parameter ref)
    ↓
EntitySymbol (RawValue, ResolvedValue, ChildEntityIds, References, CanEdit)
    ↓
ClearText + Segments (EntityProjectionSegment) — dùng cho hiển thị/Insight
```

# State Machine

Không có state machine runtime riêng (Entity Resolution là một bước tính toán thuần,
chạy trong lúc Semantic Build — xem `parsing-and-semantic-model.md`). Trạng thái kết
quả của một Entity chỉ có 3 khả năng cuối cùng:

```
[Resolve thành công]  — RawValue có giá trị, không lỗi
[Resolve lỗi: Missing/Unreadable File]  — ERP3001
[Resolve lỗi: Cycle (file include hoặc value)]  — ERP3002
[Resolve lỗi: Reference không tồn tại]  — ERP3003
```

# Events

Không phát Event runtime (xem gap chung ở `parsing-and-semantic-model.md` mục Events —
`SemanticChanged`/`InsightChanged` chưa được implement).

# Commands

- **Edit Entity Value** — thay đổi giá trị resolve của một Entity; hiện thực qua
  `IErpLanguageService.UpdateEntityValue(documentId, entityName, newValue)`. Xem hành vi
  UI chi tiết (bao gồm gap về Undo/Redo) tại `../editor/insight-editor-surface.md`.

# Integration

- Phụ thuộc Syntax Tree/DOCTYPE do `parsing-and-semantic-model.md` cung cấp.
- Là nguồn dữ liệu chính cho `EntityInsightProvider` trong Insight Provider Pipeline
  (xem ADR-0004) — Insight Layer không tự resolve Entity, chỉ đọc kết quả đã có.
- Editor (`../editor/entity-insight-rendering.md`, `../editor/insight-editor-surface.md`)
  hiển thị kết quả Entity Resolution, không tự tính lại.
- Extension Point: kiến trúc dự kiến cho phép Plugin đăng ký Insight Provider khác cạnh
  Entity Provider (ví dụ hiển thị thêm Validation/AI Suggestion) — cơ chế này đã tồn tại
  ở mức tối thiểu (`InsightProviderPipeline` nhận danh sách `IInsightProvider` qua
  constructor) nhưng **`ErpLanguageService` hiện hardcode danh sách Provider mặc định,
  chưa có API công khai để đăng ký Provider từ bên ngoài** — cần bổ sung nếu muốn Plugin
  thực sự đăng ký được.

# Performance

- Không có cache giữa các lần gọi khác nhau — `ResolveValue` chỉ có memoization cục bộ
  trong một lần Bind (một `cache` dictionary sống theo lời gọi, không giữ qua các lần
  Edit). Mỗi lần Document được Parse lại, toàn bộ Entity được resolve lại từ đầu — kế
  thừa gap chung của `parsing-and-semantic-model.md`.
- Không có target số cụ thể riêng cho Entity Resolution trong Architecture hiện tại.

# Error Handling

| Tình huống | Mã Diagnostic | Severity | Hành vi mong đợi |
|---|---|---|---|
| File `SYSTEM` không tồn tại / không đọc được | `ERP3001` | Error | Nêu rõ nguyên nhân (thiếu file / không đọc được); Document vẫn mở được, Entity đó không resolve được. |
| Vòng lặp include file (A→B→A qua `SYSTEM`) | `ERP3002` | Error | Dừng đệ quy tại điểm phát hiện lại, không đọc file vô hạn. |
| Vòng lặp giá trị Entity (A→B→A qua `&Name;` trong RawValue) | `ERP3002` | Error | Trả về tham chiếu gốc (`&A;`) thay vì giá trị, không đệ quy vô hạn. |
| Tham chiếu `&Name;` tới Entity không có khai báo | `ERP3003` | Warning | Phát Diagnostic; **Gap đã xác nhận**: ở tầng UI hiện tại (`InsightElementGenerator`), tham chiếu không tồn tại không tạo `InsightItem` nào nên **không hiển thị chỉ báo lỗi inline** — chỉ hiện ra dưới dạng text `&Name;` bình thường, khác với hành vi mục tiêu mô tả ở `../editor/entity-insight-rendering.md`. Cần khắc phục khi làm Editor Platform thật. |
| Entity trùng tên khi DTD pre-resolve thất bại (fallback regex) | `ERP3004` | Warning | Chọn 1 khai báo theo thứ tự xuất hiện, cảnh báo trùng. |
| DTD pre-resolve (XmlDocument/XmlReader) ném Exception | `ERP3010` | Info | Fallback về kết quả regex-only, không làm crash việc mở Document. |

# Future Extension

- Hiển thị chỉ báo lỗi inline cho Entity không tồn tại (hiện đang "im lặng" ở tầng UI dù
  Diagnostic `ERP3003` đã có ở tầng Language Service) — cần sửa `EntityInsightProvider`
  hoặc consumer của nó để không bỏ qua reference chưa resolve.
- Rename Entity — `EntityInsightProvider` đã gắn action id `symbol.rename` vào metadata
  nhưng chưa có Refactoring Service nào đứng sau xử lý (xem gap tại
  `parsing-and-semantic-model.md`).

# Acceptance Criteria

- [ ] Given DOCTYPE khai báo `<!ENTITY A "&B;">` và `<!ENTITY B "&A;">`, When resolve Entity
      `A`, Then hệ thống trả về lỗi `ERP3002` và giá trị hiển thị là `&A;`, không treo.
- [ ] Given `<!ENTITY Config SYSTEM "config.xml">` mà `config.xml` không tồn tại, When mở
      Document, Then Diagnostics chứa `ERP3001` và Document vẫn mở được bình thường.
- [ ] Given `&Undefined;` xuất hiện trong Document mà không có khai báo ENTITY tương ứng,
      When Semantic Build chạy, Then Diagnostics chứa `ERP3003` (dù UI hiện tại chưa hiển
      thị inline — xem Error Handling).
- [ ] Given Entity lồng nhau 3 cấp (`&Company;` → `&Department;` → text), When resolve,
      Then `ChildEntityIds` phản ánh đúng cấu trúc phân cấp, không bị rút gọn phẳng.
- [ ] Given người dùng gọi `UpdateEntityValue` với tên Entity hợp lệ, When cập nhật thành
      công, Then `ClearText`/`Segments` của Document được tính lại phản ánh giá trị mới,
      còn tham chiếu Entity gốc trong Source (`&Name;`) không đổi.
