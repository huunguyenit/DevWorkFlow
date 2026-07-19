# ADR-0004: Insight Layer as the Visual Representation of ERP Language

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

FBO ERP sử dụng XML làm định dạng lưu trữ.

Trong XML có rất nhiều Entity.

Ví dụ:

```xml
clientDefault="&ClientDefault;"
```

Đối với lập trình viên lâu năm, cú pháp này dễ hiểu.

Tuy nhiên đối với:

- lập trình viên mới
- chuyên viên nghiệp vụ
- người tìm kiếm
- AI

thì XML rất khó đọc.

Một Entity chỉ hiển thị tên.

Muốn biết giá trị phải:

- Hover
- Search
- Mở file Entity
- Resolve thủ công

Điều này làm gián đoạn quá trình làm việc.

---

# Problem

Nếu thay Entity bằng Value.

Ví dụ

```text
clientDefault="Default"
```

thì:

- mất Source
- không biết Entity gốc
- không sửa được Entity
- mất khả năng hiểu cấu trúc

Nếu chỉ dùng Tooltip.

Ví dụ

Hover

↓

Default

thì:

- gián đoạn thao tác
- khó Search
- khó đọc
- UX kém

Cần một cách biểu diễn mới.

---

# Decision

DevWorkFlow giới thiệu khái niệm:

Insight Layer.

Insight Layer là lớp hiển thị nằm phía trên Source.

Insight Layer không thay đổi XML.

Insight Layer không ghi xuống file.

Insight Layer chỉ thay đổi cách Editor hiển thị ERP Language.

---

# Architecture

```text
             XML Document

                    │

                    ▼

          ERP Language Parser

                    │

                    ▼

             Semantic Model

                    │

                    ▼

        Insight Provider Pipeline

                    │

                    ▼

             Insight Layer

                    │

                    ▼

            Monaco Editor View
```

Source XML luôn được giữ nguyên.

Insight chỉ tồn tại trong Editor.

---

# Rendering Model

Ví dụ

Source:

```xml
clientDefault="&ClientDefault;"
```

Insight:

```text
clientDefault="&ClientDefault;" Default
```

Trong đó:

"&ClientDefault;"

- màu xám
- nghiêng
- mờ hơn

"Default"

- màu bình thường
- có thể chỉnh sửa trực tiếp

Người dùng nhìn thấy cả Source và Value cùng lúc.

---

## Rendering Principles

Insight Layer là một Rendering Layer.

Nó không phải:

- Widget
- Control
- Popup
- Tooltip

Insight Layer chỉ là một lớp Render.

Nó luôn nằm giữa:

Syntax Highlighting

↓

Insight Layer

↓

Diagnostics

↓

Selection

Insight Layer không được:

- sửa XML
- sửa Semantic Model
- tạo DOM
- tạo HTML Control

Insight Layer chỉ nhận dữ liệu từ Semantic Model
và chuyển thành Monaco Decorations hoặc cơ chế Render tương đương.

Điều này giúp Editor giữ được trải nghiệm của một IDE chuyên nghiệp thay vì trở thành một Form Designer.

# Nested Entity

Insight Layer phải giữ nguyên cấu trúc Entity.

Ví dụ

```xml
&Company.&Department.Manager;
```

Hiển thị

```text
Company
 └── Department
      └── Manager

↓

ABC Corp

↓

Sales

↓

Nguyễn Văn A
```

Hoặc hiển thị inline:

```text
&Company;
   └── &Department;
         └── &Manager;

ABC Corp
   └── Sales
         └── Nguyễn Văn A
```

Không được làm mất phân cấp.

---

# Editing

Người dùng sửa:

```text
Default
```

Insight Provider:

↓

Resolve Entity

↓

Update Semantic Model

↓

Serializer

↓

XML

Kết quả XML vẫn là:

```xml
clientDefault="&ClientDefault;"
```

Entity không bị thay thế.

