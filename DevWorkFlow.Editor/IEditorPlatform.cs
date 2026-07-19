using DevWorkFlow.Domain.Language;

namespace DevWorkFlow.Editor;

/// <summary>
/// API duy nhất mà các module khác (Outline, Insight Panel, Symbol Info, Property Grid,
/// Diagnostics Bridge, Plugin, ...) được phép dùng để đọc trạng thái của Editor đang mở.
/// Không module nào ngoài Editor Platform và Adapter của nó được phép tham chiếu trực
/// tiếp control Editor cụ thể (AvalonEdit hôm nay, Monaco sau này) — xem ADR-0005.
///
/// Đây là bước 1 của lộ trình thay thế Editor: trừu tượng hoá trước, giữ nguyên hành vi
/// hiện tại (AvalonEdit) làm Adapter duy nhất. Chưa migrate Monaco — xem
/// docs/specs/editor/insight-editor-surface.md mục Future Extension.
/// </summary>
public interface IEditorPlatform
{
    IEditorDocumentService Document { get; }
    IEditorSelectionService Selection { get; }
    IEditorDecorationService Decorations { get; }
}

/// <summary>
/// Quản lý Document đang mở trong Editor. Chỉ đọc — Editor Platform không tự Parse/Resolve,
/// nó chỉ giữ tham chiếu tới kết quả đã có sẵn từ ERP Language Service (Rule R1/R3).
/// </summary>
public interface IEditorDocumentService
{
    /// <summary>Nội dung Source hiện tại (luôn giữ nguyên tham chiếu Entity gốc).</summary>
    string Text { get; }

    /// <summary>Có Document nào đang mở hay không.</summary>
    bool HasDocument { get; }

    /// <summary>Document đã Parse (từ ERP Language Service) — null nếu chưa mở gì.</summary>
    IErpDocument? ErpDocument { get; }

    /// <summary>Semantic Model của Document đang mở — null nếu chưa mở gì.</summary>
    IErpSemanticModel? SemanticModel { get; }
}

/// <summary>Vị trí con trỏ và điều hướng trong Editor. Reveal luôn theo NodeId/Symbol/Target — không theo Index UI (Rule R7).</summary>
public interface IEditorSelectionService
{
    int CaretLine { get; }
    int CaretColumn { get; }
    int CaretOffset { get; }

    /// <summary>Cuộn/focus Editor tới một dòng cụ thể.</summary>
    void RevealLine(int line);

    /// <summary>Cuộn/focus Editor tới một offset cụ thể trong Document.</summary>
    void RevealOffset(int offset, int lineHint = 0);

    /// <summary>Cuộn/focus Editor tới một NavigationTarget (kết quả Go To Definition/Find References).</summary>
    void RevealTarget(NavigationTarget? target);
}

/// <summary>Dữ liệu Insight đang hiển thị trong Editor (Entity Value, Validation, ...) — xem ADR-0004.</summary>
public interface IEditorDecorationService
{
    bool ShowInsights { get; }
    IReadOnlyList<InsightItem> Insights { get; }
}
