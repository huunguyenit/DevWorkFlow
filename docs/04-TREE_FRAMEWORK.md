# Tree Framework

Version: 1.0

---

# Purpose

Tree Framework là nền tảng hiển thị dữ liệu dạng cây của DevWorkFlow.

Tree Framework không dành riêng cho Explorer.

Tree Framework là một hạ tầng dùng chung cho toàn bộ IDE.

Mọi màn hình hiển thị dữ liệu phân cấp đều phải sử dụng Tree Framework.

---

# Vision

Tree Framework không biết:

- XML
- SQL
- Workflow
- File System
- Database
- ERP

Tree Framework chỉ biết:

- TreeNode
- TreeDataSource
- TreeViewState
- TreeRenderer

Dữ liệu luôn đến từ DataSource.

---

# Design Philosophy

Tree Framework được xây dựng theo hướng:

- Virtualization First
- Lazy Loading First
- DataSource First
- Rendering First
- Event Driven

Tree Framework không chứa Business Logic.

---

# Overall Architecture

```text
                     Tree Framework

════════════════════════════════════════════════════

                 Tree Control

════════════════════════════════════════════════════

Tree View Model

↓

Tree State Manager

↓

Selection Manager

↓

Expansion Manager

↓

Rendering Engine

↓

Virtualization Engine

↓

Lazy Loading Engine

↓

Cache Manager

════════════════════════════════════════════════════

Tree DataSource

↓

FileSystem

↓

ERP Semantic

↓

Database

↓

Workflow

↓

Plugin

════════════════════════════════════════════════════
```

---

# Core Principles

## DataSource First

Tree không biết dữ liệu.

Tree chỉ đọc từ TreeDataSource.

---

## Virtualization First

Không tạo toàn bộ TreeNode.

Chỉ Render Node đang hiển thị.

---

## Lazy Loading First

Node chỉ được tải khi cần.

---

## Immutable Node

TreeNode là Readonly.

Mọi thay đổi thông qua Command.

---

## Independent Framework

Tree Framework có thể dùng cho bất kỳ dữ liệu nào.

---

# TreeNode

TreeNode là đơn vị hiển thị.

```text
TreeNode

├── Id
├── ParentId
├── DisplayName
├── Icon
├── Type
├── State
├── HasChildren
├── IsExpanded
├── IsSelected
├── Metadata
└── Tag
```

TreeNode không chứa Business Logic.

---

# TreeDataSource

TreeDataSource là nguồn dữ liệu.

```text
ITreeDataSource

↓

GetRoot()

↓

GetChildren()

↓

Refresh()

↓

Search()

↓

Observe()
```

Tree chỉ gọi Interface.

---

# DataSource Implementations

Tree Framework hỗ trợ nhiều DataSource.

```text
FileSystemDataSource

XmlSemanticDataSource

DatabaseDataSource

WorkflowDataSource

EntityDataSource

CommandDataSource

PluginDataSource

GitDataSource

AIDataSource
```

---

# Rendering Engine

Rendering Engine chỉ Render.

Không Load Data.

```text
TreeNode

↓

Visual Node

↓

WPF Control
```

---

# Virtualization Engine

Không tạo toàn bộ Tree.

Ví dụ

100.000 Node

↓

Viewport

↓

120 Node

↓

Render

Tree vẫn hoạt động mượt.

---

# Lazy Loading Engine

Node được tải theo yêu cầu.

```text
Expand

↓

Placeholder

↓

Background Load

↓

Replace Placeholder

↓

Refresh UI
```

Nếu người dùng Collapse trước khi tải xong:

↓

Cancel Task

---

# Cache Manager

Cache

- Children
- Icon
- Metadata
- Search Result

Sử dụng

LRU Cache

để giảm bộ nhớ.

---

# Selection Manager

Quản lý

- Single Selection
- Multi Selection
- Keyboard Selection
- Mouse Selection

---

# Expansion Manager

Quản lý

- Expand
- Collapse
- Expand All
- Collapse All

Lưu trạng thái giữa các phiên làm việc.

---

# Search Engine

Search hoạt động trên DataSource.

Không duyệt toàn bộ UI.

Hỗ trợ

- Fuzzy Search
- Incremental Search
- Highlight
- Filter

---

# Refresh Model

Tree không Refresh toàn bộ.

```text
Node Changed

↓

Diff

↓

Patch

↓

Update UI
```

Không tạo lại Tree.

---

# Synchronization

Tree đồng bộ với:

Editor

↓

Navigation

↓

Selection

↓

Workflow

↓

Designer

↓

AI

---

# Drag and Drop

Tree Framework hỗ trợ:

- Move
- Copy
- Link
- External Drop
- Internal Drop

Business Rule do DataSource quyết định.

---

# Context Menu

Tree không biết Menu.

Tree yêu cầu

Context Menu Provider.

Plugin có thể bổ sung Menu.

---

# Icon Provider

Tree không biết Icon.

Icon đến từ

Icon Provider.

Ví dụ

Folder

XML

SQL

Workflow

Plugin

AI

---

# Performance

Tree Framework phải hỗ trợ:

- Virtualization
- Incremental Refresh
- Background Loading
- Async DataSource
- Cancellation Token
- Object Pool

---

# Event Model

Tree phát Event:

SelectionChanged

ExpansionChanged

NodeLoaded

NodeRemoved

NodeInserted

NodeUpdated

SearchCompleted

Không gọi trực tiếp Consumer.

---

# Consumers

Tree Framework được sử dụng bởi:

Explorer

Outline

Workflow

Database

Entity Browser

Command Explorer

Plugin Explorer

AI Explorer

---

# Plugin Support

Plugin có thể đăng ký:

TreeDataSource

IconProvider

ContextMenuProvider

SearchProvider

DragDropProvider

NodeRenderer

---

# Threading

UI Thread

↓

Virtual Tree

↓

Background Loading

↓

Cache

↓

UI Update

---

# Tree State

TreeState quản lý:

- Expanded Nodes
- Selected Nodes
- Scroll Position
- Filter
- Search Text

Cho phép khôi phục Workspace.

---

# Navigation

Tree chỉ biết:

NodeId

Khi người dùng chọn Node:

↓

Navigation Request

↓

ERP Language Service

↓

Editor Platform

↓

Reveal Symbol

Tree không biết XML.

---

# Design Rules

Tree Framework không biết:

- XML
- SQL
- ERP
- Workflow

Tree Framework chỉ biết:

TreeNode

TreeDataSource

TreeState

Render

---

# Future Features

Tree Framework được thiết kế để hỗ trợ:

- Infinite Tree
- Breadcrumb
- Favorites
- Recent Nodes
- Pinned Nodes
- Tree Diff
- AI Generated Nodes
- Live Collaboration
- Multi Workspace

Không cần thay đổi kiến trúc.

---

# Long-term Vision

Tree Framework sẽ trở thành nền tảng hiển thị dữ liệu phân cấp thống nhất của DevWorkFlow.

Mọi cây trong IDE đều sử dụng chung Framework.

Không tồn tại nhiều loại Tree khác nhau.

Explorer, Outline, Database, Workflow và AI chỉ khác nhau ở DataSource và Provider.