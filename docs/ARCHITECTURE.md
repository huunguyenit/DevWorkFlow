# FBO Studio — Architecture

> Cập nhật: 2026-07-17  
> Trạng thái: As-Is + hướng To-Be  
> Tham chiếu: [`ROADMAP.md`](ROADMAP.md), [`ERP_LANGUAGE_SERVICE.md`](ERP_LANGUAGE_SERVICE.md)

## 1. Mục tiêu kiến trúc

FBO Studio là IDE cho FBO ERP. XML chỉ là storage format.

Mọi tính năng sản phẩm (Designer, SQL Studio, Search, Navigation, Refactor,
Validation, Workflow, AI) phải tiến tới dùng chung ERP Language Service và
ERP Semantic Model.

## 2. Solution As-Is

### 2.1 Projects trong solution

[`DevWorkFlow.slnx`](../DevWorkFlow.slnx) hiện chỉ chứa runtime path chính:

```text
DevWorkFlow.slnx
├── docs/
├── DevWorkFlow.Domain
├── DevWorkFlow.Application
├── DevWorkFlow.Infrastructure
├── UI
└── tests/   (Domain.Tests, Application.Tests — Phase 0)
```

### 2.2 Dependency

```text
UI
├── DevWorkFlow.Application
├── DevWorkFlow.Domain
└── DevWorkFlow.Infrastructure

DevWorkFlow.Infrastructure
├── DevWorkFlow.Application
└── DevWorkFlow.Domain

DevWorkFlow.Application
└── DevWorkFlow.Domain

tests/*
└── project under test
```

### 2.3 Legacy trên disk (ngoài solution)

Các folder sau **không** nằm trong `DevWorkFlow.slnx` và **không** nằm trên
runtime path của `UI`:

- `Core/`
- `Infrastructure/` (root — trùng assembly name với `DevWorkFlow.Infrastructure`)
- `ViewModels/`
- `_ofd_test/`

Chính sách: giữ trên disk để đối chiếu migration; không build cùng solution;
không reference lại. Chi tiết: [`DECISIONS.md`](DECISIONS.md) ADR-001.

## 3. Runtime composition

Composition root: [`UI/App.xaml.cs`](../UI/App.xaml.cs) (manual DI).

```text
Program / Web.config
        │
        ▼
Infrastructure adapters
  SQL, file system, settings, wcommand
        │
        ▼
Application engines
  syntax / semantic bind / entity graph / SQL extract
        │
        ▼
Domain models (Fbo*, Sql, Menu, Program)
        │
        ▼
WPF ViewModels / Views
```

Shell hiện có:

- Document tabs (Form / SQL).
- Dock trái / phải / dưới + splitter.
- Left dock: **Explorer / Menu / Database** dùng chung `ExplorerTreePanel`
  ([`EXPLORER_TREE_PANEL.md`](EXPLORER_TREE_PANEL.md)); Menu từ `wcommand`.
- Outline, Properties, Toolbox.
- XML / Output / Error / Log panes.

## 4. Module và storage adapters tạm thời

| Module | Trạng thái | Storage touchpoint tạm thời |
|--------|------------|-----------------------------|
| IDE Shell | Hoạt động | — |
| Program / wcommand Navigation | Hoạt động | SQL `wcommand`, Web.config |
| Left Explorer TreePanel (FS / Menu / DB) | Hoạt động | FS + wcommand + catalog SQL; UI chung — xem `EXPLORER_TREE_PANEL.md` |
| Form Designer | Prototype | Semantic → `LegacyDocument` → `FboDesignMapper` |
| Entity insight/edit | Phase 4+ | `EntitySymbol` graph + `EntityInsightProvider` |
| SQL Studio | Prototype | `FboSqlFragmentExtractor`, `SqlScriptRunner` |
| XML Structure / F12 | Phase 5 transition | Syntax projection + workspace symbol index |
| Template Manager | Stub | In-memory |
| Language Service | Phase 1–5 | Semantic/entity binder + symbol index + insights |

Các parser/scanner hiện tại được xem là **adapters tạm thời**. Không thêm
parser XML mới trong UI hoặc ViewModel. Tính năng mới phải đi qua Language
Service contracts (Phase 1+).

## 5. To-Be: ERP Language Service

```text
Storage (XML / .f / Include / SQL / wcommand)
                │
                ▼
ERP Language Service
├── Workspace & Document Store
├── Lossless Syntax Tree
├── Semantic Binder
├── ERP Semantic Model
├── Symbol Table & References
├── Diagnostics / Navigation / Search
├── Insight Provider Pipeline
└── Serializer
                │
                ▼
Merged Insight Collection
                │
                ▼
Rendering Engine → Source / Insight / Designer
```

Document thống nhất:

```text
ErpDocument
├── StorageSnapshot
├── SyntaxTree
├── SemanticModel
├── Diagnostics
└── Version / IsDirty
```

Ba mode chuẩn là Source / Insight / Designer trên cùng `ErpDocument`.
Entity là `EntitySymbol`, không phải `string → string` map.

Phase 4 đã thay entity scanner/expander bằng `EntitySymbolBinder`; definition,
references, nested include, diagnostics và semantic edit đều đi qua
`IErpLanguageService`.

Theo Architecture Freeze 1.0, `InsightItem` là model render chung.
`EntityInsightProvider` và `ValidationInsightProvider` chỉ đọc Semantic Model;
AvalonEdit chỉ render collection đã merge. Bật/tắt Insight không parse/reload XML.

## 6. Quality gates

- `dotnet build DevWorkFlow.slnx` thành công, 0 warning ưu tiên.
- `dotnet test DevWorkFlow.slnx` thành công.
- Không dependency ngược layer.
- Không XML parsing mới trong UI/ViewModel.
- Commit nhỏ, một mục đích.

## 7. Tài liệu liên quan

- [`PRODUCT_VISION.md`](PRODUCT_VISION.md)
- [`PROJECT_STATUS.md`](PROJECT_STATUS.md)
- [`ROADMAP.md`](ROADMAP.md)
- [`AI_RULES.md`](AI_RULES.md)
- [`ERP_LANGUAGE_SERVICE.md`](ERP_LANGUAGE_SERVICE.md)
- [`DECISIONS.md`](DECISIONS.md)
