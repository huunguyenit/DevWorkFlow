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
