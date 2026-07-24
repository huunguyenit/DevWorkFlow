# DevWorkFlow

**IDE chuyên biệt cho nền tảng FBO ERP** — WPF, .NET 10.

Không phải một text editor XML tổng quát, cũng không phải client runtime của ERP. DevWorkFlow là môi
trường phát triển nơi lập trình viên làm việc trực tiếp với **ERP Language** (XML + Entity + Command +
Workflow + SQL + JavaScript + Metadata) thay vì thao tác tay trên các tệp cấu hình rời rạc.

> Tài liệu định hướng đầy đủ: [`docs/00-VISION.md`](docs/00-VISION.md). Bộ quy tắc kiến trúc bắt buộc:
> [`CLAUDE.md`](CLAUDE.md) và [`.ai/ARCHITECTURE_SUMMARY.md`](.ai/ARCHITECTURE_SUMMARY.md).

---

## Mục đích sản phẩm

Giúp lập trình viên FBO ERP:

- Phát triển nhanh hơn, ít lỗi cấu hình hơn, dễ bảo trì và mở rộng hơn.
- Hiểu hệ thống nhanh hơn nhờ **Insight** hiển thị ngay trong Editor (giá trị Entity, validation,
  navigation...) thay vì phải tra cứu XML thủ công.
- Cho phép cả người không chuyên lập trình tham gia cấu hình qua công cụ trực quan (Designer).

**Triết lý cốt lõi:** XML chỉ là định dạng lưu trữ — Semantic Model (do ERP Language Service dựng) mới
là nguồn sự thật duy nhất; mọi tính năng thao tác trên Semantic, XML chỉ được sinh ra khi lưu (qua
Serializer). Điều hướng luôn theo Symbol/NodeId, không theo offset dòng.

**Không hướng tới:** cạnh tranh với Visual Studio/VS Code, làm IDE đa ngôn ngữ, hay trở thành client
runtime của ERP.

---

## Kiến trúc tổng quan

```text
UI (WPF shell)  →  Application  →  Core (Language | Editor | Tree | Workflow | Plugin | AI)  →  Infrastructure
```

- **Đọc:** XML → Parser → Semantic → Language Service → Application → UI.
- **Sửa:** User → Command → Language Service → Semantic → **Serializer (duy nhất được ghi XML)** → XML.

10 quy tắc cứng (R1–R10) bảo vệ ranh giới kiến trúc — ví dụ: UI không được parse XML/query DB, Editor
chỉ render (không chứa business logic), Tree framework không biết gì về ERP. Chi tiết:
[`.ai/ARCHITECTURE_SUMMARY.md`](.ai/ARCHITECTURE_SUMMARY.md).

---

## Đã có

| Khu vực | Trạng thái |
|---|---|
| Solution 6 layer (Domain/Application/Infrastructure/Tree/Editor/UI) + test projects | Có |
| IDE Shell WPF — Ribbon, dock 3 cột (Left/Center/Right, mỗi cột Top/Bottom), Status Bar | Có |
| **Left Panel** — Explorer (file), Menu Explorer (wcommand), DB Explorer + Outline ở band dưới, 5 nút pin/unpin | Có — layout v1.2, **đã khoá UX**, không đổi giao diện nếu không được yêu cầu |
| Menu Explorer đọc Program/Web.config, map `wcommand` → controller thật | Có |
| ERP Language Service: parse XML, dựng Semantic, Entity binding, chẩn đoán (diagnostics), điều hướng giới hạn | Một phần |
| Outline (cây cấu trúc form) | Có 2 bản song song — ưu tiên `OutlineViewModel` (dùng LS), bản XML-parse cũ đang bị loại bỏ |
| **Insight Editor** (chế độ Source): hiển thị ClearText (entity đã expand), tô nền theo nguồn entity, hover xem tên entity, Ctrl+Click mở entity (SYSTEM → tab mới) | Có |
| **Design tab (HTML Generator)**: render form/grid bằng HTML sinh trực tiếp từ XML→Semantic→Layout (không còn phụ thuộc capture giao diện gốc), có thước đo pixel (ruler) zoom/scroll | Có |
| **Layout Blueprint** (overlay trên Design tab): xem lưới cột/hàng, kéo resize cột, chọn Control/Slot/Region, kéo-thả field vào slot (từ Toolbox hoặc di chuyển field có sẵn), merge/split ô, thêm Footer/Tab, kéo chỉnh chiều cao vùng, kéo chỉnh anchor/split, xoá field (Delete), Ctrl+Click nhảy tới `<field>` trong Source | Có |
| Toolbox theo catalog cấu hình (`toolbox-controls.xml`): TextBox/DateTime/Numeric/CheckBox/ComboBox/AutoComplete/Lookup + Tab (Normal/Grid/Post/List), kéo-thả tạo field mới | Có (MVP) |
| Ghi ngược layout xuống XML kể cả khi view lấy field từ Entity (`&E;`) — chỉ patch đúng phần token/giá trị bị đổi, giữ nguyên phần còn lại | Có (v2, 2026-07-24) |
| SQL Studio (thực thi SQL, phím `F5`) | Một phần |
| Property Grid, Command Palette (theo spec) | Một phần |

