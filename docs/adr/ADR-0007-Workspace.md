# ADR-0007: Workspace as the Runtime Context of DevWorkFlow

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

DevWorkFlow không chỉ mở XML.

IDE cần quản lý:

- nhiều Project
- nhiều Document
- nhiều Editor
- nhiều Tree
- nhiều Workflow
- AI Context
- Plugin Context
- Workspace Layout

Nếu mỗi module tự quản lý dữ liệu của mình sẽ dẫn đến:

- Không đồng bộ.
- Khó Restore Session.
- AI không biết Workspace.
- Navigation khó.
- Plugin khó tích hợp.

Cần có Runtime Context thống nhất.

---

# Decision

DevWorkFlow lựa chọn xây dựng Workspace làm Runtime Context.

Workspace không phải Folder.

Workspace không phải Project.

Workspace là môi trường làm việc của toàn bộ IDE.

Mọi module đều hoạt động bên trong Workspace.

---

# Architecture

```text
                 DevWorkFlow

                      │

                      ▼

                Workspace Manager

                      │

────────────────────────────────────────────────────

Projects

Documents

Editors

Semantic Models

Tree Sessions

Editor Sessions

Workflow Sessions

AI Context

Plugin Context

Layout

Settings

History

────────────────────────────────────────────────────

                      │

                      ▼

                 Workspace State
```

Workspace là trung tâm điều phối.

---

# Rationale

## Runtime Context

Workspace chứa toàn bộ trạng thái đang làm việc.

Không chỉ là dữ liệu trên đĩa.

---

## Session Recovery

IDE có thể:

- Restore Document.
- Restore Caret.
- Restore Tree.
- Restore Layout.
- Restore Workflow.

sau khi mở lại.

---

## Multi Project

Một Workspace có thể mở:

```text
Workspace

├── ERP A

├── ERP B

├── Common Library

└── SQL Scripts
```

---

## AI Context

AI không đọc Folder.

AI đọc Workspace.

AI hiểu:

- Document đang mở.
- Symbol đang chọn.
- Project.
- Selection.
- Workflow.

---

## Shared Context

Tree.

Editor.

Workflow.

Plugin.

AI.

đều dùng cùng Workspace.

---

# Workspace Model

```text
Workspace

├── WorkspaceId
├── Name
├── Projects
├── Documents
├── Sessions
├── Layout
├── Settings
├── Metadata
└── State
```

---

# Project

Project đại diện cho một ERP Program.

```text
Project

├── ProjectId
├── Name
├── RootPath
├── Documents
├── References
└── Metadata
```

---

# Document

Document chỉ đại diện cho nội dung.

```text
Document

├── DocumentId
├── Path
├── Version
├── Text
├── Syntax Tree
└── Semantic Model
```

Document không chứa trạng thái UI.

---

# Editor Session

Editor Session quản lý:

- Caret
- Selection
- Fold
- Scroll
- Decorations
- Insight State

Một Document có thể có nhiều Session.

---

# Tree Session

Tree Session quản lý:

- Expanded Nodes
- Selected Node
- Filters
- Search
- Sort
- Scroll Position

Tree không lưu trạng thái.

Session lưu trạng thái.

---

# Workflow Session

Workflow Session quản lý:

- Variables
- Breakpoints
- Execution State
- Runtime Context

---

# AI Context

Workspace cung cấp AI:

- Active Project
- Active Document
- Selection
- Semantic Graph
- References
- Open Documents

AI không tự thu thập.

---

# Workspace Manager

Workspace Manager chịu trách nhiệm:

- Open Workspace
- Close Workspace
- Save Workspace
- Restore Workspace
- Switch Workspace

---

# Layout

Workspace lưu:

```text
Dock Layout

↓

Open Editors

↓

Panel State

↓

Window State

↓

Theme
```

Người dùng mở lại IDE sẽ quay về đúng trạng thái trước đó.

---

# Event Synchronization

Workspace phát Event:

WorkspaceOpened

WorkspaceClosed

ProjectAdded

ProjectRemoved

DocumentOpened

DocumentClosed

DocumentChanged

LayoutChanged

SessionChanged

---

# Dependency

Mọi module phụ thuộc Workspace.

Không module nào tự lưu Session.

---

# Consequences

## Positive

- Một Runtime Context duy nhất.
- Dễ Restore.
- AI hiểu Workspace.
- Plugin dễ tích hợp.
- Multi Project.
- Session độc lập.

---

## Negative

Workspace Manager trở thành thành phần quan trọng.

Cần quản lý vòng đời và bộ nhớ cẩn thận.

---

# Alternatives Considered

## Alternative 1

Mỗi module tự quản lý trạng thái.

Rejected.

Không đồng bộ.

---

## Alternative 2

Workspace chỉ là Folder.

Rejected.

Không biểu diễn được Runtime State.

---

## Alternative 3

Workspace Runtime Context.

Accepted.

---

# Architectural Rules

- Workspace không Parse XML.
- Workspace không Render UI.
- Workspace không chứa Business Logic.
- Workspace chỉ quản lý Runtime State.
- Mọi Session phải thuộc Workspace.
- Workspace là nơi duy nhất lưu trạng thái IDE.

---

# Impact

ADR này ảnh hưởng đến:

- Editor Platform
- Tree Framework
- Workflow Engine
- Plugin System
- AI Platform
- Navigation
- Workspace Layout
- Settings

---

# Related Documents

- 01-ARCHITECTURE.md
- 03-EDITOR_PLATFORM.md
- 04-TREE_FRAMEWORK.md
- 05-WORKFLOW_ENGINE.md
- ADR-0005-EditorPlatform.md
- ADR-0006-SemanticModel.md

---

# Future Review

ADR này chỉ được xem xét lại nếu:

- DevWorkFlow thay đổi mô hình Runtime.
- Workspace không còn là Runtime Context.

Nếu không, Workspace tiếp tục là nền tảng quản lý trạng thái của toàn bộ IDE.