using DevWorkFlow.Application.Language.Syntax;
using DevWorkFlow.Domain.Language;
using DevWorkFlow.Domain.Language.Syntax;
using Xunit;

namespace DevWorkFlow.Application.Tests;

/// <summary>
/// DTD conditional/marked sections (<c>&lt;![%Name;[...]]&gt;</c>) không được nhầm thành StartTag
/// (trước đây gây ERP1002 "Tag &lt;&gt; chưa được đóng" trên Unit.ent).
/// </summary>
public class FboLexerConditionalSectionTests
{
    [Fact]
    public void Parameter_entity_conditional_is_one_ConditionalSection_token()
    {
        const string text =
            """
            <!ENTITY % Flag "IGNORE">
            <![%Flag;[
              <!ENTITY Inner "x">
            ]]>
            <!ENTITY After "y">
            """;

        var tokens = FboLexer.Tokenize(text);
        Assert.Contains(tokens, t => t.Kind == SyntaxKind.ConditionalSection);
        Assert.DoesNotContain(tokens, t =>
            t.Kind is SyntaxKind.StartTag or SyntaxKind.EndTag or SyntaxKind.EmptyElementTag);
        Assert.Equal(2, tokens.Count(t => t.Kind == SyntaxKind.EntityDeclaration));
    }

    [Fact]
    public void Nested_conditionals_close_at_matching_bracket()
    {
        const string text =
            """
            <![%Outer;[
              <!ENTITY A "1">
              <![%Inner;[
                <!ENTITY B "2">
              ]]>
            ]]>
            """;

        var tokens = FboLexer.Tokenize(text);
        var section = Assert.Single(tokens, t => t.Kind == SyntaxKind.ConditionalSection);
        Assert.StartsWith("<![%Outer;[", section.Text, StringComparison.Ordinal);
        Assert.EndsWith("]]>", section.Text, StringComparison.Ordinal);
        Assert.Contains("<![%Inner;[", section.Text, StringComparison.Ordinal);
    }

    [Fact]
    public void Include_keyword_conditional_is_tokenized()
    {
        const string text = "<![INCLUDE[ <!ENTITY X \"1\"> ]]>";
        var tokens = FboLexer.Tokenize(text);
        Assert.Single(tokens, t => t.Kind == SyntaxKind.ConditionalSection);
        Assert.DoesNotContain(tokens, t => t.Kind == SyntaxKind.StartTag);
    }

    [Fact]
    public void Unit_ent_has_no_ERP1002_structure_errors()
    {
        var path = Path.Combine(
            FindRepoRoot(),
            "SP226", "App_Data", "Controllers", "Include", "Unit.ent");
        Assert.True(File.Exists(path), $"Missing fixture: {path}");

        var text = File.ReadAllText(path);
        var tree = FboSyntaxParser.Parse(text, path);

        Assert.DoesNotContain(tree.Diagnostics, d => d.Id == "ERP1002");
        Assert.Contains(
            FboLexer.Tokenize(text),
            t => t.Kind == SyntaxKind.ConditionalSection);
    }

    [Fact]
    public void CData_still_wins_over_generic_conditional()
    {
        const string text = "<root><![CDATA[ a <![%X;[ b ]]> c ]]></root>";
        var tokens = FboLexer.Tokenize(text);
        Assert.Contains(tokens, t => t.Kind == SyntaxKind.CData);
        // Toàn bộ CDATA là một token — không tách ConditionalSection bên trong CDATA.
        Assert.DoesNotContain(tokens, t => t.Kind == SyntaxKind.ConditionalSection);
    }

    private static string FindRepoRoot()
    {
        var dir = new DirectoryInfo(AppContext.BaseDirectory);
        while (dir is not null)
        {
            if (File.Exists(Path.Combine(dir.FullName, "DevWorkFlow.slnx"))
                || File.Exists(Path.Combine(dir.FullName, "DevWorkFlow.sln")))
                return dir.FullName;
            dir = dir.Parent;
        }

        return Path.GetFullPath(Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", ".."));
    }
}
