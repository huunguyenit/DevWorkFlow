using System.IO;
using System.Xml.Linq;
using DevWorkFlow.Domain.Models;

namespace DevWorkFlow.Application.Engine;

/// <summary>
/// Parse XML khai báo form thành <see cref="FormDefinition"/>.
/// Schema XML mẫu:
/// <code>
/// &lt;Form id="catalog_product" title="Danh mục Hàng hoá" type="Catalog" columns="2"&gt;
///   &lt;Actions&gt;
///     &lt;Action name="Save"/&gt;
///     &lt;Action name="Cancel"/&gt;
///   &lt;/Actions&gt;
///   &lt;Fields&gt;
///     &lt;Field name="Code" label="Mã hàng" type="Text" required="true" row="0" col="0"/&gt;
///     &lt;Field name="Name" label="Tên hàng" type="Text" required="true" row="0" col="1"/&gt;
///     &lt;Field name="Unit"  label="ĐVT"     type="Dropdown" row="1" col="0"&gt;
///       &lt;Option&gt;Cái&lt;/Option&gt;
///       &lt;Option&gt;Kg&lt;/Option&gt;
///     &lt;/Field&gt;
///   &lt;/Fields&gt;
/// &lt;/Form&gt;
/// </code>
/// </summary>
public class XmlFormParser
{
    public FormDefinition Parse(string xml)
    {
        var doc = XDocument.Parse(xml);
        var root = doc.Root ?? throw new InvalidOperationException("XML không hợp lệ: thiếu element gốc <Form>.");

        var form = new FormDefinition
        {
            Id          = (string?)root.Attribute("id")      ?? Guid.NewGuid().ToString(),
            Title       = (string?)root.Attribute("title")   ?? string.Empty,
            Description = (string?)root.Attribute("desc")    ?? string.Empty,
            ColumnCount = int.TryParse((string?)root.Attribute("columns"), out var cols) ? cols : 2,
            TemplateType = Enum.TryParse<TemplateType>((string?)root.Attribute("type"), true, out var tt) ? tt : TemplateType.Document,
            XmlSource   = xml
        };

        // Actions
        var actionsEl = root.Element("Actions");
        if (actionsEl is not null)
            form.Actions = actionsEl.Elements("Action")
                .Select(a => (string?)a.Attribute("name") ?? string.Empty)
                .Where(n => n.Length > 0)
                .ToList();

        // Fields
        var fieldsEl = root.Element("Fields");
        if (fieldsEl is not null)
            form.Fields = fieldsEl.Elements("Field").Select(ParseField).ToList();

        return form;
    }

    public FormDefinition ParseFile(string filePath) => Parse(File.ReadAllText(filePath));

    private static FieldDefinition ParseField(XElement el)
    {
        var field = new FieldDefinition
        {
            Name            = (string?)el.Attribute("name")        ?? string.Empty,
            Label           = (string?)el.Attribute("label")       ?? string.Empty,
            FieldType       = Enum.TryParse<FieldType>((string?)el.Attribute("type"), true, out var ft) ? ft : FieldType.Text,
            IsRequired      = string.Equals((string?)el.Attribute("required"), "true", StringComparison.OrdinalIgnoreCase),
            IsReadOnly      = string.Equals((string?)el.Attribute("readonly"), "true", StringComparison.OrdinalIgnoreCase),
            DefaultValue    = (string?)el.Attribute("default"),
            PlaceholderText = (string?)el.Attribute("placeholder"),
            Row             = int.TryParse((string?)el.Attribute("row"),     out var r)  ? r  : 0,
            Column          = int.TryParse((string?)el.Attribute("col"),     out var c)  ? c  : 0,
            ColumnSpan      = int.TryParse((string?)el.Attribute("colspan"), out var cs) ? cs : 1,
            ValidationRegex   = (string?)el.Attribute("regex"),
            ValidationMessage = (string?)el.Attribute("validMsg")
        };

        field.Options = el.Elements("Option").Select(o => o.Value.Trim()).Where(v => v.Length > 0).ToList();
        return field;
    }

    /// <summary>Tạo XML mẫu cho một loại template.</summary>
    public static string GetTemplateXml(TemplateType type) => type switch
    {
        TemplateType.Catalog => """
            <Form id="new_catalog" title="Danh mục mới" type="Catalog" columns="2" desc="">
              <Actions>
                <Action name="Save"/>
                <Action name="Cancel"/>
              </Actions>
              <Fields>
                <Field name="Code"  label="Mã"   type="Text" required="true"  row="0" col="0"/>
                <Field name="Name"  label="Tên"  type="Text" required="true"  row="0" col="1"/>
                <Field name="Note"  label="Ghi chú" type="TextArea" row="1" col="0" colspan="2"/>
              </Fields>
            </Form>
            """,
        TemplateType.Document => """
            <Form id="new_document" title="Chứng từ mới" type="Document" columns="2" desc="">
              <Actions>
                <Action name="Save"/>
                <Action name="Post"/>
                <Action name="Cancel"/>
                <Action name="Print"/>
              </Actions>
              <Fields>
                <Field name="DocNo"   label="Số CT"     type="Text"     required="true" row="0" col="0"/>
                <Field name="DocDate" label="Ngày CT"   type="Date"     required="true" row="0" col="1"/>
                <Field name="Partner" label="Đối tượng" type="Lookup"   row="1" col="0"/>
                <Field name="Amount"  label="Số tiền"   type="Number"   row="1" col="1"/>
                <Field name="Note"    label="Diễn giải" type="TextArea" row="2" col="0" colspan="2"/>
              </Fields>
            </Form>
            """,
        TemplateType.Report => """
            <Form id="new_report" title="Báo cáo mới" type="Report" columns="2" desc="">
              <Actions>
                <Action name="Preview"/>
                <Action name="Export"/>
              </Actions>
              <Fields>
                <Field name="FromDate" label="Từ ngày"  type="Date" required="true" row="0" col="0"/>
                <Field name="ToDate"   label="Đến ngày" type="Date" required="true" row="0" col="1"/>
                <Field name="Branch"   label="Chi nhánh" type="Dropdown" row="1" col="0">
                  <Option>Tất cả</Option>
                </Field>
              </Fields>
            </Form>
            """,
        _ => """
            <Form id="new_stored" title="Stored mới" type="Stored" columns="1" desc="">
              <Actions>
                <Action name="Execute"/>
              </Actions>
              <Fields>
                <Field name="Script" label="Script" type="TextArea" row="0" col="0"/>
              </Fields>
            </Form>
            """
    };
}
