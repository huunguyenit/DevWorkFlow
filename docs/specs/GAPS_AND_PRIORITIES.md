# Gaps & Priorities

Ngày viết: 2026-07-19. Tổng hợp từ 12 spec đã viết trong `docs/specs/**` (dựa trên đọc
trực tiếp mã nguồn, không chỉ đọc Architecture) + kết quả audit dead code cùng ngày.
Đây là tài liệu sống — cập nhật khi một mục được giải quyết hoặc phát hiện mục mới, không
phải snapshot đóng băng.

Mục đích: (1) liệt kê đầy đủ những gì code CHƯA đáp ứng so với Architecture/ADR/Roadmap,
(2) xếp ưu tiên xử lý — ưu tiên cao nhất luôn là vi phạm Rule đang hoạt động (Tier 0), sau
đó đến trôi kiến trúc cần quyết định (Tier 1), rồi mới đến tính năng thiếu ở Level hiện
tại (Tier 2). Level tương lai (Tier 3) không cần hành động bây giờ.

Không lặp lại chi tiết đã có trong từng spec — mỗi mục chỉ tóm tắt + link.

---

## Tier 0 — Vi phạm Rule đang hoạt động (ưu tiên xử lý trước tiên)

Đây là những chỗ code hiện tại đang **trực tiếp phá vỡ** một Rule đã "Accepted", không
phải chỉ thiếu tính năng.

1. **Outline có 2 implementation song song, một vi phạm Rule R1 + R7.**
   `XmlStructureOutlineViewModel` tự gọi `XmlStructureParser.Parse(xml)` (Rule R1: chỉ
   ERP Language Service được Parse XML) và điều hướng bằng offset/line
   (`NavigateToOffset`) thay vì `NodeId` (Rule R7). Bản đúng kiến trúc
   (`OutlineViewModel`) đã tồn tại song song — chỉ cần hợp nhất, không cần viết mới.
   → [`explorer/outline.md`](explorer/outline.md) mục Known Issue.

## Tier 1 — Trôi kiến trúc cần quyết định tường minh (ADR-level)

Không phải "sai" theo nghĩa vi phạm Rule đang tồn tại, nhưng mâu thuẫn với một ADR đã
Accepted hoặc với chính Roadmap — cần quyết định rõ ràng (không tự sửa ADR).

2. **ADR-0002 (Monaco+WebView2, đã reject AvalonEdit) vs. Editor thật dùng AvalonEdit.**
   Đã xác nhận với chủ dự án: giữ AvalonEdit tạm thời, không sửa ADR-0002.
   **Tiến độ 2026-07-19**: bước 1 (project `DevWorkFlow.Editor` +
   `IEditorPlatform`/`FormBuilderEditorPlatform` Adapter) đã xong, build+test xanh. Còn
   lại: (a) migrate 7 ViewModel consumer sang `IEditorPlatform` — từng cái một, có kiểm
   chứng; (b) Monaco Adapter thật (WebView2 + Message Bridge) — vẫn chưa có mốc thời gian.
   → [`editor/insight-editor-surface.md`](editor/insight-editor-surface.md).
3. **09-ROADMAP.md ghi "Level 1 — Workspace Foundation" nhưng code đã ở Level 2-4** (ERP
   Language Service khá đầy đủ, Go To Definition/Find References một phần, Layout
   Designer bán-tương tác thật). Roadmap cần viết lại để phản ánh đúng — ngoài phạm vi
   đợt này.
   → `docs/specs/README.md` mục Known Doc Drift #1.
4. **Designer đọc/ghi qua pipeline FBO riêng (`FboXmlParser`/`FboFormModel`/`XmlWriter`),
   song song với — không thống nhất vào — Semantic Model chính thức
   (`ErpSemanticBinder`).** ADR-0006 yêu cầu Semantic Model là Source of Truth DUY NHẤT;
   hiện có 2 mô hình dữ liệu cho cùng 1 file XML (Form layout mapped riêng, Symbol/Entity
   mapped riêng qua Language Service).
   → [`designer/form-builder-canvas.md`](designer/form-builder-canvas.md) mục Integration.

## Tier 2 — Tính năng thiếu trong phạm vi Level hiện tại (2-4)

Không vi phạm Rule, không mâu thuẫn ADR — chỉ đơn giản là promise trong Architecture docs
chưa có code tương ứng, trong phạm vi Capability Level mà code THỰC TẾ đã chạm tới.

5. **Không có Event nào được implement** (`DocumentChanged`, `SemanticChanged`,
   `DiagnosticsChanged`, `InsightChanged`, `NavigationChanged`) — đây là gap lớn nhất và
   lặp lại ở HẦU HẾT mọi spec đã viết. Toàn bộ đồng bộ hiện tại dựa vào WPF
   `PropertyChanged`/`DispatcherTimer` debounce trực tiếp, không phải Event-Driven như
   Core Principle #6 (00-VISION.md) yêu cầu. Đây nên là ưu tiên kỹ thuật cao nhất trong
   Tier 2 vì mọi tính năng Event-based khác (Plugin subscribe, AI Context cập nhật realtime)
   đều phụ thuộc nó.
   → mọi spec `language/*`, `editor/*`, `explorer/outline.md`, `designer/form-builder-canvas.md`.
