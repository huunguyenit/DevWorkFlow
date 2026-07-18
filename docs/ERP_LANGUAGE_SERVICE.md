# ERP Language Service
Version: 1.0 (Architecture Freeze)

---

# Mục tiêu

FBO Studio không phải là XML Editor.

FBO Studio là IDE dành riêng cho FBO ERP.

XML chỉ là định dạng lưu trữ (Storage Format).

Mọi chức năng của IDE phải hoạt động trên mô hình ngữ nghĩa (ERP Semantic Model), không thao tác trực tiếp trên XML.

ERP Language Service là trái tim của toàn bộ hệ thống.

---

# Design Philosophy

Các nguyên tắc thiết kế:

- XML chỉ dùng để lưu dữ liệu.
- ERP Semantic Model là dữ liệu làm việc duy nhất.
- Editor chỉ chịu trách nhiệm hiển thị.
- Business Logic không được đặt trong Editor.
- AI, Workflow, Designer, Plugin đều dùng chung ERP Language Service.

---

# Overall Architecture

```text
                     XML File
                         │
                ERP Language Service
                         │
 ┌───────────────────────┼────────────────────────┐
 │                       │                        │
 │                  XML Parser               XML Serializer
 │                       │                        │
 └───────────────────────┴────────────────────────┘
                         │
                  ERP Semantic Model
                         │
                  Symbol Table / AST
                         │
          ┌──────────────┴──────────────┐
          │                             │
     Workflow Engine             AI Engine
          │                             │
          └──────────────┬──────────────┘
                         │
              Insight Provider Pipeline
                         │
       ┌─────────────────┼─────────────────┐
       │                 │                 │
 Entity Provider   Validation Provider   AI Provider
 Workflow Provider SQL Provider          Plugin Provider
 Git Provider      Documentation Provider ...
                         │
               Merged Insight Collection
                         │
                  Editor Rendering Engine
                         │
        ┌────────────────┼────────────────┐
        │                │                │
   Source Mode     Insight Mode    Designer Mode
                         │
                    AvalonEdit UI
```

---

# ERP Language Service

ERP Language Service là thành phần duy nhất được phép thao tác với XML.

Nhiệm vụ:

- Parse XML
- Serialize XML
- Build Semantic Model
- Resolve Entity
- Build Symbol Table
- Validation
- Search
- Rename
- Reference Management

Không module nào được đọc XML trực tiếp.

---

# ERP Semantic Model

ERP Semantic Model là Single Source of Truth.

Tất cả module đều làm việc trên Semantic Model.

Bao gồm:

- XML Editor
- Designer
- Workflow
- AI
- Validation
- Search
- Deployment
- Plugin

Semantic Model hoàn toàn độc lập với XML.

---

# Symbol

Trong ERP Language Service, Entity không phải là String.

Entity là Symbol.

Ví dụ

```
&ClientDefault;
```

không phải text.

Nó là

```
EntitySymbol

Name

DisplayName

Definition

References

Metadata

Value

Children
```

Mọi thao tác Rename, Search, Validation đều làm việc trên Symbol.

---

# Workflow Engine

Workflow không thao tác XML.

Workflow chỉ thao tác Semantic Model.

Ví dụ

```
Read XML

↓

Resolve Entity

↓

Generate XML

↓

Deploy
```

---

# AI Engine

AI không đọc XML.

AI chỉ làm việc trên Semantic Model.

Ví dụ

```
Rename Caption

↓

RenameSymbol()

↓

Language Service

↓

Serializer

↓

XML
```

---

# Editor Rendering Architecture

Editor không Parse XML.

Editor không Resolve Entity.

Editor chỉ Render.

```text
Syntax
        +
Insight
        +
Selection
        +
Caret

↓

Rendering Engine

↓

AvalonEdit
```

---

# View Modes

Editor hỗ trợ ba chế độ.

## Source Mode

Hiển thị XML đúng như nội dung được lưu.

Ví dụ

```
clientDefault="&ClientDefault;"
```

Phù hợp

- Debug
- Compare
- Merge
- Copy XML

Không Resolve.

---

## Insight Mode

Đây là chế độ làm việc mặc định.

Insight Mode hiển thị đồng thời

- XML
- Entity
- Value
- Validation
- Dependency
- AI
- Workflow
- Documentation

Không Tooltip.

Không Popup.

Không Floating Window.

Mọi Insight đều hiển thị trực tiếp.

---

## Designer Mode

Designer chỉ hiển thị giao diện cuối cùng.

Không hiển thị XML.

Không hiển thị Entity.

Designer thao tác trên Semantic Model.

Language Service Serialize thành XML.

---

# Insight Layer

Insight Layer là lớp hiển thị ngữ nghĩa.

Insight không lưu trong XML.

Insight chỉ là Virtual Rendering.

Editor chỉ Render Insight.

---

# Entity Rendering

Entity luôn được hiển thị thành hai phần.

Ví dụ

```
clientDefault="

&ClientDefault; │ Default

"
```

Entity Reference

```
&ClientDefault;
```

- Gray
- Italic
- ReadOnly
- Go To Definition
- Find References
- Rename Symbol

Resolved Value

```
Default
```

- Editable
- Validation
- Auto Complete
- Undo / Redo

Editor không thay thế Entity.

Editor chỉ bổ sung Value.

---

# Nested Entity

Entity có thể lồng nhau nhiều cấp.

Ví dụ

```
&CustomerTitle;
└─ Khách hàng của
   &CompanyName; │ Công ty ABC
```

Nếu tiếp tục lồng

```
&EntityA;
└─ Value A
   &EntityB;
   └─ Value B
      &EntityC;
      └─ Value C
```

Editor luôn Render Entity Tree.

Không Flatten.

Không làm mất cấu trúc.

---

# Inline Editing

Chỉ Resolved Value được phép chỉnh sửa.

Ví dụ

```
&CompanyName; │ Công ty ABC
```

Người dùng sửa

```
Công ty OpenAI
```

↓

ERP Language Service

↓

Semantic Model

↓

Entity Definition

↓

Serializer

↓

XML

XML vẫn lưu

```
&CompanyName;
```

Reference không thay đổi.

---

# Search

Search hoạt động trên Semantic Model.

Ví dụ

```
Company

Công ty

&CompanyName;
```

đều trả về cùng một Symbol.

Không Search trực tiếp XML.

---

# Rename

Rename hoạt động trên Symbol.

Không Replace Text.

Language Service cập nhật toàn bộ References.

---

# Insight Provider Pipeline

Insight Layer không tự sinh dữ liệu.

Toàn bộ Insight được tạo bởi các Provider.

```text
ERP Semantic Model
        │
        ▼
Insight Provider Pipeline
        │
 ├── EntityInsightProvider
 ├── ValidationInsightProvider
 ├── WorkflowInsightProvider
 ├── AIInsightProvider
 ├── SqlInsightProvider
 ├── DocumentationInsightProvider
 ├── GitInsightProvider
 ├── PluginInsightProvider
 └── CustomInsightProvider
        │
        ▼
Merged Insight Collection
        │
        ▼
Insight Layer
        │
        ▼
Editor
```

Mỗi Provider chỉ có một nhiệm vụ:

- Đọc Semantic Model.
- Sinh Insight.
- Không Render.
- Không sửa XML.
- Không thao tác UI.

---

# Insight Item

Mọi Insight đều phải sử dụng chung một model.

```
InsightItem

Id

Type

Range

Priority

Layer

DisplayContent

Actions

Metadata
```

Rendering Engine chỉ Render InsightItem.

---

# Layer Priority

Nếu nhiều Insight xuất hiện cùng vị trí.

Editor Render theo Priority.

Ví dụ

1. Error
2. Warning
3. Entity
4. AI Suggestion
5. Workflow
6. Documentation
7. Git

Priority có thể cấu hình.

---

# Plugin Extension

Plugin không sửa Editor.

Plugin chỉ cần đăng ký thêm Insight Provider.

Ví dụ

```
Execution Plan Plugin

↓

ExecutionPlanProvider

↓

Insight Pipeline

↓

Editor
```

Không cần sửa XML.

Không cần sửa Rendering Engine.

---

# Performance

Insight Layer không được sửa TextBuffer.

Insight chỉ Render Overlay.

Bật/Tắt Insight phải gần như tức thời.

Không Parse lại XML.

Không Reload Document.

Không Clone XML.

---

# Responsibilities

## ERP Language Service

- Parse XML
- Serialize XML
- Build Semantic Model
- Resolve Entity
- Validation
- Symbol Table
- Search
- Rename
- Reference Management

---

## Insight Provider

- Đọc Semantic Model
- Sinh Insight
- Không Render
- Không sửa dữ liệu

---

## Rendering Engine

- Render
- Layer Composition
- Selection
- Caret
- Scroll
- Zoom
- Inline Editing

---

## Editor

- UI
- Interaction
- Shortcut
- Context Menu

Không Business Logic.

---

# Design Principles

1. XML là Storage Format.

2. ERP Semantic Model là Single Source of Truth.

3. ERP Language Service là Semantic Engine.

4. Entity là Symbol, không phải String.

5. Workflow và AI chỉ thao tác trên Semantic Model.

6. Editor chỉ Render.

7. Insight Layer chỉ trình bày thông tin.

8. Insight Provider chỉ sinh Insight.

9. Plugin mở rộng bằng Insight Provider.

10. Không module nào được phép đọc XML trực tiếp ngoài ERP Language Service.

11. Mọi View chỉ khác nhau ở cách Render, không khác dữ liệu.

12. Mọi tính năng mới phải ưu tiên mở rộng bằng Provider thay vì sửa Editor.

---

# Architecture Decision (ADR-0001)

FBO Studio áp dụng mô hình ERP Language Service làm nền tảng.

ERP Semantic Model là Single Source of Truth.

XML chỉ là định dạng lưu trữ.

Editor chỉ Render.

Mọi Business Logic phải nằm ngoài Editor.

Mọi chức năng mới (AI, Workflow, Validation, Plugin...) đều phải mở rộng thông qua ERP Language Service và Insight Provider Pipeline thay vì thao tác trực tiếp trên XML.

# Navigation Service

## Mục tiêu

Navigation Service chịu trách nhiệm điều hướng toàn bộ ERP Language.

Editor không được tự tìm Line, Offset hoặc Search Text.

Mọi thao tác điều hướng đều phải thông qua Navigation Service.

Navigation Service hoạt động trên ERP Semantic Model.

---

# Design Philosophy

Không sử dụng

- Line Number
- Offset
- XPath
- Regex
- Text Search

để điều hướng.

Mọi điều hướng phải dựa trên Symbol và Node.

---

# Semantic Navigation

ERP Language Service xây dựng Navigation Map trong quá trình Parse.

```
XML
    │
    ▼
Parser
    │
    ▼
AST
    │
    ▼
Semantic Model
    │
    ▼
Navigation Map
```

Navigation Map là nguồn dữ liệu duy nhất cho mọi chức năng điều hướng.

---

# Document Model

Mỗi Node trong ERP Semantic Model đều có Identity riêng.

Ví dụ

```
FieldNode

Id

ParentId

NodeType

StartOffset

EndOffset

StartLine

EndLine

Children
```

NodeId không thay đổi trong suốt vòng đời của Document.

Parser có trách nhiệm cập nhật Position khi Document thay đổi.

---

# Navigation Target

Navigation sử dụng NavigationTarget.

```
NavigationTarget

NodeId

DocumentUri

TextRange

NodeType

Symbol
```

Editor chỉ cần NavigationTarget để điều hướng.

---

# Navigation Workflow

```
Outline Click

↓

NodeId

↓

Navigation Service

↓

NavigationTarget

↓

Editor.ScrollTo()

↓

Editor.Select()
```

Editor không tự Search XML.

---

# Outline

Outline không đọc XML.

Outline chỉ đọc ERP Semantic Model.

```
Semantic Model

↓

FieldNode

↓

Outline Item
```

Ví dụ

```
Khách hàng

↓

NodeId

↓

Navigation
```

---

# Go To Definition

```
Entity

↓

Symbol

↓

Definition

↓

NavigationTarget

↓

Editor
```

---

# Find References

```
Symbol

↓

Reference Table

↓

NavigationTarget[]

↓

Result Window
```

---

# Peek Definition

```
Symbol

↓

NavigationTarget

↓

Inline Viewer
```

Không tạo Document mới.

---

# Breadcrumb

Breadcrumb cũng sử dụng Navigation Service.

Ví dụ

```
Customer.xml

>

Form

>

Category

>

Field

>

Header
```

Click vào từng cấp sẽ điều hướng đúng Node.

---

# Designer Navigation

Designer và XML Editor dùng chung Navigation.

```
Designer Control

↓

NodeId

↓

NavigationTarget

↓

XML Editor
```

Ngược lại

```
XML

↓

NodeId

↓

Designer Control
```

Navigation hai chiều.

---

# Validation Navigation

Validation chỉ trả về NodeId.

Ví dụ

```
Validation Error

↓

NodeId

↓

NavigationTarget

↓

Editor
```

Không lưu Line Number.

---

# AI Navigation

AI chỉ trả về Symbol hoặc NodeId.

Ví dụ

```
Rename Customer

↓

Symbol

↓

Navigation Service

↓

Editor
```

AI không thao tác XML.

---

# Workflow Navigation

Workflow cũng điều hướng bằng NodeId.

Ví dụ

```
Workflow

↓

NodeId

↓

Editor
```

---

# Incremental Update

Khi Document thay đổi.

```
Editor

↓

Incremental Parse

↓

Update AST

↓

Update Semantic Model

↓

Update Navigation Map
```

Outline không cần Build lại.

Navigation không bị mất.

---

# Responsibilities

Navigation Service

- Build Navigation Map
- Find Node
- Find Symbol
- Go To Definition
- Find References
- Peek Definition
- Breadcrumb
- Outline Navigation
- Designer Navigation

Editor

- Scroll
- Select
- Highlight

Editor không được Search XML.

---

# Design Principles

Navigation phải dựa trên Semantic Model.

Không dựa trên Text.

Không dựa trên Line.

Không dựa trên Offset.

ERP Language Service là thành phần duy nhất xây dựng Navigation Map.