# ADR-0006: Semantic Model as the Source of Truth

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

FBO ERP hiện tại lưu toàn bộ chương trình dưới dạng XML.

Ví dụ:

- Form
- Field
- Command
- View
- Script
- Entity
- Metadata

Trong nhiều năm, XML được xem là nguồn dữ liệu chính.

Mọi thành phần đều đọc XML trực tiếp.

Điều này dẫn tới:

- Parse lặp lại.
- Logic phân tán.
- Navigation không thống nhất.
- Refactoring khó.
- AI khó hiểu chương trình.
- Designer khó đồng bộ.

XML phù hợp để lưu trữ.

Nhưng không phù hợp để làm mô hình làm việc của IDE.

---

# Problem

XML mô tả cấu trúc.

Nhưng không mô tả ngữ nghĩa.

Ví dụ

```xml
clientDefault="&ClientDefault;"
```

XML chỉ biết đây là Attribute.

Không biết:

- Entity
- Symbol
- Navigation
- References
- Scope
- Type
- Metadata

Điều này khiến IDE phải suy luận lại nhiều lần.

---

# Decision

DevWorkFlow lựa chọn Semantic Model làm Source of Truth.

Semantic Model là mô hình duy nhất đại diện cho ERP Program.

XML chỉ là định dạng lưu trữ.

Mọi thao tác đều thực hiện trên Semantic Model.

Khi cần lưu.

Semantic Model được Serialize thành XML.

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

────────────────────────────────────────────

Navigation

Refactoring

Search

Workflow

Designer

Insight

AI

Plugin

Tree

Editor

────────────────────────────────────────────

                  │

                  ▼

            Serializer

                  │

                  ▼

                 XML
```

Semantic Model là trung tâm.

---

# Rationale

## ERP Program

Semantic Model đại diện cho chương trình ERP.

Không phải XML.

---

## XML is Storage

XML chỉ là nơi lưu.

Không phải nơi xử lý.

---

## One Model

Toàn bộ IDE dùng cùng một Semantic Model.

Không tạo mô hình riêng.

---

## Rich Metadata

Semantic Model có thể lưu:

- Symbol
- Entity
- Scope
- Type
- Reference
- Documentation
- Validation
- Insight

XML không làm được điều này.

---

## Navigation

Navigation hoạt động theo Symbol.

Không theo dòng.

---

## Refactoring

Rename.

Move.

Delete.

Extract.

Generate.

đều thao tác trên Semantic Model.

---

## AI

AI chỉ cần đọc Semantic Model.

Không cần Parse XML.

Prompt ngắn hơn.

Độ chính xác cao hơn.

---

# Semantic Model Structure

```text
Workspace

↓

Project

↓

Document

↓

Semantic Document

↓

Symbols

↓

Entity

↓

Metadata

↓

References
```

---

# Symbol

Mọi thành phần đều là Symbol.

Ví dụ:

Field

View

Command

Action

Script

Table

Column

Workflow

Property

Entity

---

# Symbol Identity

Mỗi Symbol có:

- SymbolId
- ParentId
- Kind
- Name
- DisplayName
- Location
- Scope

SymbolId không thay đổi.

Tên có thể thay đổi.

---

# References

Reference không lưu theo dòng.

Reference lưu theo SymbolId.

Ví dụ

```text
Field A

↓

Reference

↓

Command B

↓

View C

↓

Script D
```

Rename không làm mất Reference.

---

# Entity

Entity không Resolve trong XML.

Entity Resolve trong Semantic Model.

Ví dụ

```text
&ClientDefault;

↓

Entity Symbol

↓

Default
```

Insight Layer đọc Semantic.

---

# Editing

Editor sửa:

Semantic Model

↓

Serializer

↓

XML

Không sửa XML trực tiếp.

---

# Synchronization

Khi Semantic thay đổi.

↓

Tree cập nhật.

↓

Outline cập nhật.

↓

Insight cập nhật.

↓

Designer cập nhật.

↓

Workflow cập nhật.

↓

AI cập nhật.

↓

Navigation cập nhật.

---

# Serialization

Semantic Model

↓

Serializer

↓

XML

Serializer là thành phần duy nhất được ghi XML.

---

# Incremental Update

Không Build lại toàn bộ.

Thay đổi nhỏ.

↓

Incremental Parse.

↓

Incremental Semantic Update.

↓

Incremental Render.

---

# Consequences

## Positive

- IDE hiện đại.
- AI hiểu ERP.
- Refactoring mạnh.
- Navigation chính xác.
- Workflow đơn giản.
- Designer đồng bộ.
- Plugin dễ mở rộng.

---

## Negative

Semantic Model cần thiết kế rất cẩn thận.

Chi phí xây dựng ban đầu cao.

---

# Alternatives Considered

## Alternative 1

XML DOM

Rejected.

XML không biểu diễn được ngữ nghĩa.

---

## Alternative 2

Mỗi Module tạo Model riêng.

Rejected.

Không đồng bộ.

---

## Alternative 3

Semantic Model

Accepted.

---

# Architectural Rules

- XML không được xem là Source of Truth.
- Semantic Model là mô hình duy nhất của ERP Program.
- Chỉ Serializer được ghi XML.
- Không module nào sửa XML trực tiếp.
- Navigation luôn theo SymbolId.
- Insight luôn đọc Semantic Model.
- Workflow luôn thao tác Semantic Model.
- Plugin không được lưu trạng thái riêng ngoài Semantic Model nếu đó là dữ liệu nghiệp vụ.

---

# Impact

ADR này ảnh hưởng đến:

- ERP Language Service
- Editor Platform
- Tree Framework
- Workflow Engine
- Plugin System
- Insight Layer
- AI Platform
- Navigation
- Search
- Refactoring
- Designer

Đây là quyết định kiến trúc cốt lõi của DevWorkFlow.

---

# Related Documents

- 01-ARCHITECTURE.md
- 02-ERP_LANGUAGE_SERVICE.md
- 03-EDITOR_PLATFORM.md
- 05-WORKFLOW_ENGINE.md
- ADR-0001-LanguageService.md
- ADR-0004-InsightLayer.md
- ADR-0005-EditorPlatform.md

---

# Future Review

ADR này chỉ được xem xét lại nếu:

- DevWorkFlow không còn sử dụng ERP Language Service.
- Có mô hình đại diện ERP Program tốt hơn Semantic Model.

Nếu không, Semantic Model sẽ tiếp tục là Source of Truth duy nhất của DevWorkFlow.