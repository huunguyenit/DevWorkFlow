# Designer Platform

Version: 1.0

Status: Accepted

---

# Vision

DevWorkFlow không sử dụng WPF để dựng giao diện ERP.

Designer phải hiển thị chính xác Runtime của ERP.

Designer không phải là WPF Designer.

Designer là một Web Runtime được nhúng vào IDE.

Nguyên tắc:

> What You Design Is What Runtime Executes.

---

# Why

ERP UI được tạo từ XML.

XML sinh ra:

- HTML
- CSS
- JavaScript
- Inline HTML
- Runtime Script
- Dynamic Layout

Nhiều thành phần chỉ hoạt động khi chạy trong Browser.

Nếu render bằng WPF:

- Không đúng giao diện.
- Không đúng CSS.
- Không đúng JavaScript.
- Không đúng Runtime.
- Khó bảo trì.

Do đó DevWorkFlow quyết định sử dụng Browser Engine.

---

# Architecture

```
                DevWorkFlow

                WPF Shell

--------------------------------------------------------

Explorer

Property

Outline

Workflow

AI

Toolbox

Dock Panels

--------------------------------------------------------

                Designer Platform

--------------------------------------------------------

                WebView2

--------------------------------------------------------

HTML Runtime

CSS Runtime

JavaScript Runtime

ERP Runtime

Designer Runtime

--------------------------------------------------------

                DOM

--------------------------------------------------------

Generated ERP HTML
```

---

# Responsibilities

Designer Platform chịu trách nhiệm:

- Render giao diện ERP.
- Drag & Drop.
- Resize.
- Selection.
- Hover.
- Alignment Guide.
- Snap.
- Overlay.
- Visual Editing.
- DOM Inspection.

Designer Platform KHÔNG:

- Parse XML.
- Resolve Entity.
- Sinh HTML.
- Lưu XML.
- Chỉnh sửa Semantic Model.

---

# Rendering Pipeline

```
XML

↓

ERP Language Service

↓

Semantic Model

↓

Layout Model

↓

HTML Generator

↓

Generated HTML

↓

WebView2

↓

DOM

↓

Designer Overlay
```

Designer chỉ làm việc với DOM.

---

# DOM Mapping

Mỗi phần tử được sinh phải có định danh.

Ví dụ

```html
<div
    data-node-id="NODE_1001"
    data-symbol-id="SYM_502"
    data-type="Button"
    data-parent="NODE_1000">
</div>
```

NodeId là chìa khóa kết nối giữa:

- DOM
- XML
- Workspace
- Outline
- Property Grid
- AI
- Workflow

---

# Layout Model

Designer không thao tác trực tiếp XML.

Designer thao tác Layout Model.

```
XML

↓

Semantic Model

↓

Layout Model

↓

Designer
```

Mọi thay đổi được ghi vào Layout Model.

Sau đó Serializer cập nhật XML.

---

# Drag & Drop

Luồng xử lý:

```
Mouse Down

↓

Hit Test

↓

Drag Session

↓

Preview

↓

Drop Target

↓

Command

↓

Workspace

↓

Serializer

↓

Patch DOM
```

Không sửa DOM trực tiếp.

---

# Selection

Selection luôn bắt đầu từ DOM.

```
Click DOM

↓

NodeId

↓

Workspace

↓

Property Grid

↓

Outline

↓

AI Context
```

---

# Resize

Resize được xử lý hoàn toàn trong Web Runtime.

```
Mouse Drag

↓

Resize Handle

↓

Preview

↓

Command

↓

Workspace

↓

Serializer

↓

DOM Patch
```

---

# Overlay Layer

Designer sử dụng Overlay riêng.

Overlay không thuộc DOM.

```
Overlay

├── Selection
├── Hover
├── Resize
├── Margin
├── Padding
├── Alignment Guide
├── Snap Line
├── Drop Hint
└── Multi Selection
```

Overlay luôn nằm trên DOM.

---

# Property Editing

```
Property Grid

↓

Command

↓

Workspace

↓

Serializer

↓

Layout Model

↓

HTML Generator

↓

DOM Patch
```

Property Grid không thao tác DOM.

---

# DOM Patch Engine

Không Refresh toàn bộ trang.

Chỉ cập nhật phần thay đổi.

```
Workspace

↓

Change Set

↓

DOM Patch

↓

Repaint
```

Ví dụ:

- Đổi Text.
- Đổi Width.
- Đổi Class.
- Thêm Node.

Không Reload.

---

# Designer Runtime

Designer Runtime chịu trách nhiệm:

- Hit Test
- Drag
- Drop
- Selection
- Resize
- Hover
- Keyboard
- Clipboard
- Overlay

Không xử lý Business Logic.

---

# Communication

WPF và WebView2 giao tiếp bằng Message Bridge.

```
WPF

↓

Message Bridge

↓

WebView

↓

Designer Runtime
```

Không gọi JavaScript trực tiếp từ Business Layer.

---

# Command Model

Designer chỉ gửi Command.

Ví dụ

```json
{
    "command": "MoveNode",
    "nodeId": "NODE_1005",
    "newParent": "NODE_1001",
    "index": 3
}
```

Workspace xử lý Command.

Designer không sửa XML.

---

# Undo / Redo

Undo hoạt động trên Command.

Không hoạt động trên DOM.

```
Command

↓

Workspace

↓

Undo Stack

↓

Serializer

↓

DOM Patch
```

---

# Performance

Designer phải:

- Virtual DOM Update.
- Incremental Render.
- Lazy Overlay.
- RequestAnimationFrame.
- DOM Recycling.
- Event Delegation.

Không tạo nhiều Event Listener.

---

# Future

Designer sẽ hỗ trợ:

- Responsive Preview.
- Device Preview.
- Theme Preview.
- RTL.
- Accessibility.
- Multi Selection.
- Multi Page.
- Live Preview.
- Animation Preview.

---

# Architecture Rules

Designer không Parse XML.

Designer không lưu XML.

Designer không Resolve Entity.

Designer không chứa Business Logic.

Designer chỉ thao tác Layout Model.

Mọi thay đổi phải đi qua Workspace.

DOM chỉ là View.

Workspace là Source of Truth.

Semantic Model là Source of Meaning.

Layout Model là Source of Layout.

---

# Related Documents

- 01-ARCHITECTURE.md
- 02-ERP_LANGUAGE_SERVICE.md
- 03-EDITOR_PLATFORM.md
- 04-TREE_FRAMEWORK.md
- ADR-0005-EditorPlatform.md
- ADR-0006-SemanticModel.md
- ADR-0007-Workspace.md
- ADR-0008-PluginArchitecture.md

---

# Long-term Vision

DevWorkFlow Designer không phải là một WPF Designer.

Không phải là HTML Designer.

Không phải là XML Designer.

DevWorkFlow Designer là một **DOM-based ERP Visual Designer**.

Mọi thao tác của người dùng đều diễn ra trên DOM Runtime thực tế của trình duyệt, trong khi dữ liệu gốc vẫn được quản lý thông qua Workspace, Semantic Model và Layout Model.

Điều này đảm bảo:

- **What You Design Is What Runtime Executes.**
- Giao diện thiết kế luôn phản ánh đúng giao diện chạy thực tế.
- Không cần tái hiện Browser bằng WPF.
- Kiến trúc mở rộng tốt cho Plugin, AI và Workflow trong tương lai.