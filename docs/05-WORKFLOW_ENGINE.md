# Workflow Engine

Version: 1.0

---

# Purpose

Workflow Engine là nền tảng điều phối quy trình làm việc (Workflow) của DevWorkFlow.

Workflow Engine không chỉ phục vụ Workflow của ERP.

Nó còn được sử dụng để tự động hóa các thao tác phát triển, kiểm tra, phân tích, AI và Plugin.

Workflow Engine là một nền tảng mở, cho phép định nghĩa các quy trình thông qua các Node và Action có thể mở rộng.

---

# Vision

Workflow không thao tác trực tiếp XML.

Workflow không thao tác trực tiếp UI.

Workflow chỉ làm việc với ERP Semantic Model và các Service công khai của hệ thống.

Workflow là "Automation Layer" của DevWorkFlow.

---

# Design Philosophy

Workflow Engine được xây dựng theo các nguyên tắc:

- Node-based
- Event Driven
- Declarative
- Extensible
- Transactional
- Async First

Workflow chỉ mô tả "điều gì cần làm".

Implementation được thực hiện bởi Action Provider.

---

# Overall Architecture

```text
                    Workflow Designer
════════════════════════════════════════════════════════════

      Visual Graph

════════════════════════════════════════════════════════════

                 Workflow Engine

────────────────────────────────────────────────────────────

Workflow Runtime

↓

Scheduler

↓

Execution Context

↓

Action Dispatcher

↓

Transaction Manager

↓

Event Bus

↓

Workflow State Manager

════════════════════════════════════════════════════════════

Workflow Providers

↓

ERP Language

↓

Editor Platform

↓

Tree Framework

↓

Database

↓

Git

↓

AI

↓

Plugin

════════════════════════════════════════════════════════════
```

---

# Core Principles

## Semantic First

Workflow không sửa XML.

Workflow chỉ thao tác trên Semantic Model.

---

## Event Driven

Workflow được kích hoạt bởi Event.

Không Polling.

---

## Action Based

Workflow được tạo từ các Action độc lập.

Mỗi Action chỉ thực hiện một trách nhiệm.

---

## Transaction First

Workflow có thể Rollback.

Mọi Action phải hỗ trợ Transaction nếu thay đổi dữ liệu.

---

## Provider First

Workflow không biết Implementation.

Workflow chỉ gọi Provider.

---

# Workflow Model

```text
Workflow

├── Nodes
├── Connections
├── Variables
├── Parameters
├── Events
├── Metadata
└── Version
```

---

# Workflow Node

```text
WorkflowNode

├── Id
├── Type
├── Name
├── Inputs
├── Outputs
├── Parameters
├── Position
├── State
└── Metadata
```

Node không chứa Logic.

---

# Workflow Connection

```text
Connection

Source Node

↓

Target Node

↓

Condition

↓

Transition
```

---

# Workflow Runtime

Workflow Runtime chịu trách nhiệm:

- Start
- Pause
- Resume
- Stop
- Cancel
- Retry

---

# Scheduler

Scheduler quyết định:

Node nào chạy.

Thời điểm chạy.

Điều kiện chạy.

Hỗ trợ:

- Sequential
- Parallel
- Conditional
- Loop

---

# Execution Context

Execution Context lưu:

- Variables
- Current Node
- Result
- Error
- Cancellation Token
- User Context
- Project Context

---

# Action Dispatcher

Dispatcher tìm Action phù hợp.

```text
Workflow Node

↓

Action Provider

↓

Execute
```

Workflow Engine không biết Action cụ thể.

---

# Transaction Manager

Quản lý:

- Begin
- Commit
- Rollback

Nếu Action thất bại:

↓

Rollback

↓

Raise Event

---

# Event Bus

Workflow phát Event:

WorkflowStarted

WorkflowCompleted

WorkflowFailed

NodeStarted

NodeCompleted

NodeFailed

WorkflowCancelled

Plugin và AI có thể Subscribe.

---

# Workflow State

WorkflowState quản lý:

- Running
- Waiting
- Completed
- Failed
- Cancelled
- Paused

Cho phép Resume.

---

# Built-in Action Providers

Workflow Engine cung cấp:

ERP Action

Editor Action

Tree Action

Database Action

File Action

Git Action

AI Action

Notification Action

---

# ERP Actions

Ví dụ:

Open XML

↓

Resolve Entity

↓

Rename Symbol

↓

Validate Document

↓

Format XML

↓

Save Document

---

# Editor Actions

Ví dụ:

Open Document

Reveal Symbol

Move Caret

Apply Selection

Highlight Range

---

# Database Actions

Ví dụ:

Connect

Execute SQL

Read Table

Export Data

Import Data

---

# File Actions

Ví dụ:

Read File

Write File

Copy

Delete

Move

Zip

---

# AI Actions

Ví dụ:

Generate XML

Review Code

Refactor

Explain Symbol

Generate Documentation

---

# Plugin Actions

Plugin có thể đăng ký:

Action Provider

↓

Workflow tự động sử dụng.

Không sửa Engine.

---

# Data Flow

```text
Trigger

↓

Workflow Runtime

↓

Scheduler

↓

Execution Context

↓

Action Dispatcher

↓

Provider

↓

Result

↓

Next Node
```

---

# Synchronization

Workflow đồng bộ với:

ERP Language Service

↓

Editor Platform

↓

Tree Framework

↓

Designer

↓

Database

↓

AI

---

# Designer

Workflow được thiết kế bằng giao diện kéo thả.

Designer chỉ chỉnh sửa Workflow Model.

Không chứa Runtime.

---

# Validation

Workflow được kiểm tra:

- Cycle Detection
- Missing Connection
- Invalid Parameter
- Unreachable Node
- Duplicate Node
- Infinite Loop

Trước khi chạy.

---

# Debugging

Workflow hỗ trợ:

- Breakpoint
- Step Into
- Step Over
- Continue
- Variable Watch
- Runtime Log

---

# Performance

Workflow Engine hỗ trợ:

- Async Execution
- Parallel Execution
- Cancellation Token
- Incremental Update
- Background Worker
- Object Pool

---

# Threading

UI Thread

↓

Workflow Runtime

↓

Background Tasks

↓

Provider

↓

Result

↓

UI Update

---

# Extension Points

Plugin có thể đăng ký:

Action Provider

Trigger Provider

Validation Provider

Condition Provider

Node Renderer

Property Provider

Debugger Provider

---

# Communication

Workflow Engine không biết:

- XML
- Monaco
- WPF

Workflow Engine chỉ gọi Interface.

---

# Design Rules

Workflow không được:

- Truy cập UI trực tiếp.
- Parse XML.
- Thực hiện Business Logic ngoài Action.

Workflow chỉ điều phối.

---

# Future Features

Workflow Engine được thiết kế để hỗ trợ:

- Scheduled Workflow
- Background Workflow
- Distributed Workflow
- AI Generated Workflow
- Collaborative Workflow
- Workflow Marketplace
- Workflow Templates

Không thay đổi kiến trúc.

---

# Long-term Vision

Workflow Engine sẽ trở thành nền tảng tự động hóa của DevWorkFlow.

Mọi thao tác lặp lại của lập trình viên đều có thể chuyển thành Workflow.

Workflow không chỉ dành cho ERP.

Workflow sẽ là Automation Platform cho toàn bộ IDE.