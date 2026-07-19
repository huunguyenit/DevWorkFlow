# Project Explorer

Module: explorer
Status: Implemented (phạm vi hẹp — không có Context Menu/session persistence, xem Gap)
Related Architecture: 04-TREE_FRAMEWORK.md, ADR-0003-TreeDataSource.md
Related Specs: outline.md, ../database/database-explorer-tree.md

---

# Purpose

Project Explorer là consumer chính của Tree Framework, hiển thị cấu trúc file/folder của
một ERP Program (ví dụ SP226) để lập trình viên mở file làm việc. Spec này mô tả hành vi
thực tế của Explorer — lazy loading, search, refresh, mở file — dựa trên
`FileSystemDataSource` + `VirtualTreeEngine`, KHÔNG lặp lại kiến trúc Tree Framework
(xem 04-TREE_FRAMEWORK.md/ADR-0003 cho phần đó).

# User Story

- Là lập trình viên, tôi muốn duyệt cây thư mục Program ERP mà không phải chờ tải toàn bộ
  hàng nghìn file cùng lúc, để mở IDE nhanh.
- Là lập trình viên, tôi muốn gõ từ khoá và thấy ngay các file khớp được lọc trong cây,
  để tìm file nhanh hơn duyệt thủ công.
- Là lập trình viên, tôi muốn double-click một file để mở đúng Editor tương ứng (SQL,
  Form XML), để không phải tự chọn loại Editor.

# Functional Requirements

1. Khi Explorer được mở cho một Program, root path phải được set vào
   `FileSystemDataSource` và cây hiển thị ngay 1 (hoặc vài) node gốc — không tải toàn bộ
   cây con ngay lập tức.
2. Khi người dùng mở rộng (expand) một node thư mục, children của node đó mới được tải
   (lazy loading), hiển thị placeholder trong lúc chờ.
3. Một số file/folder theo quy ước FBO phải bị ẩn hoặc gộp cặp theo cấu hình (ví dụ cặp
   `.f`/`.xml` cho Dir/Grid/Filter) — hành vi này do cấu hình (`AppConfigStore`) quyết
   định, không hardcode trong Tree Framework core.
4. Khi người dùng gõ từ khoá tìm kiếm, hệ thống phải tìm trên `FileSystemDataSource`
   (không phải duyệt UI đã render), giới hạn số kết quả tối đa theo cấu hình, và tự động
   mở rộng các node cha của kết quả khớp để hiển thị.
5. Tìm kiếm phải debounce theo cấu hình (không gọi Search mỗi keystroke ngay lập tức).
6. Double-click vào một file phải mở đúng loại Editor tương ứng theo phần mở rộng
   (**cập nhật 2026-07-19**): `.sql` → SQL Studio; `.xml`/`.f` → Form Document
   (Insight/Source/Designer); mọi file text khác (`.aspx`, `.ent`, `.txt`, `.js`,
   `.css`, ...) → mở dạng code-only (KHÔNG còn chặn `.aspx`). File nhị phân editor
   không đọc được (Excel/Crystal Report/ảnh/dll/zip/pdf...) bị CHẶN theo config
   `Explorer.BlockedOpenExtensions` (`explorer.json`), báo StatusText rõ ràng thay vì
   mở ra nội dung rác.
7. Có một hành động Refresh thủ công để tải lại toàn bộ cây từ đầu.

# UI Behavior

- Explorer dùng Tree Framework chung (không tự vẽ TreeView riêng) — icon/badge theo Icon
  Provider của Tree Framework.
- UI virtualization qua `VirtualizingStackPanel` (`VirtualizingMode=Recycling`) — chỉ
  row đang trong viewport được render.
- Không dùng Tooltip/Popup cho thông tin chính (theo 07-UI_GUIDELINES.md).

# Data Flow

```
ProjectExplorerViewModel.RebuildTreeAsync
    ↓
FileSystemDataSource.SetRoot(program.ProgramPath)
    ↓
TreeFrameworkHost.AttachAsync  →  VirtualTreeEngine + TreeRenderingEngine (mới, thay thế
                                    engine cũ — state cũ bị dispose, xem Gap)
    ↓
Expand node  →  VirtualTreeEngine.ExpandAsync  →  Placeholder  →
    TreeLoadScheduler (priority queue, cancellable)  →
    FileSystemDataSource.GetChildrenAsync  →  thay Placeholder bằng children thật
    ↓
Double-click file  →  OpenFilePath  →  route theo extension
    (.sql → SqlStudioNavigator | .xml/.f → FormDocumentNavigator | .aspx → chưa hỗ trợ)
```

Search:

```
Người dùng gõ từ khoá
    ↓
TreeFrameworkHost.DebounceFilterAsync (debounce theo cấu hình Explorer.FilterDebounceMs)
    ↓
FileSystemDataSource.SearchAsync(keyword, ct)  (re-walk file tree, giới hạn SearchMaxHits)
    ↓
VirtualTreeEngine.ApplySearchMatchesAsync(hits, ct)  (mở rộng ancestor của kết quả, lọc
                                                        hiển thị chỉ node khớp/ancestor)
```

# State Machine

```
[Chưa mở Program]
    │ Program được chọn/mở
    ▼
[Root node hiển thị, children chưa tải]
    │ Expand
    ▼
[Placeholder hiển thị] ──(background load)──▶ [Children thật hiển thị, cache theo LRU]
    │ Collapse trước khi load xong
    ▼
[Load bị Cancel]
```

# Events

