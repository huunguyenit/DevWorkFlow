using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// Insight Outline — Navigation Map dựng trên projection ClearText (entity đã expand).
/// Khác source map: body &lt;command&gt;/&lt;action&gt;/... chứa &amp;Entity; nay hiện cấu trúc
/// con thật, và offset điều hướng tính trên ClearText (UsesClearTextOffsets) khớp buffer Insight.
/// </summary>
public class ErpNavigationInsightOutlineTests
{
    // Entity value dùng dấu nháy đơn để nháy kép bên trong giữ nguyên (idiom FBO) → ClearText
    // expand thành <field name="f_from_entity"/> re-parse được.
    private const string CommandWithEntityXml =
        """
        <?xml version="1.0" encoding="utf-8"?>
        <!DOCTYPE dir [
          <!ENTITY Frag '<field name="f_from_entity"/>'>
        ]>
        <dir table="t" code="a">
          <fields>
            <field name="a"/>
          </fields>
          <commands>
            <command event="Loading">&Frag;</command>
          </commands>
        </dir>
        """;

    [Fact]
    public void Insight_map_expands_entity_inside_command_body()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("buffer:insight-command.xml", CommandWithEntityXml);

        // ClearText phải đã expand &Frag; thành <field .../> (điều kiện tiên quyết của Insight map).
        var clear_text = doc.GetProjection(ErpProjectionKind.ClearText).Text;
        Assert.Contains("f_from_entity", clear_text);

        var map = ls.Navigation.GetInsightMap(doc.Id);
        Assert.NotNull(map);

        var command = FindNode(map!.GetOutlineRoots(), n =>
            n.NodeType.Equals("command", StringComparison.OrdinalIgnoreCase));
        Assert.NotNull(command);

        // Source map: command là leaf → KHÔNG có field con. Insight map: có field từ entity.
        var field = command!.Children.FirstOrDefault(c =>
            c.NodeType.Equals("field", StringComparison.OrdinalIgnoreCase));
        Assert.NotNull(field);
        Assert.Equal("f_from_entity", field!.DisplayName);
    }

    [Fact]
    public void Insight_field_node_navigates_to_clear_text_offset()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("buffer:insight-command.xml", CommandWithEntityXml);

        var clear_text = doc.GetProjection(ErpProjectionKind.ClearText).Text;
        var map = ls.Navigation.GetInsightMap(doc.Id);
        var field = FindNode(map!.GetOutlineRoots(), n =>
            n.NodeType.Equals("field", StringComparison.OrdinalIgnoreCase)
            && n.DisplayName.Equals("f_from_entity", StringComparison.Ordinal));
        Assert.NotNull(field);

        var target = ls.Navigation.GoToNode(doc.Id, field!.Id);
        Assert.NotNull(target);
        Assert.True(target!.UsesClearTextOffsets);

        // Offset trỏ đúng vào <field .../> đã expand trong ClearText (không phải vị trí &Frag;).
        Assert.True(target.TextRange.StartOffset >= 0
                    && target.TextRange.StartOffset < clear_text.Length);
        var at = clear_text.AsSpan(target.TextRange.StartOffset);
        Assert.StartsWith("<field", at.ToString(), StringComparison.Ordinal);
    }

    [Fact]
    public void Source_map_keeps_command_as_leaf_without_entity_expansion()
    {
        var ls = new ErpLanguageService();
        var doc = ls.OpenDocumentFromText("buffer:insight-command.xml", CommandWithEntityXml);

        // Source outline (map cũ): command trong LeafElements → không đệ quy field từ entity.
        var command = FindNode(ls.Navigation.GetOutlineRoots(doc.Id), n =>
            n.NodeType.Equals("command", StringComparison.OrdinalIgnoreCase));
        Assert.NotNull(command);
        Assert.DoesNotContain(command!.Children, c =>
            c.NodeType.Equals("field", StringComparison.OrdinalIgnoreCase));

        var target = ls.Navigation.GoToNode(doc.Id, command.Id);
        Assert.NotNull(target);
        Assert.False(target!.UsesClearTextOffsets);
    }

    private static DocumentNode? FindNode(
        IReadOnlyList<DocumentNode> roots,
        Func<DocumentNode, bool> predicate)
    {
        foreach (var node in roots)
        {
            if (predicate(node)) return node;
            var found = FindNode(node.Children, predicate);
            if (found is not null) return found;
        }
        return null;
    }
}
