# Parsing & Semantic Model Pipeline

Module: language
Status: Implemented (đồng bộ, không Incremental — xem mục Gap)
Related Architecture: 02-ERP_LANGUAGE_SERVICE.md, ADR-0001-LanguageService.md, ADR-0006-SemanticModel.md
Related Specs: entity-resolution.md, symbol-navigation.md, diagnostics-pipeline.md

---

# Purpose

Toàn bộ DevWorkFlow dựa trên nguyên tắc "XML is Storage" — không module nào được Parse
XML trực tiếp ngoài ERP Language Service. Spec này mô tả hành vi thực tế của pipeline
biến XML/FBO source thành Semantic Model: Parser → Syntax Tree → Semantic Builder →
Semantic Model, và vòng đời một Document từ lúc mở tới khi sẵn sàng cho các Service khác
(Navigation, Diagnostics, Insight) sử dụng.

Đây không phải XML thuần theo chuẩn W3C — đây là **FBO Language**, một dialect XML có
DOCTYPE Entity, `<script>` (JavaScript islands), `<command>`/`<query>` (SQL islands).
Parser phải hiểu được các island này thay vì chỉ Parse XML tổng quát.

# User Story

- Là ERP Language Service, tôi cần Parse một file FBO Controller kể cả khi nó có lỗi cú
  pháp nhẹ (thẻ chưa đóng, XML không chuẩn), để Editor không bị crash hoặc từ chối mở file.
- Là một Service khác trong hệ thống (Navigation, Insight, Diagnostics), tôi cần đọc cùng
  một Semantic Model đã được build sẵn, để không phải tự Parse lại XML.
- Là lập trình viên, tôi cần khi lưu Document, nội dung XML gốc (comment, khoảng trắng,
  format) không bị bên phá vỡ vì Parser không hiểu, để diff Git luôn sạch.

# Functional Requirements

1. Khi mở một Document, hệ thống phải Tokenize toàn bộ source thành chuỗi Token sao cho
   mọi ký tự nguồn thuộc đúng một Token (lossless) — không được rơi ký tự nào ra ngoài
   Syntax Tree.
2. Parser phải nhận diện: comment (`<!--...-->`), CDATA, DOCTYPE (bao gồm ENTITY
   declaration), processing instruction (`<?xml...?>`), start/end/empty tag, text/whitespace.
3. Khi gặp cú pháp lỗi (tag không đóng, tag không khớp), Parser phải phục hồi (error
   recovery: pop stack tới tag khớp) và phát Diagnostic thay vì throw Exception hoặc từ
   chối Parse toàn bộ file.
4. `<script>` phải được nhận diện như một Island riêng — các hàm JavaScript bên trong
   được trích xuất thành các node con (không bị Parse như text thường).
5. `<command>`/`<query>` phải được nhận diện như SQL Island (nội dung giữ nguyên dạng
   opaque, không bị Parse như XML con).
6. Serialize lại Syntax Tree về text phải cho kết quả **giống hệt** source gốc (round-trip
   lossless) — bao gồm cả comment, khoảng trắng, và cấu trúc lỗi đã được recovery.
7. Semantic Builder phải build Semantic Model từ Syntax Tree, ưu tiên dùng Parser
   FBO-domain (legacy `FboXmlParser`) để lấy đầy đủ ngữ nghĩa Controller/Field/View; nếu
   Parser đó thất bại, phải fallback về việc dựng Symbol tối thiểu chỉ từ Syntax Tree
   (không được để Document ở trạng thái không có Semantic Model nào).
8. Mọi Document mở ra phải trải qua đủ chuỗi: Parse → Semantic Build → Diagnostics gộp
   (syntax + semantic) → Insight Provider Pipeline → Index vào Workspace Symbol Index →
   Rebuild Navigation Map, trước khi được trả về cho caller — không có trạng thái "một
   phần sẵn sàng" lộ ra ngoài.
9. Không component nào ngoài ERP Language Service được phép gọi Parser hoặc tạo Semantic
   Model của riêng mình (Rule R1, ADR-0001).