## Chưa có

- **Plugin host** — kiến trúc Provider đã thiết kế nhưng **chưa có dòng code nào** chạy; mọi tính năng hiện tại vẫn sửa trực tiếp Core/UI.
- **Workflow Engine (L5)** — chỉ có spec, chưa implement (prototype cũ đã gỡ bỏ).
- **AI Native (L6)** — chưa có code.
- **Event bus của Language Service** (`DocumentChanged`/`SemanticChanged`/`DiagnosticsChanged`...) — UI hiện chưa lắng nghe sự kiện, còn phụ thuộc polling/parse lại toàn bộ.
- **Incremental parse + cancellation** — hiện là full reparse mỗi lần đổi.
- **Format / Rename / Semantic Search / Find References** (ngoài phạm vi Entity) — chưa có.
- **Monaco Editor + WebView2** — thiết kế đích (ADR-0002) nhưng đang dùng **AvalonEdit** làm giải pháp tạm qua `IEditorPlatform`.
- **Workspace index / persist layout / file watcher** — chưa có.
- **Undo/Redo cấp Command cho thao tác Design** — chưa có (P6+ backlog).
- **Replace-on-drop control khác trong Blueprint, rename field, DOM patch (thay vì reparse toàn bộ)** — backlog.
- Ghi ngược layout khi Entity thay đổi **số hàng** (thêm/xoá hàng trên view lấy dữ liệu từ entity) — chưa persist, chỉ giữ nguyên raw.
- 2 mô hình Form song song (`FboXmlParser/FboFormModel` cũ vs `ErpSemanticBinder` mới) chưa hợp nhất — nợ kiến trúc theo ADR-0006.

Danh sách nợ kỹ thuật & ưu tiên đầy đủ, cập nhật liên tục: [`.ai/CURRENT_STATE.md`](.ai/CURRENT_STATE.md)
và `docs/specs/GAPS_AND_PRIORITIES.md`.

---

## Phím tắt

| Phím | Chức năng |
|---|---|
| `Ctrl+N` | New |
| `Ctrl+O` | Open |
| `Ctrl+S` | Save |
| `Ctrl+Shift+S` | Save All |
| `Alt+F4` | Exit |
| `Ctrl+Z` / `Ctrl+Y` | Undo / Redo |
| `Ctrl+X` / `Ctrl+C` / `Ctrl+V` | Cut / Copy / Paste |
| `Delete` | Xoá (item chọn trong Explorer/Blueprint...) |
| `Ctrl+F` | Search |
| `Ctrl+H` | Replace |
| `F12` | Go to Definition |
| `Shift+F12` | Find References |
| `F5` | Execute SQL (trong SQL Studio) |
| `Ctrl+-` hoặc `Alt+←` | Navigate Back |
| `Ctrl+Shift+-` hoặc `Alt+→` | Navigate Forward |
| `Ctrl+Click` (trong Insight/Design) | Mở entity/field liên kết — SYSTEM mở tab mới, giữ nguyên caret tab cũ |
| `Esc` (khi kéo trong Layout Blueprint) | Huỷ thao tác kéo-thả |

Nguồn: [`UI/Commands/IdeCommands.cs`](UI/Commands/IdeCommands.cs). Điều hướng khác theo thiết kế (chưa
chắc đã bind phím): `Ctrl+Shift+P` Command Palette, `Ctrl+P` Quick Open, `Ctrl+Shift+F` Global Search —
xem [`.ai/UI_SUMMARY.md`](.ai/UI_SUMMARY.md).

