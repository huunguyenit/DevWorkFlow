using System.Text.RegularExpressions;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests.Language;

/// <summary>
/// Phase 3 trên corpus Program THẬT. Fixture tổng hợp không lộ được các lỗi thực tế: FBO đặt tên
/// action bằng <c>id</c> (không phải <c>name</c>), và phần lớn script đến từ entity include nên
/// index chạy trên source bỏ sót rất nhiều.
///
/// Dùng <see cref="FboProgramCorpus"/> (không bám bản cụ thể) — tên thư mục Program đổi theo bản
/// checkout; golden test mới là nơi bám đúng SP226.
/// </summary>
public sealed class JsRuntimeRealCorpusTests
{
    /// <summary>File mẫu có đủ request/case/$a/function (attribute đã đảm bảo tồn tại).</summary>
    private static (ErpLanguageService Service, IErpDocument Doc) OpenSvDetail()
    {
        var path = FboProgramCorpus.TryFind("Grid", "SVDetail.xml")!;
        var service = new ErpLanguageService();
        service.SetProgramPath(FboProgramCorpus.RequireRoot());
        return (service, service.OpenDocument(path));
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Request_action_resolves_to_action_element_declared_with_id()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        // o.grid.request(o, 'Item', 'Item', …) — click vào literal action đầu tiên.
        var call = src.IndexOf(".request(o, 'Item'", StringComparison.Ordinal);
        Assert.True(call > 0, "Không tìm thấy lời gọi request mẫu trong corpus.");
        var action_offset = src.IndexOf("'Item'", call, StringComparison.Ordinal) + 1;

        var hit = service.ResolveJsRuntimeAtOffset(doc.Id, action_offset, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.RequestAction, hit!.Kind);
        Assert.True(hit.TargetOffset >= 0, $"Phải resolve được action, nhận: {hit.DisplayLabel}");
        Assert.Contains("Item", hit.DisplayLabel, StringComparison.Ordinal);

        // Target phải trỏ đúng vào <action id="Item">.
        var target_text = src.Substring(hit.TargetOffset, Math.Min(40, src.Length - hit.TargetOffset));
        Assert.Contains("action", target_text, StringComparison.OrdinalIgnoreCase);
        Assert.Contains("Item", target_text, StringComparison.Ordinal);
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Request_context_resolves_to_case_in_response_complete()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        var call = src.IndexOf(".request(o, 'Item'", StringComparison.Ordinal);
        var first = src.IndexOf("'Item'", call, StringComparison.Ordinal);
        var context_offset = src.IndexOf("'Item'", first + 6, StringComparison.Ordinal) + 1;

        var hit = service.ResolveJsRuntimeAtOffset(doc.Id, context_offset, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.RequestResponseCase, hit!.Kind);
        Assert.True(hit.TargetOffset >= 0, $"Phải tìm được case, nhận: {hit.DisplayLabel}");
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Dollar_a_usage_resolves_and_carries_hover_value()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        var use = Regex.Match(src, @"g\.\$a\.(?<n>gia|tien_nt|t_tt)\b");
        Assert.True(use.Success, "Không tìm thấy usage g.$a.<name> trong corpus.");

        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, use.Groups["n"].Index + 1, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.DollarAProperty, hit!.Kind);
        Assert.True(hit.TargetOffset >= 0);
        Assert.False(string.IsNullOrEmpty(hit.HoverValue), "Hover phải có value biểu thức.");
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Function_definition_returns_references_including_entity_sourced_call_sites()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        var def = Regex.Match(src, @"function\s+(?<n>onChange\$GridVoucherDetail\$Item)\b");
        Assert.True(def.Success);

        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, def.Groups["n"].Index + 1, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.ScriptFunctionRefs, hit!.Kind);
        Assert.NotEmpty(hit.References);
        // Mỗi reference phải có file cụ thể để mở được, không chỉ offset trần.
        Assert.All(hit.References, r => Assert.False(string.IsNullOrWhiteSpace(r.DocumentUri)));
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Action_declaration_navigates_back_to_request_call_sites()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        // Chiều ngược: đứng ở <action id="Item"> → tìm các chỗ gọi request('Item', …).
        var decl = Regex.Match(src, @"<action\b[^>]*?\bid\s*=\s*""(?<n>Item)""");
        Assert.True(decl.Success, "Không tìm thấy <action id=\"Item\"> trong corpus.");

        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, decl.Groups["n"].Index + 1, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.ActionRequestSites, hit!.Kind);
        Assert.NotEmpty(hit.References);
        Assert.All(hit.References, r => Assert.False(string.IsNullOrWhiteSpace(r.DocumentUri)));
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Case_label_navigates_back_to_request_call_sites()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        // Chiều ngược: đứng ở case 'Item': → tìm các chỗ gọi request(…, 'Item', …).
        var label = Regex.Match(src, @"\bcase\s+'(?<n>Item)'\s*:");
        Assert.True(label.Success, "Không tìm thấy case 'Item': trong corpus.");

        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, label.Groups["n"].Index + 1, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.Equal(JsRuntimeNavKind.CaseRequestSites, hit!.Kind);
        Assert.NotEmpty(hit.References);
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Round_trip_request_action_and_back_is_consistent()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        // Chiều đi: request('Item') → <action id="Item">
        var call = src.IndexOf(".request(o, 'Item'", StringComparison.Ordinal);
        var action_offset = src.IndexOf("'Item'", call, StringComparison.Ordinal) + 1;
        var forward = service.ResolveJsRuntimeAtOffset(doc.Id, action_offset, FboProgramCorpus.Controllers);

        Assert.NotNull(forward);
        Assert.Equal(JsRuntimeNavKind.RequestAction, forward!.Kind);
        Assert.True(forward.TargetOffset >= 0);

        // Chiều về: từ chính vị trí action vừa tới → phải liệt kê được lời gọi ban đầu.
        var name_in_decl = src.IndexOf("Item", forward.TargetOffset, StringComparison.Ordinal);
        var backward = service.ResolveJsRuntimeAtOffset(
            doc.Id, name_in_decl, FboProgramCorpus.Controllers);

        Assert.NotNull(backward);
        Assert.Equal(JsRuntimeNavKind.ActionRequestSites, backward!.Kind);
        // Reference trỏ vào chính literal 'Item' của lời gọi ban đầu (offset nội dung, sau quote).
        Assert.Contains(backward.References, r => r.TextRange.StartOffset == action_offset);
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Function_call_site_resolves_same_references_as_definition()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;
        const string fn = "onChange$GridVoucherDetail$Promotion";

        var def = src.IndexOf($"function {fn}", StringComparison.Ordinal);
        Assert.True(def > 0, "Corpus không có function mẫu.");
        // Nơi GỌI (không có từ khoá `function` phía trước) — trước đây Ctrl+Click ở đây không ăn.
        var call = src.IndexOf($"{fn}(", def + 10, StringComparison.Ordinal);
        Assert.True(call > 0, "Corpus không có call site nào cho function mẫu.");

        var from_definition = service.ResolveJsRuntimeAtOffset(
            doc.Id, def + "function ".Length + 2, FboProgramCorpus.Controllers);
        var from_call_site = service.ResolveJsRuntimeAtOffset(
            doc.Id, call + 2, FboProgramCorpus.Controllers);

        Assert.NotNull(from_call_site);
        Assert.Equal(JsRuntimeNavKind.ScriptFunctionRefs, from_call_site!.Kind);
        Assert.Equal($"script:{fn}", from_call_site.SymbolId);
        // Hai chiều: đứng ở đâu cũng ra cùng bộ references.
        Assert.Equal(from_definition!.References.Count, from_call_site.References.Count);
        Assert.Contains(from_call_site.Relations,
            r => r.Role == JsRuntimeRelationRole.FunctionDefinition);
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void References_carry_line_number_and_code_preview()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        var def = Regex.Match(src, @"function\s+(?<n>onChange\$GridVoucherDetail\$Item)\b");
        var hit = service.ResolveJsRuntimeAtOffset(
            doc.Id, def.Groups["n"].Index + 1, FboProgramCorpus.Controllers);

        Assert.NotNull(hit);
        Assert.NotEmpty(hit!.References);
        // Panel cần "file : line : code" mà không được tự đọc file.
        Assert.All(hit.References, r =>
        {
            Assert.True(r.StartLine > 0, "Reference phải có số dòng.");
            Assert.False(string.IsNullOrWhiteSpace(r.Preview), "Reference phải có dòng code.");
        });
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Request_chain_is_same_from_every_entry_point()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;

        var call = src.IndexOf(".request(o, 'Item'", StringComparison.Ordinal);
        var action_literal = src.IndexOf("'Item'", call, StringComparison.Ordinal) + 1;
        var decl = Regex.Match(src, @"<action\b[^>]*?\bid\s*=\s*""(?<n>Item)""");
        var case_label = Regex.Match(src, @"\bcase\s+'(?<n>Item)'\s*:");

        var from_request = service.ResolveJsRuntimeAtOffset(doc.Id, action_literal, FboProgramCorpus.Controllers);
        var from_action = service.ResolveJsRuntimeAtOffset(doc.Id, decl.Groups["n"].Index + 1, FboProgramCorpus.Controllers);
        var from_case = service.ResolveJsRuntimeAtOffset(doc.Id, case_label.Groups["n"].Index + 1, FboProgramCorpus.Controllers);

        // Vào từ mắt xích nào cũng dựng được đủ sơ đồ request → action → case.
        foreach (var hit in new[] { from_request, from_action, from_case })
        {
            Assert.NotNull(hit);
            Assert.Contains(hit!.Relations, r => r.Role == JsRuntimeRelationRole.RequestSite);
            Assert.Contains(hit.Relations, r => r.Role == JsRuntimeRelationRole.ActionDeclaration);
            Assert.Contains(hit.Relations, r => r.Role == JsRuntimeRelationRole.ResponseCase);
        }
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Clear_text_index_sees_content_that_source_index_cannot()
    {
        var (_, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;
        var clear = doc.GetProjection(ErpProjectionKind.ClearText).Text;

        var src_fns = Regex.Matches(src, @"function\s+(?<n>[A-Za-z_$][\w$]*)")
            .Select(m => m.Groups["n"].Value).ToHashSet();
        var clear_fns = Regex.Matches(clear, @"function\s+(?<n>[A-Za-z_$][\w$]*)")
            .Select(m => m.Groups["n"].Value).ToHashSet();

        // Nếu điều này không còn đúng thì corpus đã đổi — không phải resolver hỏng.
        Assert.True(clear_fns.Count > src_fns.Count,
            "Corpus phải có function chỉ xuất hiện sau khi expand entity.");
    }

    [FboCorpusFact("Grid", "SVDetail.xml")]
    public void Offset_from_insight_buffer_resolves_same_target_as_source_offset()
    {
        var (service, doc) = OpenSvDetail();
        var src = doc.Snapshot.RawText;
        var projection = doc.GetProjection(ErpProjectionKind.ClearText);

        var use = Regex.Match(src, @"g\.\$a\.(?<n>gia)\b");
        var source_offset = use.Groups["n"].Index + 1;
        var clear_offset = projection.OffsetMap.ToClearText(source_offset);

        var from_source = service.ResolveJsRuntimeAtOffset(
            doc.Id, source_offset, FboProgramCorpus.Controllers, offset_is_clear_text: false);
        var from_insight = service.ResolveJsRuntimeAtOffset(
            doc.Id, clear_offset, FboProgramCorpus.Controllers, offset_is_clear_text: true);

        Assert.NotNull(from_source);
        Assert.NotNull(from_insight);
        Assert.Equal(from_source!.Kind, from_insight!.Kind);
        Assert.Equal(from_source.TargetOffset, from_insight.TargetOffset);
    }
}
