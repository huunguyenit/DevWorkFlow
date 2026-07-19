# DevWorkFlow Architecture

Version: 1.0

---

# Purpose

Tài liệu này mô tả kiến trúc tổng thể của DevWorkFlow.

Đây là tài liệu kiến trúc cấp cao (High-Level Architecture).

Không mô tả chi tiết implementation.

Không mô tả thuật toán.

Các tài liệu chi tiết được định nghĩa trong các module tương ứng.

---

# Design Philosophy

DevWorkFlow được xây dựng theo kiến trúc phân tầng.

Mỗi tầng chỉ có một trách nhiệm duy nhất.

Các tầng chỉ giao tiếp thông qua Interface.

Không module nào được truy cập trực tiếp vào implementation của module khác.

Toàn bộ hệ thống được thiết kế theo các nguyên tắc:

- SOLID
- Clean Architecture
- MVVM
- Dependency Injection
- Event Driven
- Provider Pattern
- Adapter Pattern

---

# Overall Architecture

```text
                        DevWorkFlow IDE
═══════════════════════════════════════════════════════════════════════

Workspace

├── Explorer
├── Outline
├── Editor
├── Workflow
├── Designer
├── Database
├── AI Assistant
├── Properties
└── Console

═══════════════════════════════════════════════════════════════════════

Application Layer

├── Commands
├── Navigation
├── Search
├── Document Manager
├── Workspace Manager
├── Settings
└── Plugin Manager

═══════════════════════════════════════════════════════════════════════

Core Services

├── ERP Language Service
├── Editor Platform
├── Tree Framework
├── Workflow Engine
├── Plugin System
└── AI Platform

═══════════════════════════════════════════════════════════════════════

Infrastructure

├── XML Storage
├── SQL Server
├── Git
├── File System
├── Configuration
└── Logging

═══════════════════════════════════════════════════════════════════════
```

---

# Layer Responsibilities

## Workspace

Workspace là lớp tương tác với người dùng.

Workspace không chứa Business Logic.

Workspace chỉ hiển thị dữ liệu.

Bao gồm

- Explorer
- Editor
- Designer
- Workflow
- AI
- Outline

---

## Application Layer

Điều phối toàn bộ IDE.

Bao gồm

- Document Lifecycle
- Command Routing
- Workspace Coordination
- Search
- Global Navigation

Application Layer không thao tác XML.

---

## ERP Language Service

Đây là trái tim của DevWorkFlow.

ERP Language Service chịu trách nhiệm

- Parsing
- Semantic Analysis
- Navigation
- Diagnostics
- Completion
- Refactoring
- Formatting
- Symbol Management
- Entity Resolution

ERP Language Service là Single Source of Truth.

---

## Editor Platform

Editor Platform là lớp trừu tượng hóa mọi Editor.

Không phụ thuộc Monaco.

Không phụ thuộc AvalonEdit.

Editor Platform chịu trách nhiệm

- Document
- Caret
- Selection
- Folding
- Decoration
- Completion
- Theme
- Clipboard
- Message Bridge

Editor Platform chỉ là Adapter.

Không chứa Business Logic.

---

## Tree Framework

Tree Framework là hệ thống hiển thị dữ liệu dạng cây.

Tree Framework không biết

- XML
- SQL
- ERP

Tree Framework chỉ làm việc với

- TreeNode
- TreeDataSource

Tree Framework được sử dụng bởi

- Explorer
- Outline
- Workflow
- Database
- Entity
- Command
- AI

---

## Workflow Engine

Workflow Engine quản lý toàn bộ Workflow của ERP.

Workflow chỉ thao tác trên Semantic Model.

Không thao tác XML.

---

## Plugin System

Plugin System cho phép mở rộng IDE.

Plugin không sửa Core.

Plugin chỉ đăng ký Provider.

---

## AI Platform

AI Platform tích hợp AI vào IDE.

AI chỉ làm việc với ERP Language Service.

Không đọc XML trực tiếp.

---

# Data Flow

```text
XML

↓

ERP Parser

↓

Semantic Model

↓

ERP Language Service

↓

Application Services

↓

Workspace

↓

User
```

Ngược lại

```text
User

↓

Workspace

↓

Command

↓

ERP Language Service

↓

Semantic Model

↓

Serializer

↓

XML
```

Semantic Model luôn là trung tâm.

---

# Core Principles

## XML is Storage

XML chỉ dùng để lưu.

Không phải mô hình làm việc.

---

## Semantic Model First

Mọi thao tác đều thực hiện trên Semantic Model.

---

## Single Source of Truth

ERP Language Service là nơi duy nhất quản lý Semantic Model.

Không module nào được tạo Semantic Model riêng.

---

## Editor Independence

Editor có thể thay đổi.

ERP Language Service không thay đổi.

---

## Tree Independence

Tree Framework không phụ thuộc dữ liệu.

Mọi dữ liệu đều đến từ TreeDataSource.

---

## Plugin First

Không sửa Core để mở rộng tính năng.

Mọi mở rộng đều thông qua Plugin và Provider.

---

# Module Dependencies

```text
Workspace
      │
      ▼
Application Layer
      │
      ▼
ERP Language Service
      │
      ├──────────────┐
      ▼              ▼
Editor Platform   Tree Framework
      │              │
      └──────┬───────┘
             ▼
      Infrastructure
```

Không được phụ thuộc ngược.

---

# Architectural Rules

Các quy tắc bắt buộc.

## Rule 1

UI không được Parse XML.

---

## Rule 2

UI không được truy cập Database trực tiếp.

---

## Rule 3

Editor không chứa Business Logic.

---

## Rule 4

Tree Framework không biết ERP.

---

## Rule 5

Workflow không sửa XML trực tiếp.

---

## Rule 6

AI không đọc XML.

---

## Rule 7

Navigation dựa trên Symbol.

Không dựa trên dòng.

---

## Rule 8

Insight là lớp hiển thị.

Không sửa Source.

---

## Rule 9

Plugin không sửa Core.

---

## Rule 10

Không module nào được phụ thuộc trực tiếp vào Monaco.

Editor Platform là lớp duy nhất giao tiếp với Editor.

---

# Technology Stack

| Layer | Technology |
|--------|------------|
| UI | WPF (.NET 8/9) |
| Editor | Monaco Editor + WebView2 |
| Tree | Tree Framework (Custom) |
| Language | ERP Language Service |
| Database | SQL Server + Dapper |
| XML | LINQ to XML |
| Dependency Injection | Microsoft.Extensions.DependencyInjection |
| Logging | Serilog |
| MVVM | CommunityToolkit.Mvvm |
| AI | MCP + OpenAI Compatible API |

---

# Future Architecture

Kiến trúc được thiết kế để mở rộng.

Có thể bổ sung

- Visual Form Designer
- SQL Designer
- Workflow Designer
- Plugin Marketplace
- Git Integration
- Multi-user Collaboration
- Cloud Workspace
- AI Pair Programming

mà không cần thay đổi kiến trúc hiện tại.

---

# Architecture Goals

Kiến trúc DevWorkFlow phải đáp ứng các mục tiêu sau:

- Dễ mở rộng.
- Dễ kiểm thử.
- Dễ bảo trì.
- Hiệu năng cao.
- Không phụ thuộc thư viện bên thứ ba.
- Có thể thay thế từng thành phần mà không ảnh hưởng toàn hệ thống.
- Hỗ trợ AI và Plugin như các thành phần hạng nhất (First-class Citizens).