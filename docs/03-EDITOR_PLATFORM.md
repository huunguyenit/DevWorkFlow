# Editor Platform

Version: 1.0

---

# Purpose

Editor Platform là lớp trừu tượng giữa ERP Language Service và Editor Engine.

Editor Platform chịu trách nhiệm quản lý toàn bộ vòng đời của tài liệu, thao tác người dùng và khả năng hiển thị của Editor.

Editor Platform không phụ thuộc bất kỳ Editor Engine cụ thể nào.

Monaco Editor chỉ là implementation đầu tiên.

---

# Vision

DevWorkFlow không phát triển dựa trên Monaco.

DevWorkFlow phát triển dựa trên Editor Platform.

Editor Platform định nghĩa toàn bộ khả năng của Editor.

Monaco chỉ thực hiện việc Render.

Nếu trong tương lai thay Monaco bằng một Editor khác, ERP Language Service và các module còn lại không cần thay đổi.

---

# Responsibilities

Editor Platform chịu trách nhiệm:

- Document Management
- Caret
- Selection
- Scrolling
- Folding
- Decorations
- Completion
- Diagnostics Rendering
- Theme
- Clipboard
- Commands
- Multi Cursor
- Message Bridge

Editor Platform không chịu trách nhiệm:

- Parse XML
- Resolve Entity
- Semantic Analysis
- Validation
- Business Logic
- Workflow
- Tree
- AI

---

# Overall Architecture

```text
                      ERP Language Service
════════════════════════════════════════════════════

          Completion
          Diagnostics
          Navigation
          Insight
          Formatting

════════════════════════════════════════════════════

                 Editor Platform API

────────────────────────────────────────────────────

Document Service

Selection Service

Caret Service

Decoration Service

Completion Service

Diagnostics Service

Folding Service

Theme Service

Command Service

Clipboard Service

Viewport Service

Message Bridge

════════════════════════════════════════════════════

                Monaco Adapter

════════════════════════════════════════════════════

              WebView2 Host

════════════════════════════════════════════════════

             Monaco Editor Engine
```

---

# Design Principles

## Editor Independence

Editor Platform không biết Monaco.

ERP Language Service cũng không biết Monaco.

Monaco chỉ là Adapter.

---

## Render Only

Editor chỉ Render.

Editor không chứa Business Logic.

---

## Stateless Adapter

Monaco Adapter không lưu Business Data.

Mọi dữ liệu đều đến từ ERP Language Service.

---

## Event Driven

Editor Platform phát Event.

Không cho phép module khác thao tác trực tiếp Editor.

---

# Core Components

## Document Service

Quản lý

- Open
- Close
- Save
- Reload
- Dirty State
- Version
- Encoding

---

## Selection Service

Quản lý

- Selection
- Multi Selection
- Selection Changed

---

## Caret Service

Quản lý

- Caret Position
- Multi Caret
- Caret Events

---

## Viewport Service

Quản lý

- Scroll
- Visible Range
- Reveal Position
- Center Position

---

## Decoration Service

Hiển thị

- Insight
- Entity
- Validation
- Highlight
- Search Result
- Breakpoint
- Bookmark

Decoration không thay đổi nội dung Document.

---

## Completion Service

Hiển thị

- Completion
- Signature Help
- Parameter Hint
- Suggest Widget

Dữ liệu đến từ ERP Language Service.

---

## Diagnostics Service

Render

- Error
- Warning
- Info
- Hint

Không thực hiện Validation.

---

## Folding Service

Quản lý

- Folding Regions
- Collapse
- Expand

---

## Theme Service

Quản lý

- Theme
- Font
- Colors
- Icons
- Accessibility

---

## Clipboard Service

Quản lý

- Copy
- Cut
- Paste
- Drag Drop

---

## Command Service

Đăng ký

- Editor Commands
- Shortcut
- Context Menu

---

## Message Bridge

Bridge giữa

WPF

↓

WebView2

↓

JavaScript

↓

Monaco

Communication sử dụng JSON Message.

Không gọi JavaScript trực tiếp.

---

# Data Flow

```text
User Typing

↓

Monaco

↓

Message Bridge

↓

Editor Platform

↓

ERP Language Service

↓

Semantic Update

↓

Diagnostics

↓

Insight

↓

Editor Platform

↓

Monaco
```

---

# Insight Rendering

Editor Platform hỗ trợ nhiều lớp hiển thị.

```text
┌─────────────────────────────┐

 Source Layer

─────────────────────────────

 Insight Layer

─────────────────────────────

 Decoration Layer

─────────────────────────────

 Selection Layer

─────────────────────────────

 Cursor Layer

─────────────────────────────

 AI Layer

└─────────────────────────────┘
```

Mỗi Layer hoạt động độc lập.

---

# Entity Rendering

Source

```xml
clientDefault="&ClientDefault;"
```

Insight

```text
clientDefault=
&ClientDefault;  Default
```

Trong đó

Entity Reference

- màu xám
- in nghiêng
- readonly

Resolved Value

- màu bình thường
- editable
- đồng bộ lại Entity khi lưu

---

## Rendering Pipeline

DevWorkFlow Editor sử dụng mô hình Rendering Pipeline nhiều lớp.

```text
Raw XML Source
        │
        ▼
Syntax Highlighting
        │
        ▼
Semantic Rendering (Insight Layer)
        │
        ▼
Diagnostics
        │
        ▼
Selection / Caret
```

### Principles

- Mỗi Layer độc lập.
- Không Layer nào sửa dữ liệu của Layer khác.
- XML luôn là Source.
- Semantic chỉ Render.
- Diagnostics chỉ Overlay.
- Selection chỉ Render UI.

Editor không render bằng HTML Controls.

Editor không tạo Popup.

Editor không tạo Tooltip.

Editor không thay đổi cấu trúc Monaco.

Insight Layer hoạt động tương tự Syntax Highlighting,
nhưng thay vì tô màu Token,
nó hiển thị ngữ nghĩa của ERP Language.

# Nested Entity

Ví dụ

```text
&Company;

    &Address;

        &Country;

            Vietnam
```

Editor phải thể hiện đầy đủ phân cấp.

Không làm mất thông tin Entity gốc.

---

# Navigation

Editor Platform hỗ trợ

Go To Definition

Peek Definition

Find References

Reveal Range

Reveal Symbol

Navigation sử dụng SymbolId.

Không sử dụng Line Number.

---

# Synchronization

Editor

↓

ERP Language

↓

Designer

↓

Outline

↓

Explorer

↓

Workflow

Mọi thành phần đồng bộ hai chiều.

---

# Communication

Editor Platform chỉ giao tiếp qua Interface.

```text
IEditorPlatform

↓

IDocumentService

↓

ICompletionService

↓

IDiagnosticsService

↓

IDecorationService

↓

ICommandService
```

Không phụ thuộc Monaco API.

---

# Future Features

Editor Platform được thiết kế để hỗ trợ:

- Minimap
- Sticky Scroll
- Breadcrumb
- Diff Editor
- Split View
- Code Lens
- Inlay Hint
- Ghost Text
- Inline AI
- Semantic Highlight
- Live Collaboration
- Embedded Designer

Không cần thay đổi ERP Language Service.

---

# Performance

Editor Platform phải hỗ trợ:

- Incremental Update
- Virtual Rendering
- Lazy Decoration
- Background Processing
- Cancellation Token
- Object Pool
- Decoration Cache

Không được Render lại toàn bộ Document.

---

# Threading

UI Thread

↓

Message Bridge

↓

Background Worker

↓

ERP Language Service

↓

UI Update

---

# Extension Points

Plugin có thể đăng ký:

- Decoration Provider
- Completion Provider
- Theme Provider
- Command Provider
- AI Provider
- Inline Widget Provider

---

# Adapter Pattern

```text
ERP Language Service

↓

Editor Platform API

↓

Monaco Adapter

↓

Monaco API
```

Monaco có thể được thay thế.

---

# Design Rules

Editor Platform không biết:

- XML
- SQL
- Workflow
- Tree
- Business Rule

Editor Platform chỉ biết:

- Document
- Selection
- Render
- Message
- Commands

---

# Long-term Vision

Editor Platform sẽ trở thành nền tảng hiển thị chung của DevWorkFlow.

Không chỉ phục vụ XML Editor.

Mà còn phục vụ:

- SQL Editor
- JavaScript Editor
- Workflow Editor
- Diff Viewer
- AI Conversation Editor
- Markdown Editor

Thông qua cùng một API thống nhất.