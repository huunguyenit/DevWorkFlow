using DevWorkFlow.Application.Language;
using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

public sealed class EntitySymbolSystemTests : IDisposable
{
    private readonly string _temp_directory =
        Path.Combine(Path.GetTempPath(), $"fbo-entity-{Guid.NewGuid():N}");

    public EntitySymbolSystemTests() => Directory.CreateDirectory(_temp_directory);

    [Fact]
    public void Binder_builds_inline_external_parameter_and_nested_graph()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        File.WriteAllText(Path.Combine(_temp_directory, "external.ent"), "External");
        File.WriteAllText(
            Path.Combine(_temp_directory, "definitions.ent"),
            """<!ENTITY Nested "Nested &Inline;">""");

        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY Inline "Hello">
              <!ENTITY External SYSTEM "external.ent">
              <!ENTITY % Definitions SYSTEM "definitions.ent">
              %Definitions;
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Inline; &External; &Nested;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        Assert.Contains(result.Symbols, entity =>
            entity.Name == "Inline"
            && entity.DeclarationKind == EntityDeclarationKind.Inline);
        Assert.Contains(result.Symbols, entity =>
            entity.Name == "External"
            && entity.DeclarationKind == EntityDeclarationKind.ExternalSystem
            && entity.IsResolved);
        Assert.Contains(result.Symbols, entity =>
            entity.Name == "Definitions"
            && entity.DeclarationKind == EntityDeclarationKind.Parameter
            && entity.References.Count == 1);
        Assert.Contains(result.Symbols, entity =>
            entity.Name == "Nested"
            && entity.DisplayText == "Nested Hello");
        Assert.Contains("Hello External Nested Hello", result.ClearText);
        Assert.Equal(3, result.Segments.Count);
        Assert.DoesNotContain(result.Diagnostics, diagnostic =>
            diagnostic.Id is "ERP3001" or "ERP3002" or "ERP3003");
    }

    [Fact]
    public void Binder_excludes_entities_declared_in_include_but_not_referenced()
    {
        // Mô phỏng Account.xml + Unit.ent: include khai báo nhiều entity dùng chung,
        // document chỉ gọi một phần — entity không gọi tới không được tạo symbol.
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        File.WriteAllText(
            Path.Combine(_temp_directory, "shared.ent"),
            """
            <!ENTITY UsedEntity "used-value">
            <!ENTITY Lookup.Job "job-value">
            """);

        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY % Shared SYSTEM "shared.ent">
              %Shared;
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&UsedEntity;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        Assert.Contains(result.Symbols, entity => entity.Name == "UsedEntity");
        Assert.DoesNotContain(result.Symbols, entity => entity.Name == "Lookup.Job");
    }

    [Fact]
    public void Binder_builds_annotated_text_for_multi_level_entities()
    {
        // &A;=xin, &B;=chào, &C;=&A;&B;Claude → C.AnnotatedText = "&A;|xin&B;|chàoClaude";
        // A và B dùng gián tiếp qua C nên vẫn được tạo symbol.
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY A "xin">
              <!ENTITY B "chào">
              <!ENTITY C "&A;&B;Claude">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&C;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        var c = Assert.Single(result.Symbols, entity => entity.Name == "C");
        Assert.Equal("&A;|xin&B;|chàoClaude", c.AnnotatedText);

        var a = Assert.Single(result.Symbols, entity => entity.Name == "A");
        Assert.Equal("xin", a.AnnotatedText);
        Assert.Contains(result.Symbols, entity => entity.Name == "B");
    }

    [Fact]
    public void Insight_metadata_carries_value_span_for_inline_entity_in_document()
    {
        // Editor dùng value_start/value_length để double-click → chọn giá trị thật trong
        // <!ENTITY X "..."> (sửa bằng text editing native, không HTML control).
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        File.WriteAllText(
            Path.Combine(_temp_directory, "included.ent"),
            """<!ENTITY FromInclude "included-value">""");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY ClientDefault "Default">
              <!ENTITY % Inc SYSTEM "included.ent">
              %Inc;
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&ClientDefault; &FromInclude;</dir>
            """;
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocumentFromText(controller_path, xml);

        var inline_item = Assert.Single(
            document.Insights,
            item => item.Type == InsightType.Entity && item.ReferenceText == "&ClientDefault;");
        Assert.True(inline_item.Metadata.TryGetValue("value_start", out var start_text));
        Assert.True(inline_item.Metadata.TryGetValue("value_length", out var length_text));
        var start = int.Parse(start_text);
        var length = int.Parse(length_text);
        Assert.Equal("Default", xml.Substring(start, length));

        // Entity khai báo trong file include → không có value span trong document này.
        var include_item = Assert.Single(
            document.Insights,
            item => item.Type == InsightType.Entity && item.ReferenceText == "&FromInclude;");
        Assert.False(include_item.Metadata.ContainsKey("value_start"));
    }

    [Fact]
    public void Binder_reports_cycle_and_missing_file()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY A "&B;">
              <!ENTITY B "&A;">
              <!ENTITY Missing SYSTEM "missing.ent">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&A; &Missing;</dir>
            """;

        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        Assert.Contains(result.Diagnostics, diagnostic => diagnostic.Id == "ERP3001");
        Assert.Contains(result.Diagnostics, diagnostic => diagnostic.Id == "ERP3002");
        Assert.Contains(result.Symbols, entity => entity.Name == "Missing" && !entity.IsResolved);
    }

    [Fact]
    public void Inline_edit_updates_definition_but_preserves_reference()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [<!ENTITY Greeting "Hello">]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Greeting;</dir>
            """;
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocumentFromText(controller_path, xml);
        var definition = language_service.GetEntityDefinition(document.Id, "Greeting");
        var references = language_service.FindEntityReferences(document.Id, "Greeting");

        var result = language_service.UpdateEntityValue(
            document.Id,
            "Greeting",
            "World");

        Assert.True(result.Success, result.Error);
        Assert.NotNull(definition);
        Assert.False(definition!.Span.IsEmpty);
        Assert.Single(references);
        Assert.NotNull(result.Document);
        var source = result.Document!.GetProjection(ErpProjectionKind.Source).Text;
        var clear_text = result.Document.GetProjection(ErpProjectionKind.ClearText).Text;
        Assert.Contains("""<!ENTITY Greeting "World">""", source);
        Assert.Contains("&Greeting;", source);
        Assert.Contains(">World</dir>", clear_text);
    }

    [Fact]
    public void External_edit_writes_resolved_document_and_keeps_controller_source()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        var entity_path = Path.Combine(_temp_directory, "content.ent");
        File.WriteAllText(entity_path, "Before");
        const string xml = """
            <!DOCTYPE dir [<!ENTITY Content SYSTEM "content.ent">]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Content;</dir>
            """;
        File.WriteAllText(controller_path, xml);
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocument(controller_path);

        var result = language_service.UpdateEntityValue(
            document.Id,
            "Content",
            "After");

        Assert.True(result.Success, result.Error);
        Assert.Equal("After", File.ReadAllText(entity_path));
        Assert.Contains("&Content;", result.Document!.Snapshot.RawText);
        Assert.Contains(">After</dir>", result.Document.GetProjection(ErpProjectionKind.ClearText).Text);
    }

    [Fact]
    public void Include_ignore_conditional_section_uses_active_value()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        var include_path = Path.Combine(_temp_directory, "Feature.ent");
        File.WriteAllText(include_path, """
            <!ENTITY % Cond "IGNORE">
            <![%Cond;[
              <!ENTITY Payload SYSTEM "payload.txt">
            ]]>
            <!ENTITY Payload "">
            """);
        File.WriteAllText(Path.Combine(_temp_directory, "payload.txt"), "<action id='X'/>");
        File.WriteAllText(Path.Combine(_temp_directory, "turn-on.ent"), """
            <!ENTITY % Cond "INCLUDE">
            """);

        // Giống FBO: load feature (IGNORE mặc định) → bật INCLUDE → rồi stub IGNORE ghi đè.
        // Ở đây Cond=IGNORE nên Payload active = "" (không phải SYSTEM payload.txt).
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY % Feature SYSTEM "Feature.ent">
              %Feature;
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Payload;</dir>
            """;
        File.WriteAllText(controller_path, xml);

        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocument(controller_path);
        var payload = document.SemanticModel.FindEntity("Payload");

        Assert.NotNull(payload);
        Assert.Equal(EntityDeclarationKind.Inline, payload!.DeclarationKind);
        Assert.Equal(string.Empty, payload.RawValue);
        Assert.Equal(string.Empty, payload.DisplayText);

        var insight = Assert.Single(
            document.Insights,
            item => item.Type == InsightType.Entity && item.ReferenceText == "&Payload;");
        Assert.Equal(string.Empty, insight.ResolvedValue);
        Assert.Empty(insight.Children);
    }

    [Sp226Fact]
    public void SP226_customer_unitfields_is_empty_after_ignore()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocument(path);

        var unit_fields = document.SemanticModel.FindEntity("UnitFields");
        Assert.NotNull(unit_fields);
        Assert.Equal(EntityDeclarationKind.Inline, unit_fields!.DeclarationKind);
        Assert.Equal(string.Empty, unit_fields.RawValue);

        // Lookup.Item khai báo trong include nhưng Customer.xml KHÔNG tham chiếu &Lookup.Item;
        // → theo used-entity closure, không tạo symbol (trước đây lấy mọi declaration —
        // hành vi cũ sai, đã sửa 2026-07-19).
        Assert.Null(document.SemanticModel.FindEntity("Lookup.Item"));

        // Insight không lấy parameter %Control.Unit;
        Assert.DoesNotContain(
            document.Insights,
            item => item.Type == InsightType.Entity
                    && item.ReferenceText.Contains("Control.Unit", StringComparison.OrdinalIgnoreCase));
    }

    [Sp226Fact]
    public void SP226_customer_entities_have_definitions_and_references()
    {
        var path = Sp226Paths.Require("Dir", "Customer.xml");
        var language_service = new ErpLanguageService();
        var document = language_service.OpenDocument(path);
        var entities = document.SemanticModel.GetEntities();

        Assert.NotEmpty(entities);
        Assert.Contains(entities, entity => !entity.Definition.Span.IsEmpty);
        Assert.Contains(entities, entity => entity.References.Count > 0);
        Assert.Equal(
            document.Snapshot.RawText,
            document.GetProjection(ErpProjectionKind.Source).Text);
    }

    // ── ClearText projection (Insight mode) ──────────────────────────────────

    [Fact]
    public void ClearText_segments_cover_expanded_text_with_kind_and_depth()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        File.WriteAllText(Path.Combine(_temp_directory, "external.ent"), "External");

        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY Inline "Hello">
              <!ENTITY External SYSTEM "external.ent">
              <!ENTITY Nested "say &Inline;">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&External; &Nested;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        Assert.Contains("External say Hello", result.ClearText);

        // Mọi segment phải trỏ đúng đoạn text nó sinh ra trong ClearText.
        foreach (var segment in result.ClearTextSegments)
        {
            Assert.InRange(segment.Span.StartOffset, 0, result.ClearText.Length);
            Assert.InRange(
                segment.Span.StartOffset + segment.Span.Length, 0, result.ClearText.Length);
        }

        var external = Assert.Single(
            result.ClearTextSegments, s => s.EntityName == "External");
        Assert.Equal(ClearTextSegmentKind.System, external.Kind);
        Assert.Equal(0, external.Depth);
        Assert.Equal("External", Text(result.ClearText, external));
        Assert.EndsWith("external.ent", external.OpenPath, StringComparison.OrdinalIgnoreCase);

        var nested_root = Assert.Single(
            result.ClearTextSegments, s => s.EntityName == "Nested");
        Assert.Equal(ClearTextSegmentKind.Inline, nested_root.Kind);
        Assert.Equal(0, nested_root.Depth);
        Assert.Equal("say Hello", Text(result.ClearText, nested_root));
        Assert.Empty(nested_root.OpenPath);

        // Entity lồng: depth 1, span nằm TRỌN trong span của entity cha.
        var inline_child = Assert.Single(
            result.ClearTextSegments, s => s.EntityName == "Inline");
        Assert.Equal(1, inline_child.Depth);
        Assert.Equal("Hello", Text(result.ClearText, inline_child));
        Assert.True(inline_child.Span.StartOffset >= nested_root.Span.StartOffset);
        Assert.True(
            inline_child.Span.StartOffset + inline_child.Span.Length
            <= nested_root.Span.StartOffset + nested_root.Span.Length);
    }

    [Fact]
    public void ClearText_keeps_doctype_offsets_identical_to_source()
    {
        // Ctrl+Click entity inline nhảy tới khai báo bằng offset source — chỉ đúng nếu
        // vùng DOCTYPE không bị dịch chuyển bởi việc expand entity trong body.
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY Inline "a-much-longer-value-than-the-reference">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Inline;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        var segment = Assert.Single(result.ClearTextSegments);
        Assert.Equal(
            xml.Substring(segment.DefinitionOffset, "<!ENTITY Inline".Length),
            result.ClearText.Substring(segment.DefinitionOffset, "<!ENTITY Inline".Length));
    }

    [Fact]
    public void ClearText_offset_map_translates_navigation_offsets_after_expansion()
    {
        // Outline/F12 tính offset trên source; Insight mode hiển thị ClearText. Mọi offset
        // NẰM SAU một tham chiếu entity đều bị dịch — không có bảng ánh xạ thì nhảy sai chỗ.
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY Inline "a-much-longer-value-than-the-reference">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Inline;<mark/></dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);
        var map = result.ClearTextOffsets;

        // Offset của <mark/> lệch hẳn giữa hai buffer — đây chính là lỗi được vá.
        var source_mark = xml.IndexOf("<mark/>", StringComparison.Ordinal);
        var clear_mark = result.ClearText.IndexOf("<mark/>", StringComparison.Ordinal);
        Assert.NotEqual(source_mark, clear_mark);
        Assert.Equal(clear_mark, map.ToClearText(source_mark));
        Assert.Equal(source_mark, map.ToSource(clear_mark));

        // Vùng DOCTYPE nằm trước mọi expansion → ánh xạ đồng nhất (bất biến cũ vẫn giữ).
        var doctype_offset = xml.IndexOf("<!ENTITY", StringComparison.Ordinal);
        Assert.Equal(doctype_offset, map.ToClearText(doctype_offset));

        // Offset trỏ vào giữa "&Inline;" không có ảnh 1-1 → snap về đầu đoạn đã expand.
        var reference_offset = xml.IndexOf("&Inline;", StringComparison.Ordinal);
        var expanded_start = Assert.Single(result.ClearTextSegments).Span.StartOffset;
        Assert.Equal(expanded_start, map.ToClearText(reference_offset + 3));
    }

    [Fact]
    public void ClearText_offset_map_is_identity_when_document_has_no_entity()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir"><mark/></dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        var offset = xml.IndexOf("<mark/>", StringComparison.Ordinal);
        Assert.Equal(offset, result.ClearTextOffsets.ToClearText(offset));
        Assert.Equal(offset, result.ClearTextOffsets.ToSource(offset));
    }

    [Fact]
    public void ClearText_marks_circular_entity_as_error_and_keeps_reference()
    {
        var controller_path = Path.Combine(_temp_directory, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY A "&B;">
              <!ENTITY B "&A;">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&A;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        // Không treo, không đệ quy vô hạn; điểm cắt chu kỳ giữ nguyên "&X;".
        Assert.Contains(result.ClearTextSegments, s => s.IsError);
        Assert.Contains("&A;", result.ClearText);
    }

    [Fact]
    public void ClearText_system_segment_resolves_relative_parent_path()
    {
        // FBO thật: <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt"> —
        // base resolve = thư mục file khai báo; Ctrl+Click Insight cần OpenPath tuyệt đối tồn tại.
        var sub_dir = Path.Combine(_temp_directory, "Dir");
        Directory.CreateDirectory(sub_dir);
        var include_dir = Path.Combine(_temp_directory, "Include", "Javascript");
        Directory.CreateDirectory(include_dir);
        var script_path = Path.Combine(include_dir, "Irregular.txt");
        File.WriteAllText(script_path, "irregular-script");

        var controller_path = Path.Combine(sub_dir, "Controller.xml");
        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&ScriptIrregular;</dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        var segment = Assert.Single(
            result.ClearTextSegments, s => s.EntityName == "ScriptIrregular");
        Assert.Equal(ClearTextSegmentKind.System, segment.Kind);
        Assert.False(string.IsNullOrEmpty(segment.OpenPath));
        Assert.Equal(Path.GetFullPath(script_path), Path.GetFullPath(segment.OpenPath));
        Assert.True(File.Exists(segment.OpenPath));
    }

    [Fact]
    public void Binder_does_not_expand_entity_reference_inside_xml_comment()
    {
        // FBO: <!-- &Include; --> = tắt include. ClearText phải giữ nguyên ref trong comment,
        // không nhét value vào (value thường chứa "--" → vỡ XML / Design blank).
        var controller_path = Path.Combine(_temp_directory, "Customer.xml");
        File.WriteAllText(
            Path.Combine(_temp_directory, "view.ent"),
            """
            <!-- marker-FROM-ENTITY-FILE -->
            <item value="FROM_ENTITY_WIDTHS"/>
            """);

        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY BI.Form.View.Customer SYSTEM "view.ent">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <!-- &BI.Form.View.Customer; -->
              <fields><field name="ma_kh"><header v="Mã" e="Code"/></field></fields>
              <views><view id="Dir"><item value="100"/><item value="1: [ma_kh]"/></view></views>
            </dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var result = new EntitySymbolBinder().Bind(controller_path, xml, syntax);

        Assert.Contains("<!-- &BI.Form.View.Customer; -->", result.ClearText);
        Assert.DoesNotContain("FROM_ENTITY_WIDTHS", result.ClearText);
        Assert.DoesNotContain("marker-FROM-ENTITY-FILE", result.ClearText);
        Assert.DoesNotContain(result.Symbols, s => s.Name == "BI.Form.View.Customer");
        Assert.DoesNotContain(result.Diagnostics, d => d.Id is "ERP3001" or "ERP3002" or "ERP3003");
    }

    [Fact]
    public void SemanticBinder_parses_legacy_when_entity_only_referenced_in_comment()
    {
        var controller_path = Path.Combine(_temp_directory, "Customer.xml");
        File.WriteAllText(
            Path.Combine(_temp_directory, "view.ent"),
            "<!-- note with -- double dash -->\n<item value=\"50,50\"/>");

        const string xml = """
            <!DOCTYPE dir [
              <!ENTITY BI.Form.View.Customer SYSTEM "view.ent">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <!-- &BI.Form.View.Customer; -->
              <title v="KH" e="Cust"/>
              <fields><field name="ma_kh"><header v="Mã" e="Code"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="100, 100"/>
                  <item value="11: [ma_kh].Label, [ma_kh]"/>
                </view>
              </views>
            </dir>
            """;
        var syntax = FboSyntaxParser.Parse(xml, controller_path);
        var model = new ErpSemanticBinder().Bind(
            ErpDocumentId.FromPath(controller_path), controller_path, xml, syntax);

        Assert.NotNull(model.LegacyDocument);
        Assert.NotNull(model.LegacyDocument!.Form);
        Assert.DoesNotContain(model.Diagnostics, d => d.Id == "ERP0002");
    }

    private static string Text(string clear_text, ClearTextSegment segment) =>
        clear_text.Substring(segment.Span.StartOffset, segment.Span.Length);

    public void Dispose()
    {
        try
        {
            Directory.Delete(_temp_directory, recursive: true);
        }
        catch
        {
            // Temp cleanup không được che kết quả test.
        }
    }
}
