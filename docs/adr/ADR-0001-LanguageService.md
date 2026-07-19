# ADR-0001: ERP Language Service as the Single Source of Truth

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

FBO ERP hiện tại được xây dựng chủ yếu trên các tệp XML.

Trong quá trình phát triển, nhiều thành phần của IDE cần đọc và phân tích XML:

- Editor
- Explorer
- Outline
- Workflow
- Designer
- AI
- Validation
- Navigation

Nếu mỗi module tự phân tích XML, hệ thống sẽ gặp các vấn đề:

- Logic Parse bị lặp lại.
- Khó đồng bộ dữ liệu.
- Navigation không nhất quán.
- AI hiểu XML khác Editor.
- Workflow hiểu XML khác Designer.
- Khó mở rộng.
- Hiệu năng giảm do Parse nhiều lần.

Cần có một kiến trúc thống nhất.

---

# Decision

DevWorkFlow lựa chọn xây dựng **ERP Language Service** làm trung tâm xử lý ngôn ngữ.

ERP Language Service là thành phần duy nhất được phép:

- Parse XML
- Build Syntax Tree
- Build Semantic Model
- Resolve Entity
- Resolve Symbol
- Validation
- Diagnostics
- Navigation
- Completion
- Refactoring
- Formatting

Mọi module khác bắt buộc phải sử dụng ERP Language Service.

Không module nào được Parse XML trực tiếp.

---

# Architecture

```text
                  XML

                   │

                   ▼

             ERP Parser

                   │

                   ▼

             Syntax Tree

                   │

                   ▼

          Semantic Builder

                   │

                   ▼

            Semantic Model

                   │

    ┌──────────────┼──────────────┐
    ▼              ▼              ▼

 Editor      Tree Framework    Workflow

    ▼              ▼              ▼

 Designer        AI Platform    Plugin
```

Semantic Model là trung tâm của toàn bộ IDE.

---

# Rationale

## Một nguồn dữ liệu duy nhất

Semantic Model là "Single Source of Truth".

Mọi thành phần đọc cùng một mô hình dữ liệu.

Không phát sinh sai lệch.

---

## Tăng khả năng mở rộng

Có thể bổ sung:

- SQL Language
- Workflow Language
- JavaScript Language

mà không cần thay đổi Editor hoặc Tree.

---

## Hiệu năng

Document chỉ Parse một lần.

Các Service dùng lại cùng một Semantic Model.

Hỗ trợ:

- Incremental Parsing
- Incremental Semantic Update
- Cache

---

## AI Integration

AI không cần đọc XML.

AI chỉ cần đọc Semantic Model.

Điều này giúp Prompt ngắn hơn và chính xác hơn.

---

## Navigation

Navigation hoạt động theo Symbol.

Không dựa trên số dòng.

Cho phép:

- Go To Definition
- Find References
- Peek Definition
- Rename Symbol

hoạt động chính xác ngay cả khi XML thay đổi.

---

## Two-way Synchronization

Editor.

Explorer.

Outline.

Workflow.

Designer.

AI.

đều làm việc trên cùng một Semantic Model.

Khi Semantic Model thay đổi, mọi thành phần được cập nhật đồng thời.

---

# Consequences

## Positive

- Kiến trúc thống nhất.
- Không lặp logic Parse.
- Hiệu năng tốt hơn.
- Navigation chính xác.
- AI hiểu đúng ERP.
- Dễ kiểm thử.
- Dễ mở rộng.

---

## Negative

ERP Language Service trở thành thành phần quan trọng nhất.

Nếu thiết kế không tốt sẽ ảnh hưởng toàn bộ IDE.

Do đó cần:

- Unit Test đầy đủ.
- API ổn định.
- Thiết kế mở rộng.
- Tài liệu rõ ràng.

---

# Alternatives Considered

## Alternative 1

Mỗi module tự Parse XML.

### Kết quả

Không chấp nhận.

Lý do:

- Trùng lặp.
- Khó bảo trì.
- Hiệu năng kém.
- Không đồng bộ.

---

## Alternative 2

Editor giữ XML DOM.

Các module đọc từ Editor.

### Kết quả

Không chấp nhận.

Lý do:

- Phụ thuộc Editor.
- Không dùng được cho AI.
- Không dùng được cho CLI.
- Không dùng được cho Plugin.

---

## Alternative 3

Sử dụng XML DOM làm mô hình chung.

### Kết quả

Không chấp nhận.

Lý do:

XML DOM chỉ biểu diễn cấu trúc XML.

Không biểu diễn được:

- Symbol
- Entity
- Navigation
- Insight
- Workflow
- Metadata

Không phù hợp với định hướng ERP Language.

---

# Architectural Rules

Các quy tắc bắt buộc:

- Chỉ ERP Language Service được Parse XML.
- Chỉ ERP Language Service được tạo Semantic Model.
- Không module nào giữ Semantic Model riêng.
- Không module nào chỉnh sửa XML trực tiếp.
- Mọi thay đổi phải thông qua Semantic Model và Serializer.
- Navigation luôn theo SymbolId.
- Entity luôn được Resolve thông qua Entity Service.

---

# Impact

Quyết định này ảnh hưởng trực tiếp tới:

- Editor Platform
- Tree Framework
- Workflow Engine
- Plugin System
- AI Platform
- Navigation
- Insight Layer
- Designer

Đây là quyết định nền tảng của DevWorkFlow.

---

# Related Documents

- 00-VISION.md
- 01-ARCHITECTURE.md
- 02-ERP_LANGUAGE_SERVICE.md
- ADR-0002-MonacoEditor.md
- ADR-0003-TreeDataSource.md
- ADR-0004-InsightLayer.md

---

# Future Review

ADR này chỉ được xem xét lại nếu:

- DevWorkFlow không còn sử dụng ERP Language Service.
- Semantic Model được thay thế bởi một kiến trúc mới.
- Có thay đổi lớn trong mô hình phát triển ERP.

Nếu không có các trường hợp trên, ADR này được xem là quyết định kiến trúc lâu dài của dự án.