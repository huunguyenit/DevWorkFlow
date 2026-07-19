using DevWorkFlow.Domain.Language;
using DevWorkFlow.Editor;
using UI.ViewModels;

namespace UI.Services;

/// <summary>
/// Adapter AvalonEdit cho IEditorPlatform (ADR-0002/ADR-0005) — implementation DUY NHẤT
/// hiện có, bọc quanh FormBuilderViewModel mà không đổi hành vi của nó. Khi có Monaco
/// Adapter thật, class này bị thay thế/song song mà không ảnh hưởng consumer đã dùng
/// IEditorPlatform (Adapter Pattern).
///
/// Chưa migrate consumer nào sang IEditorPlatform trong lần này — xem
/// docs/specs/editor/insight-editor-surface.md mục Future Extension để biết phạm vi còn lại.
/// </summary>
public sealed class FormBuilderEditorPlatform(FormBuilderViewModel form)
    : IEditorPlatform, IEditorDocumentService, IEditorSelectionService, IEditorDecorationService
{
    public IEditorDocumentService Document => this;
    public IEditorSelectionService Selection => this;
    public IEditorDecorationService Decorations => this;

    string IEditorDocumentService.Text => form.XmlSource;
    bool IEditorDocumentService.HasDocument => form.HasDocument;
    IErpDocument? IEditorDocumentService.ErpDocument => form.ErpDocument;
    IErpSemanticModel? IEditorDocumentService.SemanticModel => form.SemanticModel;

    int IEditorSelectionService.CaretLine => form.CaretLine;
    int IEditorSelectionService.CaretColumn => form.CaretColumn;
    int IEditorSelectionService.CaretOffset => form.CaretOffset;
    void IEditorSelectionService.RevealLine(int line) => form.NavigateToLine(line);
    void IEditorSelectionService.RevealOffset(int offset, int lineHint) => form.NavigateToOffset(offset, lineHint);
    void IEditorSelectionService.RevealTarget(NavigationTarget? target) => form.NavigateToTarget(target);

    bool IEditorDecorationService.ShowInsights => form.ShowInsights;
    IReadOnlyList<InsightItem> IEditorDecorationService.Insights => form.Insights;
}
