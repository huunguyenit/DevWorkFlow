namespace DevWorkFlow.Domain.Language;

/// <summary>
/// Buffer nào đang được hỗ trợ (Phase 4). Insight là ClearText read-only nên chỉ Hover được
/// bật; Completion / Signature Help luôn rỗng ở mode đó.
/// </summary>
public enum EditorAssistMode
{
    Source = 0,
    Insight = 1
}
