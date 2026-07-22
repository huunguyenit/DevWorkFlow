# Phase 0 — Editor Unblock: Keys + Document Tab Menu

Date: 2026-07-22  
Status: Ready for planning  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 0)  
Related: ADR-0002 Monaco, `UI/Views/Controls/MonacoEditorHost.xaml.cs`, `UI/Assets/EditorHost/bridge.js`,  
`UI/Views/Shell/DocumentTabBar.xaml`, `UI/ViewModels/Shell/DocumentItemVm.cs`, `IdeShellViewModel`

---

## 1. Goal

Unblock thao tác hàng ngày trên editor Monaco (WebView2) và document tab:

1. **Keys:** `Home` / `End` / `PageUp` / `PageDown` và `Shift+Home` / `Shift+End` (cùng `Shift+PageUp` / `Shift+PageDown` nếu cùng root cause) di chuyển caret/selection trong Monaco đúng chuẩn.
2. **Tab menu:** Right-click document tab → **Pin**, **Copy full path**, **Open in File Explorer**.

---

## 2. In scope

| # | Hạng mục | Done when |
|---|----------|-----------|
| 2 | Navigation keys trong `MonacoEditorHost` (Form Builder Source/Insight; mọi host dùng cùng control) | Caret/selection đổi đúng; không nhảy tab AvalonDock / RadioButton |
| 1 | Context menu trên `DocumentTabBar` | 3 lệnh hoạt động; Pin có indicator trên tab |

## 3. Out of scope

- Close Others / Close Right / Copy relative path (P6-23)
- Pin persistence across sessions
- SQL AvalonEdit (`BindableSqlEditor`) key behavior (không WebView2) — chỉ xác nhận không regression nếu chạm shell
- Phase 1+ entity hover/nav
- Sửa `bridge.js` tokenizer / business logic

---

## 4. Current state (code)

### 4.1 Keys

- Editor form: `InsightEditorSurface` → `MonacoEditorHost` → WebView2 → `Assets/EditorHost/index.html` + `bridge.js`.
- `MainWindow` **đã tránh** CommandBinding NoOp cho Cut/Copy/Paste/Undo… vì airspace WebView2 nuốt phím (comment ~L99–112) — **không** phải nguyên nhân Home/End.
- Không thấy `Key.Home`/`PageUp` trong `IdeCommands`.
- Document workspace nằm trong **AvalonDock** `LayoutDocumentPane` + custom `DocumentTabBar` dùng **`RadioButton` + `GroupName="IdeDocuments"`**.
- Pattern đã biết (WebView2Feedback #2052, Rick Strahl): WebView2 `AcceleratorKeyPressed` đưa phím non-character (Home/End/PgUp/PgDn) vào cây WPF; **TabControl / ScrollViewer / group navigation** xử lý → Monaco không nhận.

**Giả thuyết làm việc (xác nhận khi implement):** AvalonDock document chrome và/hoặc `RadioButton` group nuốt Home/End/Page*; fix bằng cách **không để parent WPF Handle** các phím đó khi focus thuộc WebView2 — Monaco vẫn nhận phím (không `Handled=true` trên `AcceleratorKeyPressed` theo hướng “chặn browser”).

### 4.2 Tabs

- `DocumentItemVm`: `Id`, `Title`, `FilePath`, `IsDirty`, `IsActive`, `ContentVm` — **chưa** `IsPinned`.
- `DocumentTabBar.xaml`: chỉ Activate + Close; **không** ContextMenu.
- `IdeShellViewModel.CloseDocument`: remove tab, chọn neighbor — **chưa** tôn trọng pin (Close All chưa có; Phase 0: đóng từng tab bằng ✕ vẫn được, kể cả khi pinned — giống VS Code single close; pin chủ yếu giữ tab + visual).
- Chưa có helper Reveal-in-Explorer / Copy path dùng chung.

---

## 5. Design

### 5.1 Keys — `MonacoEditorHost`

Sau `EnsureCoreWebView2Async` thành công:

1. Gắn `CoreWebView2.Controller.AcceleratorKeyPressed` (hoặc tương đương trên control) để **quan sát** virtual key.
2. Với `Home`, `End`, `Prior` (PageUp), `Next` (PageDown) (± Shift): đảm bảo event **không bị parent AvalonDock/RadioButton consume**.
   - Cách ưu tiên: trên `MonacoEditorHost` / `WebView2`, trong bubble `KeyDown`/`PreviewKeyDown` từ accelerator routing, **không** gọi logic scroll/tab; nếu cần, set handled ở tầng **chỉ chặn parent** theo pattern AvalonDock/TabControl override (Rick Strahl: parent `OnKeyDown` return early cho Home/End) **hoặc** `KeyboardNavigation` tắt trên `DocumentTabBar`.
   - Cách bổ sung nếu vẫn fail: custom wrapper / hook AvalonDock document host — ghi rõ trong PR nếu phải đụng AvalonDock.
3. **Không** `e.Handled = true` trên `AcceleratorKeyPressed` theo nghĩa “host nuốt, browser bỏ” trừ khi đã chứng minh Monaco nhận phím bằng đường khác (inject `editor.trigger`).
4. Verify tay: Source + Insight; document đơn + nhiều tab; Shift+Home/End chọn về đầu/cuối dòng.

**Fallback (chỉ nếu WPF-steal không sửa được):** trong bridge, đăng ký keybinding Monaco tường minh `cursorHome` / `cursorEnd` / `cursorPageUp`… — kém ưa vì lệch “native Monaco”; ghi nợ nếu buộc dùng.

### 5.2 Tab context menu

**UI:** `DocumentTabBar` — `ContextMenu` trên mỗi tab (`RadioButton` hoặc border tab), right-click không bắt buộc activate trước (nên activate tab được click để command đúng document).

| Menu | Hành vi |
|------|---------|
| **Pin** / **Unpin** | Toggle `DocumentItemVm.IsPinned`; header đổi theo state; icon ghim nhỏ trên tab khi pinned |
| **Copy full path** | `Clipboard.SetText(FilePath)` nếu có path; nếu null/empty → disable item hoặc Status/toast “Tab không có đường dẫn file” |
| **Open in File Explorer** | Nếu `File.Exists(FilePath)` → `Process.Start(new ProcessStartInfo { FileName = "explorer.exe", Arguments = $"/select,\"{full}\"", UseShellExecute = true })`; nếu chỉ có thư mục tồn tại → open folder; còn lại → IdeMessage/Status lỗi ngắn |

**Commands:** đặt trên `IdeShellViewModel` (cùng chỗ `CloseDocumentCommand`):

- `TogglePinDocumentCommand`
- `CopyDocumentPathCommand`
- `RevealDocumentInExplorerCommand`

**Close vs Pin (Phase 0):** nút ✕ vẫn đóng tab đang pinned (không chặn). Không implement Close All trong phase này. Open point roadmap “Close All tôn trọng pin” → Phase 6 / P6-23.

**Visual:** PackIcon `Pin` / `PinOff` (MaterialDesign) cạnh title khi `IsPinned`; menu header “Pin” ↔ “Unpin”.

### 5.3 Architecture constraints

- Không parse XML trong tab menu.
- Không business FBO trong `bridge.js` cho việc này.
- Helper OS (`RevealInExplorer`, clipboard) có thể để `UI/Services/` static nhỏ hoặc method private shell — không tạo Utils/Helpers folder chung.

---

## 6. Testing

| Loại | Nội dung |
|------|----------|
| Manual (bắt buộc) | Keys trong Monaco Source/Insight; Shift select; nhiều document tab |
| Manual | Pin toggle + icon; Copy path → paste Notepad; Reveal chọn đúng file trong Explorer |
| Unit (nên có) | Pure helpers: argument `/select,"path"`; `IsPinned` toggle không đụng collection; Copy/Reveal no-op khi `FilePath` null (testable method trả enum/result) |
| Không bắt buộc | UI automation WebView2 |

---

## 7. Risks

| Risk | Mitigation |
|------|------------|
| Fix keys phải đụng AvalonDock nội bộ | Cô lập hook; comment link WebView2Feedback; fallback Monaco keybinding |
| RadioButton group bắt Home/End | `KeyboardNavigation.DirectionalNavigation="None"` trên tab bar + verify |
| Path UNC / file chưa lưu (`sql://…`) | Disable Reveal/Copy hoặc copy Id; không crash |
| Process.Start bị AV chặn | try/catch + IdeMessage |

---

## 8. Success criteria

- [ ] Home/End đưa caret đầu/cuối dòng (hoặc đầu/cuối wrapped line theo Monaco default).
- [ ] PageUp/PageDown cuộn/caret theo Monaco default.
- [ ] Shift+Home / Shift+End mở rộng selection.
- [ ] Right-click tab: Pin, Copy full path, Open in File Explorer.
- [ ] Pin hiện icon; Unpin đổi menu.
- [ ] Build `DevWorkFlow.slnx` xanh; không regression Close/Activate tab.