6. **ERP Language Service không Incremental**: mỗi lần mở/sửa Document đều Parse lại +
   build lại Semantic Model + rebuild Navigation Map từ đầu, đồng bộ, không
   CancellationToken, không cache.
   → [`language/parsing-and-semantic-model.md`](language/parsing-and-semantic-model.md).
7. **Find References chỉ đầy đủ cho Entity**, các SymbolKind khác (Field/Command/View/...)
   chỉ trả về định nghĩa — chính code đánh dấu "Phase 5". Không có Rename/Refactoring
   Service, không có Formatting Service, không có Search Service trên Semantic Model.
   → [`language/symbol-navigation.md`](language/symbol-navigation.md).
8. **Editor**: Search không tìm theo Resolved Value (chỉ tìm raw `&Entity;`); Validation
   Insight không render inline (chỉ ở Problems/Insight Panel); Entity không tồn tại không
   có chỉ báo lỗi inline (im lặng); Entity vòng lặp hiển thị nhưng không có màu Error
   riêng; Undo/Redo cấp IDE là no-op stub (chỉ có Undo built-in của AvalonEdit, undo theo
   thao tác text chứ không theo Command).
   → [`editor/insight-editor-surface.md`](editor/insight-editor-surface.md).
9. **Explorer/Tree**: không Context Menu (Rename/Delete/New) ở Project Explorer/Outline/
   Database Explorer; Drag&Drop có plumbing nhưng zero handler; không lưu trạng thái
   Expanded/Selected/Scroll giữa các lần Refresh (chứ chưa nói tới giữa phiên làm việc);
   Search chỉ substring, không fuzzy; Event Model mỏng hơn ADR-0003 rất nhiều (thiếu
   NodeInserted/Removed/Updated/SearchCompleted).
   → [`explorer/project-explorer.md`](explorer/project-explorer.md).
10. **Database Explorer**: không Context Menu, không Run Query/Export Data trực tiếp từ
    Tree (chỉ mở script sang SQL Studio).
    → [`database/database-explorer-tree.md`](database/database-explorer-tree.md).
11. **Designer**: Toolbox kéo-thả control mới vào canvas chưa làm (tự nhận là stub trong
    comment); không có free-form move/resize (model không có toạ độ tự do); không có
    WYSIWYG in-place editing (input cell readonly, mọi edit qua Property Grid/Source).
    Insert/Split/Merge/Delete Column từng có code nhưng chưa từng có UI thật — đã xoá như
    dead code hôm nay (xem `GAPS` mục dưới); nếu cần lại, phải thiết kế UI từ đầu.
    → [`designer/form-builder-canvas.md`](designer/form-builder-canvas.md).
12. **Plugin System: hoàn toàn chưa có code** — không Plugin Loader, Manifest, Provider
    Registry, Extension Point nào tồn tại, dù "Everything is a Provider" là Core
    Principle #9 và nhiều spec khác (Insight Provider, Tree DataSource, Action Provider)
    giả định có thể mở rộng qua Plugin. Hiện tại **không thứ gì trong DevWorkFlow thực sự
    mở rộng được mà không sửa Core** — đây là khoảng cách lớn giữa triết lý và thực tế.
    → `docs/specs/plugin/README.md` (còn placeholder).

## Tier 3 — Thuộc Level tương lai (5-7), không cần hành động bây giờ

Liệt kê ngắn gọn để không ai nhầm tưởng đây là việc bị bỏ sót — đây là đúng kế hoạch
Roadmap, chỉ đơn giản là chưa tới lượt:

- AI Platform (Level 6) — hoàn toàn chưa có code.
- Workflow Automation Engine thật theo 05-WORKFLOW_ENGINE.md (Level 5) — Node/Connection/
  Scheduler/Action Dispatcher/Transaction Manager/Event Bus, không có gì tồn tại (prototype
  không liên quan đã bị xoá hôm nay, xem mục Dead code trong `docs/specs/README.md`).
- Plugin Marketplace, Cloud Workspace, Multi-user Collaboration, AI Pair Programming
  (Level 7).

---

## Cách dùng tài liệu này

Khi bắt đầu một phiên code mới: đọc Tier 0 trước — nếu còn mục nào, ưu tiên xử lý trước
mọi việc khác vì đó là vi phạm Rule đang hoạt động. Tier 1 cần quyết định của chủ dự án
trước khi code (không tự ý). Tier 2 là backlog kỹ thuật bình thường, chọn theo giá trị/
độ khẩn cấp. Tier 3 không làm trừ khi được yêu cầu rõ ràng vượt phạm vi Level hiện tại.
