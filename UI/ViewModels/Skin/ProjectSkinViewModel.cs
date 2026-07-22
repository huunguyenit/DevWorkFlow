using System.Windows;
using System.Windows.Input;
using DevWorkFlow.Application.Abstractions;
using DevWorkFlow.Application.Skin;
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Domain.Models.Fbo;
using UI.Services;
using UI.ViewModels.Base;
using UI.Views.Skin;

namespace UI.ViewModels.Skin;

/// <summary>
/// Điều phối Project Web Skin ở tầng UI: cầm <see cref="IProjectSkinService"/> + Program hiện tại, mở cửa
/// sổ capture và gọi service. KHÔNG parse XML, KHÔNG đụng Form Builder — dịch vụ độc lập. "Lấy skin" và
/// "Cập nhật skin" dùng chung một luồng (đều login lại + capture); "Refresh assets" không login. Skin capture
/// nay chỉ dùng cho AI/tham khảo — tab Design đã chuyển sang HTML Generator (DesignWebViewHost), KHÔNG dùng
/// skin. State SkinDirectory/SkinEntryPath/HasSkin giữ lại cho tooling/tương lai.
/// </summary>
public sealed class ProjectSkinViewModel : ViewModelBase
{
    private readonly IProjectSkinService _skin;
    private readonly IProgramSession _session;
    private bool _has_skin;
    private string? _skin_directory;
    private string? _skin_entry_path;
    private string? _skin_program_root;

    public ProjectSkinViewModel(IProjectSkinService skin, IProgramSession session)
    {
        _skin = skin;
        _session = session;
        _session.ProgramChanged += (_, _) =>
        {
            OnPropertyChanged(nameof(HasProgram));
            RefreshSkinState();
            CommandManager.InvalidateRequerySuggested();
        };
        RefreshSkinState();
    }

    /// <summary>Có Program đang mở → mới cho phép thao tác skin (CanExecute cho command).</summary>
    public bool HasProgram => _session.Current is not null;

    /// <summary>Program hiện tại đã có skin (shell.html + manifest.json) chưa — cho tab Design biết show gì.</summary>
    public bool HasSkin
    {
        get => _has_skin;
        private set => SetProperty(ref _has_skin, value);
    }

    /// <summary>Thư mục skin cục bộ của Program hiện tại (null nếu chưa có skin).</summary>
    public string? SkinDirectory
    {
        get => _skin_directory;
        private set => SetProperty(ref _skin_directory, value);
    }

    /// <summary>Đường dẫn shell.html của Program hiện tại (null nếu chưa có skin).</summary>
    public string? SkinEntryPath
    {
        get => _skin_entry_path;
        private set => SetProperty(ref _skin_entry_path, value);
    }

    /// <summary>Program root để preview map virtual host nạp CSS/JS/image trực tiếp (KHÔNG mirror). Lấy từ
    /// manifest.ProgramRoot (đúng root lúc rewrite URL asset trong shell.html). Null nếu chưa có skin.</summary>
    public string? SkinProgramRoot
    {
        get => _skin_program_root;
        private set => SetProperty(ref _skin_program_root, value);
    }

    /// <summary>"Lấy skin" / "Cập nhật skin" — mở WebView2 để login + capture, rồi lưu skin local.</summary>
    /// <param name="doc_kind">Loại controller (Form/Grid/Lookup) của document đang mở lúc capture, nếu có.</param>
    public async Task CaptureSkinAsync(ControllerDisplayKind? doc_kind = null)
    {
        if (!TryGetContext(out var program, out var project_id))
            return;

        var existing = _skin.GetManifest(project_id);
        var prefill = existing?.BaseUrl;
        if (string.IsNullOrWhiteSpace(prefill))
            prefill = SkinUrlHelper.BuildDefaultBaseUrl(program.ProgramPath);

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
                ProgramRoot = program.ProgramPath,
                DocKind = doc_kind
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
            RefreshSkinState();
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
                "Đã nạp lại skin (CSS/JS/image lấy trực tiếp từ Program, không mirror).\n\n" +
                $"{sync.ResolvedCount} asset nội bộ, {sync.UnresolvedCount} ngoại vi/động (không nạp được).",
                "Refresh assets");
            RefreshSkinState();
        }
        catch (Exception ex)
        {
            IdeMessage.ShowException(ex, "Không refresh được assets.");
        }
    }

    /// <summary>Cập nhật HasSkin/SkinDirectory/SkinEntryPath cho Program hiện tại — gọi sau khi đổi Program
    /// hoặc sau khi capture/refresh assets thành công (state cho tooling; tab Design không dùng skin).</summary>
    private void RefreshSkinState()
    {
        var program = _session.Current;
        if (program is null)
        {
            HasSkin = false;
            SkinDirectory = null;
            SkinEntryPath = null;
            SkinProgramRoot = null;
            return;
        }

        var project_id = SkinProjectIdentity.From(program);
        HasSkin = _skin.HasSkin(project_id);
        SkinDirectory = HasSkin ? _skin.GetSkinDirectory(project_id) : null;
        SkinEntryPath = HasSkin ? _skin.GetSkinEntryPath(project_id) : null;
        SkinProgramRoot = HasSkin
            ? (_skin.GetManifest(project_id)?.ProgramRoot ?? program.ProgramPath)
            : null;
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
