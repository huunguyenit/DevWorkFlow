namespace DevWorkFlow.Domain.Models.Fbo.Schema;

/// <summary>Theo Dir.xsd / Grid.xsd – simpleType dataType.</summary>
public enum FboDataType
{
    AnsiString,
    Binary,
    Byte,
    Boolean,
    Currency,
    Date,
    DateTime,
    Decimal,
    Double,
    Guid,
    Int16,
    Int32,
    Int64,
    Object,
    SByte,
    Single,
    String,
    Time,
    UInt16,
    UInt32,
    UInt64,
    VarNumeric,
    AnsiStringFixedLength,
    StringFixedLength,
    Xml,
    DateTime2,
    DateTimeOffset
}

/// <summary>Theo Dir.xsd / Grid.xsd – simpleType aggregateType.</summary>
public enum FboAggregateType
{
    None,
    Sum,
    Count,
    Average,
    Max,
    Min
}

