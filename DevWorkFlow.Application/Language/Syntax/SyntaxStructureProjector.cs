using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Language.Syntax;

namespace DevWorkFlow.Application.Language.Syntax;

/// <summary>
/// Chiếu <see cref="ISyntaxTree"/> → <see cref="XmlStructureNode"/> (Structure Tree / Outline).
/// </summary>
public static class SyntaxStructureProjector
{
    public static XmlStructureNode? Project(ISyntaxTree? tree)
    {
        if (tree is null) return null;
        return ProjectNode(tree.Root, is_root: true);
    }

    private static XmlStructureNode ProjectNode(SyntaxNode node, bool is_root)
    {
        if (node.Kind == SyntaxKind.ScriptIsland && node.Qualifier == "function")
        {
            return new XmlStructureNode
            {
                Name = node.Name,
                Kind = XmlStructureKind.ScriptFunction,
                StartLine = node.StartLine,
                StartOffset = node.Span.StartOffset,
                EndLine = node.EndLine
            };
        }

        var result = new XmlStructureNode
        {
            Name = string.IsNullOrEmpty(node.Name) ? "(document)" : node.Name,
            Qualifier = node.Qualifier == "function" ? null : node.Qualifier,
            Kind = XmlStructureKind.Element,
            StartLine = node.StartLine,
            StartOffset = node.Span.StartOffset,
            EndLine = node.EndLine
        };

        // Document: lấy element gốc (giống XmlStructureParser cũ rename root)
        if (is_root && node.Kind == SyntaxKind.Document)
        {
            var elements = node.Children
                .Where(c => c.Kind == SyntaxKind.Element)
                .Select(c => ProjectNode(c, is_root: false))
                .ToList();

            if (elements.Count == 1)
                return elements[0];

            result.Children.Clear();
            foreach (var el in elements)
                result.Children.Add(el);
            return result;
        }

        foreach (var child in node.Children)
        {
            if (child.Kind is SyntaxKind.DocType or SyntaxKind.EntityDeclaration)
                continue;

            if (child.Kind == SyntaxKind.ScriptIsland && child.Qualifier != "function")
            {
                foreach (var fn in child.Children)
                    result.Children.Add(ProjectNode(fn, is_root: false));
                continue;
            }

            if (child.Kind == SyntaxKind.SqlIsland)
                continue;

            if (child.Kind == SyntaxKind.Element
                || (child.Kind == SyntaxKind.ScriptIsland && child.Qualifier == "function"))
                result.Children.Add(ProjectNode(child, is_root: false));
        }

        return result;
    }
}