# Data Flow

```
Raw Text (FBO XML)
    ↓
FboLexer.Tokenize  →  Token stream (mọi ký tự thuộc đúng 1 token)
    ↓
FboSyntaxParser.Parse  →  SyntaxTree (error-recovery, Script/Sql Island, DTD Entity node)
    ↓
ErpSemanticBinder.Bind
    ├── FboXmlParser (legacy, domain-aware) → ControllerSymbol/FieldSymbol/ViewSymbol
    │       └── thất bại → fallback: dựng Symbol tối thiểu chỉ từ Syntax Tree
    └── EnrichFromSyntax → bổ sung Command/Query/ResponseAction/ScriptFunction Symbol
    ↓
Diagnostics (Syntax + Semantic gộp)
    ↓
InsightProviderPipeline.Build
    ↓
ErpDocument (Semantic Model hoàn chỉnh)
    ↓
WorkspaceSymbolIndex.IndexDocument  +  ErpNavigationService.Rebuild (NavigationMap)
    ↓
Trả về IErpDocument cho caller (Editor/Tree/Workflow/...)
```

# State Machine

Vòng đời một Document (theo thực tế implement — đơn giản hơn Document Lifecycle lý
tưởng trong `02-ERP_LANGUAGE_SERVICE.md`, không có bước "Ready" tách biệt vì toàn bộ
pipeline chạy đồng bộ):

```
[Chưa mở]
    │ OpenDocument / OpenDocumentFromText
    ▼
[Đang Parse + Build đồng bộ] ── (không lộ trạng thái trung gian ra ngoài)
    │
    ├── Parser lỗi nặng → BadToken/error-recovery, vẫn tiếp tục, phát Diagnostic
    ├── FboXmlParser thất bại → fallback Syntax-only Symbol, phát ERP0002 (Info)
    │
    ▼
[Sẵn sàng: ErpDocument trả về, đã Index + đã có NavigationMap]
    │ ReplaceContent (edit) / ReloadDocument
    ▼
[Parse + Build lại TOÀN BỘ từ đầu] ──▶ [Sẵn sàng]
```

# Events

Kiến trúc (`02-ERP_LANGUAGE_SERVICE.md` mục Communication) định nghĩa `DocumentChanged`,
`SemanticChanged`, `DiagnosticsChanged` được phát khi Document thay đổi. **Hiện tại
không có Event nào trong số này được implement** — `OpenDocument`/`ReplaceContent` trả
kết quả trực tiếp qua return value, không phát Event nào ra ngoài. Consumer (ví dụ
`FormBuilderViewModel`) tự gọi lại Service và tự cập nhật State qua data binding, không
lắng nghe Event hệ thống. Đây là gap cần lưu ý khi bất kỳ tính năng mới nào cần phản ứng
theo thời gian thực với thay đổi Document mà không phải chính module gọi ra thay đổi đó.

# Commands

Không có Command người dùng trực tiếp ở tầng này (Parsing/Semantic Build là hệ quả tự
động của Open/Edit Document, không phải một hành động người dùng chọn riêng).

# Integration

- Là nền tảng cho toàn bộ Module khác: Entity Resolution, Symbol/Navigation, Diagnostics
  (xem 3 spec liên quan) đều build trên Semantic Model sinh ra ở đây.
- Editor (Insight Editor Surface — `docs/specs/editor/insight-editor-surface.md`) gọi
  `IErpLanguageService` để mở/replace Document, không tự Parse.
- Extension Point: kiến trúc dự kiến cho phép Plugin đăng ký Completion/Diagnostics/
  Formatting/Search Provider (06-PLUGIN_SYSTEM.md) — **hiện tại chưa có cơ chế đăng ký
  Provider nào ở tầng Language Service ngoài Insight Provider** (xem
  `entity-resolution.md` mục Integration). Formatting Service, Refactoring Service,
  Search Service (trên Semantic Model) mô tả trong `02-ERP_LANGUAGE_SERVICE.md` chưa có
  code tương ứng.

# Performance

