using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>
/// Ghi <c>form.Layout</c> in-memory trở lại XML nguồn. Tách khỏi Command để đường migrate
/// ADR-0006 (Semantic → Serializer) không đụng Overlay/Engine.
/// </summary>
public interface IDesignLayoutWriterAdapter
{
    string WriteLayout(string xml, FboFormModel form);

    /// <summary>Ghi field mới (nếu có) rồi layout — dùng sau CreateFieldAndInsert.</summary>
    string WriteFieldAndLayout(string xml, FboFormModel form, FboField? new_field);

    /// <summary>Ghi nhiều field mới (vd. AutoComplete main + reference; Tab Grid seed) rồi layout.</summary>
    string WriteFieldsAndLayout(string xml, FboFormModel form, IReadOnlyList<FboField> new_fields);

    /// <summary>Xóa các field khỏi XML rồi ghi lại layout — dùng sau RemoveField.</summary>
    string WriteRemoveFieldsAndLayout(string xml, FboFormModel form, IReadOnlyList<string> removed_names);

    /// <summary>
    /// Vùng &lt;views&gt; còn entity ref → KHÔNG được ApplyLayout thẳng vào Dir (duplicate khi
    /// reparse); commit phải đi <see cref="BuildWritebackPlan"/> (hướng 2 — ghi file entity).
    /// </summary>
    bool RequiresEntityWriteback(string dir_xml);

    /// <summary>
    /// Build plan ghi mutation hiện tại: patch literal vào Dir + nội dung mới cho entity liên quan.
    /// Fail (reason rõ) khi không map được — caller rollback model, không ghi dở.
    /// </summary>
    LayoutWritePlanResult BuildWritebackPlan(IErpDocument document, string dir_xml, FboFormModel form);
}
