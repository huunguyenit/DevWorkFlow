using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design.Layout;

/// <summary>Adapter tạm: ghi qua <see cref="FboXmlWriter.ApplyLayout"/> (dual Fbo* — ADR-0009).</summary>
public sealed class FboDesignLayoutWriterAdapter : IDesignLayoutWriterAdapter
{
    private readonly FboXmlWriter _writer = new();

    public string WriteLayout(string xml, FboFormModel form) => _writer.ApplyLayout(xml, form);

    public string WriteFieldAndLayout(string xml, FboFormModel form, FboField? new_field)
    {
        var result = xml;
        if (new_field is not null)
            result = _writer.ApplyNewField(result, new_field);
        return _writer.ApplyLayout(result, form);
    }

    public string WriteFieldsAndLayout(string xml, FboFormModel form, IReadOnlyList<FboField> new_fields)
    {
        var result = xml;
        foreach (var field in new_fields)
            result = _writer.ApplyNewField(result, field);
        return _writer.ApplyLayout(result, form);
    }

    public string WriteRemoveFieldsAndLayout(string xml, FboFormModel form, IReadOnlyList<string> removed_names)
    {
        var result = xml;
        foreach (var name in removed_names)
            result = _writer.ApplyRemoveField(result, name);
        return _writer.ApplyLayout(result, form);
    }
}
