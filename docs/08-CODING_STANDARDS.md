# Coding Standards

Version: 1.0

---

# Purpose

Tài liệu này định nghĩa các tiêu chuẩn phát triển của DevWorkFlow.

Mục tiêu là đảm bảo:

- Kiến trúc nhất quán
- Code dễ đọc
- Dễ bảo trì
- Dễ mở rộng
- Dễ kiểm thử
- Không phụ thuộc cá nhân

Coding Standards áp dụng cho toàn bộ Core, Plugin và các thành phần mở rộng.

---

# Engineering Principles

## Architecture First

Mọi quyết định phải tuân thủ Architecture.

Không được vì "viết nhanh" mà phá vỡ kiến trúc.

---

## SOLID

Toàn bộ code phải tuân thủ SOLID.

Đặc biệt:

- Single Responsibility
- Dependency Inversion

---

## Composition over Inheritance

Ưu tiên Composition.

Hạn chế kế thừa nhiều tầng.

---

## Interface First

Module chỉ giao tiếp qua Interface.

Không phụ thuộc implementation.

---

## Dependency Injection

Không new Service trực tiếp.

Mọi Service phải được quản lý bởi DI Container.

---

## Immutable by Default

Object nên immutable khi có thể.

State thay đổi thông qua Service hoặc Command.

---

## Async First

Mọi IO đều phải sử dụng async.

Không block UI Thread.

---

## Event Driven

Module giao tiếp bằng Event hoặc Message.

Không gọi chéo trực tiếp.

---

# Project Structure

```text
DevWorkFlow.slnx

/src

    DevWorkFlow.Core

    DevWorkFlow.Application

    DevWorkFlow.Language

    DevWorkFlow.Editor

    DevWorkFlow.Tree

    DevWorkFlow.Workflow

    DevWorkFlow.Plugin

    DevWorkFlow.Infrastructure

    DevWorkFlow.UI

/tests

/docs
```

Không tạo project theo chức năng nhỏ.

Project theo Layer.

---

# Naming Convention

## Namespace

```text
DevWorkFlow.Language

DevWorkFlow.Editor

DevWorkFlow.Workflow
```

---

## Class

PascalCase

Ví dụ

```text
LanguageService

NavigationProvider

TreeNode
```

---

## Interface

Bắt đầu bằng I

```text
ILanguageService

ITreeDataSource

IEditorPlatform
```

---

## Method

PascalCase

```text
LoadDocument()

ResolveEntity()

FindSymbol()
```

---

## Property

PascalCase

```text
DisplayName

DocumentId

NodeType
```

---

## Field

Private field

```text
_documentService

_cache

_parser
```

---

## Constant

PascalCase

```text
DefaultTimeout

MaxChildren
```

---

## Enum

Không prefix.

```text
DocumentState

NodeType

SymbolKind
```

---

# Folder Structure

Không phân chia theo kỹ thuật.

Không tạo:

Helpers

Utils

Common

Misc

Shared

Thay vào đó:

```text
Language

Parser

Semantic

Navigation

Completion

Diagnostics
```

---

# Class Design

Một Class chỉ có một trách nhiệm.

Class trên 500 dòng cần xem xét tách nhỏ.

Method trên 50 dòng cần xem xét refactor.

---

# Dependency Rules

UI

↓

Application

↓

Language

↓

Infrastructure

Không phụ thuộc ngược.

Không Circular Dependency.

---

# Service Rules

Service không giữ State nếu không cần.

Business Logic nằm trong Service.

Không đặt Logic trong ViewModel.

---

# ViewModel Rules

ViewModel chỉ:

- Binding
- Command
- State UI

Không Parse XML.

Không truy cập Database.

---

# Exception Handling

Không:

```csharp
catch(Exception)
{
}
```

Không bỏ qua Exception.

Luôn:

- Log
- Thông báo phù hợp
- Giữ ứng dụng ổn định

---

# Logging

Sử dụng Serilog.

Không dùng Console.WriteLine().

Không MessageBox để debug.

---

# XML Rules

Không sửa XML trực tiếp.

Luôn:

XML

↓

Parser

↓

Semantic Model

↓

Serializer

↓

XML

---

# Editor Rules

Không gọi Monaco API ngoài Editor Platform.

---

# Tree Rules

Không thao tác trực tiếp TreeView.

Luôn sử dụng Tree Framework.

---

# Workflow Rules

Workflow chỉ gọi Action.

Không chứa Business Logic.

---

# Plugin Rules

Plugin không truy cập Internal API.

Plugin chỉ sử dụng Public API.

---

# Command Rules

Mọi thao tác đều thông qua Command.

Ví dụ:

Rename

Delete

Move

Format

Generate

Navigation

Undo

Redo

---

# Event Rules

Không gọi chéo Module.

Luôn:

Publish

↓

Subscribe

---

# Threading

UI Thread chỉ Render.

Business Logic chạy Background.

Không:

```csharp
Task.Result

Task.Wait()

Thread.Sleep()
```

---

# Async Rules

Đúng

```csharp
await documentService.OpenAsync();
```

Sai

```csharp
documentService.OpenAsync().Result;
```

---

# Performance

Không:

- Parse lại toàn bộ XML
- Refresh toàn bộ Tree
- Render lại toàn bộ Editor

Ưu tiên:

Incremental

Cache

Virtualization

Lazy Loading

---

# Unit Testing

Core Module phải có Unit Test.

Mục tiêu:

Coverage ≥ 80%

Các phần cần ưu tiên:

- Parser
- Semantic
- Navigation
- Serializer
- Workflow
- Tree

---

# Documentation

Mọi Public API phải có XML Documentation.

Ví dụ

```csharp
/// <summary>
/// Resolve an ERP Entity.
/// </summary>
```

---

# Code Review Checklist

Trước khi Merge:

✓ Kiến trúc đúng

✓ Không Circular Dependency

✓ Có Unit Test

✓ Có XML Comment

✓ Không Dead Code

✓ Không Magic Number

✓ Không Hardcode Path

✓ Không Hardcode Color

✓ Không Hardcode String

✓ Có Logging

✓ Có CancellationToken nếu cần

✓ Async đúng chuẩn

---

# Anti-patterns

Không sử dụng:

God Class

Static Service

Service Locator

Global Variable

Utility Class

Business Logic trong UI

Copy/Paste Code

Hardcoded Configuration

---

# Configuration

Mọi giá trị cấu hình phải nằm trong:

Configuration

Settings

Options

Không Hardcode.

---

# Versioning

Semantic Versioning

MAJOR.MINOR.PATCH

Ví dụ

1.2.0

---

# Git Rules

- Feature Branch
- Pull Request
- Squash Merge
- Conventional Commit

Ví dụ

feat(editor): add semantic decorations

fix(tree): improve lazy loading

docs(language): update parser architecture

---

# AI Collaboration

AI là công cụ hỗ trợ.

Mọi code do AI sinh ra phải:

- Đọc lại
- Refactor
- Kiểm thử
- Tuân thủ Coding Standards

Không merge trực tiếp mã do AI tạo.

---

# Long-term Vision

Coding Standards không nhằm giới hạn lập trình viên.

Mục tiêu là giúp DevWorkFlow phát triển trong nhiều năm mà vẫn giữ được:

- Kiến trúc sạch
- Chất lượng mã nguồn cao
- Khả năng mở rộng
- Khả năng bảo trì
- Tính nhất quán giữa các thành viên và Plugin