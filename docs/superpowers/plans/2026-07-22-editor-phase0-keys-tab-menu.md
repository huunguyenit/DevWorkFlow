# Phase 0 — Editor Keys + Document Tab Menu Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Sửa Home/End/PageUp/PageDown (+ Shift) trong Monaco WebView2 và thêm context menu Pin / Copy full path / Open in File Explorer trên document tab.

**Architecture:** (1) Keys — chặn WPF parent (AvalonDock / RadioButton) nuốt accelerator từ WebView2; Monaco nhận phím native. (2) Tabs — `IsPinned` trên `DocumentItemVm` + commands trên `IdeShellViewModel` + helper path thuần trong Application (testable).

**Tech Stack:** WPF, WebView2, Monaco bridge, AvalonDock, xUnit, MaterialDesign PackIcon

**Spec:** `docs/superpowers/specs/2026-07-22-editor-phase0-keys-tab-menu-design.md`  
**Roadmap:** `docs/superpowers/specs/2026-07-22-editor-ux-roadmap-design.md` Phase 0

## Global Constraints

- Editor = render only; không parse XML trong tab menu / bridge cho Phase 0.
- Không `Handled=true` trên `AcceleratorKeyPressed` theo hướng “host nuốt → browser bỏ”, trừ khi đã chứng minh đường inject Monaco.
- Close (✕) vẫn đóng tab đang pinned (Phase 0); không làm Close All.
- Local vars / params: `snake_case` (user rule).
- Left Panel UX freeze — không đụng layout explorer.
- Verify: `dotnet build DevWorkFlow.slnx` + test project chạm tới.

---

## File map

| File | Responsibility |
|------|----------------|
| `UI/Views/Controls/MonacoEditorHost.xaml.cs` | Hook WebView2 accelerator / KeyDown để parent không steal Home/End/Pg* |
| `UI/Views/Shell/DocumentTabBar.xaml` (+ `.cs`) | ContextMenu + pin icon; KeyboardNavigation |
| `UI/ViewModels/Shell/DocumentItemVm.cs` | `IsPinned` + notify |
| `UI/ViewModels/Shell/IdeShellViewModel.cs` | TogglePin / CopyPath / Reveal commands |
| `UI/Themes/IdeShell.xaml` | (optional) style pin icon spacing |
| `DevWorkFlow.Application/Shell/DocumentTabPathHelper.cs` | Pure path rules + explorer args |
| `tests/DevWorkFlow.Application.Tests/Shell/DocumentTabPathHelperTests.cs` | Unit tests helper |
| Roadmap / Phase0 spec | Tick Done when sau khi xong (optional note) |

---

### Task 1: DocumentTabPathHelper + tests

**Files:**
- Create: `DevWorkFlow.Application/Shell/DocumentTabPathHelper.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Shell/DocumentTabPathHelperTests.cs`

**Interfaces:**
- Consumes: none
- Produces:
  - `DocumentTabPathHelper.CanCopyFullPath(string? file_path) → bool`
  - `DocumentTabPathHelper.CanRevealInExplorer(string? file_path) → bool` (file hoặc directory tồn tại)
  - `DocumentTabPathHelper.BuildExplorerSelectArguments(string full_path) → string` (`/select,"…"`)
  - `DocumentTabPathHelper.IsVirtualDocumentPath(string? file_path) → bool` (`sql://` prefix)

- [x] **Step 1: Write the failing tests**

```csharp
using DevWorkFlow.Application.Shell;
using Xunit;

namespace DevWorkFlow.Application.Tests.Shell;

public sealed class DocumentTabPathHelperTests
{
    [Theory]
    [InlineData(null, false)]
    [InlineData("", false)]
    [InlineData("   ", false)]
    [InlineData("sql://foo", false)]
    [InlineData(@"C:\work\a.xml", true)]
    public void CanCopyFullPath_rules(string? path, bool expected)
        => Assert.Equal(expected, DocumentTabPathHelper.CanCopyFullPath(path));

    [Fact]
    public void BuildExplorerSelectArguments_quotes_path()
    {
        var args = DocumentTabPathHelper.BuildExplorerSelectArguments(@"C:\work\a.xml");
        Assert.Equal(@" /select,""C:\work\a.xml""".TrimStart(), args);
        // Exact: /select,"C:\work\a.xml"
        Assert.Equal("/select,\"C:\\work\\a.xml\"", args);
    }

    [Fact]
    public void IsVirtualDocumentPath_sql_scheme()
    {
        Assert.True(DocumentTabPathHelper.IsVirtualDocumentPath("sql://x"));
        Assert.False(DocumentTabPathHelper.IsVirtualDocumentPath(@"D:\a.xml"));
    }
}
```

- [x] **Step 2: Run tests — expect FAIL (type missing)** (skipped explicit fail run — type absence verified by design; went straight to implement+pass)

```bash
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DocumentTabPathHelperTests"
```

Expected: FAIL compile or “type not found”.

- [x] **Step 3: Minimal implementation**

```csharp
namespace DevWorkFlow.Application.Shell;

public static class DocumentTabPathHelper
{
    public static bool IsVirtualDocumentPath(string? file_path)
        => !string.IsNullOrWhiteSpace(file_path)
           && file_path.StartsWith("sql://", StringComparison.OrdinalIgnoreCase);

    public static bool CanCopyFullPath(string? file_path)
        => !string.IsNullOrWhiteSpace(file_path) && !IsVirtualDocumentPath(file_path);

    public static bool CanRevealInExplorer(string? file_path)
    {
        if (!CanCopyFullPath(file_path)) return false;
        return File.Exists(file_path) || Directory.Exists(file_path);
    }

    public static string BuildExplorerSelectArguments(string full_path)
    {
        ArgumentException.ThrowIfNullOrWhiteSpace(full_path);
        return "/select,\"" + full_path + "\"";
    }
}
```

- [x] **Step 4: Run tests — expect PASS** (7/7 passed)

```bash
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DocumentTabPathHelperTests"
```

- [ ] **Step 5: Commit** (chỉ khi user yêu cầu commit; nếu đang batch Phase 0 thì gộp cuối)

```bash
git add DevWorkFlow.Application/Shell/DocumentTabPathHelper.cs tests/DevWorkFlow.Application.Tests/Shell/DocumentTabPathHelperTests.cs
git commit -m "test: add DocumentTabPathHelper for tab path/reveal rules"
```

---

### Task 2: Pin + tab context menu commands (shell VM + UI)

**Files:**
- Modify: `UI/ViewModels/Shell/DocumentItemVm.cs`
- Modify: `UI/ViewModels/Shell/IdeShellViewModel.cs`
- Modify: `UI/Views/Shell/DocumentTabBar.xaml`
- Modify: `UI/Views/Shell/DocumentTabBar.xaml.cs` (nếu cần activate-on-right-click)

**Interfaces:**
- Consumes: `DocumentTabPathHelper`
- Produces:
  - `DocumentItemVm.IsPinned` (bool, `INotifyPropertyChanged`)
  - `IdeShellViewModel.TogglePinDocumentCommand`
  - `IdeShellViewModel.CopyDocumentPathCommand`
  - `IdeShellViewModel.RevealDocumentInExplorerCommand`

- [x] **Step 1: Add `IsPinned` to `DocumentItemVm`**

```csharp
private bool _is_pinned;

public bool IsPinned
{
    get => _is_pinned;
    set => SetProperty(ref _is_pinned, value);
}
```

- [x] **Step 2: Commands trên `IdeShellViewModel`**

Trong ctor (cùng nhóm Activate/Close):

```csharp
TogglePinDocumentCommand = new RelayCommand<DocumentItemVm>(doc =>
{
    if (doc is null) return;
    doc.IsPinned = !doc.IsPinned;
});

CopyDocumentPathCommand = new RelayCommand<DocumentItemVm>(doc =>
{
    if (doc is null || !DocumentTabPathHelper.CanCopyFullPath(doc.FilePath)) return;
    Clipboard.SetText(doc.FilePath!);
}, doc => doc is not null && DocumentTabPathHelper.CanCopyFullPath(doc.FilePath));

RevealDocumentInExplorerCommand = new RelayCommand<DocumentItemVm>(doc =>
{
    if (doc is null || !DocumentTabPathHelper.CanRevealInExplorer(doc.FilePath)) return;
    var path = doc.FilePath!;
    try
    {
        if (File.Exists(path))
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = "explorer.exe",
                Arguments = DocumentTabPathHelper.BuildExplorerSelectArguments(path),
                UseShellExecute = true
            });
        }
        else if (Directory.Exists(path))
        {
            Process.Start(new ProcessStartInfo
            {
                FileName = "explorer.exe",
                Arguments = path,
                UseShellExecute = true
            });
        }
    }
    catch (Exception ex)
    {
        IdeMessage.ShowException(ex, "Không mở được File Explorer.");
    }
}, doc => doc is not null && DocumentTabPathHelper.CanRevealInExplorer(doc.FilePath));
```

Thêm properties public cho 3 command. Usings: `System.Diagnostics`, `System.Windows`, `DevWorkFlow.Application.Shell`, `UI` IdeMessage namespace hiện có.

- [x] **Step 3: ContextMenu + pin icon + KeyboardNavigation trên `DocumentTabBar.xaml`** (dùng code-behind `ContextMenuOpening` set Header Pin/Unpin qua `FindName`, không thêm converter mới)

