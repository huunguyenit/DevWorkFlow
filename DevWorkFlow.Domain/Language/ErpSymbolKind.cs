namespace DevWorkFlow.Domain.Language;

/// <summary>Loại symbol trong ERP Semantic Model.</summary>
public enum ErpSymbolKind
{
    Unknown = 0,
    Controller = 1,
    Field = 2,
    View = 3,
    Command = 4,
    Query = 5,
    ScriptFunction = 6,
    ResponseAction = 7,
    Entity = 8,
    Category = 9
}