- Kiến trúc yêu cầu Incremental Parsing, Incremental Semantic Update, Cache, Cancellation
  Token, không Parse lại toàn bộ Document (`02-ERP_LANGUAGE_SERVICE.md` mục Performance
  Goals). **Thực tế: không có mục nào trong số này được implement.** Mọi lần
  `OpenDocument`/`ReplaceContent`/`ReloadDocument` đều Parse lại toàn bộ text, build lại
  toàn bộ Semantic Model, rebuild toàn bộ Navigation Map, đồng bộ (synchronous), không
  `CancellationToken`, không cache giữa các lần gọi.
- Không có `async`/`await` ở tầng Language Service — mọi lời gọi chạy trên thread gọi nó.
  Với Document lớn, việc này có thể chặn UI Thread nếu caller không tự đẩy sang
  background thread.
- Đây là rủi ro hiệu năng cần theo dõi khi Document lớn dần hoặc tần suất Edit tăng
  (mỗi keystroke re-parse trong Insight Editor Surface hiện dùng debounce 800ms ở tầng
  UI để giảm tải, xem `insight-editor-surface.md` — không phải giải pháp ở tầng Language
  Service).

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| XML/FBO lỗi cú pháp nhẹ (tag không đóng, tag không khớp) | Parser tự phục hồi (pop stack tới tag khớp), phát Diagnostic `ERP1001` (Warning), không throw, không từ chối mở file. |
| FboXmlParser (legacy, domain-aware) thất bại hoàn toàn | Fallback dựng Symbol tối thiểu chỉ từ Syntax Tree, phát `ERP0002` (Info) — Document vẫn mở được, chỉ giảm độ chi tiết Semantic. |
| Document rất lớn khiến Parse chậm | Không có xử lý riêng — chạy đồng bộ, không Cancellation Token, không thông báo tiến trình. Đây là gap, không phải hành vi đã thiết kế. |

# Future Extension

- Incremental Parsing/Semantic Update, Cache, Object Pool, Cancellation Token — nằm
  trong mục tiêu dài hạn của `02-ERP_LANGUAGE_SERVICE.md` nhưng chưa có timeline cụ thể;
  cần một spec riêng khi triển khai (bao gồm chiến lược Diff/Patch cho Semantic Model).
- Event (`DocumentChanged`/`SemanticChanged`/`DiagnosticsChanged`) cần được thiết kế và
  implement trước khi bất kỳ tính năng nào dựa vào "phản ứng real-time không qua polling"
  có thể triển khai đúng theo Architecture Event Driven.
- Formatting Service, Refactoring Service (Rename/Safe Replace/Move/Extract Entity),
  Search Service trên Semantic Model — chưa có code, thuộc phạm vi các spec riêng khi
  bắt đầu triển khai.

# Acceptance Criteria

- [ ] Given một file FBO chứa comment, khoảng trắng tuỳ ý, và một `<script>` block, When
      Document được mở rồi Serialize lại ngay (không edit gì), Then text kết quả giống
      hệt byte-by-byte với source gốc.
- [ ] Given một file có tag không đóng, When Document được mở, Then Parser trả về
      Syntax Tree hợp lệ (không throw), và Diagnostics chứa `ERP1001`.
- [ ] Given một file mà `FboXmlParser` không map được (không đúng dialect Controller),
      When mở Document, Then Semantic Model vẫn được tạo (fallback Syntax-only), và
      Diagnostics chứa `ERP0002`.
- [ ] Given một Document đã mở, When gọi `ReplaceContent` với text mới, Then
      `WorkspaceSymbolIndex` và `NavigationMap` được rebuild lại đầy đủ cho Document đó
      (không giữ dữ liệu cũ lẫn dữ liệu mới).
- [ ] Given bất kỳ module nào ngoài `DevWorkFlow.Application/Language`, When kiểm tra
      code, Then không tìm thấy lời gọi Parse XML trực tiếp (grep không có usage của
      `FboLexer`/`FboSyntaxParser`/`XmlDocument.Load` cho mục đích Parse ERP source bên
      ngoài Language module).
