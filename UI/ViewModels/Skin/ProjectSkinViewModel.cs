using System.Windows;
using System.Windows.Input;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Skin;
using DevWorkFlow.Domain.Models;
using UI.Services;
using UI.ViewModels.Base;
using UI.Views.Skin;

namespace UI.ViewModels.Skin;

/// <summary>
/// Điều phối Project Web Skin ở tầng UI: cầm <see cref="IProjectSkinService"/> + Program hiện tại, mở cửa
/// sổ capture/preview và gọi service. KHÔNG parse XML, KHÔNG đụng Form Builder — dịch vụ độc lập.
/// "Lấy skin" và "Cập nhật skin" dùng chung một luồng (đều login lại + capture); "Refresh assets" không login.
/// </summary>
public sealed class ProjectSkinViewModel : ViewModelBase
{
    private readonly IProjectSkinService _skin;
    private readonly IProgramSession _session;

    public ProjectSkinViewModel(IProjectSkinService skin, IProgramSession session)
    {
        _skin = skin;
        _session = session;
        _session.ProgramChanged += (_, _) =>
        {
            OnPropertyChanged(nameof(HasProgram));
            CommandManager.InvalidateRequerySuggested();
        };
    }

    /// <summary>Có Program đang mở → mới cho phép thao tác skin (CanExecute cho command).</summary>
    public bool HasProgram => _session.Current is not null;

    /// <summary>"Lấy skin" / "Cập nhật skin" — mở WebView2 để login + capture, rồi lưu skin local.</summary>
    public async Task CaptureSkinAsync()
    {
        if (!TryGetContext(out var program, out var project_id))
            return;

        var existing = _skin.GetManifest(project_id);
        var prefill = existing?.BaseUrl;

        var window = new SkinCaptureWindow(prefill) { Owner = OwnerWindow() };
        var ok = window.ShowDialog();
        if (ok != true || string.IsNullOrWhiteSpace(window.CapturedHtml))
            return;

        try
        {
            var result = await _skin.SaveCapturedShellAsync(new SkinCaptureRequest
            {
                ProjectId = project_id,
                BaseUrl = window.CapturedBaseUrl,
                CapturedFromUrl = window.CapturedFromUrl,
                RawHtml = window.CapturedHtml,
                ProgramRoot = program.ProgramPath
            });

            var host_note = result.HostStatus == HostStatus.Found
                ? $"Vùng host: đã chèn placeholder ({result.Manifest.HostSelector})."
                : "Vùng host: KHÔNG tìm thấy (host_status=not_found) — shell vẫn được lưu; cần cập nhật heuristic/override sau.";

            IdeMessage.Info(
                $"Đã lưu skin cho {program.DisplayTitle}.\n\n" +
                $"{host_note}\n" +
                $"Assets: {result.AssetSync.ResolvedCount} resolved, {result.AssetSync.UnresolvedCount} unresolved.\n\n" +
                $"Thư mục: {result.SkinDirectory}",
                "Lấy skin");
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Không lưu được skin.");
        }
    }

    /// <summary>"Refresh assets" — chỉ mirror lại CSS/JS/image từ Program, KHÔNG login.</summary>
    public async Task RefreshAssetsAsync()
    {
        if (!TryGetContext(out var program, out var project_id))
            return;

        if (!_skin.HasSkin(project_id))
        {
            IdeMessage.Warning("Chưa có skin. Hãy 'Lấy skin' trước.", "Refresh assets");
            return;
        }

        try
        {
            var sync = await _skin.RefreshAssetsAsync(project_id, program.ProgramPath);
            IdeMessage.Info(
                $"Đã refresh assets (không cần login).\n\n" +
                $"{sync.ResolvedCount} resolved, {sync.UnresolvedCount} unresolved.",
                "Refresh assets");
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Không refresh được assets.");
        }
    }

    /// <summary>"Xem skin" — mở WebView2 Navigate shell.html (skin trống).</summary>
    public void ViewSkin()
    {
        if (!TryGetContext(out _, out var project_id))
            return;

        if (!_skin.HasSkin(project_id))
        {
            IdeMessage.Warning("Chưa có skin. Hãy 'Lấy skin' trước.", "Xem skin");
            return;
        }

        var window = new SkinPreviewWindow(
            _skin.GetSkinDirectory(project_id),
            _skin.GetSkinEntryPath(project_id))
        {
            Owner = OwnerWindow()
        };
        window.Show();
    }

    private bool TryGetContext(out ProgramContext program, out string project_id)
    {
        program = _session.Current!;
        project_id = string.Empty;
        if (program is null)
        {
            IdeMessage.Warning("Chưa mở Program. Hãy chọn Program trước.", "Web Skin");
            return false;
        }

        project_id = SkinProjectIdentity.From(program);
        return true;
    }

    private static Window? OwnerWindow()
    {
        var main = System.Windows.Application.Current?.MainWindow;
        return main is { IsLoaded: true } ? main : null;
    }
}
