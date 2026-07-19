# UI Guidelines

Version: 1.0

---

# Purpose

UI Guidelines định nghĩa toàn bộ quy chuẩn giao diện của DevWorkFlow.

Mọi màn hình, control và plugin phải tuân theo tài liệu này.

Mục tiêu là tạo ra một trải nghiệm nhất quán, dễ sử dụng và dễ mở rộng.

UI không chỉ đẹp.

UI phải giúp người dùng hiểu ERP nhanh hơn.

---

# Design Vision

DevWorkFlow là một IDE.

Không phải ERP Client.

Không phải XML Editor.

Không phải Visual Studio Clone.

Người dùng phải tập trung vào nghiệp vụ ERP thay vì giao diện.

UI phải:

- Hiện đại
- Gọn gàng
- Nhất quán
- Nhanh
- Không gây mất tập trung

---

# Design Principles

## Information First

Hiển thị đúng thông tin.

Không hiển thị quá nhiều.

Không ẩn thông tin quan trọng.

---

## Workspace First

Workspace là trung tâm.

Dock Panel chỉ là công cụ.

---

## Minimal Distraction

Giảm Popup.

Giảm Dialog.

Giảm Tooltip.

Ưu tiên Inline UI.

---

## Progressive Disclosure

Thông tin nâng cao chỉ xuất hiện khi cần.

Không làm rối giao diện.

---

## Consistency

Một hành động.

Một biểu tượng.

Một màu sắc.

Một cách hiển thị.

Không có ngoại lệ.

---

# Layout

```text
+----------------------------------------------------------+
| Ribbon / Toolbar                                         |
+----------------------------------------------------------+

+---------+--------------------------+---------------------+
|         |                          |                     |
|Explorer |        Editor            |     Properties      |
|Outline  |                          |     AI              |
|Workflow |                          |                     |
|         |                          |                     |
+---------+--------------------------+---------------------+

| Status Bar                                              |
+----------------------------------------------------------+
```

Docking sử dụng AvalonDock.

Mọi cửa sổ đều có thể:

- Dock
- Float
- Auto Hide
- Tab
- Split

---

# Workspace

Workspace gồm:

Explorer

Outline

Editor

Designer

Workflow

Database

AI

Properties

Console

Mọi thành phần đều là Dock Panel.

---

# Navigation

Không dùng nhiều Menu.

Ưu tiên:

Ribbon

↓

Toolbar

↓

Command Palette

↓

Context Menu

---

# Ribbon

Ribbon chia thành:

Home

Project

Edit

View

ERP

Workflow

Designer

Database

AI

Help

Không quá 7 command trên một nhóm.

---

# Toolbar

Toolbar chỉ chứa:

Save

Undo

Redo

Search

Run

Debug

AI

Theme

Không chứa chức năng ít dùng.

---

# Command Palette

Phím tắt:

Ctrl + Shift + P

Mọi chức năng đều truy cập được.

Ưu tiên hơn Menu.

---

# Explorer

Explorer sử dụng Tree Framework.

Hiển thị:

Icon

↓

Title

↓

Status Badge

↓

Indicator

Không hiển thị quá nhiều cột.

---

# Outline

Outline đồng bộ với Editor.

Click Outline:

↓

Navigation

↓

Reveal Symbol

---

# Properties

Property Grid chia:

General

Behavior

Appearance

Data

Validation

Advanced

---

# Editor

Editor là trung tâm.

Editor luôn chiếm nhiều diện tích nhất.

Không đặt Tool Window che Editor.

---

# Insight Layer

Insight hiển thị trực tiếp trong Editor.

Ví dụ

```text
&ClientDefault;     Default
```

Không Tooltip.

Không Popup.

Không che Source.

---

# Designer

Designer gồm:

Canvas

Properties

Toolbox

Hierarchy

Ruler

Grid

Guideline

Snap

---

# Canvas

Canvas hỗ trợ:

Zoom

Pan

Grid

Snap

Selection

Multi Selection

Guide Line

Alignment

Pixel Ruler

---

# Pixel Ruler

Hiển thị:

Horizontal

Vertical

Đơn vị:

Pixel

Hỗ trợ:

Guide

Snap

Margin

Padding

---

# Theme

Mặc định:

DevWorkFlow Light

Tùy chọn:

DevWorkFlow Dark

Không dùng màu quá rực.

---

# Color Palette

## Primary

Blue

#2D7FF9

---

## Accent

Green

#00B86B

---

## Warning

Orange

#F39C12

---

## Error

Red

#E74C3C

---

## Background

#FFFFFF

---

## Secondary Background

#F6F7F9

---

## Border

#D9DEE7

---

## Text

#1F2937

---

## Secondary Text

#6B7280

---

# Typography

Font:

Segoe UI

Fallback:

Inter

Font Size:

12

Heading:

14

Title:

16

---

# Iconography

Sử dụng:

Material Design Icons

Icon luôn:

20px

Không dùng Icon nhiều màu.

---

# Buttons

Primary

Outlined

Text

Icon

Không quá 3 kiểu.

---

# Dialog

Chỉ dùng Dialog khi:

Không thể Inline.

Ưu tiên:

Inline Editor

↓

Flyout

↓

Dialog

---

# Notification

Sử dụng:

Status Bar

Toast

Inline Message

Không MessageBox.

---

# Search

Search luôn xuất hiện.

Ctrl + P

↓

Quick Open

Ctrl + Shift + F

↓

Global Search

---

# Accessibility

Hỗ trợ:

Keyboard Navigation

High Contrast

Screen Reader

Zoom

Large Font

---

# Performance

Không Block UI.

Animation dưới:

150ms

Không Fade dài.

Không Animation thừa.

---

# Responsive Layout

Mọi Panel đều:

Dock

Resize

Collapse

Auto Hide

Float

---

# Empty State

Nếu không có dữ liệu.

Hiển thị:

Icon

↓

Description

↓

Action

Không để màn hình trắng.

---

# Loading

Loading luôn:

Skeleton

Spinner

Progress

Không treo giao diện.

---

# Error State

Hiển thị:

Nguyên nhân.

↓

Giải pháp.

↓

Retry.

Không chỉ hiển thị Exception.

---

# Design Rules

Không dùng:

Tooltip cho thông tin chính.

Popup liên tục.

MessageBox.

Nhiều màu.

Icon không thống nhất.

---

# Long-term Vision

UI của DevWorkFlow hướng tới trải nghiệm của một IDE chuyên nghiệp.

Giao diện phải giúp người dùng tập trung vào ERP Language thay vì XML.

Mọi thành phần trong giao diện đều phải hỗ trợ:

- Semantic First
- Insight First
- Workspace First
- AI First
- Extensible First