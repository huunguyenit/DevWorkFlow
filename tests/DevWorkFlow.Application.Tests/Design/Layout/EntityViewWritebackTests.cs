using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

/// <summary>
/// Spec v2 (2026-07-24) — ownership cột/token: thao tác Blueprint trên view entity **luôn** được;
/// commit ghi đúng file entity theo cột pattern / token control. Không phantom row sau reparse.
/// </summary>
public sealed class EntityViewWritebackTests : IDisposable
{
    private readonly string _temp_directory =
        Path.Combine(Path.GetTempPath(), $"fbo-writeback-{Guid.NewGuid():N}");

    public EntityViewWritebackTests() => Directory.CreateDirectory(_temp_directory);

    private static readonly FboDesignLayoutWriterAdapter Adapter = new();
    private static readonly LayoutEngine Engine = new();

    private (ErpLanguageService Service, IErpDocument Document, FboFormModel Form) Open(
        string dir_name, string dir_xml, params (string File, string Content)[] entity_files)
    {
        foreach (var (file, content) in entity_files)
            File.WriteAllText(Path.Combine(_temp_directory, file), content);
        var dir_path = Path.Combine(_temp_directory, dir_name);
        File.WriteAllText(dir_path, dir_xml);

        var service = new ErpLanguageService();
        var document = service.OpenDocument(dir_path);
        var form = (document.SemanticModel as ErpSemanticModel)?.LegacyDocument?.Form;
        Assert.NotNull(form?.Layout);
        return (service, document, form!);
    }

    private static FormViewRow Row(FboFormModel form, int index) => form.Layout!.Rows[index];

    // ── Acceptance 1: [&k;] control-entity — merge KHÔNG bị chặn; Raw giữ &k; ──

    [Fact]
    public void ControlEntity_Merge_NotBlocked_KeepsRefInRaw()
    {
        var (_, document, form) = Open(
            "Customer.xml",
            """
            <!DOCTYPE dir [
              <!ENTITY k "ma_kh">
              <!ENTITY UnitViews SYSTEM "unit-views.xml">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="ma_kh"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="50, 50"/>
                  <item value="1-: [&k;].Label"/>&UnitViews;
                </view>
              </views>
            </dir>
            """,
            ("unit-views.xml", """<item value="1-: [ten].Label"/>"""));

        // Merge cột 0(Label)+1(empty) trên hàng literal (row 0) — control không đổi, pattern 1-→10.
        var merge = Engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));
        Assert.True(merge.Ok, merge.Error); // KHÔNG chặn vì có &k;

        var plan = Adapter.BuildWritebackPlan(document, document.Snapshot.RawText, form);
        Assert.True(plan.Ok, plan.Reason);
        Assert.NotNull(plan.Plan!.DirXml);
        // Pattern literal đổi 1-→10; token &k; giữ nguyên.
        Assert.Contains("10: [&k;].Label", plan.Plan.DirXml);
        Assert.DoesNotContain("[ma_kh]", plan.Plan.DirXml); // KHÔNG expand &k; vào Dir
    }

    // ── Acceptance 2: Hybrid 110&x; — merge/split đổi đúng value &x; ──

    [Fact]
    public void HybridPattern_Merge_UpdatesOnlyEntityValue()
    {
        // Raw pattern 110&x; với &x;="0-1" → ClearText "1100-1" (6 cột). Fields a..f.
        var (service, document, form) = Open(
            "Hybrid.xml",
            """
            <!DOCTYPE dir [
              <!ENTITY x "0-1">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="f"><header v="F" e="F"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="20, 20, 20, 20, 20, 20"/>
                  <item value="110&x;: [a], [f]"/>
                </view>
              </views>
            </dir>
            """);

        Assert.Equal("1100-1", Row(form, 0).Pattern);

        // Merge cột 4 vào control ở cột 5? Dùng merge cột 3+4 (thuộc vùng &x;): "0-" → "00".
        // Cột 3=0,4=-,5=1. Merge slot tại cột 5 (control f) shrink? Đơn giản: đổi cột 4 từ '-' thành '0'
        // bằng merge cột control 'a' (span) — nhưng a ở cột 0. Thay vào: merge cột 5(f) mở rộng trái tới 4.
        var merge = Engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 4),
            new LayoutSlotId(LayoutRegionId.Main, 0, 5));
        Assert.True(merge.Ok, merge.Error);
        // Sau merge: cột 4 (empty) + cột 5 (f) → f span 2 bắt đầu cột 4 → pattern cột4='1',5='0'.
        Assert.Equal("110010", Row(form, 0).Pattern);

        var plan = Adapter.BuildWritebackPlan(document, document.Snapshot.RawText, form);
        Assert.True(plan.Ok, plan.Reason);
        // &x; khai inline trong Dir DOCTYPE → patch value ngay trên Dir; body giữ 110&x;.
        Assert.Empty(plan.Plan!.EntityWrites);
        Assert.NotNull(plan.Plan.DirXml);
        Assert.Contains("110&x;", plan.Plan.DirXml);
        Assert.Contains("""<!ENTITY x "010">""", plan.Plan.DirXml);

        // Reparse Dir đã patch → pattern mới, không phantom.
        var reopened = service.OpenDocumentFromText(document.Path, plan.Plan.DirXml);
        var reloaded = (reopened.SemanticModel as ErpSemanticModel)?.LegacyDocument?.Form;
        Assert.Equal("110010", reloaded!.Layout!.Rows[0].Pattern);
    }

    // ── Acceptance 3: entity pattern thuần &y; — chỉ value y đổi ──

    [Fact]
    public void PurePatternEntity_Split_UpdatesEntityValueOnly()
    {
        var (service, document, form) = Open(
            "PatternEntity.xml",
            """
            <!DOCTYPE dir [
              <!ENTITY y SYSTEM "pattern-y.txt">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields>
                <field name="a"><header v="A" e="A"/></field>
                <field name="f"><header v="F" e="F"/></field>
              </fields>
              <views>
                <view id="Dir">
                  <item value="20, 20, 20, 20, 20, 20"/>
                  <item value="&y;: [a], [f]"/>
                </view>
              </views>
            </dir>
            """,
            ("pattern-y.txt", "1100-1"));

        Assert.Equal("1100-1", Row(form, 0).Pattern);

        // Split control 'f' (cột 1 span 3) → giữ 1 cột: cột 2,3 giải phóng thành trống.
        var split = Engine.SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 1));
        Assert.True(split.Ok, split.Error);
        var new_pattern = Row(form, 0).Pattern;
        Assert.NotEqual("1100-1", new_pattern);

        var plan = Adapter.BuildWritebackPlan(document, document.Snapshot.RawText, form);
        Assert.True(plan.Ok, plan.Reason);
        Assert.Null(plan.Plan!.DirXml); // Dir giữ &y;: [a], [f]
        var write = Assert.Single(plan.Plan.EntityWrites);
        Assert.Equal("y", write.EntityName);
        Assert.Equal(new_pattern, write.NewContent); // &y; = toàn bộ pattern → value = pattern mới

        var edit = service.UpdateEntityValue(document.Id, "y", write.NewContent);
        Assert.True(edit.Success, edit.Error);
        Assert.Contains("&y;: [a], [f]", edit.Document!.Snapshot.RawText);
        var reloaded = (edit.Document.SemanticModel as ErpSemanticModel)?.LegacyDocument?.Form;
        Assert.Equal(new_pattern, reloaded!.Layout!.Rows[0].Pattern);
    }

    // ── Acceptance: item lắp từ entity chứa control-entity lồng [&Tag;dv] — không Fail ──

    [Fact]
    public void EntityItem_WithNestedControlEntity_PatternMerge_NotBlocked()
    {
        // UnitViews thật: <item value="1: [&Tag;dv]"/> → ClearText "1------------: [dmkhdv]" (13 cột).
        var (service, document, form) = Open(
            "Nested.xml",
            """
            <!DOCTYPE dir [
              <!ENTITY Tag "dmkh">
              <!ENTITY UnitViews SYSTEM "unit-views.xml">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="20, 20"/>
                  <item value="1-: [a]"/>&UnitViews;
                </view>
              </views>
            </dir>
            """,
            ("unit-views.xml", """<item value="1: [&Tag;dv]"/>"""));

        // Hàng 1 (từ entity) pattern "1-" (2 cột). Merge cột 0+1 → "10", control [&Tag;dv] giữ nguyên.
        var merge = Engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 1, 0),
            new LayoutSlotId(LayoutRegionId.Main, 1, 1));
        Assert.True(merge.Ok, merge.Error);

        var plan = Adapter.BuildWritebackPlan(document, document.Snapshot.RawText, form);
        Assert.True(plan.Ok, plan.Reason);
        var write = Assert.Single(plan.Plan!.EntityWrites, w => w.EntityName == "UnitViews");
        Assert.Contains("[&Tag;dv]", write.NewContent);   // giữ control-entity lồng
        Assert.DoesNotContain("[dmkhdv]", write.NewContent); // không expand

        var edit = service.UpdateEntityValue(document.Id, "UnitViews", write.NewContent);
        Assert.True(edit.Success, edit.Error);
        Assert.Contains("&UnitViews;", edit.Document!.Snapshot.RawText);
        var reloaded = (edit.Document.SemanticModel as ErpSemanticModel)?.LegacyDocument?.Form;
        Assert.Equal(2, reloaded!.Layout!.Rows.Count); // không phantom
    }

    // ── Dir literal row đổi → patch Dir, không đụng entity ──

    [Fact]
    public void DirLiteralRow_Merge_PatchesDirOnly()
    {
        var (_, document, form) = Open(
            "Lit.xml",
            """
            <!DOCTYPE dir [
              <!ENTITY UnitViews SYSTEM "unit-views.xml">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="20, 20"/>
                  <item value="1-: [a].Label"/>&UnitViews;
                </view>
              </views>
            </dir>
            """,
            ("unit-views.xml", """<item value="1-: [ten].Label"/>"""));

        var merge = Engine.MergeSlots(
            form,
            new LayoutSlotId(LayoutRegionId.Main, 0, 0),
            new LayoutSlotId(LayoutRegionId.Main, 0, 1));
        Assert.True(merge.Ok, merge.Error);

        var plan = Adapter.BuildWritebackPlan(document, document.Snapshot.RawText, form);
        Assert.True(plan.Ok, plan.Reason);
        Assert.Empty(plan.Plan!.EntityWrites);
        Assert.NotNull(plan.Plan.DirXml);
        Assert.Contains("10: [a].Label", plan.Plan.DirXml);
        Assert.Contains("&UnitViews;", plan.Plan.DirXml);
    }

    [Fact]
    public void NoChange_ProducesEmptyPlan()
    {
        var (_, document, form) = Open(
            "Noop.xml",
            """
            <!DOCTYPE dir [
              <!ENTITY y "11">
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="T" e="T"/>
              <fields><field name="a"><header v="A" e="A"/></field></fields>
              <views>
                <view id="Dir">
                  <item value="20, 20"/>
                  <item value="&y;: [a].Label, [a]"/>
                </view>
              </views>
            </dir>
            """);

        var plan = Adapter.BuildWritebackPlan(document, document.Snapshot.RawText, form);
        Assert.True(plan.Ok, plan.Reason);
        Assert.False(plan.Plan!.HasChanges);
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
