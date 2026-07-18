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

/// <summary>Theo Dir.xsd – simpleType appType.</summary>
public enum FboAppType
{
    Dir,
    Report,
    Voucher,
    Detail
}

/// <summary>Theo Dir.xsd – simpleType databaseName.</summary>
public enum FboDatabaseName
{
    App,
    Sys,
    Ext
}

/// <summary>Đường dẫn XSD chuẩn Controllers (tham chiếu model).</summary>
public static class FboSchemaPaths
{
    public const string Dir = "Schemas/Dir.xsd";
    public const string Grid = "Schemas/Grid.xsd";
    public const string Lookup = "Schemas/Lookup.xsd";
    public const string Report = "Schemas/Report.xsd";
}
