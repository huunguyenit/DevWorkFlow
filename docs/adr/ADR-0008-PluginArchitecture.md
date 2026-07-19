# ADR-0008: Plugin Architecture as the Extension Platform

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

DevWorkFlow được định hướng là một nền tảng phát triển ERP lâu dài.

Không phải mọi tính năng đều nên được tích hợp vào Core.

Ví dụ:

- Oracle Support
- SAP Connector
- Git Extension
- AI Provider
- SQL Formatter
- XML Formatter
- Report Designer
- Workflow Actions
- Custom Tree
- Custom Inspector

Nếu Core chứa toàn bộ chức năng:

- IDE sẽ rất lớn.
- Khó bảo trì.
- Khó nâng cấp.
- Khó cho bên thứ ba phát triển.

Cần một kiến trúc mở rộng chuẩn.

---

# Decision

DevWorkFlow áp dụng Plugin Architecture.

Core chỉ cung cấp Platform.

Mọi khả năng mở rộng đều thông qua Plugin.

Plugin không sửa Core.

Plugin không Patch Core.

Plugin chỉ đăng ký Capability.

---

# Architecture

```text
                 DevWorkFlow Core

                         │

                         ▼

                 Plugin Platform

                         │

────────────────────────────────────────────

Plugin Manager

Extension Registry

Capability Registry

Service Locator

Lifecycle Manager

Permission Manager

Dependency Resolver

Message Bus

────────────────────────────────────────────

                         │

────────────────────────────────────────────

ERP Plugin

SQL Plugin

Workflow Plugin

Git Plugin

AI Plugin

Designer Plugin

Report Plugin

Database Plugin

Theme Plugin

────────────────────────────────────────────
```

---

# Plugin Philosophy

Plugin không được biết nhau.

Plugin chỉ biết:

Platform.

Mọi giao tiếp đi qua:

Service

Event

Message

Không gọi trực tiếp.

---

# Plugin Lifecycle

```text
Discover

↓

Load Manifest

↓

Resolve Dependency

↓

Create Plugin

↓

Register Services

↓

Register Capabilities

↓

Activate

↓

Running

↓

Deactivate

↓

Unload
```

Plugin không được giữ trạng thái sau Unload.

---

# Plugin Manifest

Mỗi Plugin phải có Manifest.

Ví dụ:

```yaml
id: sql

name: SQL Support

version: 1.0.0

author: DevWorkFlow

dependencies:
  - erp-language

capabilities:
  - editor
  - tree
  - workflow

permissions:
  - database
```

---

# Capability Model

Plugin không đăng ký Control.

Plugin đăng ký Capability.

Ví dụ:

```text
Language

Tree Provider

Workflow Action

Editor Command

Insight Provider

Navigation Provider

Search Provider

Theme

AI Provider

Serializer

Importer

Exporter
```

Core tự động kết nối.

---

# Extension Points

DevWorkFlow cung cấp các Extension Point chuẩn.

Ví dụ:

```text
Editor

↓

Tree

↓

Workflow

↓

Insight

↓

Navigation

↓

Command

↓

Toolbar

↓

Menu

↓

Search

↓

Settings

↓

Project Template

↓

Language

↓

Serializer
```

Plugin có thể mở rộng bất kỳ Extension Point nào.

---

# Service Registration

Plugin có thể đăng ký:

```text
INavigationProvider

IInsightProvider

ITreeProvider

ILanguageProvider

ISerializer

IAIProvider

IWorkflowAction

ISearchProvider
```

Không được đăng ký trực tiếp UI.

---

# Message Bus

Plugin không gọi nhau.

Plugin giao tiếp bằng:

```text
Publish

↓

Message Bus

↓

Subscribe
```

Ví dụ:

```text
DocumentSaved

↓

Plugin A

Plugin B

Plugin C
```

Không phụ thuộc nhau.

---

# Dependency Injection

Plugin sử dụng DI.

Ví dụ:

```text
ILogger

INavigationService

IWorkspace

IEditorPlatform

ILanguageService
```

Không dùng Singleton toàn cục.

---

# Permission Model

Plugin phải khai báo Permission.

Ví dụ:

```text
Filesystem

Database

Network

Clipboard

Workspace

Settings

AI

Git
```

Core quyết định cấp quyền.

---

# Sandboxing

Plugin không được:

- Ghi XML trực tiếp.
- Sửa Semantic Model trực tiếp.
- Thao tác Monaco trực tiếp.
- Thay đổi Tree trực tiếp.

Plugin phải sử dụng API của Platform.

---

# UI Contribution

Plugin chỉ mô tả UI.

Ví dụ:

```text
Menu

Toolbar

Context Menu

Dock Panel

Property Tab

Settings Page
```

Core chịu trách nhiệm Render.

---

# Version Compatibility

Plugin Manifest khai báo:

```text
PlatformVersion

MinimumVersion

MaximumVersion
```

Plugin không tương thích sẽ không được Load.

---

# Hot Reload

Plugin có thể:

Load.

Unload.

Reload.

Không cần khởi động lại IDE.

---

# Consequences

## Positive

- IDE nhỏ gọn.
- Dễ mở rộng.
- Hệ sinh thái Plugin.
- Bên thứ ba phát triển được.
- AI Provider có thể thay thế.
- Ngôn ngữ mới không cần sửa Core.

---

## Negative

Plugin Platform phức tạp.

Cần:

- Dependency Resolver.
- Version Manager.
- Security.
- Lifecycle.

---

# Alternatives Considered

## Alternative 1

Plugin gọi trực tiếp Core.

Rejected.

---

## Alternative 2

Plugin Patch Source.

Rejected.

---

## Alternative 3

Capability-based Plugin Architecture.

Accepted.

---

# Architectural Rules

- Plugin không được gọi Monaco API.
- Plugin không Parse XML.
- Plugin không giữ Semantic Model riêng.
- Plugin không sửa Workspace.
- Plugin chỉ mở rộng qua Extension Point.
- Plugin luôn đăng ký Capability.
- Plugin luôn giao tiếp qua Platform Service.

---

# Impact

ADR này ảnh hưởng đến:

- ERP Language Service
- Editor Platform
- Tree Framework
- Workflow Engine
- Workspace
- AI Platform
- Insight Layer
- Navigation
- Search

---

# Related Documents

- 01-ARCHITECTURE.md
- 03-EDITOR_PLATFORM.md
- 04-TREE_FRAMEWORK.md
- 05-WORKFLOW_ENGINE.md
- 06-PLUGIN_SYSTEM.md
- ADR-0006-SemanticModel.md
- ADR-0007-Workspace.md

---

# Future Review

ADR chỉ được xem xét lại nếu:

- DevWorkFlow thay đổi hoàn toàn mô hình mở rộng.
- Capability Model không còn phù hợp.
- Có kiến trúc Plugin tốt hơn.

Nếu không, Plugin Architecture sẽ là nền tảng mở rộng duy nhất của DevWorkFlow.