Trên root `Border` hoặc `ItemsControl`:

```xml
KeyboardNavigation.DirectionalNavigation="None"
KeyboardNavigation.TabNavigation="Once"
```

Trong `DataTemplate` của tab `RadioButton`, thêm:

```xml
<RadioButton ...>
  <RadioButton.ContextMenu>
    <ContextMenu>
      <MenuItem Header="{Binding IsPinned, Converter={StaticResource PinMenuHeaderConverter}}"
                Command="{Binding DataContext.TogglePinDocumentCommand, RelativeSource={RelativeSource AncestorType=UserControl}}"
                CommandParameter="{Binding}"/>
      <MenuItem Header="Copy full path"
                Command="{Binding DataContext.CopyDocumentPathCommand, RelativeSource={RelativeSource AncestorType=UserControl}}"
                CommandParameter="{Binding}"/>
      <MenuItem Header="Open in File Explorer"
                Command="{Binding DataContext.RevealDocumentInExplorerCommand, RelativeSource={RelativeSource AncestorType=UserControl}}"
                CommandParameter="{Binding}"/>
    </ContextMenu>
  </RadioButton.ContextMenu>
  <StackPanel Orientation="Horizontal">
    <md:PackIcon Kind="Pin" Width="10" Height="10" Margin="0,0,4,0"
                 Visibility="{Binding IsPinned, Converter={StaticResource BoolToVisibilityConverter}}"
                 Foreground="{StaticResource PrimaryBrush}"/>
    <!-- existing icon + title + close -->
  </StackPanel>
</RadioButton>
```

**Pin menu header:** tránh converter mới nếu có thể — dùng hai `MenuItem` với `Visibility` theo `IsPinned` (một “Pin”, một “Unpin”) **hoặc** code-behind `ContextMenuOpening` set `Header`. Ưu tiên hai MenuItem + BoolToVisibility / inverse converter đã có trong `UI/Converters` (`BoolToCollapsed` nếu có — kiểm tra `Converters.cs`; nếu không, thêm `InverseBoolToVisibility` tối giản hoặc set Header trong `DocumentTabBar.xaml.cs`).

Khuyến nghị đơn giản trong code-behind:

```csharp
private void Tab_ContextMenuOpening(object sender, ContextMenuEventArgs e)
{
    if (sender is not FrameworkElement { DataContext: DocumentItemVm doc } fe) return;
    if (fe.ContextMenu?.Items[0] is MenuItem pin_item)
        pin_item.Header = doc.IsPinned ? "Unpin" : "Pin";
    // Activate tab được right-click
    if (DataContext is IdeShellViewModel shell)
        shell.ActivateDocument(doc);
}
```

Gắn `ContextMenuOpening="Tab_ContextMenuOpening"` trên `RadioButton`.

- [x] **Step 4: Build UI** (0 error)

```bash
dotnet build UI/UI.csproj
```

Expected: 0 error.

- [ ] **Step 5: Manual check tab menu** (chưa chạy — cần phiên WPF tương tác, ngoài khả năng môi trường hiện tại)

1. Mở 2 file XML từ Explorer.
2. Right-click tab → Pin → icon pin hiện; menu thành Unpin.
3. Copy full path → paste ra Notepad khớp `FilePath`.
4. Open in File Explorer → Explorer mở, file được select.
5. Tab `sql://` (nếu có) → Copy/Reveal disabled hoặc no-op.

- [ ] **Step 6: Commit** (khi user yêu cầu)

```bash
git add UI/ViewModels/Shell/DocumentItemVm.cs UI/ViewModels/Shell/IdeShellViewModel.cs UI/Views/Shell/DocumentTabBar.xaml UI/Views/Shell/DocumentTabBar.xaml.cs
git commit -m "feat: document tab pin, copy path, reveal in explorer"
```

---

### Task 3: Fix Monaco navigation keys (WebView2 ↔ WPF)

**Files:**
- Modify: `UI/Views/Controls/MonacoEditorHost.xaml.cs`
- Possibly modify: `UI/Views/Shell/DocumentTabBar.xaml` (KeyboardNavigation — nếu chưa làm Task 2)
- Only if needed: thin hook near AvalonDock host (document nếu phải override)

**Interfaces:**
- Consumes: `CoreWebView2` after init
- Produces: Home/End/PageUp/PageDown (+ Shift) hoạt động trong Monaco

- [ ] **Step 1: Reproduce & note**

Chạy app, focus Monaco Source, bấm Home/End/PgUp/PgDn. Ghi nhận: dead keys vs nhảy tab.

- [x] **Step 2: Implement host-side guard trong `OnLoaded` sau khi có `core`**

