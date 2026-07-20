# Prompt — Project Web Skin MVP (handoff cho Claude)

> Copy toàn bộ nội dung từ mục **PROMPT BẮT ĐẦU** trở xuống vào Claude Code / Claude session mới.
> Không implement ngoài phạm vi MVP. Không làm Visual Designer / HTML Generator / Overlay trong task này.

---

## PROMPT BẮT ĐẦU

```text
# Task: Project Web Skin MVP — capture shell + sync assets + xem skin trống

Bạn đang làm việc trong repo DevWorkFlow (WPF IDE cho FBO ERP, .NET, solution `DevWorkFlow.slnx`).

## Mục tiêu

Chứng minh Designer sẽ chạy trên **web runtime thật** của từng ERP Program bằng cách:

1. Lần đầu: user login site ERP trong IDE (WebView2) → lấy HTML shell (chrome only).
2. Chuẩn hóa vùng content host theo heuristic FBO.
3. Sync CSS / JS / image từ cấu trúc Program trên đĩa (không cần login lại).
4. Mở WebView2 xem skin trống (chưa nhúng form đang design).

Nguyên tắc gốc: `docs/04-DESIGNER_PLATFORM.md` — *What You Design Is What Runtime Executes.*
Skin này là nền cho Designer Platform sau này; MVP **không** làm Designer đầy đủ.

## Quyết định đã khóa (KHÔNG hỏi lại, KHÔNG đổi trừ khi vi phạm architecture)

| Chủ đề | Quyết định |
|--------|------------|
| Vai trò template | **A** — chỉ shell/chrome; vùng form trống để sau này HTML Generator nhúng |
| Cách lấy shell | **D Hybrid** — lần đầu login trong IDE (WebView2); sau đó chỉ refresh assets từ Program; login lại chỉ khi user bấm “Cập nhật skin” |
| Xác định host | **C** — heuristic theo convention FBO (container form chuẩn); chưa cần UI chọn vùng; cho phép override selector trong manifest sau |
| Nơi lưu | **C** — `%AppData%/DevWorkFlow/skins/<project_id>/` — local máy, không commit vào repo Program |
| MVP exit | **A** — capture + lưu + resolve assets + Navigate xem skin trống. Chưa nhúng form, chưa Overlay, chưa Generator |
| Kiến trúc | **Skin Service độc lập** (`IProjectSkinService`) — không nhét vào FormBuilderViewModel |

## Ngoài phạm vi (CẤM làm trong task này)

- Parse XML / đụng Language Service / Semantic Model / Layout Model
- HTML Generator / DOM Patch / Designer Runtime (drag, resize, overlay, selection)
- Nhúng nội dung form đang mở vào host
- Commit skin vào git / Program tree
- Đổi Left Panel UX
- Unification Designer `Fbo*` ↔ Semantic (ADR-0006) — task riêng

## Kiến trúc bắt buộc

```
WPF Shell (UI)
    │  “Lấy skin” / “Cập nhật skin” / “Xem skin” / “Refresh assets”
    ▼
IProjectSkinService  (Application contract)
    ├── CaptureShellAsync(project_id, base_url, ...)
    ├── RefreshAssetsAsync(project_id, program_root)
    ├── EnsureHostAsync(project_id)          // heuristic FBO → placeholder host
    ├── GetSkinEntryPath(project_id)         // path shell.html để Navigate
    └── HasSkin(project_id) / GetManifest(...)
    ▼
Infrastructure
    ├── WebView2SkinCaptureHost   // chỉ capture; TÁCH khỏi Monaco Editor WebView2
    ├── ProgramAssetResolver      // map URL/relative path → file trong Program
    ├── FboHostNormalizer         // tìm container form chuẩn, chèn host trống
    └── LocalSkinStore            // %AppData%/DevWorkFlow/skins/<project_id>/
```

### Cấu trúc cache

```
%AppData%/DevWorkFlow/skins/<project_id>/
  shell.html       # HTML đã chuẩn hóa, có vùng host trống
  manifest.json    # base_url, captured_at, host_selector, asset entries, program_root hint
  assets/          # css, js, images đã mirror/sync
```

### Ranh giới cứng (docs/04-DESIGNER_PLATFORM.md + ADR)

- Skin Service **không** parse XML, không sửa Semantic, không sinh HTML form.
- Capture WebView2 **tách** khỏi Editor WebView2 (Monaco) và Designer WebView2 (tương lai).
- UI chỉ gọi service; không scrape HTML trong code-behind lung tung.
- `project_id` phải ổn định theo project/program đang mở trong Workspace (dùng id/path đã có trong app — tìm convention hiện tại, đừng invent song song).

## Luồng hành vi

### Lần đầu (chưa có skin)

1. User nhập/chọn `base_url` của site ERP (từ project settings nếu đã có).
2. IDE mở WebView2 capture → user login thủ công.
3. Sau khi trang shell load (detect navigation ổn định / user bấm “Dùng trang này”).
4. Service lấy `document.documentElement.outerHTML` (hoặc tương đương an toàn).
5. `FboHostNormalizer`: tìm container content FBO → xóa/inner clear → chèn placeholder
   (ví dụ `<div id="dwf-designer-host" data-dwf-host="true"></div>`).
6. Rewrite relative URL của CSS/JS/img sang `assets/` local hoặc path file:// / virtual host
   mà WebView2 preview dùng được.
7. `RefreshAssetsAsync`: copy/mirror file từ `program_root` theo danh sách link trong HTML
   (và/hoặc quy ước thư mục static quen thuộc của FBO Program nếu tìm thấy trong codebase/docs).
8. Ghi `shell.html` + `manifest.json`.
9. “Xem skin” → Navigate WebView2 preview tới shell local.

### Lần sau

- Mở project: nếu `HasSkin` → có thể Refresh assets từ Program (không login).
- “Cập nhật skin” → chạy lại capture (login) + normalize + refresh assets.
- “Refresh assets” → chỉ `RefreshAssetsAsync`, giữ shell.html/host.

### Host heuristic (FBO)

- Implement danh sách selector/candidate có thứ tự ưu tiên (class/id container content quen thuộc FBO).
- Nếu không khớp: ghi rõ trong manifest `host_status=not_found`, vẫn lưu shell thô; UI báo cần cập nhật heuristic / override sau — **MVP không bắt buộc UI picker**.
- Document các selector đã thử trong code comment ngắn + trong manifest.

## Việc cần làm (thứ tự)

1. **Plan Mode trước**: liệt kê file tạo/sửa theo layer (Application contract, Infrastructure, UI entry tối thiểu, tests). Trình bày ngắn để đối chiếu scope MVP; rồi implement.
2. Tạo `IProjectSkinService` + models (`SkinManifest`, …) đúng layer.
3. `LocalSkinStore` đọc/ghi AppData.
4. `FboHostNormalizer` + unit tests (HTML fixture mẫu → có `#dwf-designer-host` hoặc tương đương).
5. `ProgramAssetResolver` + tests (map path tương đối → file dưới program_root; bỏ qua URL ngoại vi http tuyệt đối nếu chưa mirror được — ghi vào manifest `unresolved`).
6. `WebView2SkinCaptureHost` + UI tối thiểu để login/capture (tách control/window; tái sử dụng pattern WebView2 từ `MonacoEditorHost` nếu hợp lý nhưng **không** dùng chung instance Monaco).
7. Preview host: Navigate tới skin entry.
8. Đăng ký DI trong `UI/App.xaml.cs` (pattern hiện có).
9. Cập nhật ngắn `.ai/CURRENT_STATE.md` và/hoặc spec note: “Project Web Skin MVP landed; Designer Generator chưa nối”.
10. `dotnet build DevWorkFlow.slnx` + test cho phần skin mới.

## Acceptance criteria

- [ ] Với project có `program_root` + `base_url`, user login một lần và lưu được skin local.
- [ ] `shell.html` có placeholder host (hoặc manifest ghi `host_status=not_found` rõ ràng).
- [ ] CSS/JS/image resolve được từ Program được mirror vào `assets/` và skin preview không vỡ hoàn toàn (chrome hiển thị).
- [ ] “Refresh assets” không yêu cầu login.
- [ ] “Cập nhật skin” yêu cầu capture lại.
- [ ] Không parse XML; không sửa Form Builder semantic path.
- [ ] Build xanh; có unit test cho normalizer + asset resolver.

## Tài liệu bắt buộc đọc trước khi code

- `docs/04-DESIGNER_PLATFORM.md` (vision + ranh giới Designer)
- `CLAUDE.md` / `.ai/ARCHITECTURE_SUMMARY.md` (R1–R10)
- `.ai/CURRENT_STATE.md` (debt Designer dual model — đừng làm nặng thêm)
- Pattern WebView2 hiện có: `UI/Views/Controls/MonacoEditorHost.xaml.cs`
- Cách project/program path được model trong Workspace / Explorer (đừng tạo id song song)

## Cách làm việc

1. Vào Plan Mode, TodoWrite các bước trên.
2. Không mở rộng sang HTML Generator / Overlay.
3. Prefer snake_case cho biến local C# mới trong UI/script-adjacent code theo user rule project khi viết JS trong bridge; C# public API giữ PascalCase theo chuẩn repo.
4. Kết thúc bằng bảng Exit Criteria: Done / Chưa Done + lý do.
5. Nếu thiếu selector FBO thật: implement pluggable candidate list + TODO có căn cứ; không hardcode một id bịa và coi như xong khi không verify được.

## Ngôn ngữ

Trả lời và ghi chú commit/docs bằng tiếng Việt khi giao tiếp với user; tên symbol code theo convention repo (English PascalCase).
```

## PROMPT KẾT THÚC

---

## Ghi chú phiên brainstorm (cho người maintain)

- Ngày: 2026-07-20
- Nguồn: thảo luận dựa trên `docs/04-DESIGNER_PLATFORM.md`
- Approach đã chọn: Skin Service độc lập
- Phần thiết kế đã chốt với user: kiến trúc MVP (phần 1)
- Chưa viết implementation plan chi tiết (`writing-plans`) — Claude nhận prompt tự plan rồi code trong phạm vi MVP