Tree Framework core phát `VisibleRowsChanged` (coarse-grained) và
`TreeRenderingEngine.SelectionChanged`/`NodeActivated` — Explorer lắng nghe
`NodeActivated` để xử lý mở file. Không có Event `NodeInserted`/`NodeRemoved`/`NodeUpdated`
riêng lẻ theo ADR-0003 (xem Gap ở `04-TREE_FRAMEWORK.md` — chưa implement đủ Event Model).

# Commands

- **Refresh** — tải lại toàn bộ cây (`RebuildTreeAsync`).
- **Open File** (double-click) — mở Editor tương ứng.
- **Expand/Collapse** — qua Tree Framework core.

**Không có**: Rename, Delete, New File, New Folder, Copy/Cut/Paste — chưa có
`ITreeCommandProvider` nào được gắn cho `FileSystemDataSource`, nên right-click hiện
không hiển thị Context Menu nào trong Project Explorer.

# Integration

- Dùng Tree Framework core (`DevWorkFlow.Tree`) — không tự vẽ Tree riêng (Rule R4 tuân
  thủ: `FileSystemDataSource` nằm ở Infrastructure, Tree Framework core không biết XML/
  FBO).
- Mở file điều hướng qua `SqlStudioNavigator`/`FormDocumentNavigator` — không tự Parse
  nội dung file để quyết định Editor (chỉ dựa theo extension).
- Extension Point: `ITreeCommandProvider`, `ITreeDragDropHandler` đã tồn tại ở tầng Tree
  Framework core nhưng **chưa có implementation nào gắn cho Project Explorer** — đây là
  điểm mở rộng có sẵn, chưa dùng tới, không phải thiếu framework.

# Performance

- ADR-0003 định target: Expand < 50ms, Search < 100ms, Refresh Node < 30ms, không treo UI
  ở 100.000 node. **Các target này chưa được đo/assert bằng test hiệu năng nào** — chỉ có
  test cấu trúc (`VirtualTreeEngineTests`) xác nhận số lượng visible row đúng ở quy mô
  100k node, không đo thời gian.
- Virtualization (logic, qua `VirtualTreeEngine`) + Virtualization UI (qua WPF
  `VirtualizingPanel`) đều đã có — đúng mô hình 2 tầng theo ADR.
- LRU cache có triển khai thật (`EvictLru_NoLock`), nhưng dùng hard eviction (Dictionary +
  LinkedList), không phải "Weak Reference" như mô tả trong ADR-0003 mục Cache Strategy —
  khác biệt về cơ chế, không phải thiếu tính năng.

# Error Handling

| Tình huống | Hành vi mong đợi |
|---|---|
| Double-click file `.aspx` | (Cập nhật 2026-07-19) Mở bình thường dạng code-only — không còn chặn. |
| Double-click file nhị phân (`.xlsx`/`.rpt`/`.png`/`.dll`/...) | Chặn theo `Explorer.BlockedOpenExtensions`, StatusText "File nhị phân, không mở được trong editor: ..." — không mở nội dung rác, không crash. |
| Search trả về nhiều hơn `SearchMaxHits` | Bị cắt bớt theo giới hạn cấu hình (mặc định 400) — không có thông báo "còn nhiều kết quả hơn" cho người dùng (gap UX). |
| Collapse node trong lúc đang tải children | Load task bị Cancel qua `CancellationToken`, không lỗi, không rò rỉ task chạy ngầm. |

# Future Extension

- Context Menu (Rename/Delete/New File/New Folder) cho Project Explorer — điểm mở rộng
  đã có sẵn ở tầng Tree Framework (`ITreeCommandProvider`), chỉ cần implement và gắn vào
  `FileSystemDataSource`.
- Drag-and-drop (Move/Copy) — plumbing đã có ở `TreeControl`, cần
  `ITreeDragDropHandler` implementation.
- Lưu trạng thái Expanded/Selected/Scroll giữa các phiên làm việc (session persistence) —
  hiện bị mất mỗi khi `RebuildTreeAsync`/Refresh chạy (state sống trong
  `VirtualTreeEngine`/`TreeRenderingEngine`, bị dispose khi tạo engine mới) — lệch mục
  tiêu ADR-0003 "Lưu trạng thái giữa các phiên làm việc".
- Fuzzy Search + highlight kết quả khớp trong UI (hiện chỉ substring match, không
  highlight).

# Acceptance Criteria

- [ ] Given một Program với 10.000 file, When Explorer mở lần đầu, Then chỉ node gốc
      được tải ngay (không có delay do tải toàn bộ cây).
- [ ] Given một node thư mục con chưa từng expand, When người dùng click expand, Then
      Placeholder hiển thị ngay, sau đó được thay bằng children thật khi tải xong.
- [ ] Given người dùng collapse một node đang trong quá trình tải children, When kiểm
      tra, Then task tải bị Cancel, không có Exception nào bị ném ra ngoài UI.
- [ ] Given người dùng gõ từ khoá khớp với 5 file nằm rải rác trong cây, When search hoàn
      tất, Then cả 5 file hiển thị và các node cha của chúng tự động mở rộng.
- [ ] Given người dùng double-click file `.sql`, When mở, Then SQL Studio được mở với
      đúng file đó (không phải Form Document editor).
- [ ] Given người dùng right-click vào một file trong Project Explorer, When kiểm tra,
      Then không có Context Menu nào hiện ra (xác nhận gap hiện tại, dùng làm test hồi
      quy khi Context Menu được implement — lúc đó test này cần được cập nhật/xoá).