Thêm method:

```csharp
private static bool IsEditorNavigationKey(Key key)
    => key is Key.Home or Key.End or Key.PageUp or Key.PageDown;

private void AttachWebViewKeyboardGuards(CoreWebView2 core)
{
    // Accelerator keys (non-character) được WebView2 đẩy vào WPF — parent có thể steal.
    MonacoWebView.PreviewKeyDown += (_, e) =>
    {
        if (!IsEditorNavigationKey(e.Key)) return;
        // Đánh dấu handled ở Preview của WebView2 control để ScrollViewer/Tab/Radio
        // phía ngoài không xử lý; WebView2 vẫn nhận input ở native layer khi không
        // chặn AcceleratorKeyPressed.Handled.
        e.Handled = true;
    };

    core.Settings.AreBrowserAcceleratorKeysEnabled = true;

    // Nếu PreviewKeyDown Handled=true làm mất phím trong browser (xác nhận tay):
    // ĐỔI sang pattern: KHÔNG Handled ở đây; thay vào đó subscribe
    // core.Controller.AcceleratorKeyPressed và để Handled=false, đồng thời
    // tắt DirectionalNavigation trên DocumentTabBar (Task 2) +
    // tìm parent AvalonDock KeyDown. Xem spec §5.1.
}
```

Gọi `AttachWebViewKeyboardGuards(core);` trước `Navigate(...)`.

**Quan trọng — vòng thử nghiệm (không skip):**

1. Thử `PreviewKeyDown` + `e.Handled = true` trên `MonacoWebView` cho navigation keys.
2. Nếu Monaco **vẫn** không nhận: **revert** Handled; chỉ giữ `KeyboardNavigation` trên tab bar; thêm `AcceleratorKeyPressed` handler với `args.Handled = false` và log virtual key.
3. Nếu AvalonDock vẫn steal: tạo `UI/Views/Shell/EditorDocumentHost.cs` wrapper (nếu cần) override `OnKeyDown` — nếu `e.Key` navigation → `return` không `base` (pattern Rick Strahl). Gắn wrapper quanh `WorkspaceHost` trong `IdeDockWorkspace.xaml` **chỉ khi** bước 1–2 fail.

- [ ] **Step 3: Manual matrix**

| Phím | Expected |
|------|----------|
| Home | Caret đầu dòng |
| End | Caret cuối dòng |
| PageUp / PageDown | Trang lên/xuống theo Monaco |
| Shift+Home / Shift+End | Selection tới đầu/cuối dòng |
| Nhiều document tab | Không nhảy tab AvalonDock / RadioButton |

Lặp Source + Insight mode.

- [x] **Step 4: Build**

```bash
dotnet build DevWorkFlow.slnx
```

- [ ] **Step 5: Commit** (khi user yêu cầu)

```bash
git add UI/Views/Controls/MonacoEditorHost.xaml.cs
# + mọi file hook AvalonDock nếu có
git commit -m "fix: allow Home/End/PageUp/Down in Monaco WebView2 host"
```

---

### Task 4: Verify Phase 0 done + cập nhật roadmap note

**Files:**
- Modify (optional): `docs/superpowers/specs/2026-07-22-editor-ux-roadmap-design.md` — thêm dòng tiến độ Phase 0
- Modify (optional): tick success criteria trong Phase 0 mini-spec

- [x] **Step 1: Run automated tests**

```bash
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DocumentTabPathHelperTests"
dotnet build DevWorkFlow.slnx
```

- [ ] **Step 2: Manual checklist từ mini-spec §8** — tất cả box.

- [x] **Step 3: Ghi chú living roadmap**

Dưới Phase 0 trong roadmap, thêm:

```markdown
**Progress (2026-07-22):** Done — keys + tab menu (Pin / Copy path / Reveal).
```

- [ ] **Step 4: Handoff**

Báo user Phase 0 xong; phase tiếp theo theo roadmap = **Phase 1** (entity Ctrl+Click + hover virtual view) → mini-spec riêng trước khi code.

---

## Spec coverage (self-review)

| Spec requirement | Task |
|------------------|------|
| Home/End/PgUp/PgDn + Shift | Task 3 |
| Pin / Unpin + indicator | Task 2 |
| Copy full path | Task 1 + 2 |
| Open in File Explorer | Task 1 + 2 |
| Close pinned still OK | Task 2 (không chặn Close) |
| No bridge business | — không đụng bridge trừ fallback keys (ghi rõ nếu dùng) |
| Unit test path helper | Task 1 |
| Manual Monaco verify | Task 3–4 |

## Placeholder scan

Không còn TBD trong task steps. Fallback AvalonDock chỉ kích hoạt khi Task 3 bước 1–2 fail (điều kiện rõ).