---

# Insight Layer

Insight Layer không phải:

- Tooltip
- Popup
- Inline Text
- Annotation

Insight Layer là một lớp hiển thị độc lập.

Có thể:

- Render
- Highlight
- Collapse
- Expand
- Filter
- Search

---

# Insight Provider Pipeline

Insight Layer được xây dựng từ nhiều Provider.

```text
Semantic Model

↓

Insight Provider Pipeline

├── Entity Provider
├── Metadata Provider
├── Validation Provider
├── Reference Provider
├── Documentation Provider
├── AI Provider
└── Plugin Provider

↓

Insight Layer
```

Core không biết từng Provider.

Plugin có thể bổ sung Provider mới.

---

# Insight Provider

Mỗi Provider chỉ tạo một loại Insight.

Ví dụ:

Entity Provider

↓

Resolve Entity

Validation Provider

↓

Error

Reference Provider

↓

Reference Count

AI Provider

↓

Suggestion

Documentation Provider

↓

Comment

---

# Multiple Insights

Một Symbol có thể có nhiều Insight.

Ví dụ

```text
&Customer;   Customer A

✓ Active

⚠ Deprecated

15 References

AI: Có thể đổi sang CustomerV2
```

Insight Layer tự động sắp xếp và hợp nhất.

---

# Interaction

Insight không làm thay đổi cách chỉnh sửa.

Click Value

↓

Edit

↓

Semantic Update

↓

Serializer

↓

XML

Navigation.

Undo.

Redo.

Selection.

vẫn hoạt động bình thường.

---

# Search

Search hỗ trợ:

Source

↓

Entity

↓

Resolved Value

↓

Metadata

↓

Documentation

↓

Insight

Người dùng có thể tìm:

"Default"

hoặc

"&ClientDefault;"

đều ra kết quả.

---

# Performance

Insight không Render toàn bộ.

Chỉ Render:

Visible Range.

Khi Scroll:

↓

Dispose Insight.

↓

Render Insight mới.

Tương tự Virtualization.

---

# Consequences

## Positive

- XML dễ đọc hơn.
- Không mất Source.
- Không cần Tooltip.
- Có thể chỉnh sửa trực tiếp.
- AI dễ hiểu.
- Search tốt hơn.
- UX hiện đại.

---

## Negative

Insight Layer làm Editor phức tạp hơn.

Cần:

- Incremental Rendering.
- Virtual Decoration.
- Decoration Cache.

---

# Alternatives Considered

## Alternative 1

Tooltip

Rejected.

---

## Alternative 2

Replace XML bằng Value

Rejected.

---

## Alternative 3

Popup

Rejected.

---

## Alternative 4

Insight Layer

Accepted.

---

# Architectural Rules

- Insight không thay đổi XML.
- Insight không Parse XML.
- Insight chỉ đọc Semantic Model.
- Insight chỉ Render phần đang hiển thị.
- Plugin không được Render trực tiếp.
- Mọi Insight đều đi qua Insight Provider Pipeline.

---

# Impact

ADR này ảnh hưởng tới:

- ERP Language Service
- Editor Platform
- Monaco Adapter
- Navigation
- Search
- AI Platform
- Plugin System
- UI Guidelines

Đây là nền tảng cho toàn bộ trải nghiệm ERP Language.

---

# Future Review

ADR chỉ được xem xét lại nếu:

- Insight Layer được thay thế bằng mô hình hiển thị mới.
- ERP Language không còn sử dụng Semantic Model.

Nếu không, Insight Layer sẽ tiếp tục là lớp hiển thị chuẩn của DevWorkFlow.

---

# Related Documents

- 00-VISION.md
- 02-ERP_LANGUAGE_SERVICE.md
- 03-EDITOR_PLATFORM.md
- 07-UI_GUIDELINES.md
- ADR-0001-LanguageService.md
- ADR-0002-MonacoEditor.md