# ADR-0003: Tree Framework based on TreeDataSource

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

DevWorkFlow có rất nhiều cây dữ liệu:

- Project Explorer
- ERP Explorer
- Outline
- Workflow
- Database Explorer
- Command Explorer
- Plugin Explorer
- AI Workspace
- Search Result
- Favorites
- History

Nếu mỗi cây tự xây dựng bằng ObservableCollection hoặc TreeViewItem thì sẽ phát sinh:

- Logic bị lặp.
- Lazy Load khác nhau.
- Search khác nhau.
- Refresh khác nhau.
- Cache khác nhau.
- Không thể mở rộng.

Cần có một nền tảng Tree thống nhất.

---

# Problem

WPF TreeView được thiết kế cho dữ liệu nhỏ.

ERP Project có thể có:

- Hàng nghìn XML
- Hàng chục nghìn Node
- Database lớn
- Symbol rất nhiều

Không thể Load toàn bộ.

Không thể Refresh toàn bộ.

Không thể Binding toàn bộ.

---

# Decision

DevWorkFlow xây dựng Tree Framework riêng.

Tree Framework hoạt động dựa trên:

TreeDataSource

TreeNode

TreeProvider

TreeRenderer

TreeView chỉ là lớp hiển thị.

TreeDataSource là nguồn dữ liệu duy nhất.

---

# Architecture

```text
                  Tree Framework

                         │

                         ▼

                  Tree Controller

                         │

                         ▼

                  TreeDataSource

                         │

         ┌───────────────┼───────────────┐

         ▼               ▼               ▼

 Project Provider   Database Provider  Outline Provider

         ▼               ▼               ▼

        Node            Node            Node

                         │

                         ▼

                 Tree Renderer

                         │

                         ▼

                  WPF TreeView
```

---

# TreeDataSource

TreeDataSource là abstraction của toàn bộ dữ liệu cây.

TreeDataSource chịu trách nhiệm:

- Load Root
- Load Children
- Search
- Refresh
- Sort
- Filter
- Group
- Expand
- Collapse

TreeView không chứa Logic.

---

# TreeNode

TreeNode chỉ mô tả dữ liệu.

Ví dụ:

- Id
- ParentId
- DisplayName
- Icon
- State
- Metadata

TreeNode không biết UI.

---

# TreeProvider

Mỗi loại dữ liệu có một Provider.

Ví dụ:

Project Provider

↓

Database Provider

↓

Workflow Provider

↓

Outline Provider

↓

Search Provider

↓

Plugin Provider

---

# TreeRenderer

TreeRenderer chịu trách nhiệm:

- Icon
- Badge
- Selection
- Highlight
- Expand Icon
- Context Menu

Không đọc Database.

Không Parse XML.

---

# Rationale

## Một Framework

Toàn bộ IDE chỉ có một Tree Framework.

Mọi Explorer đều sử dụng chung.

---

## Lazy Loading

Node chỉ Load khi Expand.

Không Load toàn bộ.

---

## Virtualization

Node không hiển thị sẽ không Render.

Giảm Memory.

---

## Search

Search hoạt động trên TreeDataSource.

Không phụ thuộc UI.

---

## Refresh

Refresh theo Node.

Không Refresh toàn cây.

---

## Async

Children được Load bất đồng bộ.

Không Block UI.

---

## Reusable

Tree Framework có thể dùng cho:

ERP

Database

Workflow

AI

Plugin

Không cần sửa Core.

---

# Consequences

## Positive

- Một Tree Framework duy nhất.
- Hiệu năng cao.
- Dễ mở rộng.
- Dễ bảo trì.
- Hỗ trợ dữ liệu rất lớn.
- Plugin có thể tạo Tree mới.

---

## Negative

Tree Framework phức tạp hơn TreeView thông thường.

Cần xây dựng Cache và Scheduler riêng.

---

# Alternatives Considered

## Alternative 1

ObservableCollection

### Result

Rejected.

### Reasons

Không phù hợp với dữ liệu lớn.

Không hỗ trợ Lazy Loading tốt.

---

## Alternative 2

TreeViewItem

### Result

Rejected.

### Reasons

Logic nằm trong UI.

Khó kiểm thử.

Không mở rộng.

---

## Alternative 3

TreeDataSource

### Result

Accepted.

---

# Lazy Loading Strategy

TreeDataSource sử dụng:

Placeholder Node

↓

Expand

↓

Async Load

↓

Replace Children

↓

Cache

Không tạo Node trước.

---

# Cache Strategy

Node Cache

↓

Weak Reference

↓

LRU Cleanup

↓

Incremental Refresh

Chỉ Cache Node cần thiết.

---

# Refresh Strategy

Không Refresh Root.

Chỉ Refresh:

Node hiện tại.

Hoặc:

Parent.

Hoặc:

Affected Branch.

---

# Search Strategy

Search không duyệt TreeView.

Search chạy trên TreeDataSource.

Kết quả:

TreeNode Collection.

---

# Selection

Selection lưu bằng:

NodeId

Không lưu TreeViewItem.

---

# Navigation

Navigation luôn:

NodeId

↓

Reveal

↓

Expand Parent

↓

Scroll Into View

Không theo Index.

---

# Threading

UI Thread

↓

Virtual Tree

↓

Background Loader

↓

TreeDataSource

↓

Provider

↓

Result

↓

Dispatcher

↓

UI

---

# Performance Targets

Expand Node

< 50 ms

Search

< 100 ms

Refresh Node

< 30 ms

100.000 Node

Không treo UI.

---

# Architectural Rules

Các quy tắc bắt buộc:

- Không Binding trực tiếp ObservableCollection lớn.
- Không dùng TreeViewItem làm Model.
- Không lưu State trong UI.
- Không Parse XML trong Tree.
- Không Query Database trong Renderer.
- Chỉ TreeDataSource được Load dữ liệu.

---

# Impact

ADR này ảnh hưởng đến:

- Project Explorer
- Database Explorer
- Workflow Explorer
- Outline
- Search
- Favorites
- Plugin Explorer
- AI Workspace

---

# Future Review

ADR sẽ được xem xét lại nếu:

- Có mô hình Tree hiệu quả hơn TreeDataSource.
- DevWorkFlow không còn sử dụng Tree Framework.

Nếu không, TreeDataSource tiếp tục là nền tảng duy nhất cho mọi cây dữ liệu.

---

# Related Documents

- 01-ARCHITECTURE.md
- 03-EDITOR_PLATFORM.md
- 04-TREE_FRAMEWORK.md
- 06-PLUGIN_SYSTEM.md
- ADR-0001-LanguageService.md
- ADR-0002-MonacoEditor.md
- ADR-0004-InsightLayer.md