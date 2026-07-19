# DevWorkFlow Roadmap

Version: 1.0

---

# Purpose

Roadmap định nghĩa lộ trình phát triển DevWorkFlow.

Roadmap không được xây dựng theo thời gian.

Roadmap được xây dựng theo Capability Level.

Chỉ khi Level trước hoàn thành mới chuyển sang Level tiếp theo.

Mọi tính năng mới phải được gắn vào một Capability cụ thể.

---

# Product Evolution

```text
Configuration Tool

        │

        ▼

ERP XML Editor

        │

        ▼

ERP IDE

        │

        ▼

ERP Platform

        │

        ▼

AI Native IDE

        │

        ▼

ERP Development Platform
```

---

# Current Status

Current Version

0.x

Current Capability

Level 1

Current Milestone

Foundation

---



# Level 0 — Foundation

Mục tiêu:

Xây dựng nền móng dự án.

### Completed

- Solution Structure
- Documentation
- Vision
- Architecture
- Coding Standards



### Deliverables

- Solution (.slnx)
- Project Structure
- Dependency Injection
- Logging
- Configuration
- Settings
- Theme
- Docking Layout

---



# Level 1 — Workspace Foundation (Current)

Mục tiêu:

Tạo IDE có thể sử dụng được.

## Explorer

- Tree Framework
- Lazy Loading
- Search
- Refresh



## Editor

- Monaco Editor
- WebView2
- Open/Save
- Undo/Redo



## Layout

- Dock Panels
- Workspace
- Status Bar
- Command Palette



## Infrastructure

- Document Manager
- File Watcher
- Project Manager



### Exit Criteria

Có thể mở Project ERP.

Mở XML.

Lưu XML.

Navigation cơ bản.

---



# Level 2 — ERP Language Service

Mục tiêu:

Xây dựng trái tim của IDE.

## Parser

- XML Parser
- Syntax Tree



## Semantic

- Semantic Model
- Entity Resolver
- Symbol Table



## Services

- Navigation
- Diagnostics
- Completion
- Formatting



## Insight

- Insight Layer
- Entity Rendering
- Semantic Decorations



### Exit Criteria

Editor không thao tác XML trực tiếp.

ERP Language Service hoạt động ổn định.

---



# Level 3 — Intelligent Editor

Mục tiêu:

Editor trở thành IDE thực sự.

## Features

- Go To Definition
- Find References
- Rename Symbol
- Peek Definition
- Code Folding
- Breadcrumb
- Inlay Hint
- Code Lens
- Semantic Highlight



## Search

- Global Search
- Symbol Search
- Entity Search



### Exit Criteria

Có thể phát triển ERP nhanh hơn XML Editor truyền thống.

---



# Level 4 — Visual Development

Mục tiêu:

Giảm phụ thuộc vào XML.

## Designer

- Form Designer
- Layout Designer
- Workflow Designer
- Property Grid



## ERP Language

- Two-way Synchronization
- Visual Editing



### Exit Criteria

Có thể thiết kế giao diện bằng kéo thả.

---



# Level 5 — Workflow & Automation

Mục tiêu:

Tự động hóa công việc.

## Workflow

- Workflow Designer
- Workflow Runtime
- Workflow Templates



## Automation

- Batch Refactoring
- Code Generation
- Project Templates



### Exit Criteria

Các thao tác lặp lại đều có thể chuyển thành Workflow.

---



# Level 6 — AI Native IDE

Mục tiêu:

AI trở thành cộng sự phát triển.

## AI

- Explain ERP
- Generate XML
- Generate SQL
- Review
- Refactor
- Documentation



## Agent

- Workspace Analysis
- Project Analysis
- Dependency Analysis
- Workflow Suggestion



### Exit Criteria

AI hiểu toàn bộ ERP Language.

---



# Level 7 — Platform Ecosystem

Mục tiêu:

Biến DevWorkFlow thành Platform.

## Plugin Marketplace

- Marketplace
- Plugin Manager
- Online Update



## Cloud

- Cloud Workspace
- Team Workspace



## Enterprise

- License
- Workspace Sharing
- Remote Development



### Exit Criteria

Plugin phát triển độc lập.

---



# Parallel Streams

Các nhóm công việc có thể phát triển song song.

## Core

- ERP Language Service
- Parser
- Semantic

---



## UI

- Editor
- Tree
- Docking
- Theme

---



## Platform

- Plugin
- Workflow
- AI

---



## Infrastructure

- Logging
- Configuration
- Settings
- Telemetry

---



# Milestones



## M1

Workspace hoạt động.

---



## M2

ERP Language Service hoàn chỉnh.

---



## M3

Editor thông minh.

---



## M4

Visual Designer.

---



## M5

Workflow Automation.

---



## M6

AI Native IDE.

---



## M7

Marketplace.

---



# Current Sprint



## Sprint Goal

Hoàn thành Workspace Foundation.

### Tasks

- [ ] Monaco + WebView2 Host
- [ ] Editor Platform
- [ ] Tree Framework
- [ ] Explorer
- [ ] Dock Layout
- [ ] Document Manager
- [ ] Theme
- [ ] Status Bar
- [ ] Command Palette
- [ ] Project Open/Close

---



# Technical Debt

Các hạng mục được phép trì hoãn.

- Git Integration
- Collaboration
- Cloud
- Marketplace
- AI Agent
- Live Share

---



# Definition of Done

Một Capability chỉ được xem là hoàn thành khi:

- Kiến trúc đúng.
- Unit Test đạt yêu cầu.
- Không phá vỡ API.
- Có Documentation.
- Có Demo.
- Có Performance Benchmark.
- Được cập nhật vào Roadmap.

---



# Long-term Vision

DevWorkFlow không hướng tới việc thay thế XML Editor.

DevWorkFlow hướng tới việc trở thành nền tảng phát triển chính thức của FBO ERP.

Người phát triển sẽ làm việc với ERP Language, Visual Designer, Workflow và AI trong một Workspace thống nhất.

XML chỉ còn là định dạng lưu trữ cuối cùng.