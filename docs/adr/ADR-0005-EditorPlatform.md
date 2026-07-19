# ADR-0005: Editor Platform as the Unified Editor Abstraction

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

Editor là thành phần trung tâm của DevWorkFlow.

Rất nhiều module cần thao tác với Editor:

- ERP Language Service
- Tree Framework
- Workflow Engine
- AI Platform
- Plugin System
- Search
- Navigation
- Diagnostics
- Insight Layer

Nếu các module gọi trực tiếp Monaco API hoặc WPF Control, hệ thống sẽ:

- Phụ thuộc vào Monaco.
- Không thể thay Editor.
- Plugin khó phát triển.
- Unit Test khó thực hiện.
- Vi phạm nguyên tắc Dependency Inversion.

Cần có một lớp trừu tượng thống nhất.

---

# Decision

DevWorkFlow xây dựng **Editor Platform**.

Editor Platform là API duy nhất cho mọi thao tác liên quan đến Editor.

Monaco chỉ là một implementation.

Mọi module đều làm việc thông qua Editor Platform.

Không module nào được gọi Monaco API hoặc WebView2 trực tiếp.

---

# Architecture

```text
                  ERP Language Service

                          │

                          ▼

                 Navigation Service

                          │

                          ▼

                 Diagnostics Service

                          │

                          ▼

                    AI Platform

                          │

                          ▼

                   Plugin System

                          │

                          ▼

                 Editor Platform API

──────────────────────────────────────────────

Document Manager

Caret Manager

Selection Manager

Decoration Manager

Navigation Manager

Command Manager

Theme Manager

Message Bridge

──────────────────────────────────────────────

                  Monaco Adapter

                          │

                    WebView2 Host

                          │

                     Monaco Editor
```

---

# Responsibilities

Editor Platform chịu trách nhiệm:

- Quản lý Document
- Navigation
- Caret
- Selection
- Decoration
- Diagnostics
- Undo / Redo
- Command Dispatch
- Theme
- Message Routing

Editor Platform không:

- Parse XML
- Resolve Entity
- Thực hiện Business Logic

---

# Rationale

## Decoupling

ERP Language Service không biết Monaco.

Workflow không biết Monaco.

Plugin không biết Monaco.

Editor có thể thay thế mà không ảnh hưởng Core.

---

## Testability

Có thể Mock:

```text
IEditorPlatform
```

để kiểm thử:

- Navigation
- Completion
- Diagnostics
- Insight

không cần khởi động WebView2.

---

## Replaceability

Nếu tương lai thay Monaco bằng:

- CodeMirror
- AvalonEdit
- Editor Engine khác

chỉ cần thay Adapter.

Không thay đổi API.

---

## Extensibility

Plugin chỉ cần làm việc với:

```text
IEditorPlatform
```

Không phụ thuộc Editor cụ thể.

---

# Editor Services

Editor Platform được chia thành các Service độc lập.

```text
Editor Platform

├── Document Service
├── Caret Service
├── Selection Service
├── Navigation Service
├── Decoration Service
├── Folding Service
├── Diagnostics Service
├── Command Service
├── Theme Service
├── Clipboard Service
├── Undo Service
├── Search Service
└── Message Bridge
```

Mỗi Service có Interface riêng.

---

# Message Bridge

Editor Platform không gọi JavaScript trực tiếp.

Mọi giao tiếp sử dụng Message.

```text
Editor Platform

↓

Message

↓

Message Bridge

↓

Monaco Host

↓

Monaco
```

Message có cấu trúc:

```text
Command

RequestId

Payload

Response
```

Điều này giúp:

- Async.
- Logging.
- Replay.
- Debug.
- Retry.

---

# Document Model

Editor Platform quản lý Document.

```text
Workspace

↓

Project

↓

Document

↓

View

↓

Editor Instance
```

Một Document có thể mở nhiều View.

---

# Navigation

Navigation hoạt động theo:

SymbolId

↓

Navigation Service

↓

Editor Platform

↓

Reveal

↓

Monaco

Không theo số dòng.

---

# Decorations

Insight Layer.

Diagnostics.

Selection.

Search.

Reference.

AI.

đều sử dụng Decoration Service.

Không module nào Render trực tiếp.

---

# Undo / Redo

Undo hoạt động theo Command.

Không theo thao tác Monaco.

Workflow.

AI.

Plugin.

Editor.

đều dùng chung cơ chế Undo.

---

# Threading

UI Thread

↓

Editor Platform

↓

Message Queue

↓

WebView2

↓

Monaco

Không block UI.

---

# Consequences

## Positive

- Tách biệt Core và UI.
- Thay Editor dễ dàng.
- Dễ Unit Test.
- Plugin đơn giản.
- Kiến trúc ổn định.

---

## Negative

Thêm một lớp abstraction.

Cần duy trì API ổn định.

---

# Alternatives Considered

## Alternative 1

Module gọi Monaco trực tiếp.

Rejected.

---

## Alternative 2

Module thao tác WPF Control.

Rejected.

---

## Alternative 3

Editor Platform.

Accepted.

---

# Architectural Rules

- Chỉ Editor Platform được phép giao tiếp với Monaco.
- Chỉ Monaco Adapter được gọi Monaco API.
- Không Plugin nào tham chiếu Monaco.
- Không ERP Language Service tham chiếu WebView2.
- Không Workflow Engine tham chiếu Editor Control.

---

# Impact

ADR này ảnh hưởng đến:

- ERP Language Service
- Monaco Adapter
- Workflow Engine
- Plugin System
- Insight Layer
- Navigation
- Search
- Diagnostics
- AI Platform

---

# Related Documents

- 01-ARCHITECTURE.md
- 02-ERP_LANGUAGE_SERVICE.md
- 03-EDITOR_PLATFORM.md
- 04-TREE_FRAMEWORK.md
- 05-WORKFLOW_ENGINE.md
- 06-PLUGIN_SYSTEM.md
- ADR-0002-MonacoEditor.md

---

# Future Review

ADR này chỉ được xem xét lại nếu:

- DevWorkFlow thay đổi hoàn toàn kiến trúc Editor.
- Editor Platform không còn là lớp abstraction chính.
- Có mô hình Editor mới phù hợp hơn.

Nếu không, Editor Platform sẽ tiếp tục là API duy nhất cho mọi tương tác với Editor.