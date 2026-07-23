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
}
