using DevWorkFlow.Application.Language;
using DevWorkFlow.Domain.Language;
using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// Outline entity section chỉ hiện entity KHAI BÁO hoặc THAM CHIẾU trong chính document đang mở —
/// entity chỉ tồn tại trong file include (khai báo + tham chiếu ở include) là "thừa", bị loại.
/// </summary>
public sealed class ErpNavigationEntityOutlineFilterTests : IDisposable
{
    private readonly string _temp =
        Path.Combine(Path.GetTempPath(), $"fbo-outline-{Guid.NewGuid():N}");

    public ErpNavigationEntityOutlineFilterTests() => Directory.CreateDirectory(_temp);

    [Fact]
    public void Outline_entities_exclude_include_only_entities()
    {
        // Parent (khai báo ở include) được document chính tham chiếu; Parent lại tham chiếu Child
        // (chỉ khai báo + tham chiếu trong include). Cả hai vào closure symbol, nhưng Outline của
        // document chính chỉ nên hiện Parent (có &Parent; trong doc), KHÔNG hiện Child.
        File.WriteAllText(
            Path.Combine(_temp, "shared.ent"),
            "<!ENTITY Parent \"&Child;\">\n<!ENTITY Child \"child-value\">\n");
        var controller_path = Path.Combine(_temp, "Controller.xml");
        var xml = """
            <!DOCTYPE dir [
              <!ENTITY % Shared SYSTEM "shared.ent">
              %Shared;
            ]>
            <dir xmlns="urn:schemas-fast-com:data-dir">&Parent;</dir>
            """;
        File.WriteAllText(controller_path, xml);

        var ls = new ErpLanguageService();
        var doc = ls.OpenDocument(controller_path);

        // Tiền đề: cả hai đều là symbol trong closure (Child reachable qua giá trị của Parent).
        Assert.NotNull(doc.SemanticModel.FindEntity("Parent"));
        Assert.NotNull(doc.SemanticModel.FindEntity("Child"));

        var entity_names = CollectEntityNodeNames(ls.Navigation.GetOutlineRoots(doc.Id));
        Assert.Contains("Parent", entity_names);
        Assert.DoesNotContain("Child", entity_names);
    }

    private static List<string> CollectEntityNodeNames(IReadOnlyList<DocumentNode> roots)
    {
        var names = new List<string>();
        void Walk(IReadOnlyList<DocumentNode> nodes)
        {
            foreach (var n in nodes)
            {
                if (n.NodeType.Equals("entity", StringComparison.OrdinalIgnoreCase))
                    names.Add(n.DisplayName);
                Walk(n.Children);
            }
        }
        Walk(roots);
        return names;
    }

    public void Dispose()
    {
        try { Directory.Delete(_temp, recursive: true); }
        catch { /* temp cleanup không che kết quả test */ }
    }
}
