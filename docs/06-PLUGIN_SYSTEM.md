# Plugin System

Version: 1.0

---

# Purpose

Plugin System là nền tảng mở rộng DevWorkFlow.

Plugin cho phép bổ sung tính năng mà không cần sửa mã nguồn Core.

Plugin không được phép truy cập trực tiếp vào implementation của hệ thống.

Plugin chỉ giao tiếp thông qua các Interface và Extension Point được công bố.

---

# Vision

DevWorkFlow được thiết kế theo hướng Platform.

Core chỉ cung cấp hạ tầng.

Mọi tính năng mở rộng đều thông qua Plugin.

Trong tương lai, nhiều tính năng của DevWorkFlow cũng sẽ được tách thành Plugin.

Ví dụ:

- SQL Tools
- Git
- AI
- Workflow Templates
- Report Designer
- ERP Templates

---

# Design Philosophy

Plugin System tuân theo các nguyên tắc:

- Platform First
- Extension Point First
- Provider First
- Dependency Injection
- Loose Coupling
- Version Compatibility
- Sandbox Ready

---

# Overall Architecture

```text
                    DevWorkFlow Core
═══════════════════════════════════════════════════════

ERP Language Service

Editor Platform

Tree Framework

Workflow Engine

AI Platform

═══════════════════════════════════════════════════════

Extension Point

↓

Provider Registry

↓

Plugin Loader

↓

Plugin Host

↓

Plugin Instance

═══════════════════════════════════════════════════════

Plugins

↓

ERP Plugin

↓

AI Plugin

↓

Database Plugin

↓

Git Plugin

↓

Workflow Plugin

↓

Theme Plugin

═══════════════════════════════════════════════════════
```

---

# Core Principles

## Plugin Never Modifies Core

Plugin không sửa mã nguồn Core.

Plugin chỉ mở rộng thông qua Interface.

---

## Interface First

Core chỉ công bố Interface.

Plugin chỉ biết Interface.

Không biết implementation.

---

## Dependency Injection

Plugin không tự khởi tạo Service.

Plugin nhận Service từ DI Container.

---

## Version Compatibility

Plugin phải khai báo phiên bản API hỗ trợ.

Core quyết định có nạp Plugin hay không.

---

## Lazy Loading

Plugin chỉ được nạp khi cần.

Không Load toàn bộ lúc khởi động.

---

# Plugin Lifecycle

```text
Discover

↓

Validate

↓

Load

↓

Initialize

↓

Register Providers

↓

Running

↓

Dispose
```

---

# Plugin Manifest

Mỗi Plugin phải có Manifest.

Ví dụ:

```text
Plugin Id

Name

Author

Version

Description

Required API Version

Dependencies

Capabilities
```

---

# Plugin Structure

```text
Plugin

├── Manifest
├── Assembly
├── Resources
├── Icons
├── Localization
├── Configuration
└── Providers
```

---

# Plugin Host

Plugin Host chịu trách nhiệm:

- Load
- Unload
- Isolation
- Dependency Resolution
- Exception Handling
- Logging

---

# Provider Registry

Provider Registry quản lý tất cả Provider.

Ví dụ:

Completion Provider

↓

Insight Provider

↓

Tree Provider

↓

Workflow Provider

↓

Theme Provider

↓

Command Provider

↓

Navigation Provider

↓

Diagnostics Provider

↓

Designer Provider

---

# Extension Points

DevWorkFlow công bố các Extension Point sau.

## ERP Language

- Completion Provider
- Diagnostics Provider
- Formatting Provider
- Navigation Provider
- Search Provider
- Refactoring Provider
- Entity Provider
- Insight Provider

---

## Editor Platform

- Decoration Provider
- Command Provider
- Theme Provider
- Inline Widget Provider
- Context Menu Provider

---

## Tree Framework

- TreeDataSource
- Icon Provider
- Search Provider
- Filter Provider
- Grouping Provider
- Context Menu Provider
- Node Renderer

---

## Workflow Engine

- Action Provider
- Trigger Provider
- Validation Provider
- Condition Provider

---

## Designer

- Toolbox Provider
- Property Provider
- Control Provider

---

## AI Platform

- AI Provider
- Prompt Provider
- Review Provider
- Code Generation Provider

---

## Application

- Ribbon Provider
- Menu Provider
- Toolbar Provider
- Settings Provider
- Welcome Page Provider

---

# Plugin Communication

Plugin không giao tiếp trực tiếp với nhau.

```text
Plugin

↓

Extension Point

↓

Core

↓

Extension Point

↓

Plugin
```

Mọi giao tiếp đều thông qua Core.

---

# Dependency Model

Plugin có thể phụ thuộc Plugin khác.

```text
ERP Plugin

↓

Common Plugin

↓

Core
```

Không được tạo Circular Dependency.

---

# Plugin Isolation

Plugin chạy trong môi trường tách biệt.

Plugin không được:

- Truy cập Service nội bộ.
- Truy cập Database trực tiếp.
- Gọi UI nội bộ.

Mọi thao tác thông qua API.

---

# Plugin Configuration

Plugin có vùng cấu hình riêng.

```text
Plugin Settings

↓

User Settings

↓

Workspace Settings

↓

Project Settings
```

---

# Plugin Events

Plugin có thể Subscribe:

DocumentOpened

DocumentClosed

DocumentSaved

SelectionChanged

NavigationChanged

WorkflowStarted

WorkflowCompleted

ThemeChanged

ProjectOpened

ProjectClosed

---

# Plugin Commands

Plugin có thể đăng ký:

Menu

Toolbar

Ribbon

Command Palette

Shortcut

Quick Action

---

# Plugin UI

Plugin có thể bổ sung:

Dock Panel

Tool Window

Context Menu

Dialog

Property Page

Status Bar

Welcome Page

---

# Plugin Security

Plugin được kiểm tra:

- Signature (tương lai)
- API Version
- Dependency
- Manifest
- Capability

Plugin không hợp lệ sẽ không được nạp.

---

# Performance

Plugin System hỗ trợ:

- Lazy Load
- Async Load
- Background Initialization
- Hot Reload (tương lai)
- Plugin Cache

---

# Threading

Plugin không được chặn UI Thread.

Plugin dài hạn phải chạy nền.

---

# Design Rules

Plugin không được:

- Parse XML trực tiếp.
- Sửa Semantic Model trực tiếp.
- Gọi Monaco API.
- Gọi WPF Control.
- Gọi Database nội bộ.

Plugin chỉ làm việc qua API.

---

# Future Features

Plugin System được thiết kế để hỗ trợ:

- Marketplace
- Online Update
- Plugin Store
- Digital Signature
- Remote Plugin
- Cloud Plugin
- AI Generated Plugin
- Enterprise Plugin

Không thay đổi kiến trúc hiện tại.

---

# Long-term Vision

Plugin System sẽ biến DevWorkFlow thành một nền tảng phát triển mở.

Core sẽ ngày càng nhỏ.

Phần lớn tính năng sẽ được triển khai dưới dạng Plugin.

Điều này giúp:

- Dễ mở rộng.
- Dễ bảo trì.
- Dễ cập nhật.
- Dễ tùy biến theo từng khách hàng hoặc từng phiên bản ERP.