# ADR-0009 — Designer Platform

Status: Accepted

Date: 2026-07-20

Authors:
DevWorkFlow Architecture Team

---

# Context

DevWorkFlow là IDE dành riêng cho FBO ERP.

ERP sử dụng XML Low-Code để mô tả giao diện.

Tuy nhiên XML không chỉ mô tả Layout.

Nó còn sinh ra:

- HTML
- CSS
- JavaScript
- Inline HTML
- Dynamic Script
- Runtime Components
- Runtime Behaviors

Nhiều thành phần chỉ hoạt động khi được thực thi trong Browser.

Ví dụ:

- Inline JavaScript
- Event Binding
- Dynamic HTML
- CSS Selector
- Animation
- Responsive Layout
- DOM Manipulation

Nếu dựng lại toàn bộ Runtime bằng WPF sẽ dẫn tới:

- Không tương thích hoàn toàn với Runtime.
- Phải viết lại Browser Engine.
- Không hỗ trợ đầy đủ CSS.
- Không hỗ trợ JavaScript Runtime.
- Chi phí bảo trì rất lớn.
- Khó mở rộng.

---

# Problem

Designer cần hiển thị giao diện giống Runtime 100%.

Nếu sử dụng WPF để dựng giao diện:

XML

↓

WPF Controls

↓

Visual Tree

thì sẽ không phản ánh chính xác:

- HTML
- CSS
- JavaScript
- Browser Layout
- DOM Runtime

Các khác biệt sẽ ngày càng lớn khi ERP phát triển.

---

# Decision

DevWorkFlow quyết định:

Visual Designer sẽ chạy trên Browser Runtime.

Browser Runtime được nhúng bằng WebView2.

Designer không render WPF Controls.

Designer luôn render HTML thực tế của ERP.

Kiến trúc:

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

Browser DOM

↓

Designer Overlay
```

---

# Principles

Designer là Browser.

Không phải WPF Designer.

Không phải XML Viewer.

Không phải HTML Editor.

Không phải Form Designer.

Designer luôn hiển thị đúng Runtime.

---

# Rendering Model

Browser chịu trách nhiệm:

- HTML
- CSS
- JavaScript
- DOM
- Layout
- Paint

DevWorkFlow chịu trách nhiệm:

- Workspace
- Semantic Model
- Layout Model
- Commands
- Undo / Redo
- Property Grid
- Outline
- AI
- Workflow

Hai hệ thống độc lập.

---

# DOM Mapping

Mọi phần tử được render phải có định danh.

Ví dụ

```html
<div
    data-node-id="NODE_1001"
    data-symbol-id="SYM_201"
    data-control="Button">
</div>
```

NodeId là cầu nối giữa:

- XML
- Workspace
- Property Grid
- Outline
- Workflow
- AI
- Browser DOM

---

# Command Model

Designer không chỉnh sửa XML.

Designer chỉ phát sinh Command.

Ví dụ

```
MoveNode

ResizeNode

DeleteNode

InsertNode

UpdateProperty
```

Workspace xử lý Command.

Workspace cập nhật XML.

Workspace sinh ChangeSet.

Designer chỉ nhận Patch.

---

# DOM Patch

Không Reload toàn bộ trang.

Sau mỗi thay đổi:

Workspace

↓

Serializer

↓

HTML Generator

↓

DOM Patch

↓

Browser Update

Chỉ vùng thay đổi được cập nhật.

---

# Overlay Architecture

Selection

Hover

Resize Handles

Snap Lines

Alignment Guides

Drop Hint

Margin Preview

Padding Preview

đều được render bằng Overlay Layer.

Overlay không thuộc DOM thực tế.

Overlay chỉ phục vụ Designer.

---

# Communication

WPF

↓

Bridge

↓

WebView2

↓

Designer Runtime

Toàn bộ giao tiếp sử dụng Message Bridge.

Business Layer không gọi JavaScript trực tiếp.

---

# Source of Truth

Workspace

là

Source of Truth.

Designer không được lưu trạng thái.

Designer luôn đồng bộ từ Workspace.

---

# Advantages

## Runtime Fidelity

Giao diện Designer giống Runtime.

What You Design Is What Runtime Executes.

---

## Future-proof

ERP Runtime thay đổi.

Designer không cần viết lại.

Browser xử lý phần lớn thay đổi.

---

## Browser Compatibility

Hỗ trợ:

- HTML5
- CSS3
- JavaScript
- Responsive
- Animation
- Canvas
- SVG

không cần tự triển khai.

---

## Better Performance

Chromium tối ưu hơn Visual Tree của WPF đối với các giao diện web phức tạp.

---

## Lower Maintenance

Không cần phát triển Browser Engine riêng.

Không cần clone HTML Renderer.

Không cần clone CSS Engine.

---

## AI Friendly

AI có thể:

- Inspect DOM.
- Highlight Node.
- Navigate Symbol.
- Preview Layout.

thông qua DOM Mapping.

---

# Consequences

## Positive

Runtime chính xác.

Kiến trúc đơn giản.

Khả năng mở rộng cao.

Plugin dễ tích hợp.

AI dễ hiểu.

Workflow thống nhất.

Hiệu năng tốt.

---

## Negative

Cần Bridge giữa C# và JavaScript.

Cần DOM Mapping.

Cần HTML Generator.

Cần Patch Engine.

Đội ngũ phát triển cần hiểu Web Runtime.

---

# Alternatives Considered

## WPF Controls

Rejected.

Không phản ánh đúng Browser Runtime.

---

## WinForms Designer

Rejected.

Không hỗ trợ HTML Runtime.

---

## Avalonia Controls

Rejected.

Vấn đề tương tự WPF.

---

## Electron

Rejected.

IDE đã sử dụng WPF.

Không cần thay toàn bộ Shell.

---

## Hybrid Browser

Accepted.

WPF làm IDE.

Browser làm Designer.

---

# Related ADR

ADR-0002 — Monaco Editor

ADR-0005 — Editor Platform

ADR-0006 — Semantic Model

ADR-0007 — Workspace

ADR-0008 — Plugin Architecture

---

# Future Evolution

Designer sẽ tiếp tục mở rộng:

- Responsive Preview
- Device Preview
- Theme Preview
- Accessibility Preview
- Live Preview
- AI Visual Assistant
- Multi-user Collaboration
- Design Tokens
- Visual Diff

Mà không thay đổi kiến trúc nền tảng.

---

# Architecture Statement

DevWorkFlow chính thức lựa chọn Browser Runtime (WebView2 + Chromium) làm nền tảng duy nhất cho Visual Designer.

Visual Designer thao tác trên DOM Runtime thực tế.

Workspace là nguồn dữ liệu duy nhất.

Semantic Model là nguồn ngữ nghĩa.

Layout Model là nguồn bố cục.

Browser chỉ chịu trách nhiệm hiển thị và tương tác.

Mọi thay đổi đều đi qua Workspace trước khi phản ánh trở lại Runtime.

Nguyên tắc cốt lõi:

> **What You Design Is What Runtime Executes.**