namespace DevWorkFlow.Domain.Language.Syntax;

/// <summary>Loại token / node trong lossless FBO XML syntax tree.</summary>
public enum SyntaxKind
{
    None = 0,

    // Tokens
    EndOfFile,
    Text,
    Whitespace,
    XmlDeclaration,
    ProcessingInstruction,
    Comment,
    CData,
    /// <summary>DTD marked/conditional section: <c>&lt;![%Name;[...]]&gt;</c> hoặc <c>&lt;![INCLUDE[...]]&gt;</c>.</summary>
    ConditionalSection,
    DocType,
    EntityDeclaration,
    StartTag,
    EndTag,
    EmptyElementTag,
    BadToken,

    // Structure nodes
    Document,
    Element,
    ScriptIsland,
    SqlIsland,
    SkippedTrivia
}