---

## Thao tác cơ bản

**Build & test**

```bash
dotnet build DevWorkFlow.slnx
dotnet test tests/DevWorkFlow.Tree.Tests    # chạy đúng test project liên quan tới phần vừa sửa
```

**Luồng làm việc điển hình**

1. Mở một **Program** ERP (đọc `Web.config`, dựng cây Menu Explorer từ `wcommand`).
2. Chọn 1 form trong Explorer/Menu Explorer → mở trong Editor.
3. Chuyển giữa các chế độ của form: **Source** (Insight — XML đã expand entity, tô nền theo nguồn,
   read-only, sửa nội dung thật phải ở Source mode gốc), **Design** (render HTML trực quan, bật
   **Layout Blueprint** để kéo/resize/merge/split/drag field), **Outline** (cây cấu trúc, band dưới bên
   trái).
4. Thao tác trên Design/Blueprint ghi thẳng xuống Semantic rồi qua Serializer để cập nhật XML — không
   sửa tay XML bytes.
5. Dùng DB Explorer để duyệt database liên quan, SQL Studio để chạy truy vấn (`F5`).

---

## Hướng giải quyết / Ưu tiên kế tiếp

Thứ tự ưu tiên hiện tại (không tính theo lịch, theo mức độ chặn):

- **T0** — Hợp nhất Outline: bỏ `XmlStructureOutlineViewModel` (parse XML + điều hướng theo offset) →
  dùng LS + NodeId, tránh vi phạm R1/R7.
- **T1** — Chốt lộ trình migrate sang Monaco; hợp nhất 2 mô hình Form (`Fbo*` ↔ Semantic, ADR-0006);
  viết lại nhãn Level trong Roadmap cho khớp thực tế code.
- **T2** — Xây event surface cho Language Service (incremental + cancellable) → Find References/
  Format/Rename → hoàn tất migrate `IEditorPlatform` → Tree: menu ngữ cảnh/DnD/events/persist state →
  Designer: toolbox nâng cao/DnD mở rộng.
- **T3 (chưa bắt đầu trừ khi được yêu cầu)** — Workflow Engine (L5), AI Native (L6), Marketplace/Cloud (L7).

Roadmap theo cấp độ năng lực (không phải mốc thời gian), xem
[`.ai/ROADMAP_SUMMARY.md`](.ai/ROADMAP_SUMMARY.md):

| Level | Tên | Mục tiêu |
|---|---|---|
| 0 | Foundation | Solution, docs, DI, logging, theme |
| 1 | Workspace | Mở Program/XML, lưu, điều hướng cơ bản |
| 2 | ERP Language | Language Service ổn định; UI không tự parse |
| 3 | Intelligent Editor | GoTo/FindRef/Rename/fold/inlay cấp workspace |
| 4 | Visual | Designer 2 chiều với Semantic |
| 5 | Workflow | Designer + Runtime |
| 6 | AI Native | AI chỉ dùng LS/Workspace |
| 7 | Ecosystem | Marketplace, Cloud, Enterprise |

Code hiện tại chạm tới các mảnh của L2–L4 (Language Service, Insight, Designer) dù tài liệu roadmap vẫn
ghi "Level 1" — cần được relabel lại như một phần T1.

---

## Tài liệu

| File | Khi nào mở |
|---|---|
| [`.ai/CURRENT_STATE.md`](.ai/CURRENT_STATE.md) | Đang xây gì, ưu tiên, nợ kỹ thuật, câu hỏi mở |
| [`.ai/ARCHITECTURE_SUMMARY.md`](.ai/ARCHITECTURE_SUMMARY.md) | Layer, R1–R10, triết lý |
| [`.ai/ADR_SUMMARY.md`](.ai/ADR_SUMMARY.md) | Vì sao một quyết định được chọn (ADR 0001–0008) |
| `.ai/{ERP_LANGUAGE,EDITOR,TREE,UI}_SUMMARY.md` | Hợp đồng (contract) của từng domain |
| `.ai/{PLUGIN,WORKFLOW,ROADMAP}_SUMMARY.md` | Các level tương lai — chưa phải việc đang làm |
| `docs/*.md` | Bản đầy đủ dành cho người đọc — chỉ mở đúng file cần, không đọc cả bộ |

Điểm vào và luật bắt buộc: [`CLAUDE.md`](CLAUDE.md).
