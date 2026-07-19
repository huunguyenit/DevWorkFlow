# ERP Language Service

Version: 1.0

---

# Purpose

ERP Language Service là nền tảng xử lý ngôn ngữ của DevWorkFlow.

Nó đóng vai trò tương tự Roslyn trong Visual Studio hoặc Language Server trong VS Code.

ERP Language Service là trái tim của toàn bộ IDE.

Mọi thành phần của DevWorkFlow đều phải sử dụng ERP Language Service thay vì thao tác trực tiếp với XML.

---

# Vision

FBO ERP không được xem là tập hợp các file XML.

FBO ERP được xem là một ngôn ngữ lập trình (ERP Language).

ERP Language Service là Runtime của ngôn ngữ đó.

---

# Responsibilities

ERP Language Service chịu trách nhiệm:

- Parse
- Build Semantic Model
- Resolve Entity
- Resolve Symbol
- Diagnostics
- Navigation
- Completion
- Formatting
- Refactoring
- Search
- Validation
- Workspace Synchronization

ERP Language Service không chịu trách nhiệm:

- Render UI
- Editor
- Tree
- Workflow UI
- Database UI

---

# Overall Architecture

```text
                    ERP Language Service
══════════════════════════════════════════════════════════

                 Document Manager

══════════════════════════════════════════════════════════

Parser

↓

Syntax Tree

↓

Semantic Builder

↓

Semantic Model

══════════════════════════════════════════════════════════

Services

├── Symbol Service
├── Entity Service
├── Navigation Service
├── Completion Service
├── Diagnostics Service
├── Formatting Service
├── Refactoring Service
├── Search Service
├── Insight Service
└── Serializer

══════════════════════════════════════════════════════════

Consumers

├── Editor Platform
├── Tree Framework
├── Workflow Engine
├── Designer
├── AI Platform
├── Database Explorer
└── Plugin System

══════════════════════════════════════════════════════════
```

---

# Core Principles

## XML is Storage

XML chỉ dùng để lưu trữ.

Không phải mô hình làm việc.

---

## Semantic Model First

Toàn bộ IDE thao tác trên Semantic Model.

Không module nào thao tác XML trực tiếp.

---

## Single Source of Truth

ERP Language Service là nơi duy nhất tạo và quản lý Semantic Model.

Không được phép tạo Semantic Model ở nơi khác.

---

## Immutable Model

Semantic Model chỉ đọc.

Mọi thay đổi phải thực hiện thông qua Command hoặc Transaction.

---

## Event Driven

Khi Document thay đổi.

ERP Language Service phát sự kiện.

Các module khác tự cập nhật.

Không polling.

---

# Document Lifecycle

```text
Open XML

↓

Parse

↓

Syntax Tree

↓

Semantic Builder

↓

Semantic Model

↓

Diagnostics

↓

Insight

↓

Ready
```

---

# Semantic Model

Semantic Model là mô hình trung tâm.

```text
Document

├── Forms
├── Categories
├── Fields
├── Commands
├── Scripts
├── Views
├── Workflows
├── Entities
└── Metadata
```

Editor.

Workflow.

Tree.

AI.

Designer.

đều dùng chung Model này.

---

# Document Manager

Document Manager chịu trách nhiệm

- Open
- Close
- Save
- Reload
- Dirty State
- Version
- Undo Transaction
- Redo Transaction

Không thao tác UI.

---

# Parser

Parser chuyển XML thành Syntax Tree.

Parser không Resolve Entity.

Parser không Validate Business Rule.

Parser chỉ Parse.

---

# Semantic Builder

Semantic Builder đọc Syntax Tree.

Sinh Semantic Model.

Resolve

- Entity
- Symbol
- Reference
- Metadata

---

# Serializer

Serializer chuyển Semantic Model thành XML.

Không module nào tự sinh XML.

---

# Symbol Service

Quản lý

- Symbol
- Definition
- Reference
- Rename
- Find All References

Navigation dựa trên Symbol.

Không dựa trên dòng.

---

# Entity Service

Resolve

```xml
&ClientDefault;
```

↓

```text
Default
```

Quản lý

- Entity Tree
- Nested Entity
- Entity Dependency
- Circular Detection

---

# Navigation Service

Điều hướng theo

NodeId

SymbolId

NavigationTarget

Không theo Line Number.

---

# Completion Service

Sinh Completion dựa trên

- Context
- Semantic Model
- Entity
- Metadata

---

# Diagnostics Service

Sinh

- Error
- Warning
- Info
- Hint

Không Render.

---

# Insight Service

Sinh dữ liệu cho Insight Layer.

Ví dụ

Entity Value

Validation

Documentation

Reference Count

AI Suggestion

Workflow

Insight Service không Render.

---

# Formatting Service

Định dạng ERP XML.

Không dùng XML Formatter mặc định.

---

# Refactoring Service

Bao gồm

- Rename
- Safe Replace
- Move
- Extract Entity
- Update Reference

---

# Search Service

Search hoạt động trên Semantic Model.

Không Search XML Text.

---

# Consumers

ERP Language Service được sử dụng bởi

Editor Platform

↓

Completion

↓

Diagnostics

↓

Insight

---

Tree Framework

↓

Outline

↓

Explorer

↓

Navigation

---

Workflow Engine

↓

Workflow Designer

↓

Workflow Runner

---

Designer

↓

Property

↓

Selection

↓

Layout

---

AI Platform

↓

Review

↓

Refactoring

↓

Code Generation

---

Plugin

↓

Completion Provider

↓

Insight Provider

↓

Diagnostics Provider

---

# Data Flow

```text
XML

↓

Parser

↓

Syntax Tree

↓

Semantic Builder

↓

Semantic Model

↓

Language Services

↓

Consumers
```

---

# Update Flow

```text
User Edit

↓

Editor Platform

↓

Document Manager

↓

Incremental Parse

↓

Semantic Update

↓

Diagnostics

↓

Insight

↓

Tree Update

↓

Designer Update

↓

AI Update
```

---

# Communication

ERP Language Service không gọi UI.

ERP Language Service phát Event.

Ví dụ

DocumentChanged

SemanticChanged

DiagnosticsChanged

NavigationChanged

InsightChanged

SelectionChanged

---

# Performance Goals

Incremental Parsing.

Incremental Semantic Update.

Background Analysis.

Cancellation Token.

Cache.

Object Pool.

Không Parse lại toàn bộ Document.

---

# Threading

UI Thread

↓

Command

↓

Background Worker

↓

Semantic Update

↓

UI Notification

---

# Extension Points

Cho phép Plugin đăng ký

Completion Provider

Diagnostics Provider

Insight Provider

Navigation Provider

Formatting Provider

Search Provider

Refactoring Provider

---

# Design Rules

ERP Language Service không biết:

- Monaco
- WPF
- Tree
- Workflow UI
- Database UI

ERP Language Service chỉ biết

Semantic Model.

---

# Long-term Goals

ERP Language Service sẽ trở thành nền tảng xử lý ngôn ngữ cho toàn bộ hệ sinh thái FBO ERP.

Bao gồm:

- XML
- SQL
- Workflow
- JavaScript
- Entity
- AI
- Designer

Thông qua một Semantic Model thống nhất